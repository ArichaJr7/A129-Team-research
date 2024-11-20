library(datasets)
iotex <- read.csv('IoTeX.csv')
head(iotex)
summary(iotex)

# Clear environment
rm(list = ls()) 
# Clear packages
detach("package:datasets", unload = TRUE)  # For base
# Clear plots
dev.off()  # But only if there IS a plot
# Clear console
cat("\014")  # ctrl+L
# Clear mind :)
