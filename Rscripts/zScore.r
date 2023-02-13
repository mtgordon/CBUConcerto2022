# TODO make one last eval block that works on test results for real. then get started on next task

# this method is done from the perspective of basic statistical analysis of results
# TODO use string variable to more dynamically call the appropriate tables
tableCheck <- "ShiftTwo"
# refer to RescoreTest_Zeek for fill the table

# SLOW in reality the random number generation and updates were only used on test tables
# I don't think I need them for the actual test results table

# make code more dynamic, make the name of the table a variable that can plugin
tableSRC <- "SELECT AVG(Value) from"
tabularSelectValue <- "SELECT Value from"
countSelect <- "SELECT Count(Value) from"
# use the following string to change which table we check
# tableCheck = 'ShiftTwo'

# str1 = 'testing a name'
# str2 = 'and a concate'
# strTest = paste(str1, str2)
# the paste command will add a space between both strings
# the resulting str = 'testing a name and a concate'
# print(strTest)

tableAVG <- concerto.table.query(paste(tableSRC, tableCheck))
tabular <- concerto.table.query(paste(tabularSelectValue, tableCheck))
countSize <- concerto.table.query(paste(countSelect, tableCheck))

# TODO how to get the size of a dataframe
# may need the number of rows in a dataframe
numRows <- nrow(tabular)
print("the amount of rows is")
print(numRows)

# copy of the data frame
tabular_copy1 <- data.frame(tabular)

# https://www.w3schools.com/html/html_tables.asp
# width to the style, FOR FUN LATER
# mess with the margins too
htmlStr <- '<table style="border-style: double">
	<tr> <th>title for col</th> </tr>'

# htmlStr = paste(htmlStr, '<tr> <td> 33 </td> </tr>')

# for line 26 use numTab without bracket and 'Value'
for (integer in tabular[["Value"]]) {
    # print(integer * 10)
    htmlStr <- paste(htmlStr, "<tr> <td>", integer, "</td> </tr>")
}

# use the paste function to get the closing tag
htmlStr <- paste(htmlStr, "</table>")

# tableVARIANCE

# make a new table where the values can be manipulated for variance
# DON'T FORGET, R IS 1 BASED INDEX!!!
itr <- 1
variance <- 0
for (integer in tabular_copy1[["Value"]]) {
    # subtract the avg from each value in the dataframe
    # integer = integer - tableAVG
    # dataframe[row, col]
    tabular_copy1[itr, 1] <- integer - tableAVG
    # square the result
    tabular_copy1[itr, 1] <- tabular_copy1[itr, 1] * tabular_copy1[itr, 1]
    variance <- variance + tabular_copy1[itr, 1]
    itr <- itr + 1
}
variance <- variance / countSize[1, 1]
# to get the std deviation, just take the square root of variance
stdDeviation <- sqrt(variance)

# to get the variance START with looping through dataframe and subtracting avg from each value of table
# THEN square the result and add each result and divide by the COUNT of the table size

print(stdDeviation)
print(variance)
print(countSize)
print(tabular)
print(tabular_copy1)

# what is the formula for z score???
# (observed val - mean) / std deviation
# is there a way to reset the value of the copy of values from the data table???
tabular_copy2 <- data.frame(tabular)

# the iterator value doesn't auto increment, you need to program for that
# also don't forget to reset the iterator value back to 1 when used by a for
# loop that handles arrays!!!
itr <- 1
print(tabular_copy2)
for (integer in tabular_copy2[["Value"]]) {
    tabular_copy2[itr, 1] <- ((tabular_copy2[itr, 1] - tableAVG) / stdDeviation)
    itr <- itr + 1
}

# print(tabular_copy2)

# make a two column table that has the original score compared to the z score
htmlStrTwo <- '<table style="border-style: double">
	<tr> <th>Original</th> <th>Z score</th> </tr>'

itr <- 1
for (integer in tabular_copy2[["Value"]]) {
    # print(integer * 10)
    htmlStrTwo <- paste(htmlStrTwo, "<tr> <td>", tabular[itr, 1], "</td> <td>", integer, "</td> </tr>")
    itr <- itr + 1
}

itr <- 1

htmlStrTwo <- paste(htmlStrTwo, "</table>")

# try to make some user defined functions to eliminate for loop space
# only when you finish the main tasks!!!

# while (numRows < 300) {
# concerto.table.query('INSERT INTO ShiftThree (Value) Values (33);')
# numRows = nrow(concerto.table.query('SELECT * from ShiftThree'))
## concerto.table.query('UPDATE ShiftOne SET Value = 88 where ID = 17')
# }

itr <- 1
ranVar <- sample(2:8, 1) # this generates random whole numbers from 2 to 8, not inclusive of 8
while (itr < 20) {
    print(ranVar)
    ranVar <- sample(2:8, 1)
    itr <- itr + 1
    # if itr % 2 = 1 then it is odd, update the value to some random amount
}
itr <- 1
# https://blog.revolutionanalytics.com/2009/02/how-to-choose-a-random-number-in-r.html#:~:text=As%20a%20language%20for%20statistical,numbers%20from%20various%20statistical%20distributions.

# TODO use a random number to fill the dummy data
# SLOW in reality the random number generation and updates were only used on test tables
# I don't think I need them for the actual test results table
strVarConcate <- paste(tableCheck, ranVar)
dfUp1 <- "UPDATE ShiftTwo SET Value ="
dfUp2 <- "where ID = 17848"
concertoUp <- paste(dfUp1, ranVar)
concertoUp <- paste(concertoUp, dfUp2)
# print(concertoUp)
# con = 'UPDATE ShiftTwo SET Value = 66 where ID = 17848'
concerto.table.query(concertoUp)

# TODO write a loop that updates values in the table with random amounts
