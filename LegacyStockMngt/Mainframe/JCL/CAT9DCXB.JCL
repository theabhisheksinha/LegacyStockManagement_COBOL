//CAT9DCXB JOB (BB0P,0000),'WORKFLOW FTP',CLASS=I,MSGCLASS=W,                   
//             USER=BB0P,                                                       
//             SECLABEL=BISG                                                    
//*  ASCENDIS FTP                                                               
//CA11STEP EXEC CA11                                                            
//SORT1   EXEC SORT                                                             
//SORTIN  DD DISP=SHR,DSN=BZZZ.SIAC0716.ACAT.TRAN(0)                            
//SORTOUT DD DSN=BBBB.SIAC0716.ACAT.C237.TRAN3(+1),                             
//        SPACE=(CYL,(5,10),RLSE),                                              
//        UNIT=BATCH,                                                           
//        DCB=(GDG,RECFM=VB,LRECL=4004,BLKSIZE=0),                              
//        DISP=(,CATLG,DELETE)                                                  
//SYSIN DD *                                                                    
 SORT FIELDS=COPY                                                               
    INCLUDE COND=(048,4,CH,EQ,C'0385',OR,050,4,CH,EQ,C'0385')                   
/*                                                                              
//IEFBR14 EXEC IEFBR14                                                          
//DD01 DD DISP=SHR,DSN=BBBB.SIAC0716.ACAT.C237.TRAN3(+1)                        
