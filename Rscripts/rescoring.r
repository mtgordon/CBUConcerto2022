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
        }, error <- function(err){}
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
            session_data_temp <- data.frame(session_id,theta)
            session_results_df <- rbind(session_results_df,session_data_tmp)
        }

    }

    for(k in 1:40){
        #remake 
            # I think the best way to change this would be to just create a dataframe that holds: 
            #   1d      Q#      score       sTheta <- the theta correlating to the session 
            #   1       6       1          whatever
            #   2       6       0  
            #   3       6       1
            #   4       6                 
            #now I see what gordon was meaning by adding it to the db BUT WHAT THE ACUTAL HELL MAN!!!

        results <- data.frame(question_number <-integer(), score <- integer(), stheta <- integer())

        #iterate through the df for the sessions we care about
        for(sdf in 1:nrow(session_results_df)){

            #Grabbing session_id, item_id and score from the table this makes a dataframe 
            query_string <- paste0("SELECT item_id, score FROM ", {response_table}, "WHERE session_id = '", session_results_df[sdf,],"' ORDER BY item_id")
            session_data_df<- concerto.table.query(query_string)
            #grabbing the theta: 
            session_id <- session_results_df[sdf,1]
            theta <- as.numeric(session_results_df$theta[[match(session_id,session_results_df$session_id)]])
            #adding the theta to the data frame on every row
            session_data_df["stheta"] = theta;
            #adding this chunk to results
            results <- cbind(results, session_data_df)
        }
        print(results)

    }

#}