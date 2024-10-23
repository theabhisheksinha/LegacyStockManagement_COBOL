//CAT950XJ JOB (BJ0P,0000),'ACAT FTP TO EDJ+',CLASS=N,MSGCLASS=W,               
//    USER=BJ0P,                                                                
//  SECLABEL=BISG                                                               
//*NODAFF FTPJSF1                                                               
//*JOBAFF FTPJSF1                                                               
//*** FTP TO E.D. JONES ACAT CONFIRMS ***                               00002   
//CA11STEP EXEC CA11                                                            
//STEP2   EXEC FTPJSF,SYSOUT='W'                                                
//FTPJSF.SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(CAT950XJ)                           
