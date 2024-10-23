//CAT5750T JOB (BT0P,DY00),'ACATS: CREATE FR REC',CLASS=O,MSGCLASS=W,           
//         USER=BT0P,SECLABEL=BISG,SCHENV=STREAMT,PRTY=9                        
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BTTT,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=T                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BTTT,                                                        
//             HNB1='S1.TTT',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=S1,                                                          
//             NAV=BNATTT,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=TTT                                                         
//CAT575B.MFEXBR DD DSN=ST.TTT.MFRS.MFEXBR,DISP=SHR                             
