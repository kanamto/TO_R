#Homework 6, Nam To

## Prof G: The first two plots are missing?

#Part 1 - Plots
require(ggplot2) #Requiring packagings that includes methods and attributes to be accessed below.
require(stats)
require(grid)

#1, Plot of Diamonds - Weight to Price by Color
a <- ggplot(diamonds, aes(carat, price)) + #Assigns data frame of two columns: carat and price
  geom_point(aes(colour=factor(color))) +  #Adds layer coloring the data points differently based on the instance of "color" (attribute) in the diamonds dataset. 
  labs(list(title = "Diamonds - Weight to Price by Color", x = "Weight", y = "Price")) + #Create plot title, xlabel, and ylabel.
  theme(plot.title = element_text(size = rel(3), colour = "blue")) + #Color the plot title blue and size text relative to smallest text (default size) at 3:1
  theme(axis.title.x = element_text(size = rel(1.2))) + #Size x-axis label relative to smallest text (default size) at 1.2:1 
  theme(axis.title.y = element_text(size = rel(1.2))) + #Size y-axis label relative to smallest text (default size) at 1.2:1
  theme(legend.title = element_text(face ="bold")) #Bolds the legend title text.

#2, Plot of Diamonds - Weight to Price (Linear)
b <- cbind(data.frame("log_carat" = log(diamonds$carat),  "log_price" = log(diamonds$price)), diamonds[3]) 
     #Creates dataframe b that includes the log of carat values (column 1), log of price values (column 2), and diamond colors (column 3).
c <- ggplot(b,aes(log_carat,log_price)) + #Assigns the data frame of two columns: log(carat) and log(price)
  geom_point(aes(colour=factor(color))) +  #Adds layer coloring the data points differently based on the instance of "color" (attribute) in the diamonds dataset. 
  labs(list(title = "Diamonds - Weight to Price (Linear)", x = "Weight", y = "Price")) + #Create plot title, xlabel, and ylabel.
  theme(plot.title = element_text(size = rel(3), colour = "blue")) + #Color the plot title blue and size text relative to smallest text (default size) at 3:1
  theme(axis.title.x = element_text(size = rel(1.2))) + #Size x-axis label relative to smallest text (default size) at 1.2:1 
  theme(axis.title.y = element_text(size = rel(1.2))) + #Size y-axis label relative to smallest text (default size) at 1.2:1
  theme(legend.title = element_text(face ="bold")) #Bolds the legend title text.

#3. Plot of Diamonds - Weight to Price Residuals with Price and Weight Density Histograms
d <- cbind(b[1], data.frame("residuals" = residuals(lm(b[[1]]~b[[2]]))), b[3], diamonds[1], diamonds[7])
     #Column bind 5 columns of dataframe data: column 1 = log carat values, column 2 = residuals of linear model fit between log(carat) and log(price)
     #  column 3 = color, column 4 = price, column 5 = carat.
LM <- ggplot(d,aes(log_carat,residuals)) + #Assigns the data frame of two columns: log(carat) and residuals (calculated above)
  geom_point(aes(colour=factor(color))) +  #Adds layer coloring the data points differently based on the instance of "color" (attribute) in the diamonds dataset. 
  labs(list(title = "Diamonds - Weight to Price by Color", x = "Weight", y = "Price Residuals")) + #Create plot title, xlabel, and ylabel.
  theme(plot.title = element_text(size = rel(3), colour = "blue")) + #Color the plot title blue and size text relative to smallest text (default size) at 3:1
  theme(axis.title.x = element_text(size = rel(1.2))) + #Size x-axis label relative to smallest text (default size) at 1.2:1 
  theme(axis.title.y = element_text(size = rel(1.2))) + #Size y-axis label relative to smallest text (default size) at 1.2:1
  theme(legend.title = element_text(face ="bold")) + #Bolds the legend title text.
  theme(legend.position = "top") #Locates legend on top of the plot.

Price_density <- ggplot(d, aes(fill=color, x=price)) + #Create ggplot using diamonds prices as distinguished by the color of the diamond.
  geom_density(position="stack") + #Stack the price densities of different colors of diamonds.
  geom_histogram(binwidth=200) +   #Bin the prices into equal width bins with increments of $200
  theme(legend.position = "none",  #Remove legend
        axis.title.x=element_blank(), #Remove x-axis title
        axis.title.y=element_blank()) #Remove y-axis title

Weight_density <- ggplot(d, aes(fill=color, x=carat)) + #Create ggplot using density of diamonds weights (in carats) as distinguished by the color of the diamond.
  geom_density(position="stack") + #Stack the weight densities of different colors of diamonds.
  geom_histogram(binwidth=1/20) +  #Bin the weights into equal width bins with increments of 1/20 of a carat
  theme(legend.position = "none",  #Remove legend
        axis.title.x=element_blank(),  #Remove x-axis title
        axis.title.y=element_blank())  #Remove y-axis title

grid.newpage() #Create new plot page
print(Price_density,vp=viewport(angle=90, x=0.13, y=0.6, w=0.5, h=0.25)) #print price density onto new plot page using viewport to fine tune the specific relative position, size, and angle rotation of this plot
print(LM,vp=viewport(x=0.59, y=0.6, w=0.75, h=0.6)) #print linear model onto same plot page using viewport to fine tune the specific relative position and size of this plot
print(Weight_density,vp=viewport(x=0.59, y=0.15, w=0.75, h=0.25)) #print weight density onto same plot page using viewport to fine tune the specific relative position and size of this plot
#Note: Order is not important here because the plots DO NOT overlap!

#Also attempted grid.arrange(Price_density + coord_flip(), LM_model, empty, Weight_density, widths=c(1,5), ncol=2,  heights=c(4,1)) 
    #Set width and heights matrices to define width of each column and height of each row. 
    #Also created "empty" variable as placehold in the grid.arrange graph.
    #However, could not orient price density graph the correct way.

#4, Using Viewports to create overlays:
grid.newpage() #Create new plot page
print(LM) #Order matters, first print linear model (since it is behind everything). Linear model is defined in #3 above.
print(Price_density,vp=viewport(x=0.26, y=0.16, w=0.4, h=0.2)) #print price density on top of LM using viewport to position and size the graph.
print(Weight_density,vp=viewport(x=0.8, y=0.7, w=0.4, h=0.2))  #print weight density on top of LM using viewport to position and size the graph. Since weight and price density do no overlap their order to plotting it not as important.


