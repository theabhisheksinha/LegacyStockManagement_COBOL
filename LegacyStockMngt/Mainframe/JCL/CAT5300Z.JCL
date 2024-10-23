//CAT5300Z JOB (BP00,DY00),'ACATS REVIEW ERROR',CLASS=1,MSGCLASS=W,             
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//**                                                                            
//CA11    EXEC CA11                                                             
//**                                                                            
//********************************************************************          
//**CREATE A ASSET REVIEW ERROR REPORT AFTER EACH CYCLE, EXTRACT FROM*          
//**DB2 ACTIVE TRANSFER TABLE                                        *          
//********************************************************************          
//**                                                                            
//STEP10  EXEC CAT530,                                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BZZZ,                                                        
//             RUNDATE=                                                         
//**                                                                            
//BTR0405  EXEC  BTR004,                                                        
//            UNIT=BATCH,                                                       
//            DSN='BZZZ.CAT530.RVEPI(+1)',                                      
//            PARM='TRMX,REPLACE.AC=BP'                                         
//**                                                                            
