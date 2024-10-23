//CAT8750R JOB (BR0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BR0P,SCHENV=STREAMR,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BRRR,                                                        
//             STRM=R                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BRRR,                                                        
//             HNB1='S2.XXX',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=S5,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNAXXX,                                                      
//             STRM=RRR                                                         
