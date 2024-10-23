//CAT9GFXT JOB (BT0P,0000),'ASCENDIS FTP',CLASS=O,MSGCLASS=W,                   
//         SCHENV=STREAMT,USER=BT0P,SECLABEL=BISG,PRTY=9                        
//*  ASCENDIS SUPPORT                                                           
//*NODAFF SYSTEMC                                                               
//*JOBAFF SYSTEMC                                                               
//**NON-CA11-JOB                                                                
//*  ASCENDIS SUPPORT                                                           
//ACATSTG EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIPSTG4)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACA4ID)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT9GFXT)                                  
