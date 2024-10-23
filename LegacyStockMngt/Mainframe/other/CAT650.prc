//CAT650  PROC HNB=,                      *O/P .CAT650.FILES      GDG *         
//             HNB1='BZZZ',               *I/P .CAT650.ACATPEND   GDG *         
//             NTWRGFL='NULLFILE',        * BNW50.NTWREGOP       VSAM *         
//             NTWAMST='NULLFILE',        * NTWIO ACCOUNT FILES  VSAM *         
//             STREAM=,                   *1 BYTE BATCH STREAM ID     *         
//             STREAM2=,                  *3 BYTE BATCH STREAM ID     *         
//             CAGEHDR=Y,                 *CREATE CAGE HEADER RECORDS           
//             OVRDPRM=N,                 *BYPASS ABENDS IN CAT650              
//             NAV=,                                                            
//             EXTR=ACATPEND,             *ACATPEND OR ACATCAGE FILE            
//             IPT=IPT,                   *BOOKING OUTPUT FILE VERSION          
//             RPTPI=RPTPI,               *BOOKING OR CAGE REPORT DSN           
//             CAGEFL=,                   *'DUMMY,' TO NOT CREATE CAGE          
//             P2FL=,                     *'DUMMY,' TO NOT CREATE P2            
//             OFUND='DUMMY,',            *'DUMMY,' TO NOT FUND SERV UPD        
//             ROLLOVR='DUMMY,',          *'DUMMY,' TO NOT CRE ROLLOVER         
//             TYP2CSH='DUMMY,',          *'DUMMY,' TYPE2 CASH REPORT           
//             B1FIL='BZZZ.B1FL',                                               
//             GDG='GDG,',                                            *         
//             GEN='(0)',                 *I/P                        *         
//             GENP1='(+1)',              *O/P                        *         
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             SPACE1='(CYL,(5,10),RLSE)', *O/P .CAT650SP.ACATPEND GDG *        
//             SPACE2='(CYL,(5,10),RLSE)', *O/P .CAT650.P2BKPG   GDG *          
//             SPACE3='(CYL,(5,10),RLSE)', *O/P .CAT650.T3RDFL   GDG *          
//             SPACE4='(CYL,(5,10),RLSE)', *O/P .CAT650.CAG2FL   GDG *          
//             SPACE5='(CYL,(5,10),RLSE)', *O/P .CAT650.CAGE13   GDG *          
//             SPACE6='(CYL,(5,10),RLSE)', *O/P .CAT650.XSTLPI   GDG *          
//             PRNGFL='NULLFILE',                                               
//             BRKRFL='SZ.ZZZ.CMT07.BROKER',                                    
//             MSDFIL='POVZ.PMSD.BMS90.MSDFILE',                                
//             MSDXRF='POVZ.PMSD.BMS90.MSDXRF',                                 
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             BILFIL='BB.ZZZ.XBILL.BILLFL',                                    
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             TMP='.TMP',                                                      
//             TMP2='TMP',                                                      
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//*                                                                             
//* CAT650 IS DRIVEN BY CL=, B1 OPTIONS, AND EXTRACT FILE FROM CAT65ODB         
//*                                                                             
//*     READS CURRENT DAYS ACAT PEND FILE FROM CAT650DB / SORT / SPLIT          
//*     WRITES P2BKPG FILE OF SETTLED ACAT ITEMS                                
//*     WRITES CAGE3 T3RDFL/T4RDFL NON-CNS & REJECTED FUND/SERV ITEMS           
//*     WRITES CAGE2 FILE OF SELECTED ACAT INFO                                 
//*     WRITES CAGE FILE OF SELECTED ACAT INFO (FORMERLY CAT13 STUFF)           
//*     WRITES COMBINATION XSTLPI P2 REPORT/EXCEPTION REPORT TO TRAC            
//*********************************************************************         
//*                                                                             
//*********************************************************************         
//*  SPLIT THE EXTRACT FILE BY BATCH STREAM.                                    
//*********************************************************************         
//*                                                                             
//CAT650SP EXEC PGM=CAT650SP,                                                   
//             PARM=&STREAM                                                     
//*                                                                             
//B1FIL    DD  DSN=&B1FIL,                                    I/P               
//             DISP=SHR                                                         
//*                                                                             
//IPZZZ     DD  DSN=&HNB1..CAT650DB.&EXTR&GEN,                I/P               
//             DISP=SHR                                                         
//*                                                                             
//OPSTM1   DD DSN=&HNB..CAT650SP.&EXTR.&TMP&GENP1,                              
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=&UNIT,                                                          
//         SPACE=&SPACE1,                                                       
//         DCB=(&GDG.RECFM=VB,LRECL=1004,BLKSIZE=27998)                         
//OPSTM2   DD DUMMY                                                             
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
//CAT650    EXEC PGM=CAT650,                                                    
//             PARM='&STREAM,,,&CAGEHDR,&OVRDPRM,&EXTR',                        
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//*                                                                             
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//*                                                                             
//IPEND     DD  DSN=&HNB..CAT650SP.&EXTR.&TMP&GENP1,            I/P             
//             DISP=SHR                                                         
//*                                                                             
//IMFPEND   DD  DSN=&HNB..CAT660.ACATPEND&GEN,            I/P                   
//             DISP=SHR                                                         
//*                                                                             
//PRNGFL   DD  DSN=&PRNGFL,                                     I/P             
//             DISP=SHR                                                         
//*                                                                             
//NTWREGOP DD  DSN=&NTWRGFL,                                    I/P             
//             AMP=('BUFNI=5,BUFND=5'),                                         
//             DISP=SHR                                                         
//NTWMASTV DD  DSN=&NTWAMST,DISP=SHR,                           I/P             
//             AMP=('BUFND=2,BUFNI=15')                                         
//NTWTRANV DD  DSN=&NTWAMST,DISP=SHR,                           I/P             
//             AMP=('BUFND=2,BUFNI=15')                                         
//NTWPENDV DD  DSN=&NTWAMST,DISP=SHR,                           I/P             
//             AMP=('BUFND=2,BUFNI=15')                                         
//*                                                                             
//BRKRFL   DD  DSN=&BRKRFL,                                     I/P             
//             DISP=SHR                                                         
//*                                                                             
//ACATBRKR DD  DSN=&HNB1..CATPPL.BROKER&GEN,                    I/P             
//             DISP=SHR                                                         
//*                                                                             
//FIDMSD   DD  DSN=&MSDFIL,                                     I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=20,BUFND=5'                                           
//*                                                                             
//FIDXRF   DD  DSN=&MSDXRF,                                     I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=20,BUFND=5'                                           
//*                                                                             
//FIDCLT    DD DSN=&MSDCLT,                                     I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//*                                                                             
//FIDMSS   DD  DSN=BB.&STREAM2..MEMO.MSS,                       I/P             
//             DISP=SHR                                                         
//*                                                                             
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,                         I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFND=12,BUFNI=2')                                         
//*                                                                             
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,                         I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFND=12,BUFNI=2')                                         
//*                                                                             
//PSSETTLE DD  &CAGEFL.DSN=&HNB..CAT580SP.POST.STTL(0),        I/P              
//             DISP=SHR                                                         
//*                                                                             
//P2BKPG   DD  &P2FL.DSN=&HNB..CAT650.P2&IPT..&TMP2&GENP1,     O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE2,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=120)                           
//*                                                                             
//OFUND    DD  &OFUND.DSN=&HNB..CAT650.ACATFUND&GENP1,         O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE1,                                                   
//             DCB=(&GDG.RECFM=VB,LRECL=1004,BLKSIZE=27998)                     
//*                                                                             
//T3RDFL   DD  &CAGEFL.DSN=&HNB..CAT650.T3RDFL.&TMP2&GENP1,    O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE3,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=200)                           
//*                                                                             
//CAG2FL   DD  &CAGEFL.DSN=&HNB..CAT650.CAG2FL&GENP1,          O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE4,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=30)                            
//*                                                                             
//CAGE13   DD  &CAGEFL.DSN=&HNB..CAT650.CAGE13&GENP1,           O/P             
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE5,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=60)                            
//*                                                                             
//XSTLPI   DD  DSN=&HNB..CAT650.&RPTPI&GENP1,                                   
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE6,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FBA,LRECL=143)                          
//*                                                                             
//ROLL866  DD  &ROLLOVR.DSN=&HNB..CAT650.ROLLOVER&GENP1,        O/P             
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE5,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=80)                            
//*                                                                             
//TYP2CSH  DD  &TYP2CSH.DSN=&HNB..CAT650.TYPE2.CASH&GENP1,        O/P           
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE5,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=250)                           
//*                                                                             
//BILLFL   DD  DSN=&BILFIL,                                     O/P             
//             DISP=SHR                                                         
//*                                                                             
//BILLOG   DD  DSN=&BILLOG,                                     O/P             
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
//CAT650P2  EXEC PGM=CAT650P2                                                   
//*                                                                             
//INP2     DD  &P2FL.DSN=&HNB..CAT650.P2&IPT..&TMP2&GENP1,     I/P              
//             DISP=SHR                                                         
//OUTP2    DD  &P2FL.DSN=&HNB..CAT650.P2&IPT&GENP1,            O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE2,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=120)                           
//*                                                                             
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
//*******DELETE TEMP DATASETS*******                                            
//BR140101 EXEC PGM=IEFBR14                                                     
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSUT001 DD DSN=&HNB..CAT650SP.&EXTR.&TMP&GENP1,                              
//             DISP=(MOD,DELETE)                                                
//SYSUT002 DD  &P2FL.DSN=&HNB..CAT650.P2&IPT..&TMP2&GENP1,                      
//             DISP=(MOD,DELETE)                                                
