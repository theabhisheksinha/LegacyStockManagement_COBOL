//CAT5450Z JOB (BZ0P,0000),'ACATS AUTO REJECT   ',CLASS=1,MSGCLASS=W,           
//        PRTY=15,                                                              
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* CREATE AUTO REJECT ON INIT TABLE FOR RCL,RCR,FRV,PTD,CRD          *         
//* NOT ACCEPTED BY 3:00 PM                                           *         
//*********************************************************************         
//STEP10  EXEC CAT545,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT545.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
