//CAT8900H JOB (BH0P,DY00),'ACAT NSCC EXTRACT',                                 
//         SCHENV=STREAMH,                                                      
//             CLASS=1,MSGCLASS=W,USER=BH0P,                                    
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
//             HNB=BHHH,                                                        
//             REG=2M,                                                          
//             RUNDATE=RERUN.EARLY.,                                            
//             STRM1=H,                                                         
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
//             CL=H,                                                            
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DISP='(NEW,CATLG,DELETE)',                                       
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GEN='(+1)',                                                      
//             GENP='(+1)',                                                     
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BHHH,                                                        
//             HNO=SH,                                                          
//             HNO2=SH,                                                         
//             MSDFIL='BB.ZZZ.BMS90.MSDFILE.DUPE',                              
//             MSDXRF='BB.ZZZ.BMS90.MSDXRF.DUPE',                               
//             NAV=BNAHHH,                                                      
//             PARM05='DATE-CHK=N',                                             
//             PRNGFL='M13C.ZZZ.PRNG.PRNGFL',                                   
//             REG05=4M,                                                        
//             REG31=6M,                                                        
//             RUNDATE=RERUN.EARLY.,                                            
//             SPACE='(CYL,(15,5),RLSE)',                                       
//             SPADFL='SH.HHH.CMT01.SPADFL',                                    
//             SRTS=10,                                                         
//             STRM=HHH,                                                        
//             STRM2=HHH,                                                       
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
