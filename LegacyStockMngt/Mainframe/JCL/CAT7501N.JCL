//CAT7501N JOB (BN1P,DAC0),'ACATS CAGE CREATE',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMN,                                                      
//        USER=BN1P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
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
//             HNB='BNNN',                *O/P .CAT650DB.ACATPEND GDG *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT655DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*                                                                             
//STEP10  EXEC CAT650,                    *1 BYTE BATCH STREAM ID     *         
//             BILFIL='BB.ZZZ.XBILL.BILLFL', *I/P 3 BYTE STREAM MEMO FI         
//             BILLOG='BB.ZZZ.XBILL.BILLOG', *O/P .CAT650.FILES      GD         
//             BRKRFL='SZ.ZZZ.CMT07.BROKER', *I/P .CAT650DB.ACATCAGE GD         
//             B1FIL='BZZZ.B1FL',           *RETAIN SPLIT ACATCAGE FILE         
//             EXTR=ACATINTR,                  *DONT CREATE P2 EXTRACTS         
//             HNB='BNNN',                                                      
//             HNB1='BZZZ',                                                     
//             MSDFIL='POVZ.PMSD.BMS90.MSDFILE',                                
//             MSDXRF='POVZ.PMSD.BMS90.MSDXRF',                                 
//             NAV=BNANNN,                                                      
//             NTWRGFL='NULLFILE',                                              
//             OVRDPRM=N,                                                       
//             P2FL='DUMMY,',                                                   
//             RPTPI=XSTLPI,                                                    
//             STREAM=N,                                                        
//             STREAM2=NNN,                                                     
//             RUNDATE='RERUN.EARLY.'                                           
//CAT650SP.IPZZZ DD DSN=&HNB1..CAT650DB.ACATPEND&GEN,DISP=SHR                   
//CAT650.IMFPEND DD  DSN=&HNB..CAT660.ACATCAGE&GENP1                            
//CAT650.PSSETTLE DD DUMMY                                                      
//CAT650.T3RDFL DD DSN=&HNB..CAT650.ID.T3RDFL&GENP1                             
//CAT650.CAG2FL DD DUMMY                                                        
//CAT650.CAGE13 DD DUMMY                                                        
//CAT650.XSTLPI DD DUMMY                                                        
