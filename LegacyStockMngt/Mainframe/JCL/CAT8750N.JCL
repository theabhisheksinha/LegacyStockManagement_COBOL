//CAT8750N JOB (BN1P,DAC0),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BN1P,SECLABEL=BISG,SCHENV=STREAMN                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BNNN,                                                        
//             STRM=N                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BNNN,                                                        
//             HNB1='SN.NNN',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=SN,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNANNN,                                                      
//             STRM=NNN                                                         
