# ---------------------------------------------------------------------
# Limpeza de arquivos que o site não usa mais
# Rode no RStudio, com o projeto aberto:  source("limpar_arquivos_antigos.R")
# Depois rode quarto render (ou o render_site.R) normalmente.
# Pode rodar de novo sempre que trocar fotos: ele apaga da galeria
# tudo o que não está listado em dados/fotos.csv.
# ---------------------------------------------------------------------

apagados <- character()
apagar <- function(caminhos) {
  for (p in caminhos) if (file.exists(p)) {
    unlink(p, recursive = TRUE)
    apagados <<- c(apagados, p)
  }
}

# 1. Páginas e arquivos da versão antiga do site
apagar(c("agenda", "instituicoes", "midias", "downloads.qmd",
         "styles.css", "publicacoes.bib",          # o .bib certo fica em publicacoes/
         "assets/images/amazonia.jpg"))

# 2. Fotos antigas da galeria (fica só o que está em dados/fotos.csv)
fotos <- read.csv("dados/fotos.csv", encoding = "UTF-8", fileEncoding = "UTF-8")$arquivo
for (pasta in c("assets/images/galeria", "docs/assets/images/galeria")) {
  if (dir.exists(pasta)) {
    sobra <- setdiff(list.files(pasta), fotos)
    apagar(file.path(pasta, sobra))
  }
}

if (length(apagados)) {
  message(length(apagados), " arquivo(s)/pasta(s) apagado(s):\n  ", paste(apagados, collapse = "\n  "))
} else message("Nada para apagar: a pasta já está limpa.")
