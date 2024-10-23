//CAT650DB PROC CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *        
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDG='GDG,',                *O/P .CAT650.ACATPEND       *         
//             GENP1='(+1)',             *O/P .CAT650.ACATPEND       *          
//             HNB='BZZZ',                *O/P .CAT650.ACATPEND   GDG *         
//             B1FIL='BZZZ.B1FL',                                               
//             UNIT='BATCH',                                                    
//             EXTR=ACATPEND,             *ACATPEND OR ACATCAGE FILE            
//             STREAM='Z',                *STREAM ID                            
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             SPACE1='(CYL,(5,10),RLSE)', *O/P .CAT650.ACATPEND GDG *          
//             TMP=TMP,                                                         
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* EXTRACT PENDING BOOKING RECORDS FROM DATABASE.                    *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT650DB  EXEC PGM=CAT650DB,                                                  
//             PARM='&EXTR&STREAM',                                             
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
//B1FIL    DD  DSN=&B1FIL,                                    I/P               
//             DISP=SHR                                                         
//ACATPEND DD  DSN=&HNB..CAT650DB.&EXTR..&TMP&GENP1,           O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=1004,RECFM=VB,BLKSIZE=27998)            
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
//*********************************************************************         
//*                                                                   *         
//* SORT ACATPEND INTO CLIENT/BRANCH ACCT/ACAT SEQUENCE.              *         
//*                                                                   *         
//*********************************************************************         
//SORT10  EXEC PGM=SORT,                                                00522000
//             REGION=4M,                                               00523000
//             PARM='SIZE=4M,MSG=AP'                                    00524000
//SORTIN    DD DSN=&HNB..CAT650DB.&EXTR..&TMP&GENP1,                    00524100
//             DISP=OLD,DCB=BUFNO=5                                     00526000
//SORTOUT   DD DSN=&HNB..CAT650DB.&EXTR&GENP1,                          00527100
//             DISP=(NEW,CATLG,DELETE),                                 00528000
//             UNIT=&UNIT,                                              00529000
//             SPACE=&SPACE1,                                           00529100
//             DCB=(&GDG.BUFNO=5)                                       00529200
//SORTLIST  DD SYSOUT=&PRTCL1                                           00529300
//*                                                                             
//* RECORD TYPE=V                                                       00010000
//* SORT FIELDS=(5,38,CH,A)                                             00020001
//SYSIN     DD DSN=BISG.CARDLIB(CAT650S1),                              00529400
//             DISP=SHR                                                 00529500
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
//*******DELETE TEMP DATASETS*******                                            
//BR140101 EXEC PGM=IEFBR14                                                     
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSUT001 DD DSN=&HNB..CAT650DB.&EXTR..&TMP&GENP1,                             
//             DISP=(MOD,DELETE)                                                
