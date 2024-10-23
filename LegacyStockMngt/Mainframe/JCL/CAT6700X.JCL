//CAT6700X JOB (BX0P,DY00),'ACATS BOOK FEES',USER=BX0P,CLASS=1,                 
//             MSGCLASS=W,                                                      
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
//             HNB='BXXX',                *O/P .CAT670.FILES      GDG *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             RUNDATE=                                                         
//*                                                                             
//SORT05.SORTIN  DD                                                             
//      DD DSN=BRRR.CAT820.ID.RET(0),                                           
//             DISP=SHR,DCB=BUFNO=5                                             
//CAT670.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*********************************************************************         
//* CREATE P2 FEES FOR NON STANDARD (NON FULL) DELIVERIES.            *         
//*********************************************************************         
//STEP20  EXEC CAT670NS,                                                        
//             HNB='BXXX',                *O/P .CAT670NS.FEE      GDG *         
//             STREAM=X,                  *1 BYTE STREAM ID                     
//             SRMAS='BB.XXX.BSU40.SRMAS',                                      
//             NAV=BNAXXX,                                                      
//             RUNDATE=                                                         
