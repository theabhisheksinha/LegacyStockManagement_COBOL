//CAT788XU JOB (BU1P,0000),'NDM TO RIDGE',CLASS=H,MSGCLASS=W,           00010000
//  SECLABEL=BISG,USER=BU1P,SCHENV=NDMTCP3                              00020000
//**NON-CA11-JOB                                                                
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BIOS.C010.OUT.CBRS0264(0)                                
//SUBPR EXEC SUBPROC3                                                           
//SYSIN DD *                                                                    
 SIGNON USERID=(RMIP10P,C0NVRS1N)  CASE=YES ESF=YES                             
 SUBMIT PROC=COPYK010                               -                           
        NEWNAME=CAT788XU                            -                           
        &OPC=CAT788XU                               -                           
        &SNODE=DALNDMPRD01                          -                           
        &ID=usrridge                                -                           
        &PWD=Ridgeuser1                             -                           
        &COMPRESS=EXTENDED                          -                           
        &CKPT=100M                                  -                           
        &DISP=SHR                                   -                           
        &TYP=TEXT                                   -                           
        &XLAT=YES                                   -                           
        &BLANKS=NO                                  -                           
        &IN=BIOS.C010.OUT.CBRS0264(0)               -                           
        &OUT='\CostBasis\CBRS0264.010'                                          
 SIGNOFF                                                                        
