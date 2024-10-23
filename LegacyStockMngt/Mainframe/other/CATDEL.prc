//CATDEL   PROC CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *        
//             DB2SYS='DB2PROD.GROUP ',    *DB2 SYSTEM DB2PROD/DB2TEST *        
//             PLAN='ACTBTCH',             *DB2 PLAN CARDLIB MEMBER    *        
//             CLIENT='ALL ',     DEFAULT DELETE ALL, CL=1 USE '0001'           
//             VINITRNF=Y,        DELETE INITIAL TRANSFERS                      
//             VINITAST=Y,        DELETE INITIAL ASSETS                         
//             VTRNFR=Y,          DELETE ACTIVE TRANSFERS                       
//             VFNDRGST=Y,        DELETE FUND REGISTRATIONS                     
//             VRSDACC=Y,         DELETE RESTRICTED RESIDUAL CREDITS            
//             VRSTSEC=Y,         DELETE RESTRICTED SECURITIES                  
//             VALERT=Y,          DELETE ALERT MESSAGES                         
//             VTRNHSTY=Y,        DELETE TRANSFER HISTORY                       
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M                                                       
//*                                                                             
//*                                                                     00529800
//*********************************************************************         
//*    DELETE ALL OR SPECIFIC ACAT DB2 CLIENTS FROM DB2 TABLES.                 
//*********************************************************************         
//*                                                                     00002   
//CATDEL EXEC PGM=CATDEL,                                               00051002
//        REGION=&REGSIZE,                                                      
//        PARM='&CLIENT,&VINITRNF,&VINITAST,&VTRNFR,&VFNDRGST,&VRSDACC,         
//             &VRSTSEC,&VALERT,&VTRNHSTY'                                      
//STEPLIB   DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNLOAD,                                           
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
