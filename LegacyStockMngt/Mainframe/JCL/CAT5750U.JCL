//CAT5750U JOB (BU1P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BU1P,SECLABEL=BISG,SCHENV=STREAMU,PRTY=15                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BUUU,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=U                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BUUU,                                                        
//             HNB1='SU.UUU',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=SU,                                                          
//             NAV=BNAUUU,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=UUU                                                         
