//CAT5750R JOB (BR0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BR0P,SECLABEL=BISG,PRTY=15,SCHENV=STREAMR                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BRRR,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=R                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BRRR,                                                        
//             HNB1='S2.XXX',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=S5,                                                          
//             NAV=BNAXXX,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             STRM=RRR                                                         
