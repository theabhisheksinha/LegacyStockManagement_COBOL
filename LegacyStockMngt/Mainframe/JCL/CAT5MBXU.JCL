//CAT5MBXU JOB (BU1P,DY00),'ASCENDIS FTP',CLASS=I,MSGCLASS=W,                   
//         SECLABEL=BISG,                                                       
//             USER=BU1P                                                        
//*  ASCENDIS FTP                                                               
//CA11STEP EXEC CA11                                                            
//IEFBR141 EXEC IEFBR14                                                         
//DD01 DD DISP=SHR,DSN=BUUU.CAT525.MATH.C080.ASCENDIS(0)                        
//ACATPRD EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP3DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPI3)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT5MBXU)                                  
//IEFBR142 EXEC IEFBR14                                                         
//DD01 DD DISP=SHR,DSN=BUUU.CAT525.MATH.C080.ASCENDIS(0)                        
