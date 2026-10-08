# HerbSpectra-Amazônia

Site da **Rede de Herbários Espectrais da Amazônia** (https://herbspectraamazonia.github.io), em português, espanhol, inglês e alemão. Feito em Quarto, no mesmo esquema do site do LEDT.

## O que muda com frequência (não precisa mexer nas páginas)

| Quero... | Edite |
|---|---|
| Atualizar cursos (realizado, acontecendo agora, previsto) | `dados/cursos.csv` |
| Atualizar a equipe | `dados/equipe.csv` |
| Incluir um herbário ou parceiro | `dados/herbarios.csv` |
| Incluir publicações | `publicacoes/publicacoes.bib` |

O mapa, os números da página inicial, a faixa **"Agora"** e as listas de cursos e da equipe se atualizam sozinhos nos três idiomas.

### dados/cursos.csv

- `herbarios`: sigla do herbário (igual à de `herbarios.csv`). Para mais de um herbário no mesmo curso, separe por `;` (ex.: `HUTI;QCNE`).
- `status`: `realizado`, `andamento` (aparece a faixa "Agora" na página inicial) ou `previsto`.
- `inicio` / `fim`: datas no formato `2026-10-06` (ou só o mês: `2026-10`). Podem ficar vazias.
- `participantes`: número de pessoas formadas. Quando preenchido, a página inicial passa a mostrar o total de pessoas formadas.
- `formato`: `presencial`, `online` ou `seminario`.

### dados/equipe.csv

- `grupo`: `coordenacao`, `comite`, `curadoria`, `tecnica` ou `colaboracao`.
- `papel_pt`, `papel_es`, `papel_en`: função curta (opcional), nos três idiomas.
- `orcid`: opcional, só o número (0000-0000-0000-0000).
- Quem está na equipe aparece em **negrito** na página de publicações automaticamente.

## Textos das páginas

- **Português:** `.qmd` na raiz (`index`, `sobre`, `cursos`, `equipe`, `publicacoes`, `contato`).
- **Espanhol / inglês / alemão:** mesmos arquivos nas pastas `es/`, `en/` e `de/`.
- **Menu e rodapé:** `_quarto-pt.yml`, `_quarto-es.yml`, `_quarto-en.yml`, `_quarto-de.yml`.
- **Cores e estilo:** `assets/herbspectra.scss`.

## Para publicar

No RStudio: aba **Build → Render Website** (ou `source("render_site.R")`). O `_idiomas.R` gera sozinho `docs/es`, `docs/en` e `docs/de`. Depois faça commit e push.

O botão **Render** de uma página só serve para pré-visualizar; ele não atualiza as outras versões. Use sempre o modo **Source** do RStudio (não o Visual), para o editor não reformatar as páginas.

## Fotos e logos

- **Topo da página inicial:** fotos em `assets/images/hero/` (se alternam sozinhas, em ordem alfabética).
- **Galeria de cursos:** fotos em `assets/images/galeria/`, listadas em `dados/fotos.csv` (nome do arquivo, `destaque` = sim para aparecer na página inicial, e legenda em português, espanhol, inglês e alemão). Só aparecem as fotos que estão na tabela, na ordem da tabela. Padrão de nome: `NN-cidade-sigla-N.jpg` (ex.: `17-santarem-hstm-1.jpg`).
- **Logos:** arquivos em `assets/images/logos/realizacao/` e `assets/images/logos/apoio/`, listados na ordem desejada em `dados/logos.csv`.

## Contador de visitas

O rodapé mostra um contador simples (visitor-badge), que soma as visualizações de todas as páginas.
