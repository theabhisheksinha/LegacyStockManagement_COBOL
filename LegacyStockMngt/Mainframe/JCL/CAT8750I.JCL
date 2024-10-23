//CAT8750I JOB (BI0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BI0P,SECLABEL=BISG,SCHENV=STREAMI                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BIII,                                                        
//             STRM=I                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BIII,                                                        
//             HNB1='SI.III',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=SI,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNAIII,                                                      
//             STRM=III                                                         
