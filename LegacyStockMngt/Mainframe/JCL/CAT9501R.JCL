//CAT9501R JOB (BR0P,0000),'ACATS: CL 039 INPUT',CLASS=1,MSGCLASS=W,            
//  SECLABEL=BISG,SCHENV=STREAMR,                                               
//             USER=BR0P                                                        
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11STEP EXEC CA11                                                            
//*-------------------------------------------------------------------*         
//* SEE JOBINFO ABOUT CALLING CLIENT 39 FOR INPUT FILE DATE ERROR               
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT950,                                                          
//             RUNDATE='RERUN.EARLY.',                                          
//             CL=039,                                                          
//             BYPASS=,          CHANGE TO BYPASS=BYPASS FOR DATE ERROR         
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DUMMY1=,                                                         
//             DUMMY2=,                                                         
//             HNB=BRRR,                                                        
//             NAV=BNAXXX,                                                      
//             PLAN='ACTBTCH'                                                   
//CAT950.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//GENER10.SYSUT1 DD DSN=BIOS.C039.INPACAT.TRAN,DISP=SHR                         
//GENER20.SYSUT2 DD DSN=BIOS.C039.OUTACAT.TRAN.CNF,DISP=SHR                     
