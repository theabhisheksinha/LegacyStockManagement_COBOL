//CAT8401Z JOB (BP00,DY00),'ACAT REV FUND RPT',CLASS=1,MSGCLASS=W,              
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*-------------------------------------------------------------------*         
//* READ SIAC1076 ACAT MUTUAL FUND REVERSAL FILE AND CREATE REPORT.             
//* NON UPDATE JOB - MAY BE RESTARTED.                                *         
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT840,                                                          
//        RUNTYPE=MFUND,                                                        
//        RVSE=RVSEFUND                                                         
//CAT840A.INFILE  DD  DSN=&HNB1..SIAC1076.NDMS&GEN,DISP=SHR                     
//CAT840.RVSPI  DD DSN=&HNB2..CAT840.RVFPI&GENP1                                
