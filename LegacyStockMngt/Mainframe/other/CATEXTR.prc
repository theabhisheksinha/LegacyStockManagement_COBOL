//CATEXTR  PROC CARDLIB='BISG.CARDLIB',   *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDG='GDG,',                *O/P .CATEXTR.EXTRACT       *         
//             VRSN=,                     *O/P                                  
//             GENP1='(+1)',              *O/P .CATEXTR.EXTRACT       *         
//             HNB='BZZZ',                *O/P .CATEXTR.EXTRACT   GDG *         
//             UNIT='BATCH',                                                    
//             PARMCL='ALL ',             *WS-CLIENT SPACES=ALL                 
//             VINITRNF='A',              *VINITRNF A=ALL, S=SPECIFIED          
//             IFRRCV='    ',             *VINITRNF FROM RCV-NBR                
//             IFRRAC='                    ',        FROM ACCT-RCV              
//             ITORCV='    ',             *VINITRNF TO   RCV-NBR                
//             ITORAC='                    ',        TO   ACCT-RCV              
//             VTRNFR='A',                *VTRNFR   A=ALL, S=SPECIFIED          
//             FRCNTL='              ',   *VTRNFR  FROM CONTROL NBR             
//             TOCNTL='              ',   *VTRNFR  TO   CONTROL NBR             
//             VTRNHSTY='A',              *VTRNHSTY A=ALL                       
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             SPACE1='(CYL,(300,100),RLSE)' *O/P .CATEXTR.FILE GDG *           
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* EXTRACT ACATS DB2 RECORDS SPECIFIED VIA PARM.                     *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CATEXTR   EXEC PGM=CATEXTR,                                                   
//             REGION=&REGSIZE,                                                 
//             PARM='&PARMCL,&VINITRNF,&IFRRCV,&IFRRAC,&ITORCV,&ITORAC,         
//             &VTRNFR,&FRCNTL,&TOCNTL,&VTRNHSTY'                               
//STEPLIB   DD DSN=ADP.DATELIB,                                                 
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
//EXTR      DD DSN=&HNB..CATEXTR.&VRSN.DB2FLAT&GENP1,          O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.BUFNO=30,LRECL=754,RECFM=VB,BLKSIZE=27998)             
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
