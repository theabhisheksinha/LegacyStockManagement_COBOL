//CAT6750L JOB (BL0P,DY00),'ACATS P2 A000928 ',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAML,                                                      
//         USER=BL0P,SECLABEL=BISG                                              
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//STEP10  EXEC CAT675,                                                          
//             CL=L,                      * CLIENT STREAM             *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB='BLLL',                *O/P .CAT675.AIPP2       GDG*         
//             HNB1='BB.LLL',             *I/P .BSU40.SRMAS       VSAM*         
//             HNB2='BLLL'                *I/P .CAT610.ACCTDEL     GDG*         
//CAT675.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
