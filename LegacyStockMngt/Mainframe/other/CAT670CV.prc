//CAT670CV PROC CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB          *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB=,                      *O/P .CAT650.FILES      GDG *         
//             GDG='GDG,',                                            *         
//             GEN='(0)',                 *I/P                        *         
//             GENP1='(+1)',              *O/P                        *         
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             SPACE1='(CYL,(5,10),RLSE)', *O/P .CAT670.RET      GDG *          
//             SPACE2='(CYL,(5,10),RLSE)', *O/P .CAT670.P2BKPG   GDG *          
//             SPACE3='(CYL,(5,10),RLSE)', *O/P .CAT670.TACT     GDG *          
//             TMP=TMP,                                                         
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//* ACAT FEES, TYPE3 BALANCE MOVEMENT AND FRACTIONAL QTY LIQUIDATION.           
//* READ P2 EXTRACTS FROM CAT820 (PRIOR DAY) AND TIF THESE RECORDS              
//*    BASED ON SETTLEMENT DATE.                                                
//*********************************************************************         
//*                                                                             
//CAT670 EXEC PGM=CAT670,                                                       
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//*                                                                             
//P2WRAPI  DD DSN=&HNB..CAT820.RET&GEN,                                         
//         DISP=SHR                                                             
//*                                                                             
//P2WRAPO  DD DSN=&HNB..CAT670.RET.&TMP&GENP1,                                  
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=&UNIT,                                                          
//         SPACE=&SPACE1,                                                       
//         DCB=(&GDG.RECFM=VB,LRECL=644)                                        
//*                                                                             
//P2OUT    DD DSN=&HNB..CAT670.P2FEE.TMP&GENP1,                                 
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=&UNIT,                                                          
//         SPACE=&SPACE2,                                                       
//         DCB=(&GDG.RECFM=FB,LRECL=120)                                        
//*                                                                             
//TACT     DD DSN=&HNB..CAT670.TACTL&GENP1,                                     
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=&UNIT,                                                          
//         SPACE=&SPACE3,                                                       
//         DCB=(&GDG.RECFM=VB,LRECL=8004)                                       
//*                                                                             
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
//CATP2CV   EXEC PGM=CATP2CV                                                    
//*                                                                             
//INP2     DD  DSN=&HNB..CAT670.P2FEE.TMP&GENP1,         I/P                    
//             DISP=SHR                                                         
//AUXFILE  DD DSN=BB.ZZZ.CL010.ACAT.AUXFILE,DISP=SHR                            
//OUTP2    DD  DSN=&HNB..CAT670.P2FEE&GENP1,             O/P                    
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE2,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=120)                           
//OUTP2CV  DD  DSN=&HNB..CAT670.CVFEE&GENP1,             O/P                    
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
//SYSUT001 DD DSN=&HNB..CAT670.P2FEE.TMP&GENP1,                                 
//             DISP=(MOD,DELETE)                                                
//*                                                                             
//*********************************************************************         
//* SORT CAT670.RET FILE IN CLIENT/ACAT SEQUENCE                                
//*********************************************************************         
//SORT10  EXEC PGM=SORT,                                                        
//             REGION=4M,                                                       
//             PARM='SIZE=4M,MSG=AP'                                            
//SORTIN    DD DSN=&HNB..CAT670.RET.&TMP&GENP1,                                 
//             DISP=(OLD,DELETE,KEEP),DCB=BUFNO=5                               
//SORTOUT   DD DSN=&HNB..CAT670.RET&GENP1,                                      
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE1,                                                   
//             DCB=(&GDG.BUFNO=5)                                               
//SORTLIST  DD SYSOUT=&PRTCL1                                                   
//*                                                                             
//* RECORD TYPE=V                                                               
//* SORT FIELDS=(05,3,CH,A,16,14,CH,A)                                          
//SYSIN     DD DSN=BISG.CARDLIB(CAT670S1),                                      
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//*********************************************************************         
//* SORT CAT820.ID.RET FILE IN CLIENT/ACAT SEQUENCE                             
//*********************************************************************         
//SORT20  EXEC PGM=SORT,                                                        
//             REGION=4M,                                                       
//             PARM='SIZE=4M,MSG=AP'                                            
//SORTIN    DD DSN=&HNB..CAT820.ID.RET(0),                                      
//             DISP=SHR,DCB=BUFNO=5                                             
//SORTOUT   DD DSN=&HNB..CAT670.ID.RET&GENP1,                                   
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE1,                                                   
//             DCB=(&GDG.BUFNO=5)                                               
//SORTLIST  DD SYSOUT=&PRTCL1                                                   
//*                                                                             
//* RECORD TYPE=V                                                               
//* SORT FIELDS=(05,3,CH,A,16,14,CH,A)                                          
//SYSIN     DD DSN=BISG.CARDLIB(CAT670S1),                                      
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
