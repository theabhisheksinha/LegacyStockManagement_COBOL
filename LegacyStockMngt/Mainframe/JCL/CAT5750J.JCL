//CAT5750J JOB (BJ0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BJ0P,SECLABEL=BISG,SCHENV=STREAMJ,PRTY=15                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BJJJ,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=J                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BJJJ,                                                        
//             HNB1='SJ.JJJ',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=SJ,                                                          
//             NAV=BNAJJJ,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=JJJ                                                         
