//CAT7500H JOB (BH0P,DY00),'ACATS CAGE CREATE',CLASS=5,MSGCLASS=W,              
//         SCHENV=STREAMH,                                                      
//        USER=BH0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//*                                                                             
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//*                                                                             
//*********************************************************************         
//* EXTRACT ACATS DETAILS FOR CAGE INTERFACE.                                   
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.                        
//*********************************************************************         
//STEP10  EXEC CAT650DB,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB='BHHH',                *O/P .CAT650DB.ACATCAGE GDG *         
//             EXTR=ACATCAGE,             *EXTRACT CAGE DATA                    
//             STREAM=H,                  *STREAM ID                  *         
//             RUNDATE=                                                         
//CAT650DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*********************************************************************         
//* CREATE CAGE INTERFACE FILES.                                      *         
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.              *         
//* THE P2  EXTRACTS ARE DUMMY IN THE RUN; SEE JOB CAT6500H           *         
//*********************************************************************         
//*                                                                             
//STEP20  EXEC CAT750,                                                          
//             B1FIL='BZZZ.B1FL',                                               
//             EXTR=ACATCAGE,                                                   
//             HNB='BHHH',                                                      
//             HNB1='BZZZ',                                                     
//             NAV=BNAHHH,                                                      
//             RPTPI=XSTLPI,                                                    
//             STREAM=H,                                                        
//             STREAM2=HHH,                                                     
//             RUNDATE=                                                         
//CAT650.PSSETTLE DD DSN=&HNB..CAT580SP.POST.STTL(0),DISP=SHR                   
