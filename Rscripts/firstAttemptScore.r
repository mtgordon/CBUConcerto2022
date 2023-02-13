# TODO reference the sessions database
#  - look for user id and session id
#  - cross reference the id to the response table

# which is the session table?
# try sessions_T
# which is the response table?
# what value would link a student's test the responses and to theta???

# https://www.w3schools.com/sql/sql_orderby.asp
timeDemo <- concerto.table.query("SELECT * from demoResponses")
timeFilt <- concerto.table.query("SELECT item_id, session_id, updateTime from demoResponses ORDER BY updateTime")
student_ID <- concerto.table.query("SELECT student_id from emptyResults")
student_ID_sessions <- concerto.table.query("SELECT user_id from sessions_T")
# TODOz look at select unique values
# TODOz look at select from multiple tables, or use the join command
joinHelper <- "SELECT emptyResults.student_id, ss.user_id, emptyResults.theta from emptyResults INNER JOIN (SELECT distinct user_id from sessions_T) ss on emptyResults.student_id = ss.user_id"
# join_ID = concerto.table.query('SELECT emptyResults.student_id, sessions_T.user_id, emptyResults.theta from emptyResults INNER JOIN sessions_T on emptyResults.student_id = sessions_T.user_id')
join_ID <- concerto.table.query(joinHelper)
print(join_ID)

## concerto.table.query('UPDATE ShiftOne SET Value = 88 where ID = 17')
concerto.table.query("UPDATE emptyResults SET Theta = 0.55 where ID = 1")
## A range of 300 values can be from -150 to 150, divide by 100, the range is now from -1.5 to 1.5
## range of 30 values from -15 to 15, divide by 10 now -1.5 to 1.5

# gordan wants me to get theta values from each user's first attempt at a test
# I am supposed to use this information to figure out what the pass/fail score
# should be on a student's first attempt at a test

# practice a join command on two seperate tables!!! that may help in keeping all the data in one place

# https://www.w3schools.com/sql/sql_select.asp

# Make an empty results database with user and theta columns
# You assume a test_id that you will do the task for
# Load the sessions data table
# Filter the sessions data table for the test_id
# Loop through the lines
# Grab the user_id
# Check if the user_id is in the results database
# If no
# Get the id (session id)
# load response database
# filter response database on session id = id
# if number of responses is >= 30
# 	i.     calculate theta (this will require writing a few lines of code and pulling p values from the question bank
# 	ii.     put user_id and theta into the results database
# Sort the results database by theta
# Graph the theta scores (probably binned like a histogram if it’s easy)
# Get the theta corresponding to 70% being higher than that theta
