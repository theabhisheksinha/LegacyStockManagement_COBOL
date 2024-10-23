//CAT8900N JOB (BN1P,DAC0),'ACAT NSCC EXTRACT',                                 
//         SCHENV=STREAMN,                                                      
//             CLASS=1,MSGCLASS=W,USER=BN1P,                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//**********************************************************************        
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//**********************************************************************        
//STEP1   EXEC CAT890,                                                          
//             BRKRFL='SZ.ZZZ.CMT07.BROKER',                                    
//             B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DISP1='(,CATLG,DELETE)',                                         
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GENP='(+1)',                                                     
//             HNB=BNNN,                                                        
//             PLAN='ACTBTCH',                                                  
//             REG=2M,                                                          
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM1=N,                                                         
//             UNIT=BATCH                                                       
//CAT890.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//**********************************************************************        
//STEP01  EXEC CAT31,                                                           
//             ABND='N',                                                        
//             ANNUFL=NULLFILE,                                                 
//             B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             CL=N,                                                            
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DISP='(NEW,CATLG,DELETE)',                                       
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GEN='(+1)',                                                      
//             GENP='(+1)',                                                     
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BNNN,                                                        
//             HNO=SN,                                                          
//             HNO2=SN,                                                         
//             MSDFIL='BB.ZZZ.BMS90.MSDFILE.DUPE',                              
//             MSDXRF='BB.ZZZ.BMS90.MSDXRF.DUPE',                               
//             NAV=BNANNN,                                                      
//             PARM05='DATE-CHK=N',                                             
//             PLAN='ACTBTCH',                                                  
//             PRNGFL='M13C.ZZZ.PRNG.PRNGFL',                                   
//             REG05=4M,                                                        
//             REG31=6M,                                                        
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE='(CYL,(15,5),RLSE)',                                       
//             SPADFL='SN.NNN.CMT01.SPADFL',                                    
//             SRTS=10,                                                         
//             STRM=NNN,                                                        
//             STRM2=NNN,                                                       
//             UNIT=BATCH                                                       
//CAT892.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//CAT31.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                  
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
