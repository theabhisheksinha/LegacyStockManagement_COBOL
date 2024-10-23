//CAT5750I JOB (BI0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BI0P,SECLABEL=BISG,SCHENV=STREAMI,PRTY=15                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BIII,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=I                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BIII,                                                        
//             HNB1='SI.III',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=SI,                                                          
//             NAV=BNAIII,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=III                                                         
