#Library packages
library(shiny)
library(shinythemes)

#USER INTERFACE
ui=fluidPage(theme=shinytheme("cerulean"),
             titlePanel("Kalkulator Versi GUI R"),
             navbarPage("by: Ali Mahmudan-Stat18",
                        tabPanel("Kalkulator Buatanku",
                                 sidebarLayout(
                                   sidebarPanel(
                                     h4("Masukkan Angkanya"),
                                     textInput("angka1","Angka Pertama"),
                                     textInput("angka2","Angka Kedua"),
                                     actionButton("gas",'Gasskeun',class="btn-success")),
                                   mainPanel(
                                     tabsetPanel(type="tabs",id="navbar",
                                                 tabPanel("Hasil Perhitungan",
                                                          tags$b("Penjumlahan:"),
                                                          verbatimTextOutput("jml"),
                                                          tags$b("Pengurangan:"),
                                                          verbatimTextOutput("kurang"),
                                                          tags$b("Perkalian:"),
                                                          verbatimTextOutput("kali"),
                                                          tags$b("Pembagian"),
                                                          verbatimTextOutput("bagi"))
                                     ))))))

#SERVER
server=function(input,output){
  observeEvent(input$gas,{
    output$jml<-renderPrint({
      bilangan1<-input$angka1
      bilangan2<-input$angka2
      bilangan1=as.numeric(bilangan1)
      bilangan2=as.numeric(bilangan2)
      penjumlahan=bilangan1+bilangan2
      print(penjumlahan)
    })
    output$kurang<-renderPrint({
      bilangan1<-input$angka1
      bilangan2<-input$angka2
      bilangan1=as.numeric(bilangan1)
      bilangan2=as.numeric(bilangan2)
      pengurangan=bilangan1-bilangan2
      print(pengurangan)
    })
    output$kali<-renderPrint({
      bilangan1<-input$angka1
      bilangan2<-input$angka2
      bilangan1=as.numeric(bilangan1)
      bilangan2=as.numeric(bilangan2)
      perkalian=bilangan1*bilangan2
      print(perkalian)
    })
    output$bagi<-renderPrint({
      bilangan1<-input$angka1
      bilangan2<-input$angka2    
      bilangan1=as.numeric(bilangan1)
      bilangan2=as.numeric(bilangan2)
      pembagian=bilangan1/bilangan2
      print(pembagian)
    })
  })
}


#RUNNING APP
shinyApp(ui = ui, server = server)
