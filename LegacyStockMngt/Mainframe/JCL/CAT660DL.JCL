//CAT660DL JOB (BL0P,DY00),'ACATS DST EXTR',CLASS=1,MSGCLASS=W,                 
//         SCHENV=STREAML,                                                      
//        USER=BL0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP3   EXEC CAT660D,                                                         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT660D.STEPLIB   DD                                                          
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*------------------------------------------------------------------*          
//*  EXTRACT CLIENT 274 RECORDS FROM MULTI CLIENT FILE                          
//*------------------------------------------------------------------*          
//SORT70  EXEC PGM=SORT,REGION=4096K                                            
//SORTLIB  DD  DSN=SYS1.SORTLIB,DISP=SHR                                        
//SORTIN   DD  DSN=BLLL.CAT660.ACATDST(+1),DISP=SHR                             
//SORTOUT  DD  DSN=BLLL.C855.OUTMFACT.C274(+1),DISP=(NEW,CATLG),                
//  UNIT=BATCH,SPACE=(CYL,(2,5),RLSE),DCB=(LRECL=180,RECFM=FB)                  
//SORTLIST DD  SYSOUT=*                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=Y                                                         
//SYSIN    DD  DSN=BISG.CARDLIB(CAT660XL),DISP=SHR                              
