//CAT885  PROC HNB=,                                                            
//        NAV=,                                                                 
//        STRM=,                         *STREAM                      *         
//        DB2SYS='DB2PROD',              *DB2 SYSTEM DB2PROD/DB2TEST  *         
//        DB2SYS1='DB2PROD',             *DB2 SYSTEM DB2PROD/DB2TEST  *         
//        CARDLIB='BISG.CARDLIB',        *DB2 PLAN CARDLIB            *         
//        PLAN='ACTBTCH',                *DB2 PLAN CARDLIB MEMBER     *         
//        REG=4M,                        *                            *         
//        REG5B=20M,                     *                            *         
//        REG5C=20M,                     *                            *         
//        B1FIL='BZZZ.B1FL',                                                    
//        UNIT=BATCH,                                                           
//        GEN1='(+0)',                                                          
//        GENP='(+1)',                                                          
//        DUMP=Y,                                                               
//        RUNDATE=                       *JOB CAN RUN BEFORE DATE CHNG*         
//*                                                                             
//**********************************************************************        
//*                                                                             
//*     READS DB2 TRANSFER(ACTIVE) TABLE SELECT RECORDS BETWEEN ST_CD           
//*     REVIEW AND SETTLE PREP, CREATE AN EXTRACT FILE                          
//*                                                                             
//**********************************************************************        
//CAT885A EXEC PGM=CAT885A,                                                     
//             PARM='&STRM',                                                    
//             REGION=&REG                                                      
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                                                
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                                             
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,DISP=SHR                                              
//EXTRACT  DD  DSN=&HNB..CAT885A.EXTR&GENP,                                     
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=GDG                                                          
//OPTEXT   DD  DSN=&HNB..CAT885A.OPTEXT,                                        
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=GDG                                                          
//SYSOUT   DD  SYSOUT=*                                                 00030   
//SYSUDUMP DD  SYSOUT=&DUMP                                             00033   
//ABENDAID DD  SYSOUT=&DUMP                                                     
//*                                                                             
//**********************************************************************        
//*                                                                             
//*     READS EXTRACT FILE CREATED FROM CAT885A AND CREATE                      
//*     ACAT FOREIGN CURRENCY REPORT                                            
//*                                                                             
//**********************************************************************        
//CAT885B EXEC PGM=CAT885B,                                                     
//             REGION=&REG5B                                                    
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//CHOLDINQ  DD DSN=&HNB..MGR02.CUSHOL&GEN1,                                     
//             DISP=SHR                                                         
//CBALINQ   DD DSN=&HNB..MGR02.CUSBAL&GEN1,                                     
//             DISP=SHR                                                         
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,DISP=SHR,                                
//             AMP=('BUFNI=2,BUFND=12')                                         
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,DISP=SHR,                                
//             AMP=('BUFNI=2,BUFND=12')                                         
//EXTRACT  DD  DSN=&HNB..CAT885A.EXTR&GENP,DISP=SHR                             
//ACTFCRP  DD  DSN=&HNB..CAT885.RPTFC&GENP,                                     
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=GDG                                                          
//SYSOUT   DD  SYSOUT=*                                                 00030   
//SYSUDUMP DD  SYSOUT=&DUMP                                             00033   
//ABENDAID DD  SYSOUT=&DUMP                                                     
//*                                                                             
//CAT885C EXEC PGM=CAT885C,                                                     
//             REGION=&REG5C                                                    
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,DISP=SHR                                              
//CHOLDINQ  DD DSN=&HNB..MGR02.CUSHOL&GEN1,                                     
//             DISP=SHR                                                         
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,DISP=SHR,                                
//             AMP=('BUFNI=2,BUFND=12')                                         
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,DISP=SHR,                                
//             AMP=('BUFNI=2,BUFND=12')                                         
//EXTRACT  DD  DSN=&HNB..CAT885A.OPTEXT,DISP=SHR                                
//ACTFCRP  DD  DSN=&HNB..CAT885.EXOPR&GENP,                                     
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=GDG                                                          
//SYSOUT   DD  SYSOUT=*                                                 00030   
//SYSUDUMP DD  SYSOUT=&DUMP                                             00033   
//ABENDAID DD  SYSOUT=&DUMP                                                     
//*                                                                             
//*** END OF PROC ****                                                          
