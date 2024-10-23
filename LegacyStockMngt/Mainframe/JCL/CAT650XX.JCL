//CAT650XX JOB (BX0P,0000),'ICI NOTIFY',CLASS=I,MSGCLASS=W,             00010000
//         SCHENV=STREAMX,                                                      
//  SECLABEL=BISG,USER=BX0P                                                     
//*NODAFF NDMTCP1                                                               
//*JOBAFF NDMTCP1                                                               
//**NON-CA11-JOB                                                                
//*  NOTIFY ICI THAT FILE IS AVAILABLE TO BE PULLED                             
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BXXX.CAT650.P2IPT(0)                                     
//SUBPR EXEC SUBPROCI                                                           
//SYSIN DD *                                                                    
 SIGNON USERID=(BTCHJSQ,JSQNDM) ESF=YES CASE=YES                                
 SUBMIT PROC=CICICONF                  -                                        
        NEWNAME=CAT650XX               -                                        
        &SNODE=NDM.ADPSYS2A            -                                        
        &ID=NDMADMIN                   -                                        
        &PWD=NDMADMIN                  -                                        
        &DISP2=RPL                     -                                        
        &CMND=ADPPROPGM/NDMBASACAT                                              
 SIGNOFF                                                                        
