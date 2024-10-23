//CAT670NS PROC HNB=,                     *I/O .CAT670NS.FILES    GDG *         
//             STREAM=,                   *1 BYTE STREAM ID                     
//             SRMAS=NULLFILE,                                                  
//             NAV=,                                                            
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             B1FIL='BZZZ.B1FL',                                               
//             GDG='GDG,',                                            *         
//             GEN='(0)',                 *I/P                        *         
//             GENP1='(+1)',              *O/P                        *         
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=20M,                                                     
//             SPACE1='(CYL,(2,5),RLSE)', *O/P .CAT670NS.P2       GDG *         
//             RUNDATE=                                                         
//*                                                                             
//CAT670NS  EXEC PGM=CAT670NS,                                                  
//             REGION=&REGSIZE,                                                 
//             PARM=&STREAM                                                     
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//*                                                                             
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//*                                                                             
//PENDFLI   DD  DSN=&HNB..CAT650SP.ACATPEND&GEN,                I/P             
//             DISP=SHR                                                         
//*                                                                             
//P2ID      DD  DSN=&HNB..CAT820.ID.P2FEE&GEN,                  I/P             
//             DISP=SHR                                                         
//*                                                                             
//FIDSRREF DD DSN=BB.ZZZ.BSU10A.SRXREF,DISP=SHR                 I/P             
//FIDVMSR  DD  DSN=&SRMAS,                                      I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=40,BUFND=5')                                         
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,                         I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFND=12,BUFNI=2')                                         
//*                                                                             
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,                         I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFND=12,BUFNI=2')                                         
//*                                                                             
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,               I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDCLT,                                     I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//*                                                                             
//P2BKPG   DD  DSN=&HNB..CAT670NS.FEE&GENP1,                    O/P             
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE1,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=120)                           
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
