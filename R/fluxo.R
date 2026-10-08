# =====================================================================
# Fluxo de trabalho no herbário, passo a passo (seção interativa)
# Textos nos 4 idiomas abaixo; ilustrações em SVG desenhadas aqui mesmo.
# Para mudar um texto, edite a lista .fluxo_tx.
# =====================================================================

.fluxo_tx <- list(
  pt = list(
    nav = c("Escolher", "Registrar", "Calibrar", "Medir", "Ver", "Compartilhar"),
    ant = "Anterior", prox = "Próximo", passo = "Passo",
    camadas = c("luz", "folha", "fundo preto", "cartolina"),
    passos = list(
      c("Escolher a exsicata",
        "No herbário, as plantas secas ficam guardadas em armários, organizadas por família e espécie. Escolhemos uma exsicata que já foi identificada por especialistas.",
        "Armário → pasta → exsicata"),
      c("Registrar a amostra",
        "Lemos o código de barras da exsicata, que funciona como a identidade dela, e anotamos os dados da leitura (quem mediu, qual aparelho, qual folha e face) na planilha do protocolo de metadados.",
        "Protocolo de metadados · herbflow"),
      c("Calibrar o aparelho",
        "Antes de começar, o espectrômetro mede uma peça branca de referência. Assim, uma leitura feita em Manaus pode ser comparada com outra feita em Quito ou La Paz.",
        "Referência branca"),
      c("Medir a folha",
        "Encostamos o espectrômetro na folha, com um fundo preto por baixo. Ele lança luz infravermelha e mede quanto dela volta. Repetimos em vários pontos, nas duas faces da folha.",
        "Sem cortar, sem danificar"),
      c("Ver o espectro",
        "Em segundos, a leitura vira uma curva na tela: a assinatura espectral daquela folha. Leituras com problema são refeitas na hora.",
        "900–1700 nm"),
      c("Guardar e compartilhar",
        "Os espectros, junto com os dados de cada exsicata, entram em um banco de dados padronizado, igual em todos os herbários da rede. Com eles, treinamos modelos que ajudam a reconhecer espécies.",
        "Banco de dados · identificação de espécies")
    )
  ),
  es = list(
    nav = c("Elegir", "Registrar", "Calibrar", "Medir", "Ver", "Compartir"),
    ant = "Anterior", prox = "Siguiente", passo = "Paso",
    camadas = c("luz", "hoja", "fondo negro", "cartulina"),
    passos = list(
      c("Elegir la exsicata",
        "En el herbario, las plantas secas se guardan en armarios, organizadas por familia y especie. Elegimos una exsicata que ya fue identificada por especialistas.",
        "Armario → carpeta → exsicata"),
      c("Registrar la muestra",
        "Leemos el código de barras de la exsicata, que funciona como su identidad, y anotamos los datos de la lectura (quién midió, qué equipo, qué hoja y cara) en la planilla del protocolo de metadatos.",
        "Protocolo de metadatos · herbflow"),
      c("Calibrar el equipo",
        "Antes de empezar, el espectrómetro mide una pieza blanca de referencia. Así, una lectura hecha en Manaos puede compararse con otra hecha en Quito o La Paz.",
        "Referencia blanca"),
      c("Medir la hoja",
        "Apoyamos el espectrómetro sobre la hoja, con un fondo negro debajo. Emite luz infrarroja y mide cuánto de ella regresa. Repetimos en varios puntos, en las dos caras de la hoja.",
        "Sin cortar, sin dañar"),
      c("Ver el espectro",
        "En segundos, la lectura se convierte en una curva en la pantalla: la firma espectral de esa hoja. Las lecturas con problemas se repiten en el momento.",
        "900–1700 nm"),
      c("Guardar y compartir",
        "Los espectros, junto con los datos de cada exsicata, entran en una base de datos estandarizada, igual en todos los herbarios de la red. Con ellos entrenamos modelos que ayudan a reconocer especies.",
        "Base de datos · identificación de especies")
    )
  ),
  en = list(
    nav = c("Choose", "Record", "Calibrate", "Measure", "See", "Share"),
    ant = "Previous", prox = "Next", passo = "Step",
    camadas = c("light", "leaf", "black background", "card"),
    passos = list(
      c("Choose the specimen",
        "In the herbarium, dried plants are kept in cabinets, organized by family and species. We choose a specimen that has already been identified by specialists.",
        "Cabinet → folder → specimen"),
      c("Record the sample",
        "We scan the specimen's barcode, which works as its identity, and record the reading details (who measured, which device, which leaf and side) in the metadata protocol spreadsheet.",
        "Metadata protocol · herbflow"),
      c("Calibrate the device",
        "Before starting, the spectrometer measures a white reference piece. That way, a reading taken in Manaus can be compared with one taken in Quito or La Paz.",
        "White reference"),
      c("Measure the leaf",
        "We place the spectrometer on the leaf, with a black background underneath. It shines infrared light and measures how much of it comes back. We repeat this at several points, on both sides of the leaf.",
        "No cutting, no damage"),
      c("See the spectrum",
        "Within seconds, the reading becomes a curve on the screen: the spectral signature of that leaf. Faulty readings are redone on the spot.",
        "900–1700 nm"),
      c("Store and share",
        "The spectra, together with the data of each specimen, go into a standardized database, the same in every herbarium of the network. With them we train models that help recognize species.",
        "Database · species identification")
    )
  ),
  de = list(
    nav = c("Auswählen", "Erfassen", "Kalibrieren", "Messen", "Ansehen", "Teilen"),
    ant = "Zurück", prox = "Weiter", passo = "Schritt",
    camadas = c("Licht", "Blatt", "schwarzer Hintergrund", "Karton"),
    passos = list(
      c("Den Beleg auswählen",
        "Im Herbarium werden getrocknete Pflanzen in Schränken aufbewahrt, nach Familie und Art geordnet. Wir wählen einen Beleg, der bereits von Fachleuten bestimmt wurde.",
        "Schrank → Mappe → Beleg"),
      c("Die Probe erfassen",
        "Wir scannen den Barcode des Belegs, der wie sein Ausweis funktioniert, und tragen die Messdaten (wer gemessen hat, welches Gerät, welches Blatt, welche Seite) in die Tabelle des Metadatenprotokolls ein.",
        "Metadatenprotokoll · herbflow"),
      c("Das Gerät kalibrieren",
        "Vor Beginn misst das Spektrometer eine weiße Referenz. So lässt sich eine Messung aus Manaus mit einer aus Quito oder La Paz vergleichen.",
        "Weißreferenz"),
      c("Das Blatt messen",
        "Wir setzen das Spektrometer auf das Blatt, mit einem schwarzen Hintergrund darunter. Es sendet Infrarotlicht aus und misst, wie viel davon zurückkommt. Das wiederholen wir an mehreren Stellen, auf beiden Blattseiten.",
        "Ohne Schneiden, ohne Schaden"),
      c("Das Spektrum ansehen",
        "In Sekunden wird die Messung zu einer Kurve auf dem Bildschirm: der spektralen Signatur dieses Blattes. Fehlerhafte Messungen werden sofort wiederholt.",
        "900–1700 nm"),
      c("Speichern und teilen",
        "Die Spektren gelangen zusammen mit den Daten jedes Belegs in eine standardisierte Datenbank – in allen Herbarien des Netzwerks gleich. Damit trainieren wir Modelle, die beim Erkennen von Arten helfen.",
        "Datenbank · Artbestimmung")
    )
  )
)

# --- ilustrações (SVG) ---------------------------------------------------
.svg_folha <- function(x, y, s = 1, rot = 0, cor = "#2e7a3c") {
  sprintf("<g transform='translate(%s %s) rotate(%s) scale(%s)'><path d='M0 0 C10 -14 30 -16 44 -4 C30 8 10 8 0 0Z' fill='%s'/><path d='M2 -1 L40 -4' stroke='#fff' stroke-opacity='.55' stroke-width='1.2'/></g>", x, y, rot, s, cor)
}
.svg_ramo <- function(x, y, s = 1) {
  paste0(sprintf("<g transform='translate(%s %s) scale(%s)'>", x, y, s),
         "<path d='M0 90 C10 60 18 40 40 0' stroke='#6b4f2a' stroke-width='3' fill='none' stroke-linecap='round'/>",
         .svg_folha(8, 70, 0.9, -150), .svg_folha(14, 58, 0.9, -20), .svg_folha(22, 42, 0.85, -160),
         .svg_folha(27, 30, 0.85, -35), .svg_folha(34, 16, 0.75, -140), .svg_folha(38, 6, 0.7, -60), "</g>")
}
.svg_aparelho <- function(x, y, s = 1) {
  sprintf("<g transform='translate(%s %s) scale(%s)'><rect x='0' y='0' width='70' height='46' rx='16' fill='#23302a'/><rect x='22' y='9' width='26' height='18' rx='4' fill='#3b4a42'/><circle cx='12' cy='12' r='2.4' fill='#3ddc84'/><rect x='18' y='42' width='34' height='6' rx='3' fill='#5d8fd0'/></g>", x, y, s)
}

.fluxo_svgs <- function(lang) {
  cm <- .fluxo_tx[[lang]]$camadas
  defs <- "<defs><linearGradient id='fxEsp' x1='0' x2='1'><stop offset='0' stop-color='#4a2a8a'/><stop offset='.2' stop-color='#5d8fd0'/><stop offset='.4' stop-color='#11a35a'/><stop offset='.55' stop-color='#b8d82c'/><stop offset='.65' stop-color='#f5d800'/><stop offset='.78' stop-color='#f6a020'/><stop offset='.9' stop-color='#ee4a24'/><stop offset='1' stop-color='#8a1c22'/></linearGradient></defs>"
  folha_sheet <- function(x, y) paste0(
    sprintf("<g transform='translate(%s %s)'><rect width='120' height='160' rx='6' fill='#fff' stroke='#cfd9c8' stroke-width='2'/>", x, y),
    .svg_ramo(30, 20, 1), "<rect x='68' y='118' width='44' height='32' rx='3' fill='#f3efe2' stroke='#d8d0b8'/>",
    paste(sprintf("<rect x='%d' y='124' width='%d' height='12' fill='#23302a'/>", c(72, 76, 79, 84, 86, 90, 95, 98, 102), c(2, 1, 3, 1, 2, 3, 1, 2, 3)), collapse = ""),
    "<rect x='72' y='140' width='30' height='3' rx='1.5' fill='#c9bfa3'/></g>")
  s1 <- paste0("<svg viewBox='0 0 340 230' role='img' aria-hidden='true'>",
    "<rect x='22' y='24' width='120' height='186' rx='10' fill='#e3ece0' stroke='#1d4a28' stroke-width='2.5'/>",
    paste(sprintf("<line x1='22' y1='%d' x2='142' y2='%d' stroke='#1d4a28' stroke-width='2'/>", c(70, 116, 162), c(70, 116, 162)), collapse = ""),
    paste(sprintf("<rect x='%d' y='%d' width='22' height='34' rx='2' fill='%s'/>", rep(c(32, 58, 84, 110), 4), rep(c(34, 80, 126, 172), each = 4) , rep(c("#e9dcc0", "#d9c9a3", "#e9dcc0", "#cbb88f"), 4)), collapse = ""),
    "<rect x='84' y='80' width='22' height='34' rx='2' fill='#fff' stroke='#3ddc84' stroke-width='3'/>",
    "<path d='M150 117 C168 117 170 117 186 117' stroke='#2e7a3c' stroke-width='3' fill='none' stroke-dasharray='5 6'/><path d='M180 110 L190 117 L180 124' fill='none' stroke='#2e7a3c' stroke-width='3' stroke-linecap='round'/>",
    folha_sheet(200, 36), "</svg>")
  s2 <- paste0("<svg viewBox='0 0 340 230' role='img' aria-hidden='true'>",
    folha_sheet(24, 36),
    "<path d='M168 120 L134 174' stroke='#ee4a24' stroke-width='2.5' stroke-dasharray='3 3'/>",
    "<g transform='translate(160 92) rotate(-25)'><rect width='54' height='26' rx='8' fill='#23302a'/><rect x='34' y='20' width='16' height='34' rx='6' fill='#23302a'/><rect x='4' y='8' width='10' height='10' rx='2' fill='#ee4a24'/></g>",
    sprintf("<g transform='translate(218 40)'><rect width='104' height='150' rx='12' fill='#fff' stroke='#1d4a28' stroke-width='2.5'/><rect x='0' y='0' width='104' height='28' rx='12' fill='#1d4a28'/><rect x='0' y='16' width='104' height='12' fill='#1d4a28'/><text x='52' y='19' text-anchor='middle' font-family='Hanken Grotesk, sans-serif' font-size='11' font-weight='700' fill='#fff'>%s</text>", c(pt = "metadados", es = "metadatos", en = "metadata", de = "Metadaten")[[lang]]),
    paste(sprintf("<rect x='14' y='%d' width='%d' height='7' rx='3.5' fill='#dfe7da'/><circle cx='86' cy='%d' r='6' fill='#3ddc84'/><path d='M83 %d l2.5 2.5 l4.5 -5' stroke='#fff' stroke-width='1.8' fill='none'/>", c(44, 68, 92, 116), c(56, 48, 60, 44), c(47, 71, 95, 119), c(47, 71, 95, 119)), collapse = ""),
    "</g></svg>")
  s3 <- paste0("<svg viewBox='0 0 340 230' role='img' aria-hidden='true'>",
    "<ellipse cx='170' cy='196' rx='90' ry='10' fill='#1d4a28' opacity='.08'/>",
    "<rect x='110' y='140' width='120' height='54' rx='10' fill='#fff' stroke='#cfd9c8' stroke-width='2.5'/><rect x='120' y='132' width='100' height='14' rx='6' fill='#f4f7f2' stroke='#cfd9c8' stroke-width='2'/>",
    .svg_aparelho(128, 54, 1.2),
    "<path d='M150 116 L142 134 M170 116 L170 134 M190 116 L198 134' stroke='#f5c400' stroke-width='3' stroke-linecap='round'/>",
    "<circle cx='262' cy='70' r='24' fill='#3ddc84'/><path d='M250 70 l8 8 l15 -16' stroke='#fff' stroke-width='5' fill='none' stroke-linecap='round' stroke-linejoin='round'/>",
    "<path d='M70 60 l4 10 l10 4 l-10 4 l-4 10 l-4 -10 l-10 -4 l10 -4z' fill='#f6a020' opacity='.8'/><path d='M92 30 l2.5 6 l6 2.5 l-6 2.5 l-2.5 6 l-2.5 -6 l-6 -2.5 l6 -2.5z' fill='#5d8fd0' opacity='.8'/>",
    "</svg>")
  s4 <- paste0("<svg viewBox='0 0 340 230' role='img' aria-hidden='true'>",
    .svg_aparelho(135, 8, 1),
    "<path d='M155 56 L185 56 L205 120 L135 120 Z' fill='#f5d800' opacity='.35'/>",
    "<path d='M215 112 C230 80 236 60 244 40' stroke='url(#fxEsp4)' stroke-width='4' fill='none' stroke-linecap='round'/><path d='M226 116 C246 92 258 72 272 54' stroke='url(#fxEsp4)' stroke-width='4' fill='none' stroke-linecap='round' opacity='.7'/>",
    "<defs><linearGradient id='fxEsp4' x1='0' y1='1' x2='0' y2='0'><stop offset='0' stop-color='#4a2a8a'/><stop offset='.35' stop-color='#11a35a'/><stop offset='.6' stop-color='#f5d800'/><stop offset='1' stop-color='#ee4a24'/></linearGradient></defs>",
    "<rect x='60' y='120' width='220' height='22' rx='4' fill='#2e7a3c'/><rect x='60' y='146' width='220' height='18' rx='4' fill='#1b1b1b'/><rect x='60' y='168' width='220' height='18' rx='4' fill='#fff' stroke='#cfd9c8' stroke-width='2'/>",
    sprintf("<g font-family='Hanken Grotesk, sans-serif' font-size='12' font-weight='600' text-anchor='middle'><text x='112' y='96' fill='#8a6d00'>%s</text><text x='170' y='135' fill='#fff'>%s</text><text x='170' y='159' fill='#fff'>%s</text><text x='170' y='181' fill='#36443b'>%s</text></g>",
            cm[1], cm[2], cm[3], cm[4]),
    "</svg>")
  s5 <- paste0("<svg viewBox='0 0 340 230' role='img' aria-hidden='true'>", sub("fxEsp", "fxEsp5", defs),
    "<rect x='60' y='22' width='220' height='146' rx='10' fill='#23302a'/><rect x='70' y='32' width='200' height='126' rx='4' fill='#fff'/>",
    "<line x1='84' y1='140' x2='258' y2='140' stroke='#dfe7da' stroke-width='2'/><line x1='84' y1='46' x2='84' y2='140' stroke='#dfe7da' stroke-width='2'/>",
    "<path d='M86 74 C110 66 128 62 146 70 C158 76 162 82 172 80 C184 78 192 80 204 96 C214 110 222 116 232 106 C240 98 248 96 256 96' stroke='#2e7a3c' stroke-opacity='.25' stroke-width='2' fill='none' transform='translate(0 12)'/>",
    "<path d='M86 74 C110 66 128 62 146 70 C158 76 162 82 172 80 C184 78 192 80 204 96 C214 110 222 116 232 106 C240 98 248 96 256 96' stroke='url(#fxEsp5)' stroke-width='4.5' fill='none' stroke-linecap='round'/>",
    "<path d='M36 168 L304 168 L322 190 C322 194 318 196 314 196 L26 196 C22 196 18 194 18 190 Z' fill='#3b4a42'/><rect x='146' y='176' width='48' height='6' rx='3' fill='#23302a'/>",
    "</svg>")
  s6 <- paste0("<svg viewBox='0 0 340 230' role='img' aria-hidden='true'>",
    "<g stroke='#2e7a3c' stroke-width='2' stroke-dasharray='4 5' fill='none'><path d='M170 110 L66 52'/><path d='M170 110 L66 170'/><path d='M170 110 L274 52'/><path d='M170 110 L270 170'/></g>",
    "<g transform='translate(140 78)'><ellipse cx='30' cy='10' rx='30' ry='10' fill='#2e7a3c'/><path d='M0 10 v54 a30 10 0 0 0 60 0 v-54' fill='#1d4a28'/><path d='M0 28 a30 10 0 0 0 60 0 M0 46 a30 10 0 0 0 60 0' stroke='#3ddc84' stroke-width='2' fill='none'/></g>",
    paste(sprintf("<g transform='translate(%d %d)'><path d='M0 14 L20 2 L40 14 Z' fill='#1d4a28'/><rect x='4' y='16' width='32' height='20' fill='#e3ece0' stroke='#1d4a28' stroke-width='2'/><rect x='10' y='20' width='4' height='14' fill='#1d4a28'/><rect x='18' y='20' width='4' height='14' fill='#1d4a28'/><rect x='26' y='20' width='4' height='14' fill='#1d4a28'/></g>", c(46, 46, 252), c(30, 150, 150)), collapse = ""),
    "<g transform='translate(250 26)'><circle cx='24' cy='26' r='26' fill='#fff' stroke='#2e7a3c' stroke-width='2.5'/>", .svg_folha(8, 32, 0.75, -25), "<circle cx='40' cy='42' r='10' fill='#3ddc84'/><path d='M35 42 l4 4 l7 -8' stroke='#fff' stroke-width='2.5' fill='none' stroke-linecap='round'/></g>",
    "<text x='170' y='212' text-anchor='middle' font-family='Hanken Grotesk, sans-serif' font-size='12' font-weight='700' fill='#2e7a3c' letter-spacing='1'>HerbSpectra-Amazônia</text>",
    "</svg>")
  list(s1, s2, s3, s4, s5, s6)
}

fluxo_html <- function(lang = "pt") {
  tx <- .fluxo_tx[[lang]]; sv <- .fluxo_svgs(lang); n <- length(tx$passos)
  nav <- paste(sprintf("<button type='button' class='fx-dot%s' data-i='%d' aria-label='%s %d: %s'><span class='fx-num'>%d</span><span class='fx-lab'>%s</span></button>",
                       ifelse(seq_len(n) == 1, " ativo", ""), seq_len(n) - 1, tx$passo, seq_len(n), vapply(tx$passos, `[`, "", 1), seq_len(n), tx$nav), collapse = "")
  slides <- paste(vapply(seq_len(n), function(i) { p <- tx$passos[[i]]; sprintf(
    "<article class='fx-slide%s' data-i='%d'><div class='fx-arte'>%s</div><div class='fx-txt'><span class='fx-etapa'>%s %d / %d</span><h3>%s</h3><p>%s</p><span class='fx-chip'>%s</span></div></article>",
    if (i == 1) " ativo" else "", i - 1, sv[[i]], tx$passo, i, n, p[1], p[2], p[3]) }, ""), collapse = "")
  .html("<div class='fluxo' data-n='", n, "'>",
        "<div class='fx-nav' role='tablist'><div class='fx-trilha'><div class='fx-progresso'></div></div>", nav, "</div>",
        "<div class='fx-palco'>", slides, "</div>",
        sprintf("<div class='fx-controles'><button type='button' class='fx-btn fx-ant' aria-label='%s'><i class='bi bi-arrow-left'></i></button><span class='fx-cont'>1 / %d</span><button type='button' class='fx-btn fx-prox' aria-label='%s'>%s <i class='bi bi-arrow-right'></i></button></div>",
                tx$ant, n, tx$prox, tx$prox),
        "</div>")
}
