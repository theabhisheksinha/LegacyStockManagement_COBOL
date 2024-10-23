//CAT6601H JOB (BH0P,DY00),'ACATS MFRS MF TRAN',CLASS=1,MSGCLASS=W,             
//         SCHENV=STREAMH,                                                      
//        USER=BH0P,PRTY=15,                                                    
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
//             HNB=BHHH,                                                        
//             HNB1=BHHH,                                                       
//             HNB2=BZZZ,                                                       
//             PENDDMY=,                                                        
//             RUNDATE=RERUN.EARLY.,                                            
//             STREAM=H,                                                        
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
//             HNB1='BHHH',                                                     
//             HNB2='BHHH',                                                     
//             HNB3='BHHH',                                                     
//             HNB4='BHHH',                                                     
//             HNB5='BB.ZZZ',                                                   
//             HNO1='SH.HHH',                                                   
//             HNO2='BNAHHH',                                                   
//             HNO3='SH.HHH',                                                   
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             MSDPRE='POVZ.PMSD',                                              
//             MSDSUF=,                                                         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=RERUN.EARLY.,                                            
//             SPACE1='(CYL,(30,30),RLSE)',                                     
//             SPACE2='(CYL,(30,30),RLSE)',                                     
//             SPACE3='(CYL,(20,10),RLSE)',                                     
//             UNIT='BATCH'                                                     
//CAT660.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
