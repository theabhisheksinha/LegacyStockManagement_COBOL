//CAT9D4XB JOB (BB0P,0000),'ETRADE XFER',CLASS=H,MSGCLASS=W,            00010000
//  SECLABEL=BISG,USER=BB0P                                             00010000
//*NODAFF NDMTCP2                                                               
//*JOBAFF NDMTCP2                                                               
//**NON-CA11-JOB                                                                
//*--------------------------------------------------------------------         
//*  TRANSFER OUT CLIENT EXTRACT OF ACAT CYCLE 4 TRANS FILE SIAC0716            
//*--------------------------------------------------------------------         
//IEFBR14 EXEC IEFBR14                                                          
//*                                                                             
//DD01 DD DISP=SHR,DSN=BIOS.C237.OUT.SIAC0716.TRAN4(0)                          
//     EXEC SUBPROC2                                                            
//SYSIN DD *                                                                    
 SIGNON USERID=(RMIP237,STOCKING) CASE=YES esf=yes                              
 SUBMIT PROC=C237XSND                   -                                       
        NEWNAME=CAT9D4XB                -                                       
        &OPC=CAT9D4XB                   -                                       
        &SNODE=ETRDP1                   -                                       
        &ID=tracker                     -                                       
        &PWD=adp4bpsa!                  -                                       
        &COMPRESS=EXTENDED              -                                       
        &CKPT=3M                        -                                       
        &DISP=(SHR)                     -                                       
        &IN=BIOS.C237.OUT.SIAC0716.TRAN4(0) -                                   
        &OUT='/etrade/home/tracker/download/ACATMRO4.237' -                     
        &FILE=ACATMRO4                                                          
 SIGNOFF                                                                        
