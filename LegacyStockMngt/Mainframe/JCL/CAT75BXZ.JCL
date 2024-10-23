//CAT75BXZ JOB (BP00,0000),'NDM TO BPO',CLASS=H,MSGCLASS=W,                     
//         SECLABEL=BISG,SCHENV=NDMTCP3                                         
//**NON-CA11-JOB                                                                
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BZZZ.CAT650DB.ACATSHAD(0)                                
//SUBPR EXEC SUBPROC3                                                           
//SYSIN DD *                                                                    
 SIGNON USERID=(RMIPBPO,CR@ZYBPO) CASE=YES                                      
 SUBMIT PROC=COPY3BPO                                -                          
        NEWNAME=CAT75BXZ                             -                          
        &OPC=CAT75BXZ                                -                          
        &SNODE=data03                                -                          
        &ID=tracndm                                  -                          
        &PWD=#trac4ndm!                              -                          
        &COMPRESS=EXTENDED                           -                          
        &CKPT=100M                                   -                          
        &TYP=BINARY                                  -                          
        &BLANKS=NO                                   -                          
        &XLAT=NO                                     -                          
        &DISPP=SHR                                   -                          
        &DISPS=(rpl)                                 -                          
        &DSNP=BZZZ.CAT650DB.ACATSHAD(0)              -                          
        &RMTHLQ='/vol01/apps/tracndm/nontrac/'       -                          
        &RMTFILE=shadow_entries_binary                                          
 SIGNOFF                                                                        
