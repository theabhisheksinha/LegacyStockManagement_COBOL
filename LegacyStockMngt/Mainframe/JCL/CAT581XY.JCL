//CAT581XY JOB (BY0P,DY00),'DST NDM',CLASS=Q,MSGCLASS=W,                00020000
//         USER=BY0P,                                                           
//         SECLABEL=BISG                                                        
//*NODAFF NDMSNA1                                                               
//*JOBAFF NDMSNA1                                                               
//**NON-CA11-JOB                                                                
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BIOS.C855.OUTMF720.C313(0)                               
//SUBPR EXEC SUBPROCJ                                                           
//SYSIN DD *                                                                    
 SIGNON USERID=(RMIDDST,VENDOR)                                                 
 SUBMIT PROC=CDSTDSTQ                  -                                        
        &SNODE=DST.NDM1                -                                        
        &OPC=CAT581XY                  -                                        
        NEWNAME=CAT581XY               -                                        
        &ID=ADPXNDM                    -                                        
        &PASSWORD=ADPXNDM              -                                        
        &CKPT=2M                       -                                        
        &COMPRESS=EXT                  -                                        
        &DISP=(NEW,CATLG,DELETE)       -                                        
        &IN=BIOS.C855.OUTMF720.C313(0)  -                                       
        &OUT=PMD.BPS.ACAT.ESTAT.FIRM0701.PASSTHRU                               
 SIGNOFF                                                                        
