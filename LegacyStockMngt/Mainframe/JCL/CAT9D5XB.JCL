//CAT9D5XB JOB (BB0P,0000),'ETRADE XFER',CLASS=H,MSGCLASS=W,            00010000
//  SECLABEL=BISG,USER=BB0P                                             00010000
//*NODAFF NDMTCP2                                                               
//*JOBAFF NDMTCP2                                                               
//**NON-CA11-JOB                                                                
//*--------------------------------------------------------------------         
//*  TRANSFER OUT CLIENT EXTRACT OF ACAT CYCLE 5 TRANS FILE SIAC0716            
//*--------------------------------------------------------------------         
//IEFBR14 EXEC IEFBR14                                                          
//*                                                                             
//DD01 DD DISP=SHR,DSN=BIOS.C237.OUT.SIAC0716.TRAN5(0)                          
//     EXEC SUBPROC2                                                            
//SYSIN DD *                                                                    
 SIGNON USERID=(RMIP237,STOCKING) CASE=YES esf=yes                              
 SUBMIT PROC=C237XSND                   -                                       
        NEWNAME=CAT9D5XB                -                                       
        &OPC=CAT9D5XB                   -                                       
        &SNODE=ETRDP1                   -                                       
        &ID=tracker                     -                                       
        &PWD=adp4bpsa!                  -                                       
        &COMPRESS=EXTENDED              -                                       
        &CKPT=3M                        -                                       
        &DISP=(SHR)                     -                                       
        &IN=BIOS.C237.OUT.SIAC0716.TRAN5(0) -                                   
        &OUT='/etrade/home/tracker/download/ACATMRO5.237' -                     
        &FILE=ACATMRO5                                                          
 SIGNOFF                                                                        
