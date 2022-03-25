library(shiny)
library(shinythemes)

#membuat UI
tampilan<-fluidPage(
  theme=shinytheme("cerulean"),
  titlePanel("Pertemuan ke-3"),
  navbarPage("by: Ali Mahmudan",
             tabPanel("Input Data",
                      sidebarLayout(
                        sidebarPanel(
                          fileInput("data","Input data di sini:",accept = ".txt")
                        ),
                        mainPanel(verbatimTextOutput("statdes"),tableOutput("tabel"))
                      )),
             tabPanel("Plot Data",
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("tipe","Pilih tipe plot:",choices = c("Points","Lines","Both")),
                          selectInput("warna","Pilih warna plot:",choices = c("Hitam","Merah","Biru"))
                        ),
                        mainPanel(plotOutput("plot"))
                      )
             )
  ))


#membuat Server
program<-function(input,output){
  output$statdes<-renderPrint({
    dataku<-input$data
    if (is.null(dataku)){return()}
    data1<-read.delim(dataku$datapath,header=T)
    cat("Berikut merupakan gambaran umum data yang digunakan:\n")
    cat("*********************************************************\n")
    print(summary(data1))
    cat("*********************************************************")
  })
  output$tabel<-renderTable({
    dataku<-input$data
    if (is.null(dataku)){return()}
    data1<-read.delim(dataku$datapath,header=T)
    data1
  })
  output$plot<-renderPlot({
    dataku<-input$data
    if (is.null(dataku)){return()}
    data1<-read.delim(dataku$datapath,header=T)
    index<-c(1:101)
    covid<-data1[,1]
    if (input$tipe=="Points"){
      if (input$warna=="Hitam"){
        plot(index,covid,type = "p",col="black")
      }
      if (input$warna=="Merah"){
        plot(index,covid,type = "p",col="red")
      }
      if (input$warna=="Biru"){
        plot(index,covid,type = "p",col="blue")
      }
    }
    if (input$tipe=="Lines"){
      if (input$warna=="Hitam"){
        plot(index,covid,type = "l",col="black")
      }
      if (input$warna=="Merah"){
        plot(index,covid,type = "l",col="red")
      }
      if (input$warna=="Biru"){
        plot(index,covid,type = "l",col="blue")
      }
    }
    if (input$tipe=="Both"){
      if (input$warna=="Hitam"){
        plot(index,covid,type = "b",col="black")
      }
      if (input$warna=="Merah"){
        plot(index,covid,type = "b",col="red")
      }
      if (input$warna=="Biru"){
        plot(index,covid,type = "b",col="blue")
      }
    }
  })
}


#Running App
shinyApp(ui=tampilan,server=program)