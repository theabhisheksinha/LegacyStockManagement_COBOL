//CAT5750H JOB (BH0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BH0P,SECLABEL=BISG,SCHENV=STREAMH,PRTY=15                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BHHH,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=H                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BHHH,                                                        
//             HNB1='SH.HHH',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=SH,                                                          
//             NAV=BNAHHH,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             RUNDATE=,                                                        
//             STRM=HHH                                                         
