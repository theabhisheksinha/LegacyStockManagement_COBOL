//CAT8750A JOB (BA0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BA0P,SECLABEL=BISG,SCHENV=STREAMA                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BAAA,                                                        
//             STRM=A                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BAAA,                                                        
//             HNB1='S1.AAA',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=S1,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNAAAA,                                                      
//             STRM=AAA                                                         
