//CAT5750S JOB (BS0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BS0P,SECLABEL=BISG,PRTY=15,SCHENV=STREAMS                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BSSS,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=S                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BSSS,                                                        
//             HNB1='S3.YYY',             *I/P NTWREGOP,NTWMAST,MFEXBR**        
//             HNO=S6,                                                          
//             NAV=BNAYYY,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=SSS                                                         
