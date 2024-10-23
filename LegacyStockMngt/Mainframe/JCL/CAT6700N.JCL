//CAT6700N JOB (BN1P,DAC0),'ACATS BOOK FEES',CLASS=1,MSGCLASS=W,                
//     USER=BN1P,                                                               
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//*********************************************************************         
//* CREATE P2 FEE, FRACTIONAL QTY AND TYPE3 BALANCE MOVEMENT TIF FILES.         
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.              *         
//*********************************************************************         
//*                                                                             
//STEP10  EXEC CAT670,                    *O/P .CAT670.FILES      GDG *         
//             CARDLIB='BISG.CARDLIB',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             GDG='GDG,',                                                      
//             GEN='(0)',                                                       
//             GENP1='(+1)',                                                    
//             HNB='BNNN',                                                      
//             PLAN='ACTBTCH',                                                  
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=,                                                        
//             SPACE1='(CYL,(5,10),RLSE)',                                      
//             SPACE2='(CYL,(5,10),RLSE)',                                      
//             SPACE3='(CYL,(5,10),RLSE)',                                      
//             UNIT='BATCH'                                                     
//CAT670.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*                                                                             
//*********************************************************************         
//* CREATE P2 FEES FOR NON STANDARD (NON FULL) DELIVERIES.            *         
//*********************************************************************         
//STEP20  EXEC CAT670NS,                                                        
//             HNB='BNNN',                *O/P .CAT670NS.FEE      GDG *         
//             STREAM=N,                  *1 BYTE STREAM ID                     
//             SRMAS='BB.NNN.BSU40.SRMAS',                                      
//             NAV=BNANNN,                                                      
//             RUNDATE=                                                         
