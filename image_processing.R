##Load basic packages
source("https://bioconductor.org/biocLite.R")
biocLite("EBImage")
library("EBImage")
##read in base image
img<-readImage("\\\\deltafile01/DeltaUsers/001VIR/NonVABeach/jason.pfaff/My Documents/AC03082010_GentlemenBroncos3.jpg")
print(img)
display(img)

##basic processing
##change the brightness
img2<-img+.5
print(img2)
display(img2)

###adjust positioning
img7<-rotate(img, 30)
img8<-translate(img,c(40,70))
img9<-flip(img)

display(img7)
display(img8)
display(img9)

colorMode(img) = Grayscale
display(img)

colorMode(img) = Color
display(img)

###color transforms

imgk<-channel(img, 'rgb')
imgk[236:276, 106:146, 1]=1
imgk[236:276, 156:196, 2]=1
imgk[236;276, 206;246, 3]=1
imgb<-rgbimage(red=img, green=flip(img), blue=flop(img))

display(imgb)



print(img)







