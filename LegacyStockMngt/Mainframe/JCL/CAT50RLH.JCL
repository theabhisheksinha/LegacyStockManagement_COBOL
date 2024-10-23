//CAT50RLH JOB (BH0P,0000),'ACAT CYCLELOG',CLASS=5,MSGCLASS=W,                  
//         SCHENV=STREAMH,                                                      
//             USER=BH0P,                                                       
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11     EXEC CA11                                                    00018000
//**                                                                    00019000
//*-------------------------------------------------------------------*         
//* CREATED 12/05/00 - FOR LEHMAN MOCK RERUN ONLY                               
//*         'H' STREAM HOLD FILE IS USED AS INPUT                               
//*-------------------------------------------------------------------*         
//IDCAMS10 EXEC PGM=IDCAMS                                              00200000
//FILE1 DD DSN=SH.HHH.CAT500.CYCLELOG.HOLD,DISP=SHR                     00210002
//FILE2 DD DSN=BB.HHH.CAT500.CYCLELOG,DISP=SHR                          00220000
  REPRO INFILE(FILE1) OUTFILE(FILE2) COUNT(1) REUSE                     00230000
//SYSPRINT DD SYSOUT=*                                                  00240000
//SYSOUT DD SYSOUT=*                                                    00250000
//**                                                                    00019000
//IDCAMS20 EXEC PGM=IDCAMS                                              00200000
//FILE1 DD DSN=BTTT.CAT511.CYCLELOG(0),DISP=SHR                         00210002
//FILE2 DD DSN=BHHH.CAT511.CYCLELOG(+1),DISP=(NEW,CATLG),               00220000
//  UNIT=BATCH,SPACE=(CYL,(1,1),RLSE),DCB=(GDG,LRECL=200,RECFM=FB)              
//SYSIN DD *                                                                    
  REPRO INFILE(FILE1) OUTFILE(FILE2) COUNT(1) REUSE                     00230000
//SYSPRINT DD SYSOUT=*                                                  00240000
//SYSOUT DD SYSOUT=*                                                    00250000
//*                                                                             
//BMT7100 EXEC PGM=BMT71,PARM='02'                                              
//DD01     DD  DSN=BHHH.CAT500R.TRAC(+1),DISP=(NEW,CATLG),                      
//  UNIT=BATCH,SPACE=(TRK,(1,1),RLSE),DCB=(LRECL=143,RECFM=FB)                  
//DD02     DD  DSN=BHHH.CAT500D.TRAC(+1),DISP=(NEW,CATLG),                      
//  UNIT=BATCH,SPACE=(TRK,(1,1),RLSE),DCB=(LRECL=143,RECFM=FB)                  
