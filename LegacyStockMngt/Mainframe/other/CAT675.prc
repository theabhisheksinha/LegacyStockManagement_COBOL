//CAT675  PROC ABND='N',                  USE 'N' TO BYPASS USER ABEND          
//             B1FIL='BZZZ.B1FL',         *B1 VSAM FILE               *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             CL='T',                    * CLIENT STREAM             *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='SYS1',            *DB2 SYSTEM DB2PROD/DB2TEST *         
//             GDG='GDG,',                *O/P .CAT675.AIPP2       GDG*         
//             GEN='(0)',                 *I/P .CAT610.ACCTDEL     GDG*         
//             GENP='(+1)',               *O/P .CAT675.AIPP2       GDG*         
//             HNB='BTTT',                *O/P .CAT675.AIPP2       GDG*         
//             HNB1='BB.TTT',             *I/P .BSU40.SRMAS       VSAM*         
//             HNB2='BTTT',               *I/P .CAT610.ACCTDEL     GDG*         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             PRTCL1=*,                  *SYSOUT                     *         
//             PRTCL2=Y,                  *SYSUDUMP                   *         
//             REG=8M,                    *REGION SIZE                *         
//             RUNDATE=,                  *JOB CAN RUN BEFORE DATE CHG*         
//             SPACE='(CYL,(15,5),RLSE)', *O/P .CAT675.AIPP2       GDG*         
//             SPACE2='(CYL,(15,5),RLSE)', *O/P .CAT814.TACTL      GDG*         
//             UNIT=BATCH                 *O/P .CAT675.AIPP2       GDG*         
//**                                                                            
//******************************************************************            
//**CAT675 REPLACES CAT10B                                                      
//**READS DB2 TRANSFER(ACTIVE) TABLE RATHER THAN PENDING FILE                   
//**READS CURRENT ACAT B1 FILE                                                  
//**CREATE P2 RECORD WITH B1 = 434518 USING A000928                             
//**********************************************************                    
//**CAT675 IS DRIVEN BY CL= EXEC PARM VALUE                                     
//**********************************************************                    
//**                                                                            
//CAT675  EXEC PGM=CAT675,                                                      
//             PARM='&CL&ABND',                                                 
//             REGION=&REG                                                      
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..DSNEXIT,                                            
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//FIDSRREF DD  DSN=BB.ZZZ.BSU10A.SRXREF,                        I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDVMSR  DD  DSN=&HNB1..BSU40.SRMAS,                          I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//ACCTDEL  DD  DSN=&HNB2..CAT610.ACCTDEL&GEN,                   I/P             
//             DISP=SHR                                                         
//P2FILE   DD  DSN=&HNB..CAT675.AIPP2&GENP,                     O/P             
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.BUFNO=5)                                               
//TACT     DD  DSN=&HNB..CAT675.TACTL&GENP,                     O/P             
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE2,                                                   
//             DCB=(&GDG.RECFM=VB,LRECL=8004)                                   
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
