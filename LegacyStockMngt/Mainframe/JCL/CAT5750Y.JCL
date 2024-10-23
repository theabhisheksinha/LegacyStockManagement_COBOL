//CAT5750Y JOB (BY0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BY0P,SECLABEL=BISG,SCHENV=STREAMY,PRTY=15                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BYYY,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=Y                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BYYY,                                                        
//             HNB1='S3.YYY',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=S3,                                                          
//             NAV=BNAYYY,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=YYY                                                         
