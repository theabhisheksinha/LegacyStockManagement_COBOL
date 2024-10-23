//CAT9DLXN JOB (BN1P,0000),'ASCENDIS FTP',CLASS=I,MSGCLASS=W,                   
//             USER=BN1P,                                                       
//             SECLABEL=BISG                                                    
//*  ASCENDIS FTP                                                               
//CA11STEP EXEC CA11                                                            
//SORT1   EXEC SORT                                                             
//SORTIN  DD DISP=SHR,DSN=BZZZ.SIAC0716.ACAT.TRAN(0)                            
//SORTOUT DD DSN=BNNN.SIAC0716.ACAT.C080.TRAN2(+1),                             
//        SPACE=(CYL,(5,10),RLSE),                                              
//        UNIT=BATCH,                                                           
//        DCB=(GDG,RECFM=VB,LRECL=4004,BLKSIZE=0),                              
//        DISP=(,CATLG,DELETE)                                                  
//SYSIN DD *                                                                    
 SORT FIELDS=COPY                                                               
    INCLUDE COND=(048,4,CH,EQ,C'0220',OR,050,4,CH,EQ,C'0220')                   
/*                                                                              
//ACATPRD EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP3DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPI3)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT9DLXN)                                  
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BNNN.SIAC0716.ACAT.C080.TRAN2(+1)                        
