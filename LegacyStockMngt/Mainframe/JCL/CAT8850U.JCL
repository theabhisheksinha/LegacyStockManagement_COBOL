//CAT8850U JOB (BU1P,DY00),'FORGN CURRENCY RPT',CLASS=1,MSGCLASS=W,             
//         SCHENV=STREAMU,                                                      
//         USER=BU1P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* THIS JOB READS DB2 DATABASE.  THIS JOB CAN BE RERAN AT ANY STEPS. *         
//*********************************************************************         
//STEP10  EXEC CAT885,                                                          
//        HNB='BUUU',                *                           *              
//        NAV=BNAUUU,                *                           *              
//        STRM='U',                  *CLIENT STREAM IND          *              
//        DB2SYS='DB2PROD.GROUP',    *DB2                                       
//        DB2SYS1='DB2PROD.GROUP',   *DB2                                       
//        RUNDATE=                   *                           *              
//CAT885A.STEPLIB   DD                                                          
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
