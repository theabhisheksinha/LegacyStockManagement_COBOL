//CAT5270R JOB (BR0P,DY00),'ACATS MSD EXP RPT',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMR,                                                      
//        USER=BR0P,                                                            
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
//             STREAM=R,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BRRR',                *O/P .CAT650.FILES      GDG *         
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//CAT527DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
