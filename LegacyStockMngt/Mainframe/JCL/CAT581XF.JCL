//CAT581XF JOB (BF0P,0000),'NDM TO PNC SURPAS',CLASS=H,MSGCLASS=W,              
//         USER=BF0P,                                                           
//         SECLABEL=BISG                                                        
//**NON-CA11-JOB                                                                
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BIOS.C425.OUTPN720.C006(0)                               
//*                                                                             
//STEP10  EXEC SUBPROC3                                                         
//SYSIN   DD *                                                                  
 SIGNON USERID=(RMIP425,L1M@DR1V) CASE=YES ESF=YES                              
 SUBMIT PROC=COPYC425                      -                                    
        NEWNAME=CAT581XF                   -                                    
        &OPC=CAT581XF                      -                                    
        &SNODE=SBSCD01                     -                                    
        &ID=ADP                            -                                    
        &PWD=,                             -                                    
        &COMPRESS=EXTENDED                 -                                    
        &CKPT=2M                           -                                    
        &DISP=(SHR)                        -                                    
        &IN=BIOS.C425.OUTPN720.C006(0)     -                                    
        &OUT=CD.RBCI1.TRACATSTAT           -                                    
        &ENDFLENM=001                                                           
 SIGNOFF                                                                        
