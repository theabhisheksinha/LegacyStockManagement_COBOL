//CAT9D5XU JOB (BU1P,0000),'WORKFLOW FTP',CLASS=I,MSGCLASS=W,                   
//             USER=BU1P,                                                       
//             SECLABEL=BISG                                                    
//*  ASCENDIS FTP                                                               
//CA11STEP EXEC CA11                                                            
//SORT1   EXEC SORT                                                             
//SORTIN  DD DISP=SHR,DSN=BZZZ.SIAC0716.ACAT.TRAN(0)                            
//SORTOUT DD DSN=BUUU.SIAC0716.ACAT.C010.TRAN5(+1),                             
//        SPACE=(CYL,(5,10),RLSE),                                              
//        UNIT=BATCH,                                                           
//        DCB=(GDG,RECFM=VB,LRECL=4004,BLKSIZE=0),                              
//        DISP=(,CATLG,DELETE)                                                  
//SYSIN DD *                                                                    
 SORT FIELDS=COPY                                                               
    INCLUDE COND=(048,4,CH,EQ,C'0158',OR,050,4,CH,EQ,C'0158')                   
/*                                                                              
//ACATPRD EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP2DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPID)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT9D5XU)                                  
//ACATCL3 EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP3DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPI3)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT9D5XU)                                  
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BUUU.SIAC0716.ACAT.C010.TRAN5(+1)                        
