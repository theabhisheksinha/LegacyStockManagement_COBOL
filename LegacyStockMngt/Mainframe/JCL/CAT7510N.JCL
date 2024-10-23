//CAT7510N JOB (BN1P,DAC0),'ACATS MRGN CREATE',CLASS=1,MSGCLASS=W,              
//  USER=BN1P,                                                                  
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
//*STEP02  EXEC BMD2025 ( GENERATE INPUT FOR BMD13 BKG ACOUNT EDIT )            
//*STEP03  EXEC BMD13   ( CREATE BKG ACOUNT EDIT)                               
//*STEP04  EXEC BMD11   ( CREATE B204IN FILE FOR BPU50X )                       
//*STEP05  EXEC BPU50X  ( CREATE B204CA.TRIDM   FILE  )                         
//*STEP16  EXEC BSU16                                                           
//*STEP15  EXEC BSU15                                                           
//*STEP20  EXEC BSU20   ( CREATE ACAT PRICE FILE)                               
//*********************************************************************         
//*                                                                             
//STEP10  EXEC CAT650,                                                          
//             STREAM=N,                  *1 BYTE BATCH STREAM ID     *         
//             STREAM2=NNN,               *I/P 3 BYTE STREAM MEMO FILE*         
//             HNB='BNNN',                *O/P .CAT650.FILES      GDG *         
//             HNB1='BZZZ',               *I/P .CAT650DB.ACATMRGN GDG *         
//             NAV=BNANNN,                                                      
//             EXTR=ACATMRGN,             *USE MARGIN EXTRACT FILE              
//             IPT=MGN,                   *SPECIAL MARGIN P2 FILE               
//             RPTPI=XMGNPI,              *CREATE MARGIN EXCP REPORT            
//             CAGEFL='DUMMY,',           *DONT CREATE CAGE FILES               
//             B1FIL='BZZZ.B1FL',                                               
//             RUNDATE=                                                         
//CAT650.IMFPEND   DD DUMMY                                                     
//*****                                                                         
//STEP11 EXEC BPU93,                                                            
//       IFORMAT=B120,                                                          
//       OFORMAT=TACT                                                           
//BPU93.BKPPG  DD DSN=BNNN.CAT650.P2MGN(+1),DISP=SHR ==> ACATS P2               
//BPU93.TACT   DD DSN=BNNN.CAT650.BKTACT(+1),                                   
//       DISP=(NEW,CATLG,DELETE),                                               
//       SPACE=(CYL,(50,50),RLSE),UNIT=BATCH,                                   
//       DCB=(GDG,RECFM=VB,LRECL=8004)                                          
//*                                                                             
//STEP12  EXEC BKP10,                                                           
//        HNB=BNNN,                                                             
//        STRM='N',                                                             
//        HNO=SN,                                                               
//        CLNT=NNN,                                                             
//        NAV=BNANNN                                                            
//BKP10.TIFFILE  DD DUMMY                                                       
//BKP10.TACTIN   DD DISP=SHR,DSN=BNNN.CAT650.BKTACT(+1)                         
//BKP10.TACT01   DD DSN=BNNN.BKP10.CAT650.TACT(+1),                             
//         DISP=(NEW,CATLG,DELETE),                                             
//         DCB=(GDG,RECFM=VB,LRECL=8004),UNIT=BATCH,                            
//         SPACE=(CYL,(90,90),RLSE)                                             
//*****                                                                         
//STEP13  EXEC BKP20,                                                           
//        HNB=BNNN,                                                             
//        CLNT=NNN,                                                             
//        STRM=N,                                                               
//        NAV=BNANNN,                                                           
//        CURFILE='POVN.BTSN.CMT15.CURFLE',                                     
//        COND.IDCAMS=(0,LE)                                                    
//BKP20.TACT  DD DUMMY                                                          
//BKP20.TACT01   DD  DISP=SHR,DSN=BNNN.BKP10.CAT650.TACT(+1)                    
//BKP20.TACT02   DD  DSN=BNNN.BKP20.CAT650.TACT(+1),                            
//         DISP=(NEW,CATLG,DELETE),                                             
//         DCB=(GDG,RECFM=VB,LRECL=8004),UNIT=BATCH,                            
//         SPACE=(CYL,(90,90),RLSE)                                             
//IDCAMS.DD1 DD DUMMY                                                           
//           DD DUMMY                                                           
//IDCAMS.DD2 DD DUMMY                                                           
//*****                                                                         
//STEP14  EXEC BPU50T,                                                          
//        HNB=BNNN,                                                             
//        NAV=BNANNN                                                            
//BPU50T.TACT DD DISP=SHR,DSN=BNNN.BKP20.CAT650.TACT(+1)                        
//BPU50T.B204 DD DSN=BNNN.BPU50.B204.ACATMGN(+1),      ===> B204-OUT            
//        DISP=(NEW,CATLG,DELETE),                                              
//        UNIT=BATCH,                                                           
//        DCB=(GDG,RECFM=VB,LRECL=504),                                         
//        SPACE=(CYL,(100,100),RLSE)                                            
//BPU50T.TACT02  DD DUMMY                                                       
//*****                                                                         
//STEP15  EXEC BSU12,                                                           
//        HNB=BNNN                                                              
//BSU12.TACT     DD DISP=SHR,DSN=BNNN.BKP20.CAT650.TACT(+1)                     
//BSU12.SRTRANS  DD DSN=BNNN.BSU12.CAT650.SRTR,                                 
//          DISP=(NEW,CATLG,DELETE),                                            
//          UNIT=BATCH,                                                         
//          DCB=(RECFM=VB,LRECL=795),                                           
//          SPACE=(CYL,(100,100),RLSE)                                          
//*****                                                                         
//STEP16 EXEC BSU16,                                                            
//            GEN0=,                                                            
//            HNB=BNNN,                                                         
//        PARM.BSU16='BYPASS'                                                   
//SORT10.SORTIN DD DSN=BNNN.BSU12.CAT650.SRTR,                                  
//          DISP=SHR                                                            
//SORT10.SORTOUT DD DSN=BNNN.BSU09B.ACATSRTR.TMP,                               
//         DISP=(,CATLG,DELETE),UNIT=BATCH,                                     
//         DCB=(LRECL=795,RECFM=VB),SPACE=(CYL,(5,5),RLSE)                      
//BSU16.SRTRIN DD DSN=BNNN.BSU09B.ACATSRTR.TMP,                                 
//          DISP=SHR                                                            
//BSU16.SRTROUT DD DSN=BNNN.BSU16.ACATSRTR.TMP,                                 
//         DISP=(,CATLG,DELETE),UNIT=BATCH,                                     
//         DCB=(LRECL=795,RECFM=VB),SPACE=(CYL,(5,5),RLSE)                      
//*******DELETE TEMP DATASETS*******                                            
//BR140101.SYSUT001 DD DUMMY                                                    
//*                                                                             
//STEP15  EXEC BSU15,                                                           
//             CLNT=NNN,                                                        
//             BYP15=BYPASS,                                                    
//             HNB=BNNN                                                         
//SORT10.SORTIN  DD DSN=BNNN.BSU30.EXTPRC(0),DISP=SHR                           
//     DD DUMMY                                                                 
//SORT10.SORTOUT DD DSN=BNNN.BSU15A.ACAT.PRICE.TMP,                             
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(40,20),RLSE),                                        
//             DCB=(LRECL=150,RECFM=FB)                                         
//BSU15.OLDPRC DD DSN=BNNN.BSU15A.ACAT.PRICE.TMP,                               
//             DISP=SHR                                                         
//BSU15.EXTPRC DD DSN=BNNN.BSU15.ACAT.EXTPRC.TMP,                               
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(40,20),RLSE),                                        
//             DCB=(LRECL=150,RECFM=FB)                                         
//BSU15.MSDPRC DD DSN=BNNN.BSU15.ACAT.MSDPRC.TMP,                               
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(200,100),RLSE),                                      
//             DCB=BUFNO=50                                                     
//BSU15.NEWPRC DD DSN=BNNN.BSU15.ACAT.PRICE.TMP,                                
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(40,20),RLSE),                                        
//             DCB=(LRECL=80,RECFM=FB)                                          
//BR140101.SYSUT001 DD DUMMY                                                    
//*                                                                             
//STEP20 EXEC BSU20,                                                            
//             ACR20='ACR=N',                                                   
//             CLNT=NNN,                                                        
//             GEN='(0)',                                                       
//             BYP20=BYPASS,                                                    
//             HNB=BNNN                                                         
//*                                                                             
//SORT20.SORTIN DD DSN=BNNN.BSU16.ACATSRTR.TMP,DISP=SHR                         
//SORT20.SORTOUT DD DSN=BNNN.BSU20.ACATSRTR.SORT.TMP,                           
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=(LRECL=795,RECFM=VB)                                         
//BSU20.SRTRIN DD DSN=BNNN.BSU20.ACATSRTR.SORT.TMP,                             
//         DISP=SHR                                                             
//BSU20.PRCIN   DD DSN=BNNN.BSU15.ACAT.MSDPRC.TMP,DISP=SHR                      
//BSU20.TEMP    DD DUMMY                                                        
//BSU20.WIPEPRC DD DUMMY                                                        
//BSU20.EXTPRC  DD DSN=BNNN.BSU20.ACAT.EXTPRC(+1),                              
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(40,20),RLSE),                                        
//             DCB=GDG                                                          
//BSU20.MSDPRC  DD DSN=BNNN.BSU20.ACAT.MSDPRC(+1),                              
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(200,100),RLSE),                                      
//             DCB=(GDG,BUFNO=50)                                               
//BSU20.PRICE   DD DSN=BNNN.BSU20.ACAT.PRICE(+1),                               
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(40,20),RLSE),                                        
//             DCB=GDG                                                          
//BSU20.SRTROUT DD DUMMY                                                        
//BR140101.SYSUT001 DD DSN=BNNN.BMD11.ACATSRTR.TMP,                             
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT002 DD DSN=BNNN.BSU09B.ACATSRTR.TMP,                            
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT003 DD DSN=BNNN.BSU16.ACATSRTR.TMP,                             
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT004 DD DSN=BNNN.BSU15A.ACAT.PRICE.TMP,                          
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT005 DD DSN=BNNN.BSU15.ACAT.PRICE.TMP,                           
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT006 DD DSN=BNNN.BSU20.ACATSRTR.SORT.TMP,                        
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT007 DD DSN=BNNN.BSU15.ACAT.EXTPRC.TMP,                          
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
//BR140101.SYSUT008 DD DSN=BNNN.BSU15.ACAT.MSDPRC.TMP,                          
//  DISP=(MOD,DELETE),UNIT=BATCH,SPACE=(CYL,(1,1),RLSE)                         
