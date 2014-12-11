library(shiny)

shinyUI(fluidPage(
  titlePanel('Mapa de Sentimientos'),
  
  fluidRow(
    column(12,
      p("Clasifique los cinco tweets  como",
        "bueno, malo o neutral, sea paciente los tweets pueden tardar en cargar."),
	
	h3('Tweet1'),
	textOutput('Tweet1'),
	 br(),

      radioButtons("radio1", label = NULL,
        choices = list("Malo" = 'B', "Neutral" = 'N',
                       "Bueno" = 'G'),selected = NULL,inline=TRUE),

h3('Tweet2'),	
	textOutput('Tweet2'),
	 br(),

      radioButtons("radio2", label = NULL,
        choices = list("Malo" = 'B', "Neutral" = 'N',
                       "Bueno" = 'G'),selected = NULL,inline=TRUE),


h3('Tweet3'),	
	textOutput('Tweet3'),
	 br(),

      radioButtons("radio3", label = NULL,
        choices = list("Malo" = 'B', "Neutral" = 'N',
                       "Bueno" = 'G'),selected = NULL,inline=TRUE),

h3('Tweet4'),	
	textOutput('Tweet4'),
	 br(),

      radioButtons("radio4", label = NULL,
        choices = list("Malo" = 'B', "Neutral" = 'N',
                       "Bueno" = 'G'),selected = NULL,inline=TRUE),

h3('Tweet5'),	
	textOutput('Tweet5'),
	 br(),

      radioButtons("radio5", label = NULL,
        choices = list("Malo" = 'B', "Neutral" = 'N',
                       "Bueno" = 'G'),selected = NULL,inline=TRUE),

br(),
column(3,
actionButton("action", label = "Submit"),
#br(),
#h3('Password'),

 #textInput("text", label = NULL, value = "Enter password..."),
br(),
downloadButton('downloadData', 'Download')
)





	
    )
    
  

 
  )
))
