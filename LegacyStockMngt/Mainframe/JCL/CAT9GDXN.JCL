//CAT9GDXN JOB (BN1P,0000),'ASCENDIS FTP',CLASS=I,MSGCLASS=W,                   
//         USER=BN1P,SECLABEL=BISG                                              
//**NON-CA11-JOB                                                                
//*  ASCENDIS SUPPORT                                                           
//ACATPRD EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP3DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPI3)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT9GDXN)                                  
