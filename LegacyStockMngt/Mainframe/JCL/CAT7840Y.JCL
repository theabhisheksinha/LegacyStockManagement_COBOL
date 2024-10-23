//CAT7840Y JOB (BY0P,DY00),'ACAT TLE EDIT',CLASS=1,MSGCLASS=W,                  
//         SCHENV=STREAMY,                                                      
//        USER=BY0P,SECLABEL=BISG                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//SORT05  EXEC SORT                                                     00017   
//SORTLIB  DD  DSN=SYS1.SORTLIB,DISP=SHR                                00019   
//SORTIN   DD  DSN=BYYY.BTL605.ACAT(0),DISP=SHR                                 
//OUT088   DD  DSN=BYYY.CAT784DB.CL088(+1),DISP=(NEW,CATLG),                    
//  SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,DCB=(LRECL=1000,RECFM=FB)                 
//OUT000   DD  DSN=BYYY.CAT784DB.CL000(+1),DISP=(NEW,CATLG),                    
//  SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,DCB=(LRECL=1000,RECFM=FB)                 
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(5,10),RLSE)                       00024   
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(5,10),RLSE)                       00024   
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(5,10),RLSE)                       00024   
//SORTLIST DD  SYSOUT=*                                                 00029   
//SYSOUT   DD  SYSOUT=*                                                 00030   
//SYSUDUMP DD  SYSOUT=Y                                                 00033   
//SYSIN    DD  *                                                        00034   
   SORT FIELDS=COPY                                                             
**** THIS IS TO EXTRACT CLIENT 088                                              
   OUTFIL FNAMES=OUT088,INCLUDE=(1,3,CH,EQ,C'HDR',OR,                           
   120,4,CH,EQ,C'0445',OR,1,3,CH,EQ,C'END'),REMOVECC                            
**** THIS IS TO EXTRACT OTHER CLIENTS                                           
   OUTFIL FNAMES=OUT000,INCLUDE=(1,3,CH,EQ,C'HDR',OR,                           
   120,4,CH,NE,C'0445',OR,1,3,CH,EQ,C'END'),REMOVECC                            
//*                                                                             
//*-------------------------------------------------------------------*         
//* VERIFY TLE DETAILS.  PROCUCE NSSC FEED AND ERROR REPORT.          *         
//* CAT784DB IS A UPDATE DB2 PROGRAM AND MAY BE RESTARTED/RERAN.      *         
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT784DB,                                                        
//             HNB='BYYY',                *O/P .CAT784DB.NSCCFL   GDG *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             STREAM=Y,                  * 1 BYTE BATCH STREAM       *         
//             BYPFL=0,                   * BYPASS EMPTY FILE = 1     *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT784DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT784DB.INFILE    DD DSN=BYYY.CAT784DB.CL000(+1),DISP=SHR                    
//*                                                                             
//*-------------------------------------------------------------------*         
//* 2ND RUN WITH CLIENT 88 RECORDS TO OUTPUT TO SEPERATE FILES.       *         
//*-------------------------------------------------------------------*         
//STEP20  EXEC CAT784DB,                                                        
//             HNB='BYYY',                *O/P .CAT784DB.NSCCFL   GDG *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             STREAM=Y,                  * 1 BYTE BATCH STREAM       *         
//             BYPFL=0,                   * BYPASS EMPTY FILE = 1     *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT784DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT784DB.INFILE    DD DSN=BYYY.CAT784DB.CL088(+1),DISP=SHR                    
//CAT784DB.NSCCFL    DD DSN=&HNB..CAT784DB.&SPLITCL.NSCCFL.CL088&GENP1          
//CAT784DB.TLERROR  DD DUMMY                                                    
//CAT784R.INFILE  DD DUMMY                                                      
//CAT784R.REPORT  DD DUMMY                                                      
