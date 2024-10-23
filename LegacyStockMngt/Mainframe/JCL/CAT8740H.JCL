//CAT8740H JOB (BH0P,DY00),'ACAT: SET FAILS',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAMH,                                                      
//         USER=BH0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11STEP EXEC CA11,                                                           
//             RMSPARM=P                                                        
//*                                                                             
//STEP10  EXEC CAT874,                                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             CLNT=HHH,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DISP1='(,CATLG,DELETE)',                                         
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GENP='(+1)',                                                     
//             GEN0='(0)',                                                      
//             HNB=BHHH,                                                        
//             REG=2M,                                                          
//             RUNDATE=,                                                        
//             UNIT=BATCH                                                       
//CAT874.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//*                                                                             
