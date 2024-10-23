//CAT616XB JOB (BB0P,0000),'ETRADE XFER',CLASS=H,MSGCLASS=W,            00010000
//  SECLABEL=BISG,SCHENV=STREAMB,USER=BB0P                              00010000
//**NON-CA11-JOB                                                                
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BIOS.C237.OUT.ACATNTL(0)                                 
//     EXEC SUBPROC2                                                            
//SYSIN DD *                                                                    
 SIGNON USERID=(RMIP237,STOCKING) CASE=YES                                      
 SUBMIT PROC=C237XSD2                                         -                 
        NEWNAME=CAT616XB                                      -                 
        &OPC=CAT616XB                                         -                 
        &SNODE=ETRDP1                                         -                 
        &ID=tracker                                           -                 
        &PWD=adp4bpsa!                                        -                 
        &COMPRESS=EXTENDED                                    -                 
        &CKPT=3M                                              -                 
        &DISP=(SHR)                                           -                 
        &IN=BIOS.C237.OUT.ACATNTL(0)                       -                    
        &OUT='/etrade/home/tracker/download/ACATNTLF.237'  -                    
        &FILE=ACATNTLF                                                          
 SIGNOFF                                                                        
