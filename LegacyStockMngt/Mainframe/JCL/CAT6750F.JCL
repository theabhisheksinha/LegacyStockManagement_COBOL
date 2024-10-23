//CAT6750F JOB (BF0P,DY00),'ACATS P2 A000928 ',CLASS=1,MSGCLASS=W,              
//         USER=BF0P,SECLABEL=BISG,SCHENV=STREAMF                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//STEP10  EXEC CAT675,                                                          
//             CL=F,                      * CLIENT STREAM             *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB='BFFF',                *O/P .CAT675.AIPP2       GDG*         
//             HNB1='BB.FFF',             *I/P .BSU40.SRMAS       VSAM*         
//             HNB2='BFFF'                *I/P .CAT610.ACCTDEL     GDG*         
//CAT675.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
