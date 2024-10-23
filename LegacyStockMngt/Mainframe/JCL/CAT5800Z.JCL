//CAT5800Z JOB (BP00,DY00),'ACATS VFNDSRVS UPDT',CLASS=1,MSGCLASS=W,            
//        PRTY=15,                                                              
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//CAT580  EXEC CAT580,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             BYP3=0                     * 1=BYPASS RECORD COUNT <100*         
//CAT580.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//*                                                                             
//*-------------------------------------------------------------------*         
//* EXTRACT POST SETTLEMENT DETAILS FROM SIAC0720 FILE                *         
//*-------------------------------------------------------------------*         
//CAT580PS EXEC CAT580PS,                                                       
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             STREAM=Z,                  *1 BYTE BATCH STREAM ID     *         
//             HNB=BZZZ,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             RUNDATE=                                                         
//CAT580PS.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                               
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//*********************************************************************         
//* SPLIT THE POST SETTLE FILE BY STREAM                              *         
//*********************************************************************         
//*                                                                             
//STEP80A EXEC CAT580SP,                                                        
//             STREAM=A,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BAAA',                *O/P .CAT580DB.POST.STTL GDG*         
//             HNB1='BZZZ'                *I/P .CAT580SP.POST.STTL GDG*         
//*                                                                             
//STEP80B EXEC CAT580SP,                                                        
//             STREAM=B,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BBBB',                *O/P .CAT580DB.POST.STTL GDG*         
//             HNB1='BZZZ'                *I/P .CAT580SP.POST.STTL GDG*         
//*                                                                             
//STEP80F EXEC CAT580SP,                                                        
//             STREAM=F,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BFFF',                *O/P .CAT580DB.POST.STTL GDG*         
//             HNB1='BZZZ'                *I/P .CAT580SP.POST.STTL GDG*         
//*                                                                             
//STEP80H EXEC CAT580SP,                                                        
//             STREAM=H,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BHHH',                *O/P .CAT580DB.POST.STTL GDG*         
//             HNB1='BZZZ'                *I/P .CAT580SP.POST.STTL GDG*         
//*                                                                             
//STEP80I EXEC CAT580SP,                                                        
//             STREAM=I,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BIII',                *O/P .CAT580DB.POST.STTL GDG*         
//             HNB1='BZZZ'                *I/P .CAT580SP.POST.STTL GDG*         
//*                                                                             
//STEP80J EXEC CAT580SP,                                                        
//             STREAM=J,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BJJJ',                *O/P .CAT580DB.POST.STTL GDG*         
//             HNB1='BZZZ'                *I/P .CAT580SP.POST.STTL GDG*         
//*                                                                             
//STEP80L EXEC CAT580SP,                                                        
//             STREAM=L,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BLLL',                *O/P .CAT580DB.POST.STTL GDG*         
//             HNB1='BZZZ'                *I/P .CAT580SP.POST.STTL GDG*         
//*                                                                             
//STEP80N EXEC CAT580SP,                                                        
//             STREAM=N,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BNNN',                *O/P .CAT580DB.POST.STTL GDG*         
//             HNB1='BZZZ'                *I/P .CAT580SP.POST.STTL GDG*         
//*                                                                             
//STEP80P EXEC CAT580SP,                                                        
//             STREAM=P,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BPPP',                *O/P .CAT580DB.POST.STTL GDG*         
//             HNB1='BZZZ'                *I/P .CAT580SP.POST.STTL GDG*         
//*                                                                             
//STEP80U EXEC CAT580SP,                                                        
//             STREAM=U,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BUUU',                *O/P .CAT580DB.POST.STTL GDG*         
//             HNB1='BZZZ'                *I/P .CAT580SP.POST.STTL GDG*         
//*                                                                             
//STEP80X EXEC CAT580SP,                                                        
//             STREAM=X,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BXXX',                *O/P .CAT580DB.POST.STTL GDG*         
//             HNB1='BZZZ'                *I/P .CAT580SP.POST.STTL GDG*         
//*                                                                             
//STEP80Y EXEC CAT580SP,                                                        
//             STREAM=Y,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BYYY',                *O/P .CAT580DB.POST.STTL GDG*         
//             HNB1='BZZZ'                *I/P .CAT580SP.POST.STTL GDG*         
