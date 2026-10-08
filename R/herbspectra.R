# =====================================================================
# Funções do site HerbSpectra-Amazônia (só R básico + jsonlite)
#
# As páginas leem as tabelas da pasta dados/:
#   dados/herbarios.csv  -> herbários e instituições da rede (com coordenadas)
#   dados/cursos.csv     -> cursos: realizados, em andamento e previstos
#   dados/equipe.csv     -> pessoas da equipe
#
# Para atualizar o site, edite só as tabelas (no Excel ou no RStudio)
# e renderize. O mapa, os números, a faixa "Agora" e as listas mudam sozinhos.
# =====================================================================

.raiz <- function() {
  for (r in c(".", "..", "../..")) if (file.exists(file.path(r, "dados", "cursos.csv"))) return(r)
  stop("Pasta dados/ não encontrada")
}
.ler <- function(nome) {
  read.csv(file.path(.raiz(), "dados", nome), encoding = "UTF-8", fileEncoding = "UTF-8",
           stringsAsFactors = FALSE, na.strings = c("", "NA"), check.names = FALSE)
}
`%||%` <- function(a, b) if (is.null(a) || length(a) == 0 || all(is.na(a))) b else a
.esc <- function(x) { x <- gsub("&", "&amp;", x); x <- gsub("<", "&lt;", x); gsub(">", "&gt;", x) }
.html <- function(...) cat("\n```{=html}\n", paste0(..., collapse = ""), "\n```\n\n", sep = "")

# ---------------------------------------------------------------------
# Textos nos 3 idiomas
# ---------------------------------------------------------------------
.tx <- list(
  pt = list(
    paises = c(BR = "Brasil", CO = "Colômbia", EC = "Equador", BO = "Bolívia", PE = "Peru",
               US = "EUA", DE = "Alemanha", DK = "Dinamarca"),
    meses = c("jan.", "fev.", "mar.", "abr.", "maio", "jun.", "jul.", "ago.", "set.", "out.", "nov.", "dez."),
    status = c(realizado = "Realizado", andamento = "Acontecendo agora", previsto = "Previsto"),
    grupo_status = c(andamento = "Agora", realizado = "Já realizados", previsto = "Próximos"),
    formato = c(presencial = "Curso presencial", online = "Curso online", seminario = "Seminário"),
    online = "Online", agora = "Agora", herbario = "Herbário", herbarios = "Herbários",
    n_herbarios = "herbários na rede", n_paises = "países amazônicos", n_cursos = "cursos realizados",
    n_pessoas = "pessoas formadas", n_inst = "instituições envolvidas",
    pessoas = "participantes", ver_cursos = "Ver todos os cursos", cursos_url = "cursos.html",
    legenda = c(realizado = "Cursos realizados", andamento = "Acontecendo agora", previsto = "Cursos previstos"),
    grupos = c(coordenacao = "Coordenação", comite = "Comitê gestor",
               curadoria = "Curadoria nos herbários da rede", tecnica = "Equipe técnica e bolsistas",
               colaboracao = "Colaboradoras e colaboradores"),
    tipos = c(executor = "Herbários executores", parceiro = "Parceiros internacionais e de apoio")
  ),
  es = list(
    paises = c(BR = "Brasil", CO = "Colombia", EC = "Ecuador", BO = "Bolivia", PE = "Perú",
               US = "EE. UU.", DE = "Alemania", DK = "Dinamarca"),
    meses = c("ene.", "feb.", "mar.", "abr.", "may.", "jun.", "jul.", "ago.", "sep.", "oct.", "nov.", "dic."),
    status = c(realizado = "Realizado", andamento = "En curso ahora", previsto = "Previsto"),
    grupo_status = c(andamento = "Ahora", realizado = "Ya realizados", previsto = "Próximos"),
    formato = c(presencial = "Curso presencial", online = "Curso en línea", seminario = "Seminario"),
    online = "En línea", agora = "Ahora", herbario = "Herbario", herbarios = "Herbarios",
    n_herbarios = "herbarios en la red", n_paises = "países amazónicos", n_cursos = "cursos realizados",
    n_pessoas = "personas formadas", n_inst = "instituciones involucradas",
    pessoas = "participantes", ver_cursos = "Ver todos los cursos", cursos_url = "cursos.html",
    legenda = c(realizado = "Cursos realizados", andamento = "En curso ahora", previsto = "Cursos previstos"),
    grupos = c(coordenacao = "Coordinación", comite = "Comité de gestión",
               curadoria = "Curaduría en los herbarios de la red", tecnica = "Equipo técnico y becarios",
               colaboracao = "Colaboradoras y colaboradores"),
    tipos = c(executor = "Herbarios ejecutores", parceiro = "Socios internacionales y de apoyo")
  ),
  en = list(
    paises = c(BR = "Brazil", CO = "Colombia", EC = "Ecuador", BO = "Bolivia", PE = "Peru",
               US = "USA", DE = "Germany", DK = "Denmark"),
    meses = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
    status = c(realizado = "Completed", andamento = "Happening now", previsto = "Upcoming"),
    grupo_status = c(andamento = "Now", realizado = "Completed", previsto = "Upcoming"),
    formato = c(presencial = "On-site course", online = "Online course", seminario = "Seminar"),
    online = "Online", agora = "Now", herbario = "Herbarium", herbarios = "Herbaria",
    n_herbarios = "herbaria in the network", n_paises = "Amazonian countries", n_cursos = "courses completed",
    n_pessoas = "people trained", n_inst = "institutions involved",
    pessoas = "participants", ver_cursos = "See all courses", cursos_url = "cursos.html",
    legenda = c(realizado = "Completed courses", andamento = "Happening now", previsto = "Upcoming courses"),
    grupos = c(coordenacao = "Coordination", comite = "Steering committee",
               curadoria = "Curators across the network", tecnica = "Technical team and fellows",
               colaboracao = "Collaborators"),
    tipos = c(executor = "Network herbaria", parceiro = "International and supporting partners")
  ),
  de = list(
    paises = c(BR = "Brasilien", CO = "Kolumbien", EC = "Ecuador", BO = "Bolivien", PE = "Peru",
               US = "USA", DE = "Deutschland", DK = "Dänemark"),
    meses = c("Jan.", "Feb.", "März", "Apr.", "Mai", "Juni", "Juli", "Aug.", "Sep.", "Okt.", "Nov.", "Dez."),
    status = c(realizado = "Abgeschlossen", andamento = "Läuft gerade", previsto = "Geplant"),
    grupo_status = c(andamento = "Jetzt", realizado = "Abgeschlossen", previsto = "Demnächst"),
    formato = c(presencial = "Präsenzkurs", online = "Online-Kurs", seminario = "Seminar"),
    online = "Online", agora = "Jetzt", herbario = "Herbarium", herbarios = "Herbarien",
    n_herbarios = "Herbarien im Netzwerk", n_paises = "Amazonasländer", n_cursos = "abgeschlossene Kurse",
    n_pessoas = "geschulte Personen", n_inst = "beteiligte Institutionen",
    pessoas = "Teilnehmende", ver_cursos = "Alle Kurse ansehen", cursos_url = "cursos.html",
    legenda = c(realizado = "Abgeschlossene Kurse", andamento = "Läuft gerade", previsto = "Geplante Kurse"),
    grupos = c(coordenacao = "Koordination", comite = "Lenkungsausschuss",
               curadoria = "Kuratorinnen und Kuratoren der Netzwerkherbarien", tecnica = "Technisches Team und Stipendiat:innen",
               colaboracao = "Mitwirkende"),
    tipos = c(executor = "Herbarien des Netzwerks", parceiro = "Internationale und unterstützende Partner")
  )
)

# "2026-10" -> "out. 2026"; "2026-10-05" + "2026-10-09" -> "5–9 out. 2026"
.periodo <- function(ini, fim, lang) {
  if (is.na(ini)) return("")
  m <- .tx[[lang]]$meses
  p <- as.integer(strsplit(ini, "-")[[1]])
  if (length(p) == 2) return(paste(m[p[2]], p[1]))
  if (is.na(fim)) return(paste(p[3], m[p[2]], p[1]))
  q <- as.integer(strsplit(fim, "-")[[1]])
  if (q[2] == p[2]) paste0(p[3], "–", q[3], " ", m[p[2]], " ", p[1])
  else paste0(p[3], " ", m[p[2]], " – ", q[3], " ", m[q[2]], " ", p[1])
}

# Junta cursos + herbários (local, instituição, coordenadas)
.cursos <- function(lang) {
  cu <- .ler("cursos.csv"); he <- .ler("herbarios.csv"); tx <- .tx[[lang]]
  rownames(he) <- he$sigla
  for (k in c("titulo", "detalhes", "participantes", "inicio", "fim")) if (is.null(cu[[k]])) cu[[k]] <- NA
  do.call(rbind, lapply(seq_len(nrow(cu)), function(i) {
    s <- if (is.na(cu$herbarios[i])) character() else trimws(strsplit(cu$herbarios[i], ";")[[1]])
    online <- !length(s)
    h <- if (online) list(cidade = tx$online, pais = NA, lat = NA, lng = NA) else he[s[1], ]
    data.frame(siglas = paste(s, collapse = " · "),
               instituicao = if (online) "" else paste(unique(he[s, "instituicao"]), collapse = " · "),
               cidade = h$cidade, pais = if (online) "" else tx$paises[[h$pais]], lat = h$lat, lng = h$lng,
               status = cu$status[i], formato = cu$formato[i] %||% "presencial",
               periodo = .periodo(cu$inicio[i], cu$fim[i], lang),
               participantes = cu$participantes[i], hub = !online && s[1] == "INPA",
               titulo = cu$titulo[i], detalhes = cu$detalhes[i],
               stringsAsFactors = FALSE)
  }))
}

# ---------------------------------------------------------------------
# Fotos do topo da página inicial: todas as imagens da pasta
# assets/images/hero/ (em ordem alfabética) se alternam sozinhas.
# Para trocar ou incluir fotos, basta colocar/remover arquivos .jpg ali
# (de preferência com ~1800 px de largura e menos de 500 KB).
# ---------------------------------------------------------------------
hero_fotos_html <- function() {
  r <- .raiz(); pre <- if (r == ".") "" else paste0(r, "/")
  f <- sort(list.files(file.path(r, "assets", "images", "hero"), pattern = "\\.(jpe?g|png|webp)$", ignore.case = TRUE))
  if (!length(f)) return(invisible())
  sl <- vapply(seq_along(f), function(i) sprintf("<div class='hero-slide%s' style=\"background-image:url('%sassets/images/hero/%s')\"></div>",
                                                  if (i == 1) " ativo" else "", pre, f[i]), "")
  .html("<div class='hero-slides' aria-hidden='true'>", paste(sl, collapse = ""), "</div>")
}

# ---------------------------------------------------------------------
# Faixa "Agora": aparece sozinha quando algum curso está com status "andamento"
# ---------------------------------------------------------------------
agora_html <- function(lang = "pt") {
  tx <- .tx[[lang]]; cu <- .cursos(lang); a <- cu[cu$status == "andamento", ]
  if (!nrow(a)) return(invisible())
  itens <- vapply(seq_len(nrow(a)), function(i) sprintf(
    "<a class='agora' href='%s'><span class='agora-pulse'></span><span class='agora-tag'>%s</span><span class='agora-txt'><strong>%s, %s</strong> — %s %s · %s%s</span><i class='bi bi-arrow-right'></i></a>",
    tx$cursos_url, tx$agora, a$cidade[i], a$pais[i], tx$formato[[a$formato[i]]],
    if (grepl("·", a$siglas[i])) "" else paste0("(", a$siglas[i], ")"), .esc(a$instituicao[i]),
    if (nzchar(a$periodo[i])) paste0(" · ", a$periodo[i]) else ""), "")
  .html("<div class='agora-wrap'>", paste(itens, collapse = ""), "</div>")
}

# ---------------------------------------------------------------------
# Números da rede
# ---------------------------------------------------------------------
numeros_html <- function(lang = "pt") {
  tx <- .tx[[lang]]; he <- .ler("herbarios.csv"); cu <- .ler("cursos.csv")
  ex <- he[he$tipo == "executor", ]
  n <- list(c(nrow(ex), tx$n_herbarios), c(length(unique(ex$pais)), tx$n_paises),
            c(sum(he$tipo %in% c("executor", "parceiro")), tx$n_inst))
  .html("<div class='numeros'>", paste(vapply(n, function(x) sprintf(
    "<div class='numero'><span class='numero-n'>%s</span><span class='numero-l'>%s</span></div>", x[1], x[2]), ""),
    collapse = ""), "</div>")
}

# ---------------------------------------------------------------------
# "Em números": indicadores do projeto (página inicial)
# Contados sozinhos: publicações (publicacoes.bib), cursos e pessoas
# capacitadas (cursos.csv, status realizado ou andamento).
# Informados à mão em dados/indicadores.csv: ferramentas, palestras, eventos.
# ---------------------------------------------------------------------
indicadores_html <- function(lang = "pt") {
  L <- list(
    pt = c(pessoas = "pessoas capacitadas", pessoas_d = "em cursos presenciais nos herbários da rede",
           cursos_presencial = "cursos presenciais", cursos_online = "curso online|cursos online",
           publicacoes = "publicações", ferramentas = "ferramentas", palestras = "palestras", eventos = "eventos científicos"),
    es = c(pessoas = "personas capacitadas", pessoas_d = "en cursos presenciales en los herbarios de la red",
           cursos_presencial = "cursos presenciales", cursos_online = "curso en línea|cursos en línea",
           publicacoes = "publicaciones", ferramentas = "herramientas", palestras = "conferencias", eventos = "eventos científicos"),
    en = c(pessoas = "people trained", pessoas_d = "in hands-on courses at the network's herbaria",
           cursos_presencial = "in-person courses", cursos_online = "online course|online courses",
           publicacoes = "publications", ferramentas = "tools", palestras = "talks", eventos = "scientific events"),
    de = c(pessoas = "geschulte Personen", pessoas_d = "in Präsenzkursen in den Herbarien des Netzwerks",
           cursos_presencial = "Präsenzkurse", cursos_online = "Online-Kurs|Online-Kurse",
           publicacoes = "Publikationen", ferramentas = "Werkzeuge", palestras = "Vorträge", eventos = "wissenschaftliche Veranstaltungen"))[[lang]]
  r <- .raiz(); cu <- .ler("cursos.csv")
  feitos <- cu[cu$status %in% c("realizado", "andamento"), ]
  bib <- file.path(r, "publicacoes", "publicacoes.bib")
  n_pub <- if (file.exists(bib)) sum(grepl("^\\s*@\\w+\\s*\\{", readLines(bib, encoding = "UTF-8", warn = FALSE))) else 0
  ind <- tryCatch(.ler("indicadores.csv"), error = function(e) data.frame(indicador = character(), valor = numeric()))
  man <- function(k) { v <- ind$valor[ind$indicador == k]; if (length(v)) v[1] else 0 }
  n_on <- sum(feitos$formato == "online")
  rot_on <- strsplit(L[["cursos_online"]], "|", fixed = TRUE)[[1]][if (n_on == 1) 1 else 2]
  pes <- sum(suppressWarnings(as.numeric(feitos$participantes)), na.rm = TRUE)
  itens <- list(
    c("bi-geo-alt", sum(feitos$formato == "presencial"), L[["cursos_presencial"]]),
    c("bi-laptop", n_on, rot_on),
    c("bi-camera-video", man("palestras"), L[["palestras"]]),
    c("bi-journal-text", n_pub, L[["publicacoes"]]),
    c("bi-tools", man("ferramentas"), L[["ferramentas"]]),
    c("bi-calendar-event", man("eventos"), L[["eventos"]]))
  .html("<div class='indicadores'>",
        sprintf("<div class='ind-destaque'><i class='bi bi-mortarboard'></i><span class='ind-n'>%s</span><span class='ind-l'>%s</span><span class='ind-d'>%s</span></div>",
                pes, L[["pessoas"]], L[["pessoas_d"]]),
        "<div class='ind-grade'>",
        paste(vapply(itens, function(x) sprintf("<div class='ind'><i class='bi %s'></i><span class='ind-n'>%s</span><span class='ind-l'>%s</span></div>", x[1], x[2], x[3]), ""), collapse = ""),
        "</div></div>")
}

# ---------------------------------------------------------------------
# Mapa interativo (Leaflet) com linhas saindo de Manaus
# ---------------------------------------------------------------------
mapa_html <- function(lang = "pt", altura = "560px", id = "mapa-cursos") {
  tx <- .tx[[lang]]; cu <- .cursos(lang); cu <- cu[!is.na(cu$lat), ]
  cu$status_txt <- unname(tx$status[cu$status])
  cu$formato_txt <- unname(tx$formato[cu$formato])
  dados <- jsonlite::toJSON(cu, dataframe = "rows", na = "null", auto_unbox = TRUE)
  leg <- paste(vapply(names(tx$legenda), function(s) sprintf(
    "<span class='leg-item'><span class='pin pin-%s'></span>%s</span>", s, tx$legenda[[s]]), ""), collapse = "")
  .html(
    "<link rel='stylesheet' href='https://unpkg.com/leaflet@1.9.4/dist/leaflet.css'>",
    "<script src='https://unpkg.com/leaflet@1.9.4/dist/leaflet.js'></script>",
    sprintf("<div class='mapa-box'><div id='%s' class='mapa' style='height:%s'></div><div class='mapa-legenda'>%s</div></div>", id, altura, leg),
    "<script>(function(){",
    sprintf("var D=%s, el='%s', PT='%s';", dados, id, tx$pessoas),
    "var cor={realizado:'#ffd23f',andamento:'#ff5a5f',previsto:'#7fd8ff'};",
    "var map=L.map(el,{scrollWheelZoom:false,zoomSnap:0.25,attributionControl:true});",
    "L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',{maxZoom:12,attribution:'Imagery &copy; Esri'}).addTo(map);",
    "var hub=D.filter(function(d){return d.hub})[0]||D[0];",
    "function curva(a,b){var p=[],lat1=a.lat,lng1=a.lng,lat2=b.lat,lng2=b.lng,dx=lng2-lng1,dy=lat2-lat1,",
    " cx=(lng1+lng2)/2-dy*0.25,cy=(lat1+lat2)/2+dx*0.25;",
    " for(var t=0;t<=1.0001;t+=0.04){var x=(1-t)*(1-t)*lng1+2*(1-t)*t*cx+t*t*lng2,y=(1-t)*(1-t)*lat1+2*(1-t)*t*cy+t*t*lat2;p.push([y,x]);}return p;}",
    "var pts=[];",
    "D.forEach(function(d){pts.push([d.lat,d.lng]);",
    " if(!d.hub){L.polyline(curva(hub,d),{color:cor[d.status],weight:2.5,opacity:1,dashArray:'6 6',interactive:false}).addTo(map);}",
    " var ic=L.divIcon({className:'',html:'<span class=\"pin pin-'+d.status+(d.hub?' pin-hub':'')+'\"></span>',iconSize:[22,22],iconAnchor:[11,11]});",
    " var pop='<div class=\"pop\"><div class=\"pop-st pop-'+d.status+'\">'+d.status_txt+'</div><div class=\"pop-t\">'+d.cidade+', '+d.pais+'</div>'+",
    "  '<div class=\"pop-s\"><b>'+d.siglas+'</b> · '+d.instituicao+'</div>'+",
    "  '<div class=\"pop-m\">'+d.formato_txt+(d.periodo?' · '+d.periodo:'')+(d.participantes?' · '+d.participantes+' '+PT:'')+'</div></div>';",
    " L.marker([d.lat,d.lng],{icon:ic,riseOnHover:true}).addTo(map).bindPopup(pop)",
    "  .bindTooltip(d.siglas,{permanent:true,direction:(d.siglas==='UFPA'?'bottom':'right'),offset:(d.siglas==='UFPA'?[0,10]:[10,0]),className:'map-label'});",
    "});",
    "var pq=window.innerWidth<768; map.fitBounds(pts,pq?{paddingTopLeft:[24,24],paddingBottomRight:[72,24]}:{paddingTopLeft:[40,40],paddingBottomRight:[60,80]});",
    "window.addEventListener('resize',function(){map.invalidateSize();});",
    "})();</script>")
}

# ---------------------------------------------------------------------
# Lista de cursos (Agora / Já realizados / Próximos)
# ---------------------------------------------------------------------
cursos_html <- function(lang = "pt") {
  tx <- .tx[[lang]]; cu <- .cursos(lang); out <- "<div class='cursos-lista'>"
  for (s in c("andamento", "realizado", "previsto")) {
    x <- cu[cu$status == s, ]
    if (!nrow(x)) next
    out <- c(out, sprintf("<div class='cursos-grupo'><h3 class='cursos-gt gt-%s'>%s <span>%d</span></h3><div class='cursos-grid'>",
                          s, tx$grupo_status[[s]], nrow(x)))
    for (i in seq_len(nrow(x))) {
      online <- !nzchar(x$siglas[i])
      sig <- if (online) .esc(x$titulo[i] %||% "") else sprintf("<b>%s</b> · %s", x$siglas[i], .esc(x$instituicao[i]))
      det <- if (!is.na(x$detalhes[i])) sprintf("<p class='curso-det'>%s</p>", .esc(x$detalhes[i])) else ""
      out <- c(out, sprintf(
      "<article class='curso curso-%s%s'><div class='curso-top'><span class='pin pin-%s'></span><span class='curso-st'>%s</span>%s</div><h4>%s <small>%s</small></h4><p class='curso-sig'>%s</p>%s<p class='curso-meta'>%s%s</p></article>",
      s, if (online) " curso-online" else "", s, tx$status[[s]], if (nzchar(x$periodo[i])) sprintf("<span class='curso-data'>%s</span>", x$periodo[i]) else "",
      x$cidade[i], x$pais[i], sig, det, tx$formato[[x$formato[i]]],
      if (!is.na(x$participantes[i])) sprintf(" · %s %s", x$participantes[i], tx$pessoas) else ""))
    }
    out <- c(out, "</div></div>")
  }
  .html(paste(c(out, "</div>"), collapse = ""))
}

# ---------------------------------------------------------------------
# Herbários e instituições da rede
# ---------------------------------------------------------------------
herbarios_html <- function(lang = "pt", tipo = "executor") {
  tx <- .tx[[lang]]; he <- .ler("herbarios.csv"); he <- he[he$tipo == tipo, ]
  cards <- vapply(seq_len(nrow(he)), function(i) sprintf(
    "<div class='herb'><span class='herb-sigla'>%s</span><span class='herb-inst'>%s</span><span class='herb-loc'><i class='bi bi-geo-alt'></i> %s, %s</span></div>",
    he$sigla[i], .esc(he$instituicao[i]), he$cidade[i], tx$paises[[he$pais[i]]]), "")
  .html("<div class='herb-grid herb-", tipo, "'>", paste(cards, collapse = ""), "</div>")
}

# ---------------------------------------------------------------------
# Equipe
# ---------------------------------------------------------------------
equipe_html <- function(lang = "pt") {
  tx <- .tx[[lang]]; eq <- .ler("equipe.csv"); out <- character()
  papel <- eq[[paste0("papel_", lang)]]
  ini <- function(n) { p <- strsplit(n, " ")[[1]]; p <- p[!tolower(p) %in% c("da", "de", "do", "dos", "das")]
                       toupper(paste0(substr(p[1], 1, 1), substr(p[length(p)], 1, 1))) }
  for (g in names(tx$grupos)) {
    x <- which(eq$grupo == g)
    if (!length(x)) next
    out <- c(out, sprintf("<h2 class='eq-titulo'>%s</h2><div class='eq-grid eq-%s'>", tx$grupos[[g]], g))
    for (i in x) {
      links <- c(if (!is.na(eq$lattes[i])) sprintf("<a href='%s' target='_blank' rel='noopener' title='Lattes'>Lattes</a>", eq$lattes[i]),
                 if (!is.na(eq$orcid[i])) sprintf("<a href='https://orcid.org/%s' target='_blank' rel='noopener' title='ORCID'>ORCID</a>", sub(".*orcid.org/", "", eq$orcid[i])))
      out <- c(out, sprintf(
        "<div class='pessoa'><span class='avatar'>%s</span><div class='pessoa-txt'><span class='pessoa-nome'>%s</span>%s<span class='pessoa-inst'>%s · %s</span><span class='pessoa-links'>%s</span></div></div>",
        ini(eq$nome[i]), eq$nome[i], if (!is.na(papel[i])) sprintf("<span class='pessoa-papel'>%s</span>", papel[i]) else "",
        .esc(eq$instituicao[i]), tx$paises[[eq$pais[i]]], paste(links, collapse = "")))
    }
    out <- c(out, "</div>")
  }
  .html(paste(out, collapse = ""))
}

# ---------------------------------------------------------------------
# Galeria de fotos dos cursos: fotos em assets/images/galeria/ listadas em
# dados/fotos.csv (arquivo, destaque, legenda nos 4 idiomas), na ordem da tabela.
# Clique abre ampliada. n = quantas fotos mostrar (NULL = todas); na página
# inicial aparecem primeiro as marcadas com destaque = "sim".
# ---------------------------------------------------------------------
galeria_html <- function(lang = "pt", n = NULL) {
  r <- .raiz(); pre <- if (r == ".") "" else paste0(r, "/")
  fo <- .ler("fotos.csv")
  fo <- fo[file.exists(file.path(r, "assets", "images", "galeria", fo$arquivo)), ]
  if (!is.null(n)) {
    d <- fo[!is.na(fo$destaque) & fo$destaque == "sim", ]
    fo <- head(rbind(d, fo[!(fo$arquivo %in% d$arquivo), ]), n)
  }
  leg <- fo[[paste0("legenda_", lang)]]; leg[is.na(leg)] <- ""
  leg <- gsub("\\]", ")", gsub("\\[", "(", leg))
  cat("\n::: {.galeria}\n\n",
      paste0("![", leg, "](", pre, "assets/images/galeria/", fo$arquivo, "){.lightbox group=\"cursos\"}", collapse = "\n\n"),
      "\n\n:::\n\n", sep = "")
}

# ---------------------------------------------------------------------
# Logos de quem realiza e apoia: arquivos em assets/images/logos/realizacao/
# e assets/images/logos/apoio/, listados (e ordenados) em dados/logos.csv.
# Só aparecem as logos que estão na tabela.
# ---------------------------------------------------------------------
logos_html <- function(lang = "pt") {
  r <- .raiz(); pre <- if (r == ".") "" else paste0(r, "/")
  tit <- list(pt = c(realizacao = "Realização", apoio = "Apoio"),
              es = c(realizacao = "Realización", apoio = "Apoyo"),
              en = c(realizacao = "Led by", apoio = "Support"),
              de = c(realizacao = "Durchführung", apoio = "Förderung"))[[lang]]
  lo <- .ler("logos.csv")
  lo <- lo[file.exists(file.path(r, "assets", "images", "logos", lo$grupo, lo$arquivo)), ]
  out <- character()
  for (g in names(tit)) {
    x <- lo[lo$grupo == g, ]
    if (!nrow(x)) next
    imgs <- paste(sprintf("<img src='%sassets/images/logos/%s/%s' alt='%s'>", pre, g, x$arquivo, x$nome), collapse = "")
    out <- c(out, sprintf("<div class='logos-grupo'><span class='logos-tit'>%s</span><div class='logos-lista'>%s</div></div>",
                          tit[[g]], imgs))
  }
  if (length(out)) .html("<div class='logos'>", paste(out, collapse = ""), "</div>")
}

# Seção "fluxo de trabalho" (passo a passo da página inicial)
source(file.path(.raiz(), "R", "fluxo.R"), encoding = "UTF-8", local = environment())
