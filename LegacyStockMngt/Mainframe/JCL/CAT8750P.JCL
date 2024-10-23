//CAT8750P JOB (BP0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BP0P,SECLABEL=BISG,SCHENV=STREAMP                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BPPP,                                                        
//             STRM=P                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BPPP,                                                        
//             HNB1='SP.PPP',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=SP,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNAPPP,                                                      
//             DUMADT='DUMMY,',                                                 
//             STRM=PPP                                                         
