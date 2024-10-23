//CAT7501L JOB (BL0P,DY00),'ACATS CAGE CREATE',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAML,                                                      
//        USER=BL0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*********************************************************************         
//* CREATE CAGE FAIL SET UP INTRA DAY FOR REJECTED MF AFTER S/D       *         
//*********************************************************************         
//*                                                                             
//*********************************************************************         
//* ADD TI FOR ALL CAT660.ACATPEND SINCE THESE ARE PAST SETTLE        *         
//*********************************************************************         
//STEP10  EXEC CAT655DB,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB='BLLL',                *O/P .CAT650DB.ACATPEND GDG *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT655DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*                                                                             
//STEP10  EXEC CAT650,                                                          
//             STREAM=L,                  *1 BYTE BATCH STREAM ID     *         
//             STREAM2=LLL,               *I/P 3 BYTE STREAM MEMO FILE*         
//             HNB='BLLL',                *O/P .CAT650.FILES      GDG *         
//             HNB1='BZZZ',               *I/P .CAT650DB.ACATCAGE GDG *         
//             NAV=BNALLL,                                                      
//             EXTR=ACATINTR,             *USE CAGE EXTRACT FILE                
//             RPTPI=XSTLPI,              *CREATE CAGE EXCP REPORT              
//             P2FL='DUMMY,',             *DONT CREATE P2 EXTRACTS              
//             B1FIL='BZZZ.B1FL',                                               
//             BILFIL='BB.ZZZ.XBILL.BILLFL',                                    
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             RUNDATE='RERUN.EARLY.'                                           
//CAT650SP.IPZZZ DD DSN=&HNB1..CAT650DB.ACATPEND&GEN,DISP=SHR                   
//CAT650.IMFPEND DD  DSN=&HNB..CAT660.ACATCAGE&GENP1                            
//CAT650.PSSETTLE DD DUMMY                                                      
//CAT650.T3RDFL DD DSN=&HNB..CAT650.ID.T3RDFL&GENP1                             
//CAT650.CAG2FL DD DUMMY                                                        
//CAT650.CAGE13 DD DUMMY                                                        
//CAT650.XSTLPI DD DUMMY                                                        
