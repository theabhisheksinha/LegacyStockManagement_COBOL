//*********************************************************************         
//*  PROC CAT731 IS USED IN JOB CAT7310-                              *         
//*********************************************************************         
//CAT731  PROC STREAM=Z,                  *JOB STREAM                 *         
//             BYP1=1,                    *'1' BYPASS DATE CHECK      *         
//             BYP2=0,                    *'1' BYPASS EMPTY FILE      *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDG='GDG,',                *O/P &HNB.CAT731R.RPI       *         
//             GEN='(0)',                 *I/P &HNB.CAT731.LOGFL      *         
//             GENP='(+1)',               *O/P &HNB.CAT731.LOGFL      *         
//             HNB='BZZZ',                *O/P &HNB.CAT731R.RBPI   GDG*         
//             UNIT='BATCH',              *O/P &HNB.CAT731R.RBPI   GDG*         
//             REGSIZE=4M,                                                      
//             RUNDATE=,                                                        
//             SPACE='(CYL,(1,1),RLSE)',  *O/P &HNB.CAT731.LOGFL   GDG*         
//             SPACE2='(CYL,(2,5),RLSE)'  *O/P &HNB.CAT731R.RBPI   GDG*         
//*                                                                             
//*********************************************************************         
//*       CAT731 - RESCIND BLOCK AGING                                *         
//*********************************************************************         
//*                                                                             
//CAT731  EXEC PGM=CAT731,                                                      
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
//LOGIN     DD DSN=&HNB..CAT731.LOGFL&GEN,                       I/P            
//             DISP=SHR                                                         
//LOGOUT    DD DSN=&HNB..CAT731.LOGFL&GENP,                      O/P            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE,                                                    
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=80)                            
//SYSOUT    DD SYSOUT=*                                                         
//SYSPRINT  DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=Y                                                         
//SPIESNAP  DD SYSOUT=Y                                                         
//SYSABOUT  DD SYSOUT=Y                                                         
//*                                                                             
//*                                                                             
//*********************************************************************         
//*      CAT731R - ACATS RESCIND BLOCK         REPORT                 *         
//*********************************************************************         
//*                                                                             
//CAT731R EXEC PGM=CAT731R,                                                     
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
//B1FIL     DD DSN=&B1HDR,                                     I/P              
//             DISP=SHR                                                         
//LOGIN     DD DSN=&HNB..CAT731.LOGFL&GENP,                    I/P              
//             DISP=SHR                                                         
//REPT      DD DSN=&HNB..CAT731R.ADPI&GENP,                    O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE2,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=143)                           
//REPT2     DD DSN=&HNB..CAT731R.DLPI&GENP,                    O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE2,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=143)                           
//REPT3     DD DSN=&HNB..CAT731R.ACPI&GENP,                    O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE2,                                                   
//             UNIT=&UNIT,                                                      
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
