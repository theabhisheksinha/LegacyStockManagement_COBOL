//CAT5750N JOB (BN1P,DAC0),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BN1P,SECLABEL=BISG,SCHENV=STREAMN,PRTY=15                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BNNN,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=N                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BNNN,                                                        
//             HNB1='SN.NNN',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=SN,                                                          
//             NAV=BNANNN,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=NNN                                                         
