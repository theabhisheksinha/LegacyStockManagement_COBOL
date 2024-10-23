//CAT781XU JOB (BU1P,7810),'NDM TO RIDGE',CLASS=H,MSGCLASS=W,           00010000
//  SECLABEL=BISG,USER=BU1P,SCHENV=NDMTCP3                              00020000
//**NON-CA11-JOB                                                                
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BZZZ.SIAC1666.NDMS(0)                                    
//SUBPR EXEC SUBPROC3                                                           
//SYSIN DD *                                                                    
 SIGNON USERID=(RMIP10P,C0NVRS1N)  CASE=YES ESF=YES                             
 SUBMIT PROC=COPYN010                               -                           
        NEWNAME=CAT781XU                            -                           
        &OPC=CAT781XU                               -                           
        &SNODE=DALNDMPRD01                          -                           
        &ID=usrridge                                -                           
        &PWD=Ridgeuser1                             -                           
        &COMPRESS=EXTENDED                          -                           
        &CKPT=100M                                  -                           
        &DISP=SHR                                   -                           
        &IN=BZZZ.SIAC1666.NDMS(0)                   -                           
        &OUT='\CostBasis\CBRS1666.010'                                          
 SIGNOFF                                                                        
