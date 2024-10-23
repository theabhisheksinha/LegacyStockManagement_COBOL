//CAT580PS PROC HNB=,                     *O/P .CAT580PS.FILES    GDG *         
//             HNB1='BZZZ',               *I/P .CAT580PS.POST.STTL GDG*         
//             STREAM=,                   *1 BYTE BATCH STREAM ID     *         
//             B1FIL='BZZZ.B1FL',                                               
//             GDG='GDG,',                                            *         
//             GENP1='(+1)',              *I/P AND O/P                *         
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             SPACE1='(CYL,(2,5),RLSE)'  *O/P .CAT580SP.POST.STTL GDG*         
//*                                                                             
//*********************************************************************         
//*  SPLIT THE EXTRACT FILE BY BATCH STREAM.                                    
//*********************************************************************         
//CAT650SP EXEC PGM=CAT650SP,                                                   
//             PARM=&STREAM                                                     
//*                                                                             
//B1FIL    DD  DSN=&B1FIL,                                    I/P               
//             DISP=SHR                                                         
//*                                                                             
//IPZZZ     DD  DSN=&HNB1..CAT580PS.POST.STTL&GENP1,          I/P               
//             DISP=SHR                                                         
//*                                                                             
//OPSTM1   DD DSN=&HNB..CAT580SP.POST.STTL&GENP1,                               
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=&UNIT,                                                          
//         SPACE=&SPACE1,                                                       
//         DCB=(&GDG.RECFM=VB,LRECL=1004)                                       
//OPSTM2   DD DUMMY                                                             
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
