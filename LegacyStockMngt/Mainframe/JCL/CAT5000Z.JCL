//CAT5000Z JOB (BP00,DY00),'ACATS DB2 BACKUP',CLASS=1,MSGCLASS=W,               
//        PRTY=15,                                                              
//  SECLABEL=BISG                                                               
//*NODAFF VALANCE1                                                              
//*JOBAFF VALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* COPY ALL OR SPECIFIC CLIENTS FROM ALL OR SPECIFY ACAT DB2 TABLES. *         
//* THIS IS NOT AN UPDATE JOB AND MAY BE RESTARTED/RERAN FROM THE TOP.*         
//*********************************************************************         
//STEP10  EXEC CATEXTR,                                                         
//             HNB=BZZZ,                                                        
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
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
//             VTRNHSTY='N',              *VTRNHSTY A=ALL                       
//             VRSN='CAT500.',            *DSN NODE FOR EXTRACT                 
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M                                                       
//CATEXTR.STEPLIB  DD                                                           
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//CATEXTR.EXTR DD SPACE=(CYL,(3000,40),RLSE)                                    
