//CAT7240Z JOB (BZ0P,0000),'SBMT ACCT FRZ REJ',CLASS=1,MSGCLASS=W,              
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* SELECT FULL RECEIVES IN REVIEW AND PTR DELIVERY TRANSERS IN MEMO  *         
//* REQUEST, WHICH WERE FOUND BY BATCH TO HAVE AN ACCOUNT FREEZE.     *         
//* WHEN A REJECT ROW EXISTS ON HOLD, UPD IT TO BE ELIGABLE TO SUBMIT.*         
//*                                                                   *         
//* THIS IS AN UPDATE JOB AND IS RESTARTABLE.                         *         
//*********************************************************************         
//STEP10  EXEC CAT724,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT724.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
