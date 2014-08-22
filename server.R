library(data.table)
library(ggplot2)
library(knitr)
library(lubridate)

indexing2 <- fread("./data/aggtotal.csv", sep = "auto", header = "auto", stringsAsFactors = TRUE)
indexing2$date <- as.Date(indexing2$date, format = "%Y-%m-%d")

dentry <- fread("./data/deaggtotal.csv", sep = "auto", header = "auto", stringsAsFactors = TRUE)
dentry$date <- as.Date(dentry$date, format = "%m/%d/%Y")

shinyServer(function(input, output) {
    
    avg <- reactive(subset(indexing2, date >= input$dates[1] & date <= input$dates[2]))
    
    output$trend2 <- renderPlot({
        
        validate(
            need(avg()$date[1] >= "2008-12-01" & avg()$date[2] <= "2014-08-07", 
                 "Enter a valid date range"))
        
        g <- ggplot(avg(), aes(x = date, y = docs))
        
        g + geom_point(aes(color = hourlyrate), size = 4) + 
            
            geom_line(color = "grey") +
            
            scale_color_gradient(low = "blue", high = "red") +
            
            labs(title = "Daily Indexed Documents", x = "", y = "", color = "Average Hourly Rate"
            ) + theme_bw()
    })
    
    output$trendtable2 <- renderDataTable({ 
                                    avg()}
                                    , options = list(iDisplayLength = 10,
                                                     aLengthMenu = c(10,15,20),
                                                     bSortClasses = TRUE))
    
    output$total <- renderText({
        sum(avg()$docs)
        
    })
    
    output$indAverage <- renderText({
        round(mean(avg()$hourlyrate), 2)
        
    })
    
    dataEntry <- reactive(subset(dentry, date >= input$dateDE[1] & date <= input$dateDE[2]))
    
    output$trend3 <- renderPlot({
        
        validate(
            need(dataEntry()$date[1] >= "2012-10-01" & dataEntry()$date[2] <= "2013-10-31",
                 "Enter a valid date range"))
        
        dplot <- ggplot(dataEntry(), aes(x = date, y = registrations))
        
        dplot + geom_point(aes(color = hourlyrate), size = 4) +
            
            geom_line(color = "grey") +
            
            scale_color_gradient(low = "blue", high = "red") +
            
            labs(title = "Daily Registrations Processed", x = "", y = "", color = "Average Hourly Rate") +
            theme_bw()
    })
    
    output$trendtable3 <- renderDataTable({
        
        dataEntry()},
                                          options = list(iDisplayLength = 10,
                                                         aLengthMenu = c(10,15,20),
                                                         bSortClasses = TRUE))
    
    output$totalDE <- renderText({
        sum(dataEntry()$registrations)
    })
    
    output$deAverage <- renderText({
        
        round(mean(dataEntry()$hourlyrate), 2)                        
        
        })
    
})