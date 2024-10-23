//CAT5MEXT JOB (BT0P,0000),'ASCENDIS FTP',CLASS=O,MSGCLASS=W,                   
//         SCHENV=STREAMT,USER=BT0P,SECLABEL=BISG,PRTY=9                        
//*  ASCENDIS SUPPORT                                                           
//*NODAFF SYSTEMC                                                               
//*JOBAFF SYSTEMC                                                               
//*  ASCENDIS FTP                                                               
//CA11STEP EXEC CA11                                                            
//IEFBR141 EXEC IEFBR14                                                         
//DD01 DD DISP=SHR,DSN=BTTT.CAT525.MATH.C313.ASCENDIS(0)                        
//*ACATPRD EXEC BPFTP                                                           
//*SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP6DC1)                                 
//*      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPI6)                                 
//*      DD DISP=SHR,DSN=BISG.CARDLIB(CAT5MEXT)                                 
//IEFBR142 EXEC IEFBR14                                                         
//DD01 DD DISP=SHR,DSN=BTTT.CAT525.MATH.C313.ASCENDIS(0)                        
