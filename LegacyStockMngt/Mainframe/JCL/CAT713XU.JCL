//CAT713XU JOB (BU1P,0000),'ASCENDIS FTP',CLASS=I,MSGCLASS=W,                   
//             USER=BU1P,                                                       
//             SECLABEL=BISG                                                    
//*  ASCENDIS FTP                                                               
//CA11STEP EXEC CA11                                                            
//SORT1   EXEC SORT                                                             
//SORTIN  DD DISP=SHR,DSN=BZZZ.SIAC0718.ACAT.POSN(0)                            
//SORTOUT DD DSN=BUUU.SIAC0718.ACAT.C080.POSN(+1),                              
//        SPACE=(CYL,(5,10),RLSE),                                              
//        UNIT=BATCH,                                                           
//        DCB=(GDG,RECFM=VB,LRECL=4004,BLKSIZE=0),                              
//        DISP=(,CATLG,DELETE)                                                  
//SYSIN DD *                                                                    
 SORT FIELDS=COPY                                                               
    INCLUDE COND=(048,4,CH,EQ,C'0158',OR,050,4,CH,EQ,C'0158')                   
/*                                                                              
//ACATPRD EXEC BPFTP                                                            
//SYSIN DD DISP=SHR,DSN=BISG.CARDLIB(WFIP3DC1)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(WFACTPI3)                                  
//      DD DISP=SHR,DSN=BISG.CARDLIB(CAT713XU)                                  
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BUUU.SIAC0718.ACAT.C080.POSN(+1)                         
