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
    #TODO: make sure you get the actual size of a dataframe!!! not a list
    for(s in 1:nrow(list_unique_sessions)){ #for each unique session:

        #grabbing the answers in each session
        #TODO: Make sure that the data type from this query is iterable!
        #remember to add a ORDER BY 
        #NEW QUERY STRING I CAN USE! 

        query_string <- paste0("SELECT score, item_id FROM ", {response_table}," WHERE session_id = '", list_unique_sessions[s,],"'' ORDER BY id")
        list_score_itemid_from_session <- concerto.table.query(query_string)
        x=vector()
        tryCatch({
            rm(params)
        }, error <- function(err){}
        )
        params <- matrix(,nrow =0 , ncol = 4)
        dimnames(params) <- list(c(),c("a","b","c","d"))
        
        #TODO: fix this loop length as well
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
            session_data <- data.frame(session_id,theta)
            session_results_df <- rbind(session_results_df,session_data)
        }

    }

    for(k in 1:40){

        results = list()

        #TODO: I will need to remake this query so that it works per tabl
        #grabbing the entire list of sessions 

        #the bottom % of the thetas grab the score of what they got

        #grabbing the entire list of question #s
        #grabbing the entire list of scores

        query_string <- paste0("SELECT session_id, item_id, score FROM ", {response_table}, " ORDER BY id")
        list_sessionid_itemid_score_from_table <- concerto.table.query(query_string)

        for(b in 1:nrow(list_sessionid_itemid_score_from_table)){
            session_id <- list_sessionid_itemid_score_from_table[b,1]
            print(session_id)
            question_number <- list_sessionid_itemid_score_from_table[b,2]
            print(question_number)

            result <- list_sessionid_itemid_score_from_table[b,3] 

            #remake 
            if(session_id%in%session_results_df$session_id){
                theta = as.numeric(session_results_df$theta[[match(session_id,session_results_df$session_id)]])

                if(length(results)<question_number){
                    results[[question_number]] = list()
                }
                results[[question_number]][[length(results[[question_number]])+1]]=list(theta,result)
            }
        }
    }

#}