//CAT660XL JOB (BL0P,0DST),'ACATS DST TRANS',CLASS=Q,MSGCLASS=W,                
//        USER=BL0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF NDMSNA1                                                               
//*JOBAFF NDMSNA1                                                               
//**NON-CA11-JOB                                                        00013000
//*                                                                             
//STEP05  EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BLLL.C855.OUTMFACT.C274(0)                               
//*                                                                             
//STEP10  EXEC SUBPROCJ                                                         
//SYSIN DD *                                                                    
 SIGNON USERID=(RMIDDST,VENDOR)                                                 
 SUBMIT PROC=CDSTSEND                  -                                        
        &SNODE=DST.NDM14               -                                        
        &ID=ADPXNDM                    -                                        
        &PASSWORD=ADPXNDM              -                                        
        &CKPT=2M                       -                                        
        &COMPRESS=EXT                  -                                        
        &RUNGOOD=MFL.PROD.LEGJCL       -                                        
        &GOODMBR=LGJMU808              -                                        
        &DISP=(NEW,CATLG)              -                                        
        &OPC=CAT660XL                  -                                        
        &IN=BLLL.C855.OUTMFACT.C274(0)       -                                  
        &OUT=LEG.ADPXNDM.LEGG.ACATS          -                                  
        NEWNAME=CAT660XL                                                        
 SIGNOFF                                                                        
/*                                                                              
