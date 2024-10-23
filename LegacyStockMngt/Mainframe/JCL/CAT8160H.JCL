//CAT8160H JOB (BH0P,DY00),'WITHHELD ASSETS RPT ',CLASS=1,MSGCLASS=W,           
//         SCHENV=STREAMH,                                                      
//         USER=BH0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//STEP10  EXEC CAT816,                    *JOB STREAM                 *         
//             BYP1=1,                    *O/P &HNB1.CAT816.WHDPI  GDG*         
//             BYP2=0,                                                          
//             B1HDR='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             GDG='GDG,',                                                      
//             GENP1A='(+1)',                                                   
//             HNB1='BHHH',                                                     
//             PERMUN='BATCH',                                                  
//             REGSIZE=4M,                                                      
//             RUNDATE=,                                                        
//             SPACE='(CYL,(1,1),RLSE)',                                        
//             STREAM=H                                                         
//CAT816.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//*                                                                             
