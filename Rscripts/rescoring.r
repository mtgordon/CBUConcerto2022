library("catR")

#TODO: fix this poor query and data table system
#Grabbing all the tables 
#list_res_tables <- concerto.table.query("GET TABLE...")

session_results_df <- data.frame(session_id <- integer(), theta <- double())

#use this for loop when we can aquire all the tables
#for (t in 1:length(list_res_tables)){ #for each table given:

    
    #creating the query for each unique session 
    query_string <- paste0("SELECT DISTINCT session_id FROM ", {response_table})
    list_unique_sessions <- concerto.table.query(query_string)
    
    for(s in 1:nrow(list_unique_sessions)){ #for each unique session:

        #grabbing the answers in each session
        #remember to add a ORDER BY 
        #NEW QUERY STRING I CAN USE! 

        query_string <- paste0("SELECT score, item_id FROM ", {response_table}," WHERE session_id = '", list_unique_sessions[s,],"' ORDER BY id")
        list_score_itemid_from_session <- concerto.table.query(query_string)
        x=vector()
        tryCatch({
            rm(params)
        }, error = function(err){}
        )
        params <- matrix(,nrow =0 , ncol = 4)
        dimnames(params) <- list(c(),c("a","b","c","d"))
        
        #iterate through all the answers in a given session
        for(i in 1:nrow(list_score_itemid_from_session)){
            
            tryCatch({
                score <- list_score_itemid_from_session[i,1]
                question_id <- list_score_itemid_from_session[i,2]

                print(question_id)
                print(score)

                p1 <- 2
                p2 <- 0
                p3 <- 0.25
                p4 <- 1
                x <- append(x,score)
                params <- rbind(params,c(p1,p2,p3,p4))
            }, error = function(err){}
            )
        }

        #calculating the new theta, but I don't know why this check is here
        if(length(x) > 5){

            new_theta <- thetaEst(params,x)
            # print(new_theta)
            session_id <- list_unique_sessions[s,]
            theta <- new_theta
            session_data_tmp <- data.frame(session_id,theta)
            session_results_df <- rbind(session_results_df,session_data_tmp)
        }

    }

    for(k in 1:40){

        
            # I think the best way to change this would be to just create a dataframe that holds: 
            #   1d      Q#      score       sTheta <- the theta correlating to the session 
            #   1       6       1          whatever
            #   2       6       0  
            #   3       6       1
            #   4       6                 

        results <- data.frame(question_number <-integer(), score <- integer(), stheta <- integer())

        #iterate through the df for the sessions we care about
        for(sdf in 1:nrow(session_results_df)){

            #Grabbing session_id, item_id and score from the table this makes a dataframe 
            query_string <- paste0("SELECT item_id, score FROM ", {response_table}, "WHERE session_id = '", session_results_df[sdf,1],"' ORDER BY item_id")
            session_data_df<- concerto.table.query(query_string)

            #grabbing the theta: 
            session_id <- session_results_df[sdf,1]
            theta <- as.numeric(session_results_df$theta[[match(session_id,session_results_df$session_id)]])

            #adding the theta to the data frame on every row
            session_data_df["stheta"] = theta;

            #adding this chunk to results
            results <- rbind(results, session_data_df)
        }
        print(results)
        min_questions <- 10

        #rescoring 
        #for each question overall in the test 
        for(q in 1:length(unique(results$question_number))){

            # super disgusting, This is finding out how-
            # many times a certain question number has been answered.
            # Say if question 1 has been answered 5 times and is less-
            # than the number of min_questions we don't want to rescore it 
            if(nrow(results[which(results$question_number == q)]) < min_questions){
                # get the p1 and p2 value from questionTable
                # p1 = discernment 
                # p2 = difficulty  
                query_string <- paste0("SELECT p1, p2 FROM ",{question_table}, "WHERE id = " , q)

                p1_p2_df <- concerto.table.query(query_string)
                #this is another bad looking line, it is grabbing the session theta and score for the given question

                sorted_data <- results[order(which(results$question_number == q))]

                bin_size <- 5

                # This is interesting to see.. ask Gordon 
                number_of_bins <- ceiling(nrow(results[which(results$question_number == q)])/bin_size)

                #ask Gordon why do this?
                binned_theta = integer(number_of_bins)
                binned_score = integer(number_of_bins)
                count = integer(number_of_bins)

                for(j in 1:nrow(sorted_data)){    
                    
                }

            }
        }
        

    }

#}