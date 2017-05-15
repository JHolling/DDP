
shinyServer(function(input, output,session) {

       
    HP.WT.model<-lm(qsec~wt+hp,data=mtcars)
    hp<-seq(from=50,to=700,by=45) #setting HP data range
    
    qsec.points<-reactive({
        wtInput<-input$wt.in      #bringing in slider data
        hpInput<-input$hp.in      #to predict point result
        predict(HP.WT.model,data.frame(wt=wtInput,hp=hpInput))
                        })

    output$points<-renderText({
         qsec.points()
        })

    output$qsec.plot<-renderPlot({
        wtInput<-input$wt.in      #bringing in slide data for realtime
        hpInput<-input$hp.in      #graph & set wt fixed point for graph
        qsec.graph<-predict(HP.WT.model,data.frame(wt=input$wt.in,hp=hp))
        
        plot(hp,qsec.graph, xlab = "Horsepower", ylab = "1/4 mile (seconds)",
             main = "HP/Weight vs Seconds ", cex = 2, pch = 1)
        points(hpInput,qsec.points(),col="blue",pch=18,cex=3)
                                })
})
