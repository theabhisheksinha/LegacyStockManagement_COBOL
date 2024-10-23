//CAT714  PROC CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             CARDLIB1='BISG.CARDLIB',   *SORT CARDLIB               *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='SYS1',            *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DUMP=Y,                    *                           *         
//             GDG='GDG,',                *O/P .CAT714.ACCTDEL    GDG *         
//             GENP='(+1)',               *O/P .CAT714.ACCTDEL    GDG *         
//             HNB='BZZZ',                *O/P .CAT714.ACCTDEL    GDG *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             REG=4M,                    *                           *         
//             RUNDATE=,                  *                           *         
//             SPACE='(CYL,(2,5),RLSE)',  *O/P .CAT714.ACCTDEL    GDG *         
//             UNIT='BATCH'               *O/P .CAT714.ACCTDEL    GDG *         
//*                                                                             
//*********************************************************************         
//* CAT714 - PURGE ASSET    HISTORY 6 MONTH OLD (180 DAYS)            *         
//*          PURGE TRANSFER HISTORY 6 MONTH OLD (180 DAYS)            *         
//*********************************************************************         
//*                                                                             
//CAT714  EXEC PGM=CAT714,REGION=&REG                                           
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//          DD DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//          DD DSN=&DB2SYS..DSNEXIT,DISP=SHR                                    
//          DD DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA   DD DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//ACCTDEL   DD DSN=&HNB..CAT714.ACCTDEL.UNSORT&GENP,                            
//          DISP=(,CATLG,DELETE),                                               
//          UNIT=&UNIT,                                                         
//          SPACE=&SPACE,                                                       
//          DCB=(&GDG.RECFM=FB,LRECL=30)                                        
//SYSOUT    DD SYSOUT=*                                                         
//SYSPRINT  DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=&DUMP                                                     
//*-------------------------------------------------------------------*         
//* SORT AGED/DELETE FILE INTO CLIENT/BRANCH ACCT SEQUENCE.           *         
//*-------------------------------------------------------------------*         
//SORT10  EXEC PGM=SORT,                                                        
//             REGION=4M,                                                       
//             PARM='SIZE=4M,MSG=AP'                                            
//SORTIN    DD DSN=&HNB..CAT714.ACCTDEL.UNSORT&GENP,                            
//             DISP=SHR                                                         
//SORTOUT   DD DSN=&HNB..CAT714.ACCTDEL&GENP,                                   
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.BUFNO=5)                                               
//SORTLIST  DD SYSOUT=*                                                         
//SYSOUT    DD SYSOUT=*                                                         
//SYSPRINT  DD SYSOUT=*                                                         
//* SORT FIELDS=(1,09,CH,A)                                                     
//SYSIN     DD DSN=&CARDLIB1(CAT714S1),                                         
//             DISP=SHR                                                         
