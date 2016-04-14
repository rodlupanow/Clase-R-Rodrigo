usedcars <- read.csv("usedcars.csv", stringsAsFactors = FALSE)
View(usedcars)
attach(usedcars)

str(usedcars)#para ver las estructuras en los datos. chr para caracter e int para integer (numérica)
summary(usedcars$year)
summary(usedcars[c("price", "mileage")])
#R tiene comando mean y median para estimar la tendencia central, la media es más sensible a los outliers

range(usedcars$price) #intervalo de los datos
diff(range(usedcars$price))#diferencia entre los intervalos max y min
IQR(usedcars$price)#diferencia entre el primer y tercer cuartil. 
quantile(usedcars$price)
quantile(usedcars$price, probs = c(0.01, 0.99))
quantile(usedcars$price, seq(from = 0, to = 1, by = 0.20))
#las diferencias entre los cuantiles nos permite reconocer una distribución normal de la data

boxplot(usedcars$price, main="Boxplot of Used Car Prices",ylab="Price ($)")
boxplot(usedcars$mileage, main="Boxplot of Used Car Mileage",ylab="Odometer (mi.)")
hist(usedcars$price, main = "Histogram of Used Car Prices",xlab = "Price ($)")#como previamente usamos el comando attach, podemos tambien:
hist(price, main = "Histogram of Used Car Prices",xlab = "Price ($)")
hist(usedcars$mileage, main = "Histogram of Used Car Mileage",xlab = "Odometer (mi.)")
#el parametro breaks permite decir el número de barras que tiene nuestro histograma
var(price)#números altos indican la data varía más ampliamente cerca de la media. 
sd(price)#cuanto varía cada dato de la media
var(mileage)
sd(mileage)

#datos categóricos
table(usedcars$year)
table(model)
table(color)
model_table <- table(usedcars$model)
prop.table(model_table)#proporciones de cada categoría 
color_pct <- table(usedcars$color)
color_pct <- prop.table(color_table) * 100
round(color_pct, digits = 1)
#la categoría que más se repita posee la mayor moda, en datos numéricos no siempre da mucha información. 

plot(x = usedcars$mileage, y = usedcars$price,main = "Scatterplot of Price vs. Mileage",xlab = "Used Car Odometer (mi.)",ylab = "Used Car Price ($)")
#más sencillo:
plot(mileage,price,main = "Scatterplot of Price vs. Mileage",xlab = "Used Car Odometer (mi.)",ylab = "Used Car Price ($)")
abline(lm(price~mileage))
summary(lm(price~mileage))

install.packages("gmodels")#o con Rstudio 
library(gmodels)#o con Rstudio

usedcars$conservative <-usedcars$color %in% c("Black", "Gray", "Silver", "White")
table(usedcars$conservative)
CrossTable(x = usedcars$model, y = usedcars$conservative)
#No se pudo comprobar diferencias entre los modelos para los colores. 