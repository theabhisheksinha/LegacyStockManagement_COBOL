//*********************************************************************         
//*  PROC CAT816 IS USED IN JOB CAT8160-                              *         
//*********************************************************************         
//CAT816  PROC STREAM=Z,                  *JOB STREAM                 *         
//             BYP1=1,                    *'1' BYPASS DATE CHECK      *         
//             BYP2=0,                    *'1' BYPASS EMPTY FILE      *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',       *DB2 SYSTEM DB2PROD/DB2TEST *           
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDG='GDG,',                *O/P &HNB1.CAT816.WHDPI     *         
//             GENP1A='(+1)',             *O/P &HNB1.CAT816.WHDPI     *         
//             HNB1='BXXX',               *O/P &HNB1.CAT816.WHDPI  GDG*         
//             PERMUN='BATCH',            *O/P &HNB1.CAT816.WHDPI  GDG*         
//             REGSIZE=4M,                                                      
//             RUNDATE=,                                                        
//             SPACE='(CYL,(1,1),RLSE)'   *O/P &HNB1.CAT816.WHDPI  GDG*         
//*                                                                             
//*********************************************************************         
//*       CAT816 - ACATS WITHHELD ASSET        REPORT                 *         
//*********************************************************************         
//*                                                                             
//CAT816  EXEC PGM=CAT816,                                                      
//             PARM=&STREAM&BYP1&BYP2,                                          
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
//B1FIL     DD DSN=&B1HDR,                                       I/P            
//             DISP=SHR                                                         
//REPORT    DD DSN=&HNB1..CAT816.WHDPI&GENP1A,                   O/P            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE,                                                    
//             UNIT=&PERMUN,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=143)                           
//SORTLIB  DD  DSN=SYS1.SORTLIB,                                                
//             DISP=SHR                                                         
//SORTWK01 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK02 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK03 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK04 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK05 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTLIST DD  SYSOUT=*                                                         
//SYSOUT    DD SYSOUT=*                                                         
//SYSPRINT  DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=Y                                                         
//SPIESNAP  DD SYSOUT=Y                                                         
//SYSABOUT  DD SYSOUT=Y                                                         
//*                                                                             
