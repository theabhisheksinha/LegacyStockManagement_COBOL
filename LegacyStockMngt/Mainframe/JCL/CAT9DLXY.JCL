//CAT9DLXY JOB (BY0P,0000),'ASCENDIS FTP',CLASS=I,MSGCLASS=W,                   
//         SCHENV=STREAMY,USER=BY0P,SECLABEL=BISG                               
//*  ASCENDIS SUPPORT                                                           
//CA11STEP EXEC CA11                                                            
//SORT1   EXEC SORT                                                             
//SORTIN  DD DISP=SHR,DSN=BZZZ.SIAC0716.ACAT.TRAN(0)                            
//SORTOUT DD DSN=BYYY.SIAC0716.ACAT.C313.TRAN2(+1),                             
//        SPACE=(CYL,(5,10),RLSE),                                              
//        UNIT=BATCH,                                                           
//        DCB=(GDG,RECFM=VB,LRECL=4004,BLKSIZE=0),                              
//        DISP=(,CATLG,DELETE)                                                  
//SYSIN DD *                                                                    
 SORT FIELDS=COPY                                                               
    INCLUDE COND=(048,4,CH,EQ,C'0701',OR,050,4,CH,EQ,C'0701')                   
/*                                                                              
//ACATPRD EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP6DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPI6)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT9DLXY)                                  
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BYYY.SIAC0716.ACAT.C313.TRAN2(+1)                        
