library(ggplot2)
# Gordon is using a 2 point moving avg
# Basically we are going to create the first hard-coded line to compare everything else to it

x_concrete <- c(4,8,13,17,21,25,29,33,38,42,50,50,54,58,63,67,71,75,79,83,88,92,96)
y_concrete <- c(62.4,64.8,66.6,72.1,72.3,74.1,77.3,77.6,79.8,81.3,82.3,82.3,82.8,84.2,84.3,86.8,87,88.5,89.5,91.8,93.5,94,94.3)

con_data <- data.frame(c(x_concrete), c(y_concrete))

plot(x_concrete,y_concrete)

con_mod = lm(y_concrete ~ x_concrete, con_data)

plot(x_concrete,y_concrete)
lines(x_concrete, predict(con_mod), col = 2, lwd = 2)

summary(con_mod)
coef(con_mod)
con_intercept = coef[1]
con_slope = coef[2]





#lm function is used to fit linear models to data frames in the R language

#trendline(x_concrete,y_concrete, model = "line2P", plot = TRUE, linecolor = 'red')

#ggplot(con_data, aes(x=x_concrete, y=y_concrete)) +
#geom_point() +
#geom_smooth()

#fit <- lm(y_concrete ~ loess(x_concrete))
#summary(fit)
#coef(fit)

