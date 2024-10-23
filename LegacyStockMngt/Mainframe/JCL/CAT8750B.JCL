//CAT8750B JOB (BB0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BB0P,SECLABEL=BISG,SCHENV=STREAMB                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BBBB,                                                        
//             STRM=B                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BBBB,                                                        
//             HNB1='SB.BBB',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=SB,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNABBB,                                                      
//             STRM=BBB                                                         
