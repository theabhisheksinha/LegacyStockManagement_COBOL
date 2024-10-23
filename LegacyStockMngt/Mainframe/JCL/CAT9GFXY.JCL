//CAT9GFXY JOB (BY0P,0000),'ASCENDIS FTP',CLASS=I,MSGCLASS=W,                   
//         SCHENV=STREAMY,USER=BY0P,SECLABEL=BISG                               
//*  ASCENDIS SUPPORT                                                           
//**NON-CA11-JOB                                                                
//*  ASCENDIS SUPPORT                                                           
//ACATSTG EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP6DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPI6)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT9GFXY)                                  
