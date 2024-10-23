//CAT6100J JOB (BJ0P,DY00),'ACATS NA UPDATES',CLASS=1,MSGCLASS=W,               
//         SCHENV=STREAMJ,                                                      
//        USER=BJ0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//STEP10  EXEC CAT610,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             CL=J,                      * CLIENT STREAM             *         
//             B1FIL='BZZZ.B1FL',                                               
//             HNB=BJJJ,                                                        
//             NAV=BNAJJJ,                                                      
//             RUNDATE='RERUN.EARLY.'                                           
//CAT610.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//CAT612.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//*                                                                             
//*------------------------------------------------------------------*          
//* MERGE 5 CYCLES OF NAME AND ADDRESS DEFERRED UPDATE WITH NIGHTLY  *          
//* DEFERRED UPDATE FILE INTO EOD FILE TO BE PROCESSED NEXT NIGHT.   *          
//*------------------------------------------------------------------*          
//SORT50  EXEC SORT,                                                            
//             REGION=4M,                                                       
//             PARM='SIZE=4M,MSG=AP'                                            
//SORTIN    DD DSN=BJJJ.CAT610.NAUP.WRAP(+1),DISP=SHR                           
//          DD DSN=BJJJ.CAT611.NAUP.WRAP(+0),DISP=SHR                           
//          DD DSN=BJJJ.CAT611.NAUP.WRAP(-1),DISP=SHR                           
//          DD DSN=BJJJ.CAT611.NAUP.WRAP(-2),DISP=SHR                           
//SORTOUT   DD DSN=BJJJ.CAT610.NAUP.WRAP.EOD(+1),                               
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(1,5),RLSE),                                          
//             DCB=(GDG,LRECL=40,RECFM=FB)                                      
//SORTLIST  DD SYSOUT=*                                                         
//* CLIENT,BR,AC                                                                
//* SORT FIELDS=(01,11,CH,A)                                                    
//* SUM FIELDS=NONE                                                             
//SYSIN     DD DSN=BISG.CARDLIB(CAT610S1),                                      
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=Y                                                         
