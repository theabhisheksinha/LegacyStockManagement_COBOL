//CAT5ECXN JOB (BN1P,DY00),'ASCENDIS FTP',CLASS=I,MSGCLASS=W,                   
//         SECLABEL=BISG,                                                       
//             USER=BN1P                                                        
//*  ASCENDIS FTP                                                               
//CA11STEP EXEC CA11                                                            
//IEFBR141 EXEC IEFBR14                                                         
//DD01 DD DISP=SHR,DSN=BNNN.CAT525.EXCP.C080.ASCENDIS(0)                        
//ACATPRD EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP3DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPI3)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT5ECXN)                                  
//IEFBR142 EXEC IEFBR14                                                         
//DD01 DD DISP=SHR,DSN=BNNN.CAT525.EXCP.C080.ASCENDIS(0)                        
