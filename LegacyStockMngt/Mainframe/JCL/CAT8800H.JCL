//CAT8800H JOB (BH0P,DY00),'ACAT BALANCE RPT',                                  
//         SCHENV=STREAMH,                                                      
//             CLASS=5,MSGCLASS=W,USER=BH0P,                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//**********************************************************************        
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//**********************************************************************        
//STEP1   EXEC CAT880,                                                          
//             B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             DISP1='(,CATLG,DELETE)',                                         
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GENP='(+1)',                                                     
//             HNB=BHHH,                                                        
//             HNB1='SH.HHH',                                                   
//             REG=2M,                                                          
//             RUNDATE=,                                                        
//             STREAM=H,                                                        
//             UNIT=BATCH                                                       
//CAT880.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
