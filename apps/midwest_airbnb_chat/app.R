# ISA 401 midwest airbnb: ask questions, get SQL, a table, or a chart back
library(querychat)
library(shiny)
library(bslib)

con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db")

client = ellmer::chat_openai(
  model  = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)

qc = querychat(
  con, "listings",
  client   = client,
  tools    = c("filter", "query", "visualize"),  # visualize: charts in the chat (needs ggsql)
  greeting = "Ask me about 14,887 Airbnb listings in Chicago, Columbus, and the Twin Cities.",
  data_description = "data/data_desc.md",
  extra_instructions = "data/extra_instructions.md"
)

ui = page_sidebar(
  title = "Midwest Airbnb Chat",
  theme = bs_theme(
    primary = "#C31420",
    base_font = font_google("Lato")
  ),
  sidebar = qc$sidebar(),
  card(
    card_header("About"),
    p("Explore Airbnb listings from Inside Airbnb for three Midwest cities."),
    p("Chicago — July 20, 2026"),
    p("Columbus — July 23, 2026"),
    p("Twin Cities — July 21, 2026"),
    p("Built by Morgan Tanking")
  ),

  accordion(
    open = FALSE,
    accordion_panel(
      "SQL",
      verbatimTextOutput("sql")
    )
  )
)


server = function(input, output, session) {
  vals = qc$server()
  
  output$sql = renderText(
    vals$sql() %||% "SELECT * FROM listings"
  )
}

shinyApp(ui, server)