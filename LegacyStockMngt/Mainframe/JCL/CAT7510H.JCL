//CAT7510H JOB (BH0P,DY00),'ACATS MRGN CREATE',CLASS=1,MSGCLASS=W,              
//  USER=BH0P,                                                                  
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*********************************************************************         
//* CREATE SPECIAL MARGIN CALC EXTRACT FILE.                          *         
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.              *         
//*STEP01  EXEC CAT650  ( CREATE ACATS SPECIAL BOOKING FILE )                   
//*STEP02  EXEC BPU93   ( GENERATE TACT FROM ACAT BKSR FILE )                   
//*STEP03  EXEC BKP10   ( CREATE INPUT FOR BKP20 )                              
//*STEP04  EXEC BKP20   ( CREATE B204IN FILE FOR BPU50T )                       
//*STEP05  EXEC BPU50T  ( CREATE B204CA.TRIDM   FILE  )                         
//*STEP06  EXEC BSU12   ( CREATE SRTR FIEL FOR BSU16  )                         
//*STEP16  EXEC BSU16                                                           
//*STEP15  EXEC BSU15                                                           
//*STEP20  EXEC BSU20   ( CREATE ACAT PRICE FILE)                               
//*********************************************************************         
//*                                                                             
//STEP10  EXEC CAT650,                                                          
//             STREAM=H,                  *1 BYTE BATCH STREAM ID     *         
//             STREAM2=HHH,               *I/P 3 BYTE STREAM MEMO FILE*         
//             HNB='BHHH',                *O/P .CAT650.FILES      GDG *         
//             HNB1='BZZZ',               *I/P .CAT650DB.ACATMRGN GDG *         
//             NAV=BNAHHH,                                                      
//             EXTR=ACATMRGN,             *USE MARGIN EXTRACT FILE              
//             IPT=MGN,                   *SPECIAL MARGIN P2 FILE               
//             RPTPI=XMGNPI,              *CREATE MARGIN EXCP REPORT            
//             CAGEFL='DUMMY,',           *DONT CREATE CAGE FILES               
//             B1FIL='BZZZ.B1FL',                                               
//             RUNDATE=                                                         
//CAT650.IMFPEND   DD DUMMY                                                     
//*****                                                                         
//STEP02 EXEC BPU93,                                                            
//       IFORMAT=B120,                                                          
//       OFORMAT=TACT                                                           
//BPU93.BKPPG  DD DISP=SHR,DSN=BHHH.CAT650.P2MGN(+1)  ==> ACATS P2              
//BPU93.TACT   DD DSN=BHHH.CAT650.BKTACT(+1),                                   
//       DISP=(NEW,CATLG,DELETE),                                               
//       SPACE=(CYL,(50,50),RLSE),UNIT=BATCH,                                   
//       DCB=(GDG,RECFM=VB,LRECL=8004)                                          
//*                                                                             
//STEP03  EXEC BKP10,                                                           
//        HNB=BHHH,                                                             
//        STRM='H',                                                             
//        HNO=SH,                                                               
//        CLNT=HHH,                                                             
//        NAV=BNAHHH                                                            
//BKP10.TIFFILE  DD DUMMY                                                       
//BKP10.TACTIN   DD DSN=BHHH.CAT650.BKTACT(+1),DISP=SHR                         
//BKP10.TACT01   DD DSN=BHHH.BKP10.CAT650.TACT(+1),                             
//         DISP=(NEW,CATLG,DELETE),                                             
//         DCB=(GDG,RECFM=VB,LRECL=8004),UNIT=BATCH,                            
//         SPACE=(CYL,(90,90),RLSE)                                             
//*****                                                                         
//STEP04  EXEC BKP20,                                                           
//        HNB=BHHH,                                                             
//        CLNT=HHH,                                                             
//        STRM=H,                                                               
//        NAV=BNAHHH,                                                           
//        CURFILE='POVH.BTSH.CMT15.CURFLE',                                     
//        COND.IDCAMS=(0,LE)                                                    
//BKP20.TACT  DD DUMMY                                                          
//BKP20.TACT01   DD  DSN=BHHH.BKP10.CAT650.TACT(+1),DISP=SHR                    
//BKP20.TACT02   DD  DSN=BHHH.BKP20.CAT650.TACT(+1),                            
//         DISP=(NEW,CATLG,DELETE),                                             
//         DCB=(GDG,RECFM=VB,LRECL=8004),UNIT=BATCH,                            
//         SPACE=(CYL,(90,90),RLSE)                                             
//IDCAMS.DD1 DD DUMMY                                                           
//           DD DUMMY                                                           
//IDCAMS.DD2 DD DUMMY                                                           
//*****                                                                         
//STEP05  EXEC BPU50T,                                                          
//        HNB=BHHH,                                                             
//        NAV=BNAHHH                                                            
//BPU50T.TACT  DD  DSN=BHHH.BKP20.CAT650.TACT(+1),DISP=SHR                      
//BPU50T.B204  DD DSN=BHHH.BPU50.B204.ACATMGN(+1),      ===> B204-OUT           
//        DISP=(NEW,CATLG,DELETE),                                              
//        UNIT=BATCH,                                                           
//        DCB=(GDG,RECFM=VB,LRECL=504),                                         
//        SPACE=(CYL,(100,100),RLSE)                                            
//BPU50T.TACT02  DD DUMMY                                                       
//*****                                                                         
//STEP06  EXEC BSU12,                                                           
//        HNB=BHHH                                                              
//BSU12.TACT    DD DISP=SHR,DSN=BHHH.BKP20.CAT650.TACT(+1)                      
//BSU12.SRTRANS DD DSN=BHHH.BSU12.CAT650.SRTR,                                  
//          DISP=(NEW,CATLG,DELETE),                                            
//          UNIT=BATCH,                                                         
//          DCB=(RECFM=VB,LRECL=795),                                           
//          SPACE=(CYL,(50,50),RLSE)                                            
//*****                                                                         
//STEP16 EXEC BSU16,                                                            
//       GEN0=,                                                                 
//       HNB=BHHH,                                                              
//       PARM.BSU16='BYPASS'                                                    
//SORT10.SORTIN DD DSN=BHHH.BSU12.CAT650.SRTR,DISP=SHR                          
//SORT10.SORTOUT DD DSN=BHHH.BSU09B.ACATSRTR.TMP,                               
//         DISP=(,CATLG,DELETE),UNIT=BATCH,                                     
//         DCB=(LRECL=795,RECFM=VB),SPACE=(CYL,(5,5),RLSE)                      
//BSU16.SRTRIN DD DSN=BHHH.BSU09B.ACATSRTR.TMP,                                 
//          DISP=SHR                                                            
//BSU16.SRTROUT DD DSN=BHHH.BSU16.ACATSRTR.TMP,                                 
//         DISP=(,CATLG,DELETE),UNIT=BATCH,                                     
//         DCB=(LRECL=795,RECFM=VB),SPACE=(CYL,(5,5),RLSE)                      
//*******DELETE TEMP DATASETS*******                                            
//BR140101.SYSUT001 DD DUMMY                                                    
//*                                                                             
//STEP15  EXEC BSU15,                                                           
//        CLNT=HHH,                                                             
//        BYP15=BYPASS,                                                         
//        HNB=BHHH                                                              
//SORT10.SORTIN  DD DSN=BHHH.BSU30.EXTPRC(0),DISP=SHR                           
//     DD DUMMY                                                                 
//SORT10.SORTOUT DD DSN=BHHH.BSU15A.ACAT.PRICE.TMP,                             
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(40,20),RLSE),                                        
//             DCB=(LRECL=150,RECFM=FB)                                         
//BSU15.OLDPRC DD DSN=BHHH.BSU15A.ACAT.PRICE.TMP,                               
//             DISP=SHR                                                         
//BSU15.EXTPRC DD DSN=BHHH.BSU15.ACAT.EXTPRC.TMP,                               
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(40,20),RLSE),                                        
//             DCB=(LRECL=150,RECFM=FB)                                         
//BSU15.MSDPRC DD DSN=BHHH.BSU15.ACAT.MSDPRC.TMP,                               
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(200,100),RLSE),                                      
//             DCB=BUFNO=50                                                     
//BSU15.NEWPRC DD DSN=BHHH.BSU15.ACAT.PRICE.TMP,                                
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(40,20),RLSE),                                        
//             DCB=(LRECL=80,RECFM=FB)                                          
//BR140101.SYSUT001 DD DUMMY                                                    
//*                                                                             
//STEP20 EXEC BSU20,                                                            
//             ACR20='ACR=N',                                                   
//             CLNT=HHH,                                                        
//             GEN='(0)',                                                       
//             BYP20=BYPASS,                                                    
//             HNB=BHHH                                                         
//*                                                                             
//SORT20.SORTIN DD DSN=BHHH.BSU16.ACATSRTR.TMP,DISP=SHR                         
//SORT20.SORTOUT DD DSN=BHHH.BSU20.ACATSRTR.SORT.TMP,                           
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=(LRECL=795,RECFM=VB)                                         
//BSU20.SRTRIN DD DSN=BHHH.BSU20.ACATSRTR.SORT.TMP,                             
//         DISP=SHR                                                             
//BSU20.PRCIN   DD DSN=BHHH.BSU15.ACAT.MSDPRC.TMP,DISP=SHR                      
//BSU20.TEMP    DD DUMMY                                                        
//BSU20.WIPEPRC DD DUMMY                                                        
//BSU20.EXTPRC  DD DSN=BHHH.BSU20.ACAT.EXTPRC(+1),                              
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(40,20),RLSE),                                        
//             DCB=GDG                                                          
//BSU20.MSDPRC  DD DSN=BHHH.BSU20.ACAT.MSDPRC(+1),                              
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(200,100),RLSE),                                      
//             DCB=(GDG,BUFNO=50)                                               
//BSU20.PRICE   DD DSN=BHHH.BSU20.ACAT.PRICE(+1),                               
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(40,20),RLSE),                                        
//             DCB=GDG                                                          
//BSU20.SRTROUT DD DUMMY                                                        
//BR140101.SYSUT001 DD DSN=BHHH.BSU12.CAT650.SRTR,                              
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT002 DD DSN=BHHH.BSU09B.ACATSRTR.TMP,                            
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT003 DD DSN=BHHH.BSU16.ACATSRTR.TMP,                             
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT004 DD DSN=BHHH.BSU15A.ACAT.PRICE.TMP,                          
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT005 DD DSN=BHHH.BSU15.ACAT.PRICE.TMP,                           
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT006 DD DSN=BHHH.BSU20.ACATSRTR.SORT.TMP,                        
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT007 DD DSN=BHHH.BSU15.ACAT.EXTPRC.TMP,                          
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT007 DD DSN=BHHH.BSU15.ACAT.MSDPRC.TMP,                          
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
