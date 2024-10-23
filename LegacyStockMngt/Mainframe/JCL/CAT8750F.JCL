//CAT8750F JOB (BF0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BF0P,SECLABEL=BISG,SCHENV=STREAMF                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BFFF,                                                        
//             STRM=F                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BFFF,                                                        
//             HNB1='SF.FFF',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=SF,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNAFFF,                                                      
//             STRM=FFF                                                         
