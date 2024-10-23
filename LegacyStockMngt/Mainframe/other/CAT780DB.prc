//CAT780DB PROC CARDLIB='BISG.CARDLIB',     *DB2 PLAN CARDLIB         *         
//             BYP1=0,                    * 1=BYPASS DATE CHECK 1666  *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GEN='(0)',                 *I/P .CATPPL.BROKER         *         
//             GDG='GDG,',                *O/P .CAT780DB.TAXLOT       *         
//             GENP1='(+1)',              *O/P .CAT780DB.TAXLOT.TMP   *         
//             HNB='BZZZ',                *O/P .CAT780DB.TAXLOT   GDG *         
//             STREAM=Z,                  *1 BYTE BATCH STREAM        *         
//             UNIT='BATCH',                                                    
//             B1FIL='BZZZ.B1FL',                                               
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             SPACE1='(CYL,(5,10),RLSE)', *O/P .CAT780DB.TAXLOTA GDG *         
//             TMP=TMP,                                                         
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* EXTRACT ACAT DELIVERY DETAILS TO PASS TO TAX LOT SYSTEM           *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT780DB  EXEC PGM=CAT780DB,PARM='&STREAM&BYP1',                              
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
//CBRSBRKR  DD DSN=&HNB..SIAC1666.NDMS&GEN,                     I/P             
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//ACATTAXA  DD DSN=&HNB..CAT780DB.TAXLOT.&TMP&GENP1,            O/P             
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=1000,RECFM=FB)                          
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
//*-------------------------------------------------------------------*         
//* SORT ACATTAXA INTO REC TYPE/CLIENT/TIF/ASSET SEQ NBR/ SEQUENCE    *         
//*-------------------------------------------------------------------*         
//SORT10  EXEC PGM=SORT,                                                00522000
//             REGION=4M,                                               00523000
//             PARM='SIZE=4M,MSG=AP'                                    00524000
//SORTIN    DD DSN=&HNB..CAT780DB.TAXLOT.&TMP&GENP1,                    00524100
//             DISP=OLD,DCB=BUFNO=5                                     00526000
//SORTOUT   DD DSN=&HNB..CAT780DB.TAXLOT.MASTER&GENP1,                  00527100
//             DISP=(NEW,CATLG,DELETE),                                 00528000
//             UNIT=&UNIT,                                              00529000
//             SPACE=&SPACE1,                                           00529100
//             DCB=(&GDG.BUFNO=5)                                       00529200
//SORTLIST  DD SYSOUT=&PRTCL1                                           00529300
//*                                                                             
//* RECORD TYPE=F                                                       00010000
//* SORT FIELDS=(1000,1,A,900,3,A,180,20,A,10,30,A,915,6,A),FORMAT=CH   00020001
//* SORT FIELDS=(REC TYPE, CLIENT, DLVR ACCT, CONTROL NBR, ASSET SEQ#)  00020001
//SYSIN     DD DSN=BISG.CARDLIB(CAT780S1),                              00529400
//             DISP=SHR                                                 00529500
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
//*******DELETE TEMP DATASETS*******                                            
//BR140101 EXEC PGM=IEFBR14                                                     
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSUT001  DD DSN=&HNB..CAT780DB.TAXLOT.&TMP&GENP1,                            
//             DISP=(MOD,DELETE)                                                
