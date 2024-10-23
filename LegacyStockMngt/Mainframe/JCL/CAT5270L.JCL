//CAT5270L JOB (BL0P,DY00),'ACATS MSD EXP RPT',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAML,                                                      
//        USER=BL0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//STEP10  EXEC CAT527,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             STREAM=L,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BLLL',                *O/P .CAT650.FILES      GDG *         
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//CAT527DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
