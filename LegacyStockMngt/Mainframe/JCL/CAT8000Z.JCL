//CAT8000Z JOB (BP00,DY00),'ACATS DB2 BACKUP    ',CLASS=9,MSGCLASS=W,           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE9                                                              
//*JOBAFF BALANCE9                                                              
//********PRTY=13                                                               
//CA11    EXEC CA11                                                             
//STEP05  EXEC CATEXTR,                                                         
//             HNB=BZZZ,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             PARMCL='ALL ',             *CLIENT '0096','ALL '                 
//             VINITRNF='A',              *VINITRNF A=ALL, S=SPECIFIED          
//             IFRRCV='0000',             *VINITRNF FROM RCV-NBR                
//             IFRRAC='00000000000000000000',        FROM ACCT-RCV              
//             ITORCV='9999',             *VINITRNF TO   RCV-NBR                
//             ITORAC='99999999999999999999',        TO   ACCT-RCV              
//             VTRNFR='A',                *VTRNFR   A=ALL, S=SPECIFIED          
//             FRCNTL='19980000000000',   *VTRNFR  FROM CONTROL NBR             
//             TOCNTL='19989999999999',   *VTRNFR  TO   CONTROL NBR             
//             VTRNHSTY='A',              *VTRNHSTY A=ALL                       
//             VRSN='CAT800.',            *DSN NODE FOR EXTRACT                 
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M                                                       
//CATEXTR.STEPLIB   DD                                                          
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CATEXTR.EXTR DD SPACE=(CYL,(3000,40),RLSE)                                    
