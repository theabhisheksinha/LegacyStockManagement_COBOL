//CAT8750J JOB (BJ0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BJ0P,SECLABEL=BISG,SCHENV=STREAMJ                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BJJJ,                                                        
//             STRM=J                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BJJJ,                                                        
//             HNB1='SJ.JJJ',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=SJ,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNAJJJ,                                                      
//             STRM=JJJ                                                         
