library(shinyapps)
library(ggplot2)
library(shiny)
library(httr)

data(mtcars)

mtcars$cyl <- as.factor(mtcars$cyl)

fit <- lm(mpg ~ cyl + wt, data=mtcars)

shinyServer( function(input, output) 
{    
    output$distPlot <- renderPlot(
      {
      result <- predict(fit, newdata=data.frame(cyl=factor(input$cylinders), wt=c(input$weight)))
          
      diag <- ggplot(mtcars, aes(wt, mpg))
      diag <- diag + geom_point(aes(colour = cyl), size = 6)
      diag <- diag + geom_point(colour="grey", size = 2)
      diag <- diag + geom_vline(xintercept = input$weight)
      diag <- diag + geom_hline(yintercept = result)
      
      output$text1 <- renderText({ 
        paste("Predicted miles per gallon for weight = ", input$weight, " and cylinder = ", input$cylinders, " will be ", round(result, digits=1))
      })
      
      diag
      
      })
}

)