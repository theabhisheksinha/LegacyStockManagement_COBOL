//CAT7550T JOB (BT0P,DY00),'ADD CONTRA CUSIP',CLASS=O,MSGCLASS=W,               
//         SCHENV=STREAMT,                                                      
//        PRTY=9,USER=BT0P,                                                     
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//JOBLIB DD DSN=BTTT.ADP.DATELIB,DISP=SHR                                       
//PROCLIB DD DSN=BISG.T3.PROCLIB,DISP=SHR                                       
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*********************************************************************         
//*    ADD CONTRA CUSIP FROM REORG FILE TO VRSTSEC DATABASE           *         
//*********************************************************************         
//STEP10  EXEC CAT755,                                                          
//             STREAM=T,                                                        
//             HNB=BTTT,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT755.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
