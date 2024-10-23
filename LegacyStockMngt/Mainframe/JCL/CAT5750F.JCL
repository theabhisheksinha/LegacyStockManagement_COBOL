//CAT5750F JOB (BF0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BF0P,SECLABEL=BISG,SCHENV=STREAMF,PRTY=15                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BFFF,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=F                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BFFF,                                                        
//             HNB1='SF.FFF',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=SF,                                                          
//             NAV=BNAFFF,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=FFF                                                         
