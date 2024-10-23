//CAT8750Y JOB (BY0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BY0P,SECLABEL=BISG,SCHENV=STREAMY                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BYYY,                                                        
//             STRM=Y                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BYYY,                                                        
//             HNB1='S3.YYY',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=S3,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNAYYY,                                                      
//             STRM=YYY                                                         
