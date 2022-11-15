library("catR")
#This inital chunk is all hypothetical, and x_new are numbers calulated and given by Gordon
# How such numbers were calculated is still news to me 
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
# Section 1: calculating thetas
#============================================================

print('starting eval')
gc()
rm(list = ls())

#grab distinct list of response session ids
sessions <- concerto.table.query("select distinct session_id from {{responseTable}}")

#grab distinct list of response item ids
itemIds <- concerto.table.query("select distinct item_id from {{responseTable}}")

#testing grabbing response table data
responseData <- concerto.table.query("select item_id, score, session_id from {{responseTable}}")

#new list of thetas for each session id
theta <- c()
#loop through each session id and generate new theta
for (i in 1:length(sessions[['session_id']])) {
  #grab score data for session id
  rm(scores)
  #Grabbing the p-values for each question
  pValues <- concerto.table.query(paste0("select p1,p2,p3,p4 from {{questionTable}} where id = ",responseData[i,1]))
  p1 <- pValues[1]
  p2 <- pValues[2]
  p3 <- pValues[3]
  p4 <- pValues[4]
  scores = subset(responseData, session_id == sessions[['session_id']][i])
   
  #generate params matrix
  rm(params)
  params = matrix(,nrow =0 , ncol = 4)
  dimnames(params) = list(c(),c("a","b","c","d"))
  for(val in scores[['score']]){
    params <- rbind(params,c(p1,p2,p3,p4))
  }
  
  #add new theta to list of thetas
  theta <- c(theta, thetaEst(params,scores[['score']]))
}

thetasTable <- cbind(sessions, theta)

x_concrete <- c(4,8,13,17,21,25,29,33,38,42,50,50,54,58,63,67,71,75,79,83,88,92,96)
y_concrete <- c(62.4,64.8,66.6,72.1,72.3,74.1,77.3,77.6,79.8,81.3,82.3,82.3,82.8,84.2,84.3,86.8,87,88.5,89.5,91.8,93.5,94,94.3)

x_new <- c(0,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96)
y_new <- c(62.0,62.4,62.8,63.1,69.8,72.8,73.3,75.6,76.0,77.3,78.4,81.2,81.9,82.5,82.6,84.0,84.1,85.3,87.3,88.1,89.4,90.9,93.2,102.9,115.0)

con_data <- data.frame(c(x_concrete), c(y_concrete))
new_data <- data.frame(c(x_new),c(y_new))

con_mod <- lm(y_concrete ~ x_concrete, con_data)
new_mod <- lm(y_new ~ x_new, new_data)

plot(x_concrete,y_concrete,col = "orange")
points(x_new,y_new, col = "black")

#trend lines for our values
lines(x_concrete, predict(con_mod), col = "orange", lwd = 2)
lines(x_new, predict(new_mod),col = "black", lwd = 2)


new_coef <- coef(new_mod)

tempThetaValues <- c(-0.036072868,-0.023574167,-0.013157811,-0.002526671,0.19985009,
0.289118281,0.3,0.374268269,0.385802921,0.426545856,0.457969122,0.544040112,
0.564896521,0.581438811,0.584752892,0.626782541,0.629566929,0.666904352,0.72750015,
0.751141976,0.789994934,0.8,0.905306618,1.197604967,1.5630329)

#This is used to remove any outliers 
quartiles <- quantile(tempThetaValues, probs = c(.25,.75), na.rm = FALSE)
IQR <- IQR(tempThetaValues)
lower <- quartiles[1] - 1.5 * IQR
upper <- quartiles[2] + 1.5 * IQR
tempThetaValues <- subset(tempThetaValues, tempThetaValues > lower & tempThetaValues < upper)

thetaValues <- as.data.frame(matrix(nrow = length(tempThetaValues), ncol = 3))

tempThetaValues <- sort(tempThetaValues, decreasing = FALSE)
rankNum <- sort(rank(tempThetaValues),decreasing = TRUE)

#will have to check if theta values are null
# ranking all the thetas 
max <- max(rankNum)
rankPer <- c()

for(i in rankNum){
  temp <- (max - i)/max 
  rankPer <- append(rankPer, temp)
}
thetaValues <- cbind(data.frame(tempThetaValues),data.frame(rankNum),data.frame(rankPer))
colnames(thetaValues) <- c("Theta", "Rank", "RankPercent")


con_coef <- coef(con_mod)

bOrg <- con_coef[1]
mOrg <- con_coef[2]

x <- thetaValues$Theta
#I really hope that this function works
peramFunction <- function(x,m,b,bOrg,mOrg){((x*m+b)/mOrg)-bOrg}

tryCatch({
  fit <- nls(rankPer ~ peramFunction(x,m,b,bOrg,mOrg),
  start = list(m = mOrg,b = 0),
  algorithm = "port",
  lower = 0,
  upper = max(x)
  )

  fitCoef <- coef(fit)
  print(fitCoef)
  
}, warning = function(w){
  print(warning)
},error = function(e){
  print(error)
})