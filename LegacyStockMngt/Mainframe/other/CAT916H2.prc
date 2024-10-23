//CAT916H2 PROC ABND='Y',                USE 'N' TO BYPASS USER ABEND           
//             CL=' ',                                                          
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='SYS1',                                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             B1FIL='BZZZ.B1FL',                                               
//             DISP='(NEW,CATLG,DELETE)',                                       
//             HNB=,                                                            
//             NAV=,                                                            
//             GDG='GDG,',                                                      
//             GENP='(+1)',                                                     
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=,                  JOB CAN RUN BEFORE DATE CHNG          
//             SPACE='(CYL,(15,5),RLSE)',                                       
//             SRTSPACE='(CYL,(15,5),RLSE)',                                    
//             UNIT=BATCH                                                       
//CAT916H2 EXEC PGM=CAT916H2,                                                   
//             PARM='&CL&ABND',                                                 
//             REGION=&REGSIZE                                                  
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
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,                         I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=2,BUFND=12')                                         
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,                         I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=2,BUFND=12')                                         
//NAUPDTE  DD  DSN=&HNB..CAT916H2.TIF,                          O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(DSORG=PS,RECFM=FB,LRECL=255)                                
//DBSAVE   DD  DUMMY,DSN=&HNB..CAT916H2.DBSAVE&GENP,            O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=30)                            
//MGNINT   DD  DUMMY,DSN=&HNB..CAT916H2.MGNINT&GENP,            O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=30)                            
//PPMNT    DD  DUMMY,DSN=&HNB..CAT916H2.PPMNT&GENP,             O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=80)                            
//REPORT   DD  DUMMY,DSN=&HNB..CAT916H2.PNDPI&GENP,             O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FBA,LRECL=143)                          
//REPORT2  DD  DUMMY,DSN=&HNB..CAT916H2.NAUPI&GENP,             O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FBA,LRECL=143)                          
//TEMP     DD  UNIT=SYSDA,                                                      
//             SPACE=&SRTSPACE,                                                 
//             DCB=(DSORG=PS,RECFM=FB,LRECL=80)                                 
//SORTWK01 DD  UNIT=SYSDA,                                                      
//             SPACE=&SRTSPACE                                                  
//SORTWK02 DD  UNIT=SYSDA,                                                      
//             SPACE=&SRTSPACE                                                  
//SORTWK03 DD  UNIT=SYSDA,                                                      
//             SPACE=&SRTSPACE                                                  
//SORTWK04 DD  UNIT=SYSDA,                                                      
//             SPACE=&SRTSPACE                                                  
//SYSOUT   DD SYSOUT=&PRTCL1                                                    
//SYSPRINT DD SYSOUT=&PRTCL1                                                    
//SYSUDUMP DD SYSOUT=&PRTCL2                                                    
//SPIESNAP DD SYSOUT=&PRTCL2                                                    
//SYSABOUT DD SYSOUT=&PRTCL2                                                    
//*                                                                             
