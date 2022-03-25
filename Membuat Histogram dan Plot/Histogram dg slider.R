library(shiny)
library(shinythemes)

#make an UI
tampilan<-fluidPage(
  titlePanel("Membuat Histogram"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("jml","Pilih Jumlah Bilangan:",
                min = 1,max = 100,value = 50)),
  mainPanel(
    h4("Histogram"),plotOutput("hist"),
    h4("Scatter Plot"), plotOutput("plot"))
  ))

#make a server
rancangan<-function(input,output){
  output$hist<-renderPlot({
    x=rnorm(input$jml)
    hist(x,col="blue",border="black")
  })
  output$plot<-renderPlot({
    x=rnorm(input$jml)
    plot(x,type="p",col="red")
  })
}

shinyApp(tampilan,rancangan)

#make an UI
tampilan<-fluidPage(
  titlePanel("Membuat Histogram"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("jml","Pilih Jumlah Bilangan:",
                  min = 1,max = 100,value = 50)),
    mainPanel(
      h4("Histogram"),plotOutput("hist")
  )))

#make a server
rancangan<-function(input,output){
  output$hist<-renderPlot({
    x=rnorm(input$jml)
    hist(x)
  })
}

shinyApp(tampilan,rancangan)

#3 pilihan warna
#make an UI
tampilan<-fluidPage(
  titlePanel("Membuat Histogram"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("jml","Pilih Jumlah Bilangan:",
                  min = 1,max = 100,value = 50),
      selectInput("pilih",label="Pilih Warna",choices=c("abu-abu","kuning","biru"))),
    mainPanel(
      h4("Histogram"),plotOutput("hist")
    )))

#make a server
rancangan<-function(input,output){
  output$hist<-renderPlot({
    x=rnorm(input$jml)
    warna=input$pilih
    if(warna=="abu-abu"){
      hist(x,col = "grey")
    }
    if(warna=="kuning"){
      hist(x,col = "yellow")
    }
    if(warna=="biru"){
      hist(x,col = "blue")
    }
  })
}

shinyApp(tampilan,rancangan)

#3 pilihan warna
#make an UI
tampilan<-fluidPage(
  titlePanel("Membuat Plot"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("jml","Pilih Jumlah Bilangan:",
                  min = 1,max = 1000,value = 500),
      selectInput("pilih",label="Pilih Warna",choices=c("abu-abu","kuning","biru","hijau","merah"))),
    mainPanel(
      h4("Plot"),plotOutput("plot")
    )))

#make a server
rancangan<-function(input,output){
  output$plot<-renderPlot({
    x=rnorm(input$jml)
    warna=input$pilih
    if(warna=="abu-abu"){
      plot(x,type="l",col = "grey")
    }
    if(warna=="kuning"){
      plot(x,type="l",col = "yellow")
    }
    if(warna=="biru"){
      plot(x,type="l",col = "blue")
    }
    if(warna=="hijau"){
      plot(x,type="l",col = "green")
    }
    if(warna=="merah"){
      plot(x,type="l",col = "red")
    }
  })
}

shinyApp(tampilan,rancangan)

#membuat UI
uiku<-fluidPage(
  titlePanel("Membuat Histogram"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("jml","Pilih Jumlah Bilangan:",min = 1,max = 1000,value = 500),
      selectInput("pilih","Pilih Warna Hitogram:",choices = c("abu-abu","biru","hijau","merah","kuning"))
    ),
    mainPanel(plotOutput("plot"))
  )
)

#membuat server
serverku<-function(input,output){
  output$plot<-renderPlot({
    data_histogram<-rnorm(input$jml)
    if (input$pilih=="abu-abu"){
      plot(data_histogram,type="b",col="grey")
    }
    if (input$pilih=="biru"){
      plot(data_histogram,type="b",col="blue")
    }
    if (input$pilih=="hijau"){
      plot(data_histogram,type="b",col="green")
    }
    if (input$pilih=="merah"){
      plot(data_histogram,type="b",col="red")
    }
    if (input$pilih=="kuning"){
      plot(data_histogram,type="b",col="yellow")
    }
  })
}

#Running App
shinyApp(ui=uiku,server = serverku)