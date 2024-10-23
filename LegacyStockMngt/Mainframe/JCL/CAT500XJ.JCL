//CAT500XJ JOB (BJ0P,0000),'ACAT FTP TO EDJ+',CLASS=N,MSGCLASS=W,               
//    USER=BJ0P,                                                                
//  SECLABEL=BISG                                                               
//*NODAFF FTPJSF1                                                               
//*JOBAFF FTPJSF1                                                               
//**********************************************************************        
//*** FTP E.D. JONES ACAT EXTRACT ***                                   00002   
//**********************************************************************        
//CA11STEP EXEC CA11                                                            
//**********************************************************************        
//**** STEP TO COPY PROD FILE TO BIOS DATASET...                                
//**********************************************************************        
//GENER10   EXEC IEBGENER                                                       
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUT1   DD  DSN=BJJJ.CAT502.NSCCFL(0),DISP=SHR                       00004   
//SYSUT2   DD  DSN=BIOS.C063.OUTACAT.TRAN,DISP=SHR                      00004   
//SYSIN    DD  DUMMY                                                            
//**********************************************************************        
//STEP2   EXEC FTPJSF,SYSOUT='W'                                                
//FTPJSF.SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(CAT500XJ)                           
