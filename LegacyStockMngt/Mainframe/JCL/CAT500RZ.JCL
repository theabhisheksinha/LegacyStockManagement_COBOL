//CAT500RZ JOB (BZ0P,0000),'ACAT: NEW TRAC',CLASS=1,MSGCLASS=W,                 
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//**********************************************************************        
//CA11STEP EXEC CA11                                                            
//**********************************************************************        
//*            RECEIVER SIDE                                                    
//**********************************************************************        
//BMT7110 EXEC BMT71,DD=15                                                      
//DD01     DD  DSN=BAAA.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD02     DD  DSN=BBBB.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD03     DD  DSN=BFFF.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD04     DD  DSN=BHHH.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD05     DD  DSN=BIII.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD06     DD  DSN=BJJJ.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD07     DD  DSN=BLLL.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD08     DD  DSN=BNNN.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD09     DD  DSN=BPPP.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD10     DD  DSN=BRRR.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD11     DD  DSN=BSSS.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD12     DD  DSN=BTTT.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD13     DD  DSN=BUUU.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD14     DD  DSN=BXXX.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD15     DD  DSN=BYYY.CAT500R.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//**********************************************************************        
//*            DELIVERER SIDE                                                   
//**********************************************************************        
//BMT7120 EXEC BMT71,DD=15                                                      
//DD01     DD  DSN=BAAA.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD02     DD  DSN=BBBB.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD03     DD  DSN=BFFF.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD04     DD  DSN=BHHH.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD05     DD  DSN=BIII.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD06     DD  DSN=BJJJ.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD07     DD  DSN=BLLL.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD08     DD  DSN=BNNN.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD09     DD  DSN=BPPP.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD10     DD  DSN=BRRR.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD11     DD  DSN=BSSS.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD12     DD  DSN=BTTT.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD13     DD  DSN=BUUU.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD14     DD  DSN=BXXX.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//DD15     DD  DSN=BYYY.CAT500D.TRAC(+1),                                       
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,RECFM=FB,DSORG=PS,LRECL=143),                           
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=BATCH                                                       
//**********************************************************************        
//*            INTRA-DAY FEE PROCESSING                                         
//**********************************************************************        
//BMT713A EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BAAA.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BAAA.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BAAA.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BAAA.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BAAA.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713B EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BBBB.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BBBB.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BBBB.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BBBB.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BBBB.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713F EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BFFF.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BFFF.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BFFF.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BFFF.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BFFF.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713H EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BHHH.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BHHH.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BHHH.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BHHH.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BHHH.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713I EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BIII.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BIII.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BIII.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BIII.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BIII.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713J EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BJJJ.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BJJJ.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BJJJ.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BJJJ.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BJJJ.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713L EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BLLL.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BLLL.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BLLL.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BLLL.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BLLL.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713N EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BNNN.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BNNN.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BNNN.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BNNN.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BNNN.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713P EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BPPP.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BPPP.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BPPP.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BPPP.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BPPP.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713R EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BRRR.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BRRR.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BRRR.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BRRR.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BRRR.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713S EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BSSS.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BSSS.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BSSS.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BSSS.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BSSS.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713U EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BUUU.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BUUU.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BUUU.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BUUU.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BUUU.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713X EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BXXX.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BXXX.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BXXX.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BXXX.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BXXX.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//BMT713Y EXEC BMT71,DD=05                                                      
//DD01     DD DSN=BYYY.CAT820.ID.CSHADJ(+1),                                    
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD02     DD DSN=BYYY.CAT820.ID.P2FEE(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=120,RECFM=FB)                             
//DD03     DD DSN=BYYY.CAT820.ID.TACTL(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=8004,RECFM=VB)                            
//DD04     DD DSN=BYYY.CAT820.ID.LQRPI(+1),                                     
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=143,RECFM=FB)                             
//DD05     DD DSN=BYYY.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
