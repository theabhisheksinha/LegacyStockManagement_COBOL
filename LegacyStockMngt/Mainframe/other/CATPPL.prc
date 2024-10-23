//CATPPL   PROC CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *        
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',       *DB2 SYSTEM DB2PROD/DB2TEST *           
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB=,                      *O/P .CATPPL SORT       GDG *         
//             HNB1=BZZZ,                 *I/P .SIAC0068 FILE     GDG *         
//             GDG='GDG,',                                            *         
//             GEN='(0)',                 *O/P                        *         
//             GENP1='(+1)',              *O/P                        *         
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             SPACE1='(CYL,(1,2),RLSE)', *O/P .CATPPL.BROKER   GDG *           
//             TMP=TMP,                                                         
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//* SORT SIAC 0068 FILE INTO BROKER NUMBER SEQUENCE                   *         
//*********************************************************************         
//SORT10  EXEC PGM=SORT,                                                00522000
//             REGION=4M,                                               00523000
//             PARM='SIZE=4M,MSG=AP'                                    00524000
//SORTIN    DD DSN=&HNB1..SIAC0068.NDMS&GEN,                                    
//             DISP=SHR                                                 00526000
//SORTOUT   DD DSN=&HNB..CATPPL.BROKER.&TMP&GENP1,                      00527100
//             DISP=(NEW,CATLG,DELETE),                                 00528000
//             UNIT=&UNIT,                                              00529000
//             SPACE=&SPACE1,                                           00529100
//             DCB=(&GDG.BUFNO=5,LRECL=80,RECFM=FB)                     00529200
//SORTLIST  DD SYSOUT=&PRTCL1                                           00529300
//*                                                                             
//* SORT FIELDS=(11,4,CH,A)                                                     
//SYSIN     DD DSN=BISG.CARDLIB(CATPPLS1),                              00529400
//             DISP=SHR                                                 00529500
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00529800
//*********************************************************************         
//*    APPLY PARTICIPATING BROKERS TO DATABASE.                                 
//*********************************************************************         
//*                                                                     00002   
//CATPPL EXEC PGM=CATPPL,PARM=&BYP1,                                    00051002
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//SIAC068   DD DSN=&HNB..CATPPL.BROKER.&TMP&GENP1,                      00527100
//             DISP=(OLD,DELETE,KEEP)                                           
//PRTFLE    DD DSN=&HNB..CATPPL.BROKER&GENP1,                                   
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=150,RECFM=FB)                           
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
