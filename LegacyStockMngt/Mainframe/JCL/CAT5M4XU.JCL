//CAT5M4XU JOB (BU1P,DY00),'WORKFLOW FTP',CLASS=I,MSGCLASS=W,                   
//         SECLABEL=BISG,                                                       
//             USER=BU1P                                                        
//*  ASCENDIS FTP                                                               
//CA11STEP EXEC CA11                                                            
//IEFBR141 EXEC IEFBR14                                                         
//DD01 DD DISP=SHR,DSN=BUUU.CAT525.MATH.C010.ASCENDIS(0)                        
//ACATPRD EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP2DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPID)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT5M4XU)                                  
//ACATCL3 EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP3DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPI3)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT5M4XU)                                  
//IEFBR142 EXEC IEFBR14                                                         
//DD01 DD DISP=SHR,DSN=BUUU.CAT525.MATH.C010.ASCENDIS(0)                        
