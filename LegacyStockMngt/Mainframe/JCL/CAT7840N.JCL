//CAT7840N JOB (BN1P,DY00),'ACAT TLE EDIT',CLASS=1,MSGCLASS=W,                  
//         SCHENV=STREAMN,                                                      
//        USER=BN1P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//SORT05  EXEC SORT                                                     00017   
//SORTLIB  DD  DSN=SYS1.SORTLIB,DISP=SHR                                00019   
//SORTIN   DD  DSN=BNNN.BTL605.ACAT(0),DISP=SHR                                 
//OUT018   DD  DSN=BNNN.CAT784DB.CL018(+1),DISP=(NEW,CATLG),                    
//  SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,DCB=(LRECL=1000,RECFM=FB)                 
//OUT000   DD  DSN=BNNN.CAT784DB.CL000(+1),DISP=(NEW,CATLG),                    
//  SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,DCB=(LRECL=1000,RECFM=FB)                 
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(5,10),RLSE)                       00024   
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(5,10),RLSE)                       00024   
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(5,10),RLSE)                       00024   
//SORTLIST DD  SYSOUT=*                                                 00029   
//SYSOUT   DD  SYSOUT=*                                                 00030   
//SYSUDUMP DD  SYSOUT=Y                                                 00033   
//SYSIN    DD  *                                                        00034   
   SORT FIELDS=COPY                                                             
**** THIS IS TO EXTRACT CLIENT 018                                              
   OUTFIL FNAMES=OUT018,INCLUDE=(1,3,CH,EQ,C'HDR',OR,                           
   120,4,CH,EQ,C'0311',OR,1,3,CH,EQ,C'END'),REMOVECC                            
**** THIS IS TO EXTRACT OTHER CLIENTS                                           
   OUTFIL FNAMES=OUT000,INCLUDE=(1,3,CH,EQ,C'HDR',OR,                           
   120,4,CH,NE,C'0311',OR,1,3,CH,EQ,C'END'),REMOVECC                            
//*                                                                             
//*-------------------------------------------------------------------*         
//* VERIFY TLE DETAILS.  PROCUCE NSSC FEED AND ERROR REPORT.          *         
//* CAT784DB IS A UPDATE DB2 PROGRAM AND MAY BE RESTARTED/RERAN.      *         
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT784DB,                                                        
//             HNB='BNNN',                *O/P .CAT784DB.NSCCFL   GDG *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             STREAM=N,                  * 1 BYTE BATCH STREAM       *         
//             BYPFL=0,                   * BYPASS EMPTY FILE = 1     *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT784DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT784DB.INFILE    DD DSN=BNNN.CAT784DB.CL000(+1),DISP=SHR                    
//*                                                                             
//*-------------------------------------------------------------------*         
//* 2ND RUN WITH CLIENT 18 RECORDS TO OUTPUT TO SEPERATE FILES.       *         
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT784DB,                                                        
//             HNB='BNNN',                *O/P .CAT784DB.NSCCFL   GDG *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             STREAM=N,                  * 1 BYTE BATCH STREAM       *         
//             BYPFL=0,                   * BYPASS EMPTY FILE = 1     *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT784DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT784DB.INFILE    DD DSN=BNNN.CAT784DB.CL018(+1),DISP=SHR                    
//CAT784DB.NSCCFL    DD DSN=&HNB..CAT784DB.&SPLITCL.NSCCFL.CL018&GENP1          
//CAT784DB.TLERROR  DD DUMMY                                                    
//CAT784R.INFILE  DD DUMMY                                                      
//CAT784R.REPORT  DD DUMMY                                                      
