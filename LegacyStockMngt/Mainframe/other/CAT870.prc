//CAT870  PROC CAT870=,                                                         
//          DUMP=Y,                                                             
//          REG=2M,                                                             
//          HNB=,                      UNIVERSAL STREAM PREFIX          00033000
//          GENP1='(+1)',              GDG 1                            00036000
//          OUT='*',                   SYSOUT MSGCLASS                  00038000
//          PARM870=N,                                                          
//          BATCH=BATCH,               DISK AREA                        00031000
//          DB2SYS='DB2PROD',          DB2PROD/DB2TEST                          
//          DB2SYS1='DB2PROD',         DB2PROD/DB2TEST                          
//          CARDLIB='BISG.CARDLIB',    DB2 PLAN CARDLIB                         
//          PLAN='ACTBTCH',                                                     
//          RUNDATE=                                                            
//*-------------------------------------------------------------------  00004000
//* THIS SORTS THE ORDER FILE BY CLIENT/BRANCH/ACCT                     00005000
//*-------------------------------------------------------------------  00006000
//SORT10  EXEC PGM=SORT                                                 00007000
//SORTIN   DD DSN=BZZZ.OMG26SRT.OPENO,DISP=SHR                          00095000
//SORTOUT  DD DSN=&HNB..CAT870.ORDER.TMP&GENP1,                         00096000
//             DISP=(NEW,CATLG,DELETE),                                 00097000
//             UNIT=&BATCH,                                             00097100
//             SPACE=(CYL,(10,10),RLSE),                                00097200
//             DCB=(GDG,RECFM=FB,LRECL=80,BLKSIZE=27920)                00097300
//SYSIN    DD DSN=BISG.CARDLIB(CAT87ORD),DISP=SHR                       00097400
//SORTLIST DD SYSOUT=&OUT                                               00097500
//SORTMSG  DD SYSOUT=&OUT                                               00097600
//SYSOUT   DD SYSOUT=&OUT                                               00097700
//SYSUDUMP DD SYSOUT=&DUMP                                              00097800
//*-------------------------------------------------------------------  00004000
//* THIS STEP FLAGS ACTIVE TRANSFERS WITH OPEN ORDERS                   00005000
//*-------------------------------------------------------------------  00006000
//CAT870  EXEC PGM=CAT870&CAT870,                                               
//             PARM='ROLBACK=&PARM870',                                         
//             REGION=&REG                                                      
//*                                                                             
//SYSOUT   DD  SYSOUT=*                                                         
//*                                                                             
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                I/P             
//         DD  DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//ORDERI   DD  DSN=&HNB..CAT870.ORDER.TMP&GENP1,DISP=(OLD,DELETE,KEEP)  00096000
//*                                                                             
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
//****** END OF PROCEDURE                                                       
