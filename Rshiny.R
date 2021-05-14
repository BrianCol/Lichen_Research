data <- read.csv("working.csv")

library(shiny)
library(DT)

dt_output = function(title, id) {
  fluidRow(column(
    12, h1(paste0('Table ', sub('.*?([0-9]+)$', '\\1', id), ': ', title)),
    hr(), DTOutput(id)
  ))
}
render_dt = function(data, editable = 'cell', server = TRUE, ...) {
  renderDT(data, selection = 'none', server = server, editable = editable, ...)
}

shinyApp(
  ui = fluidPage(
    title = 'Double-click to edit table cells',
    
    dt_output('client-side processing (editable = "cell")', 'x1'),
  ),
  
  server = function(input, output, session) {
    d1 = data
    d1$Date = Sys.time() + seq_len(nrow(d1))
    d10 = d9 = d8 = d7 = d6 = d5 = d4 = d3 = d2 = d1
    
    options(DT.options = list(pageLength = 5))
    
    # client-side processing
    output$x1 = render_dt(d1, 'cell', FALSE)
    
    observe(str(input$x1_cell_edit))
    
    # server-side processing
    output$x5 = render_dt(d5, 'cell')
    
    
    # edit a single cell
    proxy5 = dataTableProxy('x5')
    observeEvent(input$x5_cell_edit, {
      info = input$x5_cell_edit
      str(info)  # check what info looks like (a data frame of 3 columns)
      d5 <<- editData(d5, info)
      replaceData(proxy5, d5, resetPaging = FALSE)  # important
      # the above steps can be merged into a single editData() call; see examples below
    })
    
  }
)


