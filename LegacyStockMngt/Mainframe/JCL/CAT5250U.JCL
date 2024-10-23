//CAT5250U JOB (BU1P,DY00),'ACATS ASCENDIS      ',CLASS=1,MSGCLASS=W,           
//         USER=BU1P,PRTY=15,SECLABEL=BISG                                      
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* THIS JOB RUNS FIVE TIMES A DAY TRIGGERED BY CAT5110U              *         
//*********************************************************************         
//*********************************************************************         
//*CAT525: CREATE EXCEPTION FILE FOR ASCENDIS                                   
//*CAT525: MUST RUN BEFORE CAT500A                                              
//*********************************************************************         
//STEP20  EXEC CAT525,                                                          
//             STREAM='U',                * STREAM INDICATOR          *         
//             HNB1='BUUU',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB2='BUUU',               *O/P .CAT525.EXCP       GDG *         
//             RUNDATE='RERUN.EARLY.'                                           
//*********************************************************************         
//*CAT500A/CAT501:EXTRACT ACATS TIF AND ASSETS CYCLE FEED FOR ASCENDIS          
//*********************************************************************         
//STEP10  EXEC CAT500A,                                                         
//             HNB=BUUU,                                                        
//             HNB1=SU.UUU,              *I/P NTWREGOP, NTWMAST,MFEXBR*         
//             HNB2=BUUU,                *O/P CAT500.ACATACTF.ASCENDIS*         
//             STRM1=U,                                                         
//             STRM2=UUU                                                        
//*********************************************************************         
//*CAT825: EXTRACT/SPLIT ONE CLIENT FOR ASCENDIS FTP                            
//*********************************************************************         
//STEP30  EXEC CAT825,                                                          
//             CLIENT='0010',             *CLIENT NUMBER (4 BYTES)    *         
//             CLEARNO='0158',            *NSCC BROKER CLEARING NBR   *         
//             BYP1=0,                    *1=BYPASS DATE CHECK        *         
//             BYP2=0,                    *1=BYPASS FILE CHECK        *         
//             JOBNAME='CAT525  ',        *JOBNAME=CAT525   /CAT825   *         
//             DUMEXCP2=,                                                       
//             DUMEXCP3=,                                                       
//             INWHLD='BUUU.CAT519.WHLD(+0)',                                   
//             INEXCP='BUUU.CAT525.EXCP(+1)',                                   
//             INEXCP2='BUUU.CAT518.EXCP(+0)',                                  
//             INEXCP3='BUUU.CAT519.EXCP(+0)',                                  
//             INMATH='BUUU.CAT821.ID.MATH(+0)',                                
//             INNSCC='BUUU.CAT500A.NSCCIN.ASCENDIS(+1)',                       
//             OTWHLD='BUUU.CAT525.WHLD.C010.ASCENDIS(+1)',                     
//             OTEXCP='BUUU.CAT525.EXCP.C010.ASCENDIS(+1)',                     
//             OTMATH='BUUU.CAT525.MATH.C010.ASCENDIS(+1)',                     
//             OTNSCC='BUUU.CAT525.NSCC.C010.ASCENDIS(+1)',                     
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE1='(CYL,(01,01),RLSE)', *O/P WHLD                 *         
//             SPACE2='(CYL,(01,01),RLSE)', *O/P EXCP                 *         
//             SPACE3='(CYL,(01,01),RLSE)', *O/P MATH                 *         
//             SPACE4='(CYL,(01,01),RLSE)'  *O/P NSCC                 *         
//*********************************************************************         
//*EVENT TRIGGER: TRIGGER THE FTP JOBS BASED ON CYCLE NBR(COND CODE)            
//*********************************************************************         
//*  TRIGGER CYCLE 1 JOBS                                                       
//STEP41   EXEC PGM=EQQEVPGM,COND=(1,NE,STEP30.CAT825)                          
//EQQMLIB   DD  DISP=SHR,DSN=SYS1.SEQQMSG0                                      
//EQQMLOG   DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
SRSTAT 'CAT5250U.CAT5E1XU' SUBSYS(OPCT) AVAIL(YES)                              
//*                                                                             
//*  TRIGGER CYCLE 2 JOBS                                                       
//STEP42   EXEC PGM=EQQEVPGM,COND=(2,NE,STEP30.CAT825)                          
//EQQMLIB   DD  DISP=SHR,DSN=SYS1.SEQQMSG0                                      
//EQQMLOG   DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
SRSTAT 'CAT5250U.CAT5E2XU' SUBSYS(OPCT) AVAIL(YES)                              
//*                                                                             
//*  TRIGGER CYCLE 3 JOBS                                                       
//STEP43   EXEC PGM=EQQEVPGM,COND=(3,NE,STEP30.CAT825)                          
//EQQMLIB   DD  DISP=SHR,DSN=SYS1.SEQQMSG0                                      
//EQQMLOG   DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
SRSTAT 'CAT5250U.CAT5E3XU' SUBSYS(OPCT) AVAIL(YES)                              
//*                                                                             
//*  TRIGGER CYCLE 4 JOBS                                                       
//STEP44   EXEC PGM=EQQEVPGM,COND=(4,NE,STEP30.CAT825)                          
//EQQMLIB   DD  DISP=SHR,DSN=SYS1.SEQQMSG0                                      
//EQQMLOG   DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
SRSTAT 'CAT5250U.CAT5E4XU' SUBSYS(OPCT) AVAIL(YES)                              
//*                                                                             
//*  TRIGGER CYCLE 5 JOBS                                                       
//STEP45   EXEC PGM=EQQEVPGM,COND=(5,NE,STEP30.CAT825)                          
//EQQMLIB   DD  DISP=SHR,DSN=SYS1.SEQQMSG0                                      
//EQQMLOG   DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
SRSTAT 'CAT5250U.CAT5E5XU' SUBSYS(OPCT) AVAIL(YES)                              
//*                                                                             
