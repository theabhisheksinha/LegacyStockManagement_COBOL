//CAT7501H JOB (BH0P,DY00),'ACATS CAGE CREATE',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMH,                                                      
//        USER=BH0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
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
//             HNB='BHHH',                *O/P .CAT650DB.ACATPEND GDG *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT655DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*                                                                             
//STEP10  EXEC CAT650,                    *1 BYTE BATCH STREAM ID     *         
//             STREAM=H,                                                        
//             STREAM2=HHH,                                                     
//             HNB='BHHH',                                                      
//             HNB1='BZZZ',                                                     
//             NAV=BNAHHH,                                                      
//             EXTR=ACATINTR,                  *DONT CREATE P2 EXTRACTS         
//             RPTPI=XSTLPI,                                                    
//             P2FL='DUMMY,',                                                   
//             B1FIL='BZZZ.B1FL',           *RETAIN SPLIT ACATCAGE FILE         
//             BILFIL='BB.ZZZ.XBILL.BILLFL', *I/P 3 BYTE STREAM MEMO FI         
//             BILLOG='BB.ZZZ.XBILL.BILLOG', *O/P .CAT650.FILES      GD         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT650SP.IPZZZ DD DSN=&HNB1..CAT650DB.ACATPEND&GEN,DISP=SHR                   
//CAT650.IMFPEND DD  DSN=&HNB..CAT660.ACATCAGE&GENP1                            
//CAT650.PSSETTLE DD DUMMY                                                      
//CAT650.T3RDFL DD DSN=&HNB..CAT650.ID.T3RDFL&GENP1                             
//CAT650.CAG2FL DD DUMMY                                                        
//CAT650.CAGE13 DD DUMMY                                                        
//CAT650.XSTLPI DD DUMMY                                                        
