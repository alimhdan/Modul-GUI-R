library(shiny)
library(shinythemes)

#membuat UI
tampilanGUI<-fluidPage(
  theme = shinytheme("cerulean"),
  titlePanel("Statistika Deskriptif"),
  navbarPage("by: Ali Mahmudan",
             tabPanel("Input Data",
                      sidebarLayout(
                        sidebarPanel(
                          fileInput("data","Input file di sini:",accept = ".txt")
                        ),
                        mainPanel(verbatimTextOutput("statdes"),tableOutput("tabel"))
                      )),
             tabPanel("Statdes Per Provinsi",
                      sidebarLayout(
                        sidebarPanel(
                          radioButtons("provinsi","Pilih provinsi:",choices = c("Aceh"=2,"Bali"=3,"Banten"=4)),
                          selectInput("warna","Pilih warna plot:",choices = c("merah"="red","biru"="blue","hitam"="black")),
                          selectInput("tipe","Pilih tipe plot:",choices = c("titik"="p","garis"="l","titik dan garis"="b"))
                        ),
                        mainPanel(plotOutput("plot"),verbatimTextOutput("statdesprovinsi"))
                      ))
             )
  
)

#membuat server
server<-function(input,output){
  output$statdes<-renderPrint({
    datainput=input$data
    if (is.null(datainput)){return()}
    datapakai=read.delim(datainput$datapath,header = T)
    summary(datapakai)
  })
  output$tabel<-renderTable({
    datainput=input$data
    if (is.null(datainput)){return()}
    datapakai=read.delim(datainput$datapath,header = T)
    datapakai
  })
  output$plot<-renderPlot({
    datainput=input$data
    if (is.null(datainput)){return()}
    datapakai=read.delim(datainput$datapath,header = T)
    kolom=as.numeric(input$provinsi)
    datafiks=datapakai[,kolom]
    plot(datafiks,type=input$tipe,col=input$warna)
  })
  output$statdesprovinsi<-renderPrint({
    datainput=input$data
    if (is.null(datainput)){return()}
    datapakai=read.delim(datainput$datapath,header = T)
    kolom=as.numeric(input$provinsi)
    datafiks=datapakai[,kolom]
    cat("*****************************************************\n")
    cat("Berikut merupakan output dari statistika deskriptif:\n")
    print(summary(datafiks))
    cat("\n*****************************************************")
  })
}

#Running App
shinyApp(ui=tampilanGUI,server=server)