//CAT582XF JOB (BF0P,DY00),'NDM TO RBC DAIN',CLASS=H,MSGCLASS=W,                
//         SCHENV=STREAMF,SECLABEL=BISG,USER=BF0P                               
//**NON-CA11-JOB                                                                
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BIOS.C425.OUTPN720.C006(0)                               
//SUBPR EXEC SUBPROC3                                                           
//SYSIN DD *                                                                    
 SIGNON USERID=(RMIP006,S0L1T@RE) ESF=YES                                       
 SUBMIT PROC=COPYC006                   -                                       
        NEWNAME=CAT582XF                -                                       
        &OPC=CAT582XF                   -                                       
        &SNODE=DRCNDMOPC                -                                       
        &CKPT=300M                      -                                       
        &COMPRESS=EXT                   -                                       
        &DISPP=SHR                      -                                       
        &DISPS=(NEW,CATLG,DELETE)       -                                       
        &TRIG=DZSZTD59                  -                               00010000
        &IN=BIOS.C425.OUTPN720.C006(0)  -                                       
        &OUT=ZSZ#JN.XCD.R1J1BROD.NSCC.N720(+1)                                  
 SIGNOFF                                                                        
//*                                                                             
//TPTC001 EXEC TPTCUTIL,                                                        
//             DD=FILEIN,      --> REQ                                          
//             AB=N,           --> ABEND FLAG: Y -ABEND, N- NO ABEND            
//             AP='RBC',       --> APPLICATION NAME (REQ)                       
//             SI='F',         --> STREAM           (REQ)                       
//             JN='CAT582XF',  --> JOB NAME (REQ)                               
//             ND='N'          --> CALC EXP FOR TOMORROW                        
//FILEIN   DD DUMMY                                                             
//*                                                                             
