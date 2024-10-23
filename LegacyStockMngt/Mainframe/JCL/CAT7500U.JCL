//CAT7500U JOB (BU1P,DY00),'ACATS CAGE CREATE',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMU,                                                      
//        USER=BU1P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*********************************************************************         
//* EXTRACT ACATS DETAILS FOR CAGE INTERFACE.                                   
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.                        
//*********************************************************************         
//STEP10  EXEC CAT650DB,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB='BUUU',                *O/P .CAT650DB.ACATCAGE GDG *         
//             EXTR=ACATCAGE,             *EXTRACT CAGE DATA                    
//             STREAM=U,                  *STREAM ID                  *         
//             RUNDATE=                                                         
//CAT650DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*                                                                             
//*********************************************************************         
//* CREATE CAGE INTERFACE FILES.                                      *         
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.              *         
//* THE P2  EXTRACTS ARE DUMMY IN THE RUN; SEE JOB CAT6500U           *         
//*********************************************************************         
//*                                                                             
//STEP20  EXEC CAT750,                                                          
//             STREAM=U,                  *1 BYTE BATCH STREAM ID     *         
//             STREAM2=UUU,               *I/P 3 BYTE STREAM MEMO FILE*         
//             HNB='BUUU',                *O/P .CAT650.FILES      GDG *         
//             HNB1='BZZZ',               *I/P .CAT650DB.ACATCAGE GDG *         
//             NAV=BNAUUU,                                                      
//             EXTR=ACATCAGE,             *USE CAGE EXTRACT FILE                
//             RPTPI=XSTLPI,              *CREATE CAGE EXCP REPORT              
//             B1FIL='BZZZ.B1FL',                                               
//             BILFIL='BB.ZZZ.XBILL.BILLFL',                                    
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             RUNDATE=                                                         
//CAT650.PSSETTLE DD DSN=&HNB..CAT580SP.POST.STTL(0),DISP=SHR                   
