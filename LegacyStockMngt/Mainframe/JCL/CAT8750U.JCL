//CAT8750U JOB (BU1P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BU1P,SECLABEL=BISG,SCHENV=STREAMU                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BUUU,                                                        
//             STRM=U                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BUUU,                                                        
//             HNB1='SU.UUU',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=SU,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNAUUU,                                                      
//             STRM=UUU                                                         
