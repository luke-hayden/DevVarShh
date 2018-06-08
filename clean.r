


mxstg <- read.table(paste(jaw, "FVBDUHiCD1scores20.txt", sep=""))

mxstg$nid <- as.factor(paste(mxstg$Weight, mxstg$Clutch, sep=""))

mxstg <- subset(mxstg, mxstg$Strain != "CD1")

lf <- Sys.glob("predic*")

combdat <- data.frame(matrix(nrow=0,ncol=20))

for (i in lf){
  lht <- read.table(i)
  lht$sd <- substr(i,(nchar(i)-6), (nchar(i)-4))
  combdat <-rbind(combdat, lht)
}


ndat <- subset(combdat, combdat$sd == "001")
ndat05 <- subset(combdat, combdat$sd == "005")
ndat15 <- subset(combdat, combdat$sd == "015")

ndat$dev05 <- ndat05$dev
ndat$dev15 <- ndat15$dev


names(ndat)[names(ndat) == 'dev'] <- 'dev01'
ndat$ident <- seq(1, nrow(ndat))

ndat$nid <- as.factor(paste(ndat$Weight, ndat$Litter, sep=""))

mxstgp <- left_join(mxstg, ndat, by="nid")



write.csv(ndat, file="ndat.csv")

write.csv(mxstgp, file=paste(jaw, "dat.csv", sep=""))


combdat$correction <- combdat$sd
combdat$correction[combdat$sd == "001"] <- 10
combdat$correction <- as.numeric(combdat$correction)/ 100



combdat$devlev <- case_when(
  combdat$sd == "001" ~ "sd.litter.preg = 0.1",
  combdat$sd == "005" ~ "sd.litter.preg = 0.05",
  combdat$sd == "015" ~ "sd.litter.preg = 0.15")


(p=ggplot(combdat, aes(y=Weight, x=dev, colour=Strain))+
    geom_point() + 
    facet_wrap(devlev~Strain, ncol=2)+
    scale_colour_manual(values=c("red3",  "cornflowerblue")) +
    xlab("Computed developmental age (cdpc)")+
    ylab("Embryo Weight (mg)") +
    theme_bw()
)




ggsave(plot=p,height=8, width=8,device="png", file="wtvscdpc.png" )


ggsave(plot=p,height=7, width=5,device="pdf", file=paste(jaw,"allstatedev05.pdf" ,sep="") )