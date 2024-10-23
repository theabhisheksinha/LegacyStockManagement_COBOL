//CAT7150Z JOB (BP00,DY00),'ACATS CAGE TAG IDX',CLASS=1,MSGCLASS=W,             
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* THIS IS NOT AN UPDATE JOB AND MAY BE RESTARTED/RERAN.             *         
//*********************************************************************         
//STEP05  EXEC CAT715,                                                          
//             HNB=BZZZ,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH'             *DB2 PLAN CARDLIB MEMBER    *         
//CAT715.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*                                                                             
//**************************************************************        00012000
//**** OPEN ACAX CAGE TAG INDEX FILE (ACAXCG) IN ALL BTS REGIONS        00013000
//**************************************************************        00014000
//STEP50  EXEC OCPSPROD,                                                00018000
//             MBR='CAT715OZ'                                           00019000
