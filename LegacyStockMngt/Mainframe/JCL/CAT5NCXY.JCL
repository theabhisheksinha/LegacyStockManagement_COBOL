//CAT5NCXY JOB (BY0P,0000),'ASCENDIS FTP',CLASS=I,MSGCLASS=W,                   
//         SCHENV=STREAMY,USER=BY0P,SECLABEL=BISG                               
//*  ASCENDIS SUPPORT                                                           
//CA11STEP EXEC CA11                                                            
//IEFBR141 EXEC IEFBR14                                                         
//DD01 DD DISP=SHR,DSN=BYYY.CAT525.NSCC.C313.ASCENDIS(0)                        
//ACATPRD EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP6DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPI6)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT5NCXY)                                  
//IEFBR142 EXEC IEFBR14                                                         
//DD01 DD DISP=SHR,DSN=BYYY.CAT525.NSCC.C313.ASCENDIS(0)                        
