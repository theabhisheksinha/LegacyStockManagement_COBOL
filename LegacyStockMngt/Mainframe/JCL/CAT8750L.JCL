//CAT8750L JOB (BL0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BL0P,SECLABEL=BISG,SCHENV=STREAML                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BLLL,                                                        
//             STRM=L                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BLLL,                                                        
//             HNB1='SL.LLL',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=SL,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNALLL,                                                      
//             STRM=LLL                                                         
