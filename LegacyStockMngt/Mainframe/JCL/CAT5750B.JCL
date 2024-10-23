//CAT5750B JOB (BB0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BB0P,SECLABEL=BISG,SCHENV=STREAMB,PRTY=15                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BBBB,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=B                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BBBB,                                                        
//             HNB1='SB.BBB',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=SB,                                                          
//             NAV=BNABBB,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=BBB                                                         
