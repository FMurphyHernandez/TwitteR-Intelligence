library(shiny)

shinyServer(
  function(input, output) {

	
	source('Proof.R')
	source('Feel.R')
	data<-Proof()
	data$text<-as.character(data$text)

	output$Tweet1 <- renderText({data$text[1]})
	output$Tweet2 <- renderText({data$text[2]})
	output$Tweet3 <- renderText({data$text[3]})
	output$Tweet4 <- renderText({data$text[4]})
	output$Tweet5 <- renderText({data$text[5]})

		Train<-read.csv('Train.csv')
		#input$action = 0
#renderUI({
  #  input$action
 #  isolate(Feel(input$radio1,input$radio2,input$radio3,input$radio4,input$radio5,data),
#	data<-Proof())
 # })



#REAC<-reactive({
#    if (input$action == 0) {return(NULL)}
 #   Feel(input$radio1,input$radio2,input$radio3,input$radio4,input$radio5,data)
#	data<-Proof()
 # })


 observe({
   input$action 
  if (input$action == 1)Feel(input$radio1,input$radio2,input$radio3,input$radio4,input$radio5,data)	
 })



  output$downloadData <- downloadHandler(

    filename = function() { 
		'Train.csv'
	 },
    content = function(file) {
      write.csv(Train, file)
   }
  )




  }
)
