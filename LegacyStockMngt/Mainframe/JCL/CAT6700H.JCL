//CAT6700H JOB (BH0P,DY00),'ACATS BOOK FEES',CLASS=1,MSGCLASS=W,                
//     USER=BH0P,                                                               
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
//             HNB='BHHH',                                                      
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
//             HNB='BHHH',                *O/P .CAT670NS.FEE      GDG *         
//             STREAM=H,                  *1 BYTE STREAM ID                     
//             SRMAS='BB.HHH.BSU40.SRMAS',                                      
//             NAV=BNAHHH,                                                      
//             RUNDATE=                                                         
