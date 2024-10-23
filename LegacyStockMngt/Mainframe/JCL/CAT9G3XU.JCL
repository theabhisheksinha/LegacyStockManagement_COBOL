//CAT9G3XU JOB (BU1P,0000),'ASCENDIS FTP',CLASS=I,MSGCLASS=W,                   
//         USER=BU1P,SECLABEL=BISG                                              
//**NON-CA11-JOB                                                                
//*  ASCENDIS SUPPORT                                                           
//ACATPRD EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP3DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPI3)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT9G3XU)                                  
