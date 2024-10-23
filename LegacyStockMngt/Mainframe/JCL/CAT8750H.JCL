//CAT8750H JOB (BH0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BH0P,SECLABEL=BISG,SCHENV=STREAMH                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT875A,                                                         
//             HNB=BHHH,                                                        
//             STRM=H                                                           
//STEP20  EXEC CAT575,                                                          
//             CYCLE=CAT875A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BHHH,                                                        
//             HNB1='SH.HHH',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=SH,                                                          
//             DY=ED,                     *EOD RUN                              
//             NAV=BNAHHH,                                                      
//             STRM=HHH                                                         
