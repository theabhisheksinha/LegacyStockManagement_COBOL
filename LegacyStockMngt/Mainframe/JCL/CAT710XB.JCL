//CAT710XB JOB (BB0P,0000),'ETRADE XFER',CLASS=H,MSGCLASS=W,            00010000
//  SECLABEL=BISG,USER=BB0P                                             00010000
//*NODAFF NDMTCP2                                                               
//*JOBAFF NDMTCP2                                                               
//**NON-CA11-JOB                                                                
//*--------------------------------------------------------------------         
//*  TRANSFER OUT CLIENT EXTRACT OF ACAT EOD POSITION SIAC0718                  
//*--------------------------------------------------------------------         
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BIOS.C237.OUT.SIAC0718.POSN(0)                           
//     EXEC SUBPROC2                                                            
//SYSIN DD *                                                                    
 SIGNON USERID=(RMIP237,STOCKING) CASE=YES esf=yes                              
 SUBMIT PROC=C237XSND                   -                                       
        NEWNAME=CAT710XB                -                                       
        &OPC=CAT710XB                   -                                       
        &SNODE=ETRDP1                   -                                       
        &ID=tracker                     -                                       
        &PWD=adp4bpsa!                  -                                       
        &COMPRESS=EXTENDED              -                                       
        &CKPT=3M                        -                                       
        &DISP=(SHR)                     -                                       
        &IN=BIOS.C237.OUT.SIAC0718.POSN(0) -                                    
        &OUT='/etrade/home/tracker/download/ACATPOSN.237' -                     
        &FILE=ACATPOSN                                                          
 SIGNOFF                                                                        
