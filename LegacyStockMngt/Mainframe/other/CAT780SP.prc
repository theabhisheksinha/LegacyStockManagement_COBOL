//CAT780SP PROC HNB=,                     *O/P .CAT780.EXTRACT    GDG *         
//             HNB1='BZZZ',               *I/P .CAT780.TAXLOT     GDG *         
//             STREAM=,                   *3 BYTE BATCH STREAM        *         
//             SPLITCL=,                  *SINGLE CLIENT EXTR 'CL###' *         
//             B1FIL='BZZZ.B1FL',                                     *         
//             GDG='GDG,',                                            *         
//             GEN='(0)',                 *I/P                        *         
//             GENP1='(+1)',              *O/P                        *         
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=4M,                                                      
//             SPACE1='(CYL,(5,10),RLSE)', *O/P .CAT780SP.TAXLOT GDG *          
//             RUNDATE=                                                         
//*                                                                             
//*-------------------------------------------------------------------*         
//* CAT780SP IS DRIVEN BY CL=, B1 OPTIONS, AND EXTRACT FILE FROM CAT780         
//*                                                                             
//*     READS CURRENT ACATS/TAXLOT MASTER FILE TO SPLIT EITHER BY               
//*     BATCH STREAM (TLE CLIENTS ONLY) OR BY SPECIFIED CLIENT NUMBER.          
//*-------------------------------------------------------------------*         
//*                                                                             
//CAT780SP  EXEC PGM=CAT780SP,                                                  
//             PARM='&STREAM&SPLITCL',                                          
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//*                                                                             
//B1FIL    DD  DSN=&B1FIL,                                     I/P              
//             DISP=SHR                                                         
//*                                                                             
//ACATTAXI  DD  DSN=&HNB1..CAT780DB.TAXLOT.MASTER&GEN,         I/P              
//             DISP=SHR                                                         
//*                                                                             
//ACATTAXO DD   DSN=&HNB..CAT780SP.&SPLITCL.TAXLOT.REQUEST&GENP1, O/P           
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE1,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=1000)                          
//*                                                                             
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
