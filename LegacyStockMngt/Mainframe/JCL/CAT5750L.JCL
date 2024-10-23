//CAT5750L JOB (BL0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BL0P,SECLABEL=BISG,SCHENV=STREAML,PRTY=15                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BLLL,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=L                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BLLL,                                                        
//             HNB1='SL.LLL',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=SL,                                                          
//             NAV=BNALLL,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=LLL                                                         
