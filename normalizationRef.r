library("catR")
#data frames is [row,col]
#X-values are the ranks of the tests
#Y-values are the grades that the tests would get

#Steps needed for this problem: 
# 1. Calculate the theta values tied to session_id 
# 2. Sort the thetas 
# 3. Rank the thetas 
# 4. Grab the slope and interception of the old data 
# 5. Create the function described by gordon
# 6. Use nls and fit to create a new linear trend line 
# 7. Grab the coef and intercept from new line 
# 8. Compare the slope and intercept 
# 9. get new p value from equation and place into table  

#============================================================
# Section 1: Calculating Thetas
#============================================================
responseData <- data.frame()
responseData<- concerto.table.query("select item_id, score, session_id from {{responseTable}}")
sessions <- concerto.table.query("select distinct session_id from {{responseTable}}")

print("responseData")
print(responseData)
calcThetas <- c()

for (i in 1:length(sessions[['session_id']])) {
  #make sure to have clean slate
  rm(scores)
  rm(params)
  #Using default values to find theta 
  p1 <- 2
  p2 <- 2
  p3 <- 0.25
  p4 <- 1
  #grab score data for session id
  scores = subset(responseData, session_id == sessions[['session_id']][i])
  #generate params matrix
  params = matrix(,nrow =0 , ncol = 4)
  dimnames(params) = list(c(),c("a","b","c","d"))
  for(val in responseData[['score']]){
    params <- rbind(params,c(p1,p2,p3,p4))
  }
  calcThetas <- c(calcThetas, thetaEst(params, scores[['score']]))
  print(calcThetas)
}

#============================================================
# Section 1: Calculating Old Values to Map to
#============================================================
      
thetasTable <- cbind(calcThetas)
x_concrete <- c(4,8,13,17,21,25,29,33,38,42,50,50,54,58,63,67,71,75,79,83,88,92,96)
y_concrete <- c(62.4,64.8,66.6,72.1,72.3,74.1,77.3,77.6,79.8,81.3,82.3,82.3,82.8,84.2,84.3,86.8,87,88.5,89.5,91.8,93.5,94,94.3)
con_data <- data.frame(c(x_concrete), c(y_concrete))
con_mod <- lm(y_concrete ~ x_concrete, con_data)
con_coef <- coef(con_mod)
bOrg <- con_coef[1]
mOrg <- con_coef[2]

#============================================================
# Removing Outliers 
#============================================================

#split the data into quartiles  
quartiles <- quantile(calcThetas, probs = c(.10,.90), na.rm = FALSE)
#Inter-Quartile Range 
IQR <- IQR(calcThetas)
#Define Upper and Lower bounds 
lower <- quartiles[1] - 1.5 * IQR
upper <- quartiles[2] + 1.5 * IQR
#The subset is what we are working with
calcThetas <- subset(calcThetas, calcThetas > lower & calcThetas < upper)
thetaValues <- as.data.frame(matrix(nrow = length(calcThetas), ncol = 3))
#Sorting thetas 
calcThetas <- sort(calcThetas, decreasing = FALSE)
#Ranking thetas 
rankNum <- sort(rank(calcThetas),decreasing = TRUE)

# TODO will have to check if theta values are null 
max <- max(rankNum)
rankPer <- c()

#Calculating Rank Percent 
for(i in rankNum){
  temp <- (max - i)/max 
  rankPer <- append(rankPer, temp)
}

#Making a reference dataframe to see what we are working with
thetaValues <- cbind(data.frame(calcThetas),data.frame(rankNum),data.frame(rankPer))
colnames(thetaValues) <- c("Theta", "Rank", "RankPercent")
print(thetaValues)

x <- thetaValues$Theta
#create perameter function that will predict the new slope and intercept 
peramFunction <- function(x,m,b){(((x*m+b)-bOrg)/mOrg)}
  newM <- 0
  newB <- 0
  tryCatch({
    fit <- nls(rankPer ~ peramFunction(x,m,b),
    start = list(m = mOrg,b = bOrg),
    algorithm = "port",
    lower = 0,
    upper = 100
    )
    summary(fit)
    fitCoef <- coef(fit)
    newB <- fitCoef[2]
    newM <- fitCoef[1] * 100 
    print(fitCoef)
  }, warning = function(w){
    print(warning)
  },error = function(e){
    print(error)
  })

uniqueData <- unique(responseData[["item_id"]])

for(i in 1: length(uniqueData)){
  oldP <- concerto.table.query(paste0("select p2 from {{questionTable}} where id = ",uniqueData[i]))
  newP <- 1 + (oldP - ((90-newB)/newM)) * (newM/20)
  print(newP)
  #this is where I would update the p-value
}

#============================================================
# Plotting and Graphing  
#============================================================
#Plot out our old data and then overlay it with the new
print("HELLO!!")
print(concerto.file.getPath("dino.png"))
print("llll")
png(file = "/data/files/Temp.png", width = 600, height = 350)
plot(x_concrete,y_concrete,col = "black", xlab = "Rank", ylab = "Theta")
lines(x_concrete, predict(con_mod), col = "black", lwd = 2)

#Making x and y values to plot with/ new data 
newYTrend <- thetaValues$Theta * newM + newB
newTrend <- round(thetaValues$RankPercent*100)
#adding new points to plot
points(newTrend, newYTrend, col = 'blue')
#creating predictive line for the plot 
calcData <-data.frame(c(newTrend),c(newYTrend))
calMod <- lm(newYTrend ~ newTrend)
#adding new prediction line to plot 
lines(newTrend, predict(calMod),col = "blue", lwd = 2)
#saving plot to some file