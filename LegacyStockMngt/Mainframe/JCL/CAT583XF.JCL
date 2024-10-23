//CAT583XF JOB (BF0P,0000),'BCN FTP',CLASS=H,MSGCLASS=W,                        
//         SCHENV=STREAMF,USER=BF0P,SECLABEL=BISG                               
//*NODAFF SYSTEMB                                                               
//*JOBAFF SYSTEMB                                                               
//**NON-CA11-JOB                                                                
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BIOS.C425.OUTPN720.C006(0)                               
//FTPPR2 EXEC BPFTP2                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(BCNPRIP3)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(BCNPRPW1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT583XF)                                  
