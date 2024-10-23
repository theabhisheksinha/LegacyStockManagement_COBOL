//CAT8750X JOB (BX0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BX0P,SECLABEL=BISG,SCHENV=STREAMX                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BXXX,                                                        
//             STRM=X                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BXXX,                                                        
//             HNB1='S2.XXX',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=S2,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNAXXX,                                                      
//             STRM=XXX                                                         
