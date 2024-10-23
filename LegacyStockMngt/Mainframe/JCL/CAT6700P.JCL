//CAT6700P JOB (BP0P,DY00),'ACATS BOOK FEES',CLASS=1,MSGCLASS=W,                
//     USER=BP0P,                                                               
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*********************************************************************         
//* CREATE P2 FEE, FRACTIONAL QTY AND TYPE3 BALANCE MOVEMENT TIF FILES.         
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.              *         
//*********************************************************************         
//*                                                                             
//STEP10  EXEC CAT670,                                                          
//             HNB='BPPP',                *O/P .CAT670.FILES      GDG *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             RUNDATE=                                                         
//CAT670.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*                                                                             
//*********************************************************************         
//* CREATE P2 FEES FOR NON STANDARD (NON FULL) DELIVERIES.            *         
//*********************************************************************         
//STEP20  EXEC CAT670NS,                                                        
//             HNB='BPPP',                *O/P .CAT670NS.FEE      GDG *         
//             STREAM=P,                  *1 BYTE STREAM ID                     
//             SRMAS='BB.PPP.BSU40.SRMAS',                                      
//             NAV=BNAPPP,                                                      
//             RUNDATE=                                                         
