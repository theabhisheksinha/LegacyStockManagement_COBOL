//CAT5750P JOB (BP0P,0000),'ACATS: CREATE FR REC',CLASS=1,MSGCLASS=W,           
//         USER=BP0P,SECLABEL=BISG,SCHENV=STREAMP,PRTY=15                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BPPP,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM=P                                                           
//STEP20  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BPPP,                                                        
//             HNB1='SP.PPP',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=SP,                                                          
//             NAV=BNAPPP,                                                      
//             DY=DY,                     *DAILY 3 PM RUN                       
//             DUMADT='DUMMY,',                                                 
//             STRM=PPP                                                         
