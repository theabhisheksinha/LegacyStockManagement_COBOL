//CAT715  PROC HNB='BZZZ',                *O/P=.CAT715.CAGETG     GDG *         
//             HNO=SZ,                    *O/P VSAM .CAT715.ACATCG    *         
//             STREAM=ZZZ,                *O/P VSAM .CAT715.ACATCG    *         
//             GDG='GDG,',                *O/P .CAT715.CAGETG         *         
//             GENP='(+1)',               *O/P .CAT715.CAGETG         *         
//             UNIT='BATCH',                                                    
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 DB2PROD/DB2TEST        *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             TMP='.TMP',                                                      
//             REGSIZE=8M,                                                      
//             SPACE1='(CYL,(30,30),RLSE)', *O/P .CAT715.CAGETG       *         
//             SPACE2='(CYL,(50,50),RLSE)', *O/P SORT10 SORTWORK      *         
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* CREATE AN INDEX FILE OF ASSET HISTORY ROWS CONTAINING A CAGE TAG  *         
//* NUMBERS FOR ONLINE REFERENCE/EFFIECIENCY.                         *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT715  EXEC PGM=CAT715,                                                      
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
//CAGETAG  DD  DSN=&HNB..CAT715.CAGETG&TMP&GENP,                  O/P           
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=50,RECFM=FB)                            
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SPIESNAP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
//*                                                                             
//SORT10  EXEC PGM=SORT,                                                        
//             REGION=6M,                                                       
//             PARM='SIZE=6M,MSG=AP'                                            
//SORTIN   DD DSN=&HNB..CAT715.CAGETG&TMP&GENP,                                 
//             DISP=SHR                                                         
//SORTOUT  DD DSN=&HNB..CAT715.CAGETG&GENP,                                     
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE1,                                                   
//             DCB=(&GDG.BUFNO=5,LRECL=50,RECFM=FB)                             
//SORTWK01 DD UNIT=SYSDA,SPACE=&SPACE2                                          
//SORTWK02 DD UNIT=SYSDA,SPACE=&SPACE2                                          
//SORTWK03 DD UNIT=SYSDA,SPACE=&SPACE2                                          
//SORTWK04 DD UNIT=SYSDA,SPACE=&SPACE2                                          
//SORTWK05 DD UNIT=SYSDA,SPACE=&SPACE2                                          
//SORTWK06 DD UNIT=SYSDA,SPACE=&SPACE2                                          
//SORTLIST DD SYSOUT=&PRTCL1                                                    
//SYSIN    DD DSN=&CARDLIB(CAT715S1),                                           
//             DISP=SHR                                                         
//SYSOUT   DD SYSOUT=&PRTCL1                                                    
//SYSUDUMP DD SYSOUT=&PRTCL2                                                    
//*                                                                             
//IDCAM20 EXEC PGM=IDCAMS                                                       
//SYSPRINT DD SYSOUT=&PRTCL1                                                    
//DD1      DD  DSN=&HNB..CAT715.CAGETG&GENP,                                    
//             DISP=SHR                                                         
//DD2      DD DSN=&HNO..&STREAM..CAT715.ACATCG,                                 
//             DISP=OLD                                                         
//SYSIN    DD DSN=BISG.CARDLIB(REPRO),                                          
//             DISP=SHR                                                         
