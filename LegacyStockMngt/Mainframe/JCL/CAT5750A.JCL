//CAT5750A JOB (BA0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BA0P,SECLABEL=BISG,SCHENV=STREAMA,PRTY=15                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BAAA,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=A                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BAAA,                                                        
//             HNB1='S1.AAA',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=S1,                                                          
//             NAV=BNAAAA,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=AAA                                                         
