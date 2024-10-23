//CAT6601N JOB (BN1P,DAC0),'ACATS MFRS MF TRAN',CLASS=1,MSGCLASS=W,             
//         SCHENV=STREAMN,                                                      
//        USER=BN1P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//STEP1   EXEC CAT659,                                                          
//             BYP1=0,                                                          
//             B1FIL='BZZZ.B1FL',                                               
//             CAT659=,                                                         
//             GENP='(+1)',                                                     
//             GEN0='(0)',                                                      
//             HNB=BNNN,                                                        
//             HNB1=BNNN,                                                       
//             HNB2=BZZZ,                                                       
//             PENDDMY=,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             STREAM=N,                                                        
//             UNIT=BATCH                                                       
//STEP2   EXEC CAT660,                    *O/P .CAT660.ACATPEND   GDG *         
//             BYP1=0,                    *O/P .CAT660.ACATPENS   GDG *         
//             B1HDR='BZZZ.B1FL',         *O/P .CAT660.BNWTRAN    GDG *         
//             CARDLIB='BISG.CARDLIB',    *I/P .CAT650DB.ACATPEND GDG *         
//             GDGA='GDG,',               *I/P .BNW50.NTWREGOP    VSAM*         
//             GDGB='GDG,',               *I/P .BNA34.NAFILE      VSAM*         
//             GDGC='GDG,',                                                     
//             GENP1A='(+1)',                                                   
//             GENP1B='(+1)',                                                   
//             GENP1C='(+1)',                                                   
//             GEN00A='(+1)',                                                   
//             HNB1='BNNN',                                                     
//             HNB2='BNNN',                                                     
//             HNB3='BNNN',                                                     
//             HNB4='BNNN',                                                     
//             HNB5='BB.ZZZ',                                                   
//             HNO1='SN.NNN',                                                   
//             HNO2='BNANNN',                                                   
//             HNO3='SN.NNN',                                                   
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             MSDPRE='POVZ.PMSD',                                              
//             MSDSUF=,                                                         
//             PLAN='ACTBTCH',                                                  
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE1='(CYL,(30,30),RLSE)',                                     
//             SPACE2='(CYL,(30,30),RLSE)',                                     
//             SPACE3='(CYL,(20,10),RLSE)',                                     
//             UNIT='BATCH'                                                     
//CAT660.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
