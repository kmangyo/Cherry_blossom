# References

# https://cran.r-project.org/web/packages/ggimage/vignettes/ggimage.html
# http://stackoverflow.com/questions/21991130/simulating-a-random-walk
# https://github.com/dgrtwo/gganimate
# https://github.com/dgrtwo/gganimate/issues/31
# https://cran.r-project.org/web/packages/imager/imager.pdf
# https://www.r-bloggers.com/r-image-analysis-using-ebimage/

#source("https://bioconductor.org/biocLite.R")
#biocLite("EBImage")
#library(devtools)
#install_github("dgrtwo/gganimate")
#install.packages('cowplot')
#install.packages('ggimage')
#install.packages('imager')

library(imager)
library(ggplot2)
library(EBImage)
library(ggimage)
library(gganimate)
library(animation)

#image URL = http://www.clker.com/cliparts/U/9/8/a/6/c/salmon-sakura-petal-3-md.png

cherry<-load.image(file.choose())
cherry_rotate<-list()
name<-c(1:5)

for (i in 1:5) {
  cherry_rotate[[i]]<-imrotate(cherry, sample(1:360,1), interpolation = 1L, boundary = 0L)
  save.image(cherry_rotate[[i]], paste0(name[[i]],c('.png')))
}

x <- c(1:40)
y <- cumsum(sample(c(-2:2), max(x), TRUE))

d <- data.frame(x = x, y = y,
                image = sample(c('http://i.imgur.com/eamNgDB.png',
                                 'http://i.imgur.com/jLkokZM.png',
                                 'http://i.imgur.com/XLQ2fg2.png',
                                 'http://i.imgur.com/MPtfbg6.png',
                                 'http://i.imgur.com/3Bhf5aL.png')),
                size=10, replace = TRUE)

plot<-ggplot(d, aes(x, y, frame=x)) + geom_image(aes(image=image), size=.03)

ani.options(interval = .2)
gganimate(plot, 'cherry_int.gif')

# Result is http://imgur.com/pg54qXQ
