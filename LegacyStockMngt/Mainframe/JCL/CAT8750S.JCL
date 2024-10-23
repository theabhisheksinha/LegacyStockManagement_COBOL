//CAT8750S JOB (BS0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BS0P,SCHENV=STREAMS,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BSSS,                                                        
//             STRM=S                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BSSS,                                                        
//             HNB1='S3.YYY',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=S6,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNAYYY,                                                      
//             STRM=SSS                                                         
