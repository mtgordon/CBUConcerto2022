rm(list=ls())

library("catR")

#### Loads in the data
### Old Files
#session_results_data <- read.csv('EGR343F20SessionResults.csv', as.is=TRUE)
#answers_data <- read.csv('EGR343F20Responses.csv',as.is=TRUE)


## Set the directory
setwd("G:/My Drive/Online Testing/")

## read in the session results (session number, score, user)
# session_results_data <- read.csv('EGR343_Combo_Results.csv', as.is=TRUE)

## read in the questions (question numbers, parameters, etc.)
#question_table <- read.csv(file = '343 Master Question Table.csv')
question_table <- read.csv(file = '242_Blank_Master_Question_List.csv') # Since it's blank it doesn't matter what course it is for

## read in the answers (session number, question number, correct/incorrect)
answers_data <- read.csv('EGR343_Combo_Responses.csv',as.is=TRUE)
#answers_data <- read.csv('242_cat_response_table.csv',as.is=TRUE)

# # create a matrix for session results with the session_id and score (theta)
# session_results_matrix = matrix(,nrow =0 , ncol = 2)
# dimnames(session_results_matrix) = list(c(),c("session_id","theta"))

# make sure that the datafram doesn't already exist by removing any instances
rm(session_results_df)
# create a dataframe to hold session ids and scores
session_results_df <- data.frame(session_id=integer(),
                                 theta = double())
# 
# session_data <- c("session_id","theta")
# 
# # Create a new dataframe for the session_ids and thetas. This will be used for the looping of the code
# for (n in seq(from=1, to=length(session_results_data$value), by=2)){
#   session_id = session_results_data$session_id[[n]]
#   theta = as.numeric(session_results_data$value[[n]])
#   session_data <- data.frame(session_id,theta)
#   # print(session_data)
#   session_results_df <- rbind(session_results_df,session_data)
#   # print(session_results_df)
# }

max_session = max(answers_data$session_id)
print(max_session)

for (desired_session_id in 1:max_session){
  #print(desired_session_id)
  one_test = dplyr::filter(answers_data, session_id == desired_session_id)
  
  x=vector()
  tryCatch({
    rm(params)
  }, error = function(err){}
  )
  params = matrix(,nrow =0 , ncol = 4)
  dimnames(params) = list(c(),c("a","b","c","d"))
  for (i in 1:length(one_test$session_id)){
    # print("i")
    # print(i)
    # print(one_test$score[[i]])
    tryCatch({
      score = one_test$score[[i]]
      question_id = one_test$item_id[[i]]
      # print(question_id)
      # print(score)
      p1 = 2
      p2 = 0
      p3 = 0.25
      p4 = 1
      x = append(x,score)
      params <- rbind(params,c(p1,p2,p3,p4))
    }, error = function(err){}
    )
  }
  
  #print(x)
  if (length(x)>35){
    new_theta = thetaEst(params,x)
    # print(new_theta)
    session_id = desired_session_id
    theta = new_theta
    session_data <- data.frame(session_id,theta)
    session_results_df <- rbind(session_results_df,session_data)
    # session_results_df <- within(session_results_df,theta[session_id==desired_session_id]<-new_theta)
  }
}

#print(session_results_df)







############################################
#Start of loop
############################################

for (k in 1:40){
  print('k')
  print(k)
  
  ############################################
  # Determine the Difficulty/Discernment of the questions
  ############################################
  
  # test_question_instance = 1
  results = list()
  r=0
  #Loop through each line from the results file and put the theta from the test and the answer in a list with the number being the question number
  for (b in 1:length(answers_data$item_id)){
    #get the session_id, question_id, and result
    session_id = answers_data$session_id[[b]]
    question_number = answers_data$item_id[[b]]
    # if (question_number > 4800){
    #   question_number = 4801 + question_number %% 5
    # } else {
    #   if(question_number > 4000){
    #     question_number = 4001 + question_number %% 6
    #   }
    # }
    
    if (question_number == 4001){
      r = r+1
      print(r)
    }
    
    # If they got the question correct or not
    result = answers_data$score[[b]]
    #    print(c(session_id,question_number,result))
    
    
    #if the session_id is in the session results file
    if (session_id%in%session_results_df$session_id){
      
      #get the theta value corresponding to the session_id
      theta = as.numeric(session_results_df$theta[[match(session_id,session_results_df$session_id)]])
      
      if (length(results)<question_number){
        #results[[question_number]]
        results[[question_number]] = list()
      }
      #length(results[[question_number]])
      results[[question_number]][[length(results[[question_number]])+1]]=list(theta,result)
      
    }
    if (question_number == 4001){
      print(length(results[[question_number]]))
    }
  }
  



  ####### Now Rescore the questions
  # Don't score it if it has less than this number of responses
  min_questions = 10


  for (q in 1:length(results)){
    #print(q)
    if (length(results[[q]])>min_questions){

      discernment = question_table$p1[question_table$id==q]
      difficulty = question_table$p2[question_table$id==q]

      sorted_data = results[[q]][order(sapply(results[[q]],'[[',1))]
      # print(sorted_data)

      number_of_bins = 5
      bin_size = 5

      number_of_bins = ceiling(length(results[[q]])/bin_size)

      j=0
      binned_theta = integer(number_of_bins)
      binned_score = integer(number_of_bins)
      count = integer(number_of_bins)
      
      for (j in 1:length(sorted_data)){
        bin = ceiling(j/(length(sorted_data)/number_of_bins))
        binned_theta[bin] = (binned_theta[bin]*count[bin] + sorted_data[[j]][[1]])/(count[bin]+1)
        binned_score[bin] = (binned_score[bin]*count[bin] + sorted_data[[j]][[2]])/(count[bin]+1)
        count[bin] = count[bin] + 1
      }

      stored_count = count

      Binned_Score_Data <- vector()
      Binned_Theta_Data <- vector()

      for (bin in 1:number_of_bins){
        while (count[bin] > 0){
          Binned_Theta_Data <- c(Binned_Theta_Data,binned_theta[bin])
          Binned_Score_Data <- c(Binned_Score_Data,binned_score[bin])
          count[bin] = count[bin]-1
        }
      }

      x = Binned_Theta_Data
      y = Binned_Score_Data



      tryCatch({
        discernment_param_start = question_table$p1[[match(q,question_table$id)]]
        diff_param_start = question_table$p2[[match(q,question_table$id)]]
      }, error = function(err){
        discernment_param_start = 2
        diff_param_start = 1
      })


      Func <- function(x,discernment_param,diff_param){0.25 + (1-0.25)/(1+exp(-discernment_param*(x-diff_param)))}



      tryCatch({
        fit <- nls(y~Func(x,discernment_param,diff_param),start=list(discernment_param=discernment_param_start, diff_param=discernment_param_start),algorithm="port",lower=c(0,-4),upper=c(3,4),control = list(maxiter=1000, warnOnly=T))
        discernment = summary(fit)$coefficients[1,1]
        difficulty = summary(fit)$coefficients[2,1]

        #         if (q%%133 < 1){
        #           # print(x)
        #           # print(y)
        #           print(q)
        #           print('Plotting')
        #           plotx = x
        #           ploty = y
        #
        #           plot(x,y,xlim=c(-1,2),ylim=c(0,1))
        # #          plot(x,y)
        #           Sys.sleep(1)
        #     #      plot(x,Func(x,discernment,difficulty),xlim=c(-3,3),ylim=c(0,1))}
        #           y = Func(x,discernment,difficulty)
        #           plot(x,y,xlim=c(-1,2),ylim = c(0,1))}

      }, warning = function(w){
        # summary(fit)

        discernment = question_table$p1[question_table$id==q]
        difficulty = question_table$p2[question_table$id==q]

        tryCatch({
          discernment_param_start=coef(summary(fit))["discernment_param","Estimate"]
          diff_param_start=coef(summary(fit))["diff_param","Estimate"]

          fit <- nls(y~Func(x,discernment_param,diff_param),start=list(discernment_param=discernment_param_start, diff_param=diff_param_start),algorithm="port",lower=c(0,-4),upper=c(3,4),control = list(maxiter=1000, warnOnly=T))

          discernment = summary(fit)$coefficients[1,1]
          difficulty = summary(fit)$coefficients[2,1]


        }, warning = function(w){
          discernment = question_table$p1[question_table$id==q]
          difficulty = question_table$p2[question_table$id==q]
        },error = function(e){
          discernment = question_table$p1[question_table$id==q]
          difficulty = question_table$p2[question_table$id==q]}
        )
      }, error = function(e){
        discernment = question_table$p1[question_table$id==q]
        difficulty = question_table$p2[question_table$id==q]
      }
      )

      question_table <- within(question_table,p1[id==q]<-discernment)
      question_table <- within(question_table,p2[id==q]<-difficulty)




    }
  }

  ################################################################
  ## This code recalculates the theta for a given test
  ################################################################


  for (desired_session_id in session_results_df$session_id){


    one_test = dplyr::filter(answers_data, session_id == desired_session_id)

    answers_data

    x=vector()
    rm(params)
    params = matrix(,nrow =0 , ncol = 4)
    dimnames(params) = list(c(),c("a","b","c","d"))
    for (i in 1:length(one_test$session_id)){
      tryCatch({
        score = one_test$score[[i]]
        question_id = one_test$item_id[[i]]
        if (question_id > 4800){
          question_id = 4801 + question_id %% 5
        } else {
          if(question_id > 4000){
            question_id = 4001 + question_id %% 6
          }
        }
        p1 = question_table$p1[[match(question_id,question_table$id)]]
        p2 = question_table$p2[[match(question_id,question_table$id)]]
        p3 = question_table$p3[[match(question_id,question_table$id)]]
        p4 = question_table$p4[[match(question_id,question_table$id)]]
        x = append(x,score)
        params <- rbind(params,c(p1,p2,p3,p4))
      }, error = function(err){}
      )

   } 

    if (length(x)>35){
      new_theta = thetaEst(params,x)

      session_results_df <- within(session_results_df,theta[session_id==desired_session_id]<-new_theta)
    }

  }
}


write.csv(question_table,"rescored_questions.csv")
write.csv(session_results_df,"rescored_sessions.csv")
