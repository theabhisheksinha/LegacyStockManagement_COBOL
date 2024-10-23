//CAT5750X JOB (BX0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BX0P,SECLABEL=BISG,SCHENV=STREAMX,PRTY=15                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BXXX,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=X                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BXXX,                                                        
//             HNB1='S2.XXX',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=S2,                                                          
//             NAV=BNAXXX,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=XXX                                                         
