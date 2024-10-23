000001* PDX    - CAT754   C0359500 10/30/14 14:46:48 TBLAMUR            00001007
      * LRM010 SSR 100867 CREATE TOA FROM/TO SPAD WHEN TRANSFER WAS     00001101
      *   REJECTED AND RE-SUMITTED WITH CHANGED ACCT NBR.               00001200
000001* PDX    - CAT754   C0348882 12/06/13 06:50:05 TBCHKOP            00001300
      * CSG001 SSR  91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.         00001400
000001* PDX    - CAT754   C0324918 04/03/12 13:47:31 TBLAMUR            00001500
      * LRM009 SSR 83069 REMOVE QA LOGIC FOR PROCESSING TDY MINUS 1.    00001600
000001* PDX    - CAT754   C0280228 04/27/09 10:29:15 TBLAMUR            00001700
      * LRM008 PMR 3028399 DTSEARCH ABEND FROM 999 DAYS IN B1,          00001800
      *    FORCE 99999999 IN EXP DATE (ALSO HARD CODE FOR 999 DAYS)     00001900
000001* PDX    - CAT754   C0272583 01/11/09 11:27:02 TBLAMUR            00002000
      * LRM007 SSR 61164 POSITION TRANSFER FUND(PTF) NEW B1(434745)     00002100
000001* PDX    - CAT754   C0245386 03/21/07 11:46:41 TBLAMUR            00002200
      * LRM006* SSR 49202 NEW B1 434698 TO CREATE 90 DAY TRADE          00002300
      * RESTRICTION SPAD 9203 FOR RCVR SIDE 90DT MEMO AND               00002400
      * CREATE 9200 SPAD FOR REGT.                                      00002500
000001* PDX    - CAT754   C0222833 08/08/05 10:40:59 TBDOJUN            00003000
      * DJ0004 SSR 0041110 SPAD FIX FOR PTR 600 STATUS                  00020000
      * DJ0004 SSR 0043008 CREATE STL CLOS ONLY ON NIGHT BEFORE SETTLE  00030000
000001* PDX    - CAT754   C0212229 01/10/05 07:51:48 TBDOJUN            00040000
      * DJ0003 SSR 0039558 ADD EXPIRATION DATE: PTR,PTD,RCR,RCL,MFC,FRV 00050000
      * DJ0003 NEW B1: 434700(PTR) 434701(PTD) 434702(RCR)              00060000
      *              : 434703(RCL) 434704(MFC) 434705(FRV)              00070000
      * DJ0003 CHANGE PIC 9 TO PIC 9 COMP-3 FOR MIPS REDUCTION.         00080000
      * LRM005 SSR 0039739 DO NOT DISPLAY CLOSED MESSAGE ON SPAD        00090000
      *        FOR NON-STANDARD TRANSFERS THAT HAVE NOT YET SETTLED.    00100000
000001* PDX    - CAT754   C0210654 10/27/04 15:23:49 TBLAMUR            00110000
      * LRM005 SSR 0036936 FIX SEQUENCE NUMBER FOR MULTIPLE TIFS        00120000
      * LRM005 SSR 0024798 CREATE TOA MESSAGES ON DAY 1 NOT IN REQ      00130000
000001* PDX    - CAT754   C0192286 06/25/03 15:15:13 TBEDTAK            00140000
      * ET0001 - CREATE "TOA TO" (DLVR) SPAD MSG WITH EXPIRATION DATE OF00150000
      * ET0001   99/99/99 TO CAUSE THE MESSAGE TO REMAIN INDEFINITELY.  00160000
000001* PDX    - CAT754   C0184969 01/23/03 09:16:03 TBLAMUR            00170000
      * LRM004 SSR 0024350 USE VPRTCPPF FOR MISSING BROKER NAMES        00180000
000001* PDX    - CAT754   C0179727 12/04/02 13:34:03 TBLAMUR            00190000
      * LRM003 0026952 CREATE RESCIND BLOCK SPAD MESSAGES               00200000
000001* PDX    - CAT754   C0155513 03/12/01 07:55:08 TBDOJUN            00210000
000001* PDX    - CAT754   C0141030 04/17/00 15:30:44 TBLAMUR            00220000
000001* PDX    - CAT754   C0139917 04/03/00 11:34:46 TBLAMUR            00230000
000001* PDX    - CAT754   C0129247 08/16/99 10:25:21 TBDOJUN            00240000
      * DJ0002 - MOVE STTLM-DT TO MSG FOR CLOSED TRANSFERS              00250000
000001* PDX    - CAT754   C0121265 02/02/99 22:49:41 TBYOHON            00260000
000001* PDX    - CAT754   C0120779 01/24/99 18:11:09 TBYOHON            00270000
000001* PDX    - CAT754   C0119783 12/28/98 11:19:31 TBLAMUR            00280000
000001* PDX    - CAT754   C0117772 12/26/98 15:21:37 TBYOHON            00290000
       IDENTIFICATION DIVISION.                                         00300000
       PROGRAM-ID. CAT754.                                              00310000
      *                                                                 00320000
       DATE-WRITTEN. NOV 1998.                                          00330000
      *---------------------------------------------------------------* 00340000
      *REMARKS.                                                       * 00350000
      *  CAT754 IS COPIED FROM CAT24.                                 * 00360000
      *  THIS PROGRAM - CREATES SCRATCH PAD ENTRIES FILE FOR THE      * 00370000
      *                 SPAD SYSTEM. THE PRIMARY INPUT IS THE DB2     * 00380000
      *                 ACTIVE TIFS.  ADDITIONAL INPUTS ARE THE       * 00390000
      *                 B1 CARDS FOR ACCOUNT SELECTION AND THE CMT07  * 00400000
      *                 BROKER FILE WHICH CONTAINS THE BROKER NAME.   * 00410000
      *  PROGRAM MODELLED FROM CAT24 FOR ACATS REWRITE.               * 00420000
      *                                                               * 00430000
      *               - THE OUTPUT FILE IS IN CLIENT, BRANCH AND      * 00440000
      *                 ACCOUNT NUMBER SEQUENCE.                      * 00450000
      *                                                               * 00460000
C05762*  105762 - PRODUCE 9348 SCRATCH PAD WITH 30 DAY EXPIRATION     * 00470000
      *---------------------------------------------------------------* 00480000
           EJECT                                                        00490000
       ENVIRONMENT DIVISION.                                            00500000
       INPUT-OUTPUT SECTION.                                            00510000
                                                                        00520000
       FILE-CONTROL.                                                    00530000
                                                                        00540000
           SELECT  BROKER-FILE         ASSIGN  TO  BRKRFL               00550000
                                 ORGANIZATION  IS  INDEXED              00560000
                                       ACCESS  IS  DYNAMIC              00570000
                                   RECORD KEY  IS  BROKER-KEY           00580000
                                  FILE STATUS  IS  BROKER-FILE-STATUS.  00590000
                                                                        00600000
           SELECT  ACAT-SPAD-FILE      ASSIGN  TO  UT-S-SPADFL.         00610000
                                                                        00620000
           SELECT  SORT-FILE           ASSIGN  TO  SORTWK01.            00630000
                                                                        00640000
           EJECT                                                        00650000
       DATA DIVISION.                                                   00660000
                                                                        00670000
       FILE SECTION.                                                    00680000
                                                                        00690000
       FD  BROKER-FILE.                                                 00700000
                                                                        00710000
       01  BROKER-REC.                                                  00720000
           05  BROKER-KEY.                                              00730000
               10  BROKER-EXCHANGE     PIC X.                           00740000
               10  BROKER-BADGE        PIC X(4).                        00750000
               10  FILLER              PIC X(6).                        00760000
           05  FILLER                  PIC X(12).                       00770000
           05  BROKER-NAME             PIC X(33).                       00780000
           05  FILLER                  PIC X(24).                       00790000
                                                                        00800000
       FD  ACAT-SPAD-FILE                                               00810000
           LABEL RECORDS STANDARD                                       00820000
           RECORDING MODE IS V                                          00830000
           RECORD IS VARYING                                            00840000
           BLOCK CONTAINS 0 RECORDS.                                    00850000
       01  ACAT-SPAD-REC-1             PIC X(25).                       00860000
       01  ACAT-SPAD-REC-2             PIC X(88).                       00870000
       01  ACAT-SPAD-REC-3             PIC X(31).                       00880000
                                                                        00890000
       SD  SORT-FILE.                                                   00900000
       01  SORT-REC.                                                    00910000
           05  S-CLI                   PIC 9(03)  COMP-3.               00920000
           05  S-BR-ACCT               PIC X(10).                       00930000
           05  S-CODE                  PIC 9(03)  COMP-3.               00940000
           05  S-EXP-DTE               PIC X(06).                       00950000
           05  FILLER                  PIC X(68).                       00960000
LRM003     05  S-ACAT-CONTROL-NBR      PIC X(14).                       00970000
           EJECT                                                        00980000
      ***************************************************************** 00990000
       WORKING-STORAGE  SECTION.                                        01000000
      ***************************************************************** 01010000
           COPY PDXIDCOB.                                               01020000
       77  PGM-NAME                         PIC X(06)  VALUE 'CAT754'.  01030000
                                                                        01040000
       77  ABEND-CODE-2000      COMP        PIC S9(4)  VALUE +2000.     01050000
       77  ABEND-CODE-2020      COMP        PIC S9(4)  VALUE +2020.     01060000
       77  ABEND-CODE-2024      COMP        PIC S9(4)  VALUE +2024.     01070000
       77  ABEND-CODE-2028      COMP        PIC S9(4)  VALUE +2028.     01080000
                                                                        01090000
       77  ABEND-CODE-4004      COMP        PIC S9(4)  VALUE +4004.     01100000
       77  ABEND-CODE-4008      COMP        PIC S9(4)  VALUE +4008.     01110000
       77  ABEND-CODE-4012      COMP        PIC S9(4)  VALUE +4012.     01120000
       77  ABEND-CODE-4016      COMP        PIC S9(4)  VALUE +4016.     01130000
       77  ABEND-CODE-4020      COMP        PIC S9(4)  VALUE +4020.     01140000
       77  ABEND-CODE-4024      COMP        PIC S9(4)  VALUE +4024.     01150000
       77  ABEND-CODE-4028      COMP        PIC S9(4)  VALUE +4028.     01160000
                                                                        01170000
       77  ABEND-CODE-8000      COMP        PIC S9(4)  VALUE +8000.     01180000
                                                                        01190000
       77  BROKER-FILE-STATUS                 PIC X(02).                01200000
           88  BRKR-FILE-OK                            VALUE '00'.      01210000
           88  BRKR-OPEN-OK                            VALUE '00' '97'. 01220000
           88  BRKR-ENDFILE                            VALUE '10'.      01230000
                                                                        01240000
       77  ACAT-RECS-CLIENT      COMP-3     PIC S9(9)  VALUE +0.        01250000
       77  ACAT-RECS-TOTAL       COMP-3     PIC S9(9)  VALUE +0.        01260000
                                                                        01270000
       77  B1-SUB                COMP-3     PIC 9(4)    VALUE 0.        01280000
       77  B1-TBL-CNT            COMP-3     PIC 9(4)    VALUE 0.        01290000
       77  MSGNO                 COMP-3     PIC 9(3)    VALUE 0.        01300000
                                                                        01310000
                                                                        01320000
       77  ACAT-TYPE-WRITE                  PIC X(01)  VALUE ' '.       01330000
           88  WRITE-HDR                               VALUE 'H'.       01340000
           88  WRITE-DATA                              VALUE 'D'.       01350000
           88  WRITE-TRLR                              VALUE 'T'.       01360000
                                                                        01370000
DJ0003 77  B1-ENTRY-FOUND-SW                PIC X(01)  VALUE ' '.       01380000
           88  B1-ENTRY-FOUND                          VALUE 'Y'.       01390000
           88  B1-ENTRY-NOT-FOUND                      VALUE 'N'.       01400000
                                                                        01410000
       77  ACAT-FIRST-TIME-SW               PIC X(01)  VALUE 'Y'.       01420000
           88  ACAT-FIRST-TIME                         VALUE 'Y'.       01430000
                                                                        01440000
       77  ACAT-FIRST-WRITE-SW              PIC X(01)  VALUE 'Y'.       01450000
           88  ACAT-FIRST-WRITE                        VALUE 'Y'.       01460000
                                                                        01470000
       77  ACAT-EOF-SW                      PIC X(01)  VALUE ' '.       01480000
           88  ACAT-EOF                                VALUE 'Y'.       01490000
                                                                        01500000
       01  FILLER                        PIC X(08) VALUE 'DB2AREA '.    01510000
       01  DB2-ABEND-WORK-AREA.                                         01520000
           03  WS-NSCC-PEND-IND              PIC X(01)  VALUE SPACES.   01530000
           03  WS-DB2-MESSAGE-AREA.                                     01540000
               05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.01550000
               05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES 01560000
                   INDEXED BY WS-ERROR-INDEX.                           01570000
           03  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80. 01580000
           03  W-DB2-SQLCODE            PIC  ---9.                      01581002
                                                                        01590000
       01  CONTRA-BROKER                PIC X(04) VALUE ' '.            01600000
                                                                        01610000
       01  WS-COUNTERS.                                                 01620000
           05  ACAT-ACPT-RECS           PIC 9(7)   COMP-3  VALUE ZERO.  01630000
           05  ACAT-SPAD-RECS           PIC 9(7)   COMP-3  VALUE ZERO.  01640000
           05  ACAT-SPAD-HDRS           PIC 9(7)   COMP-3  VALUE ZERO.  01650000
           05  ACAT-SPAD-TRLRS          PIC 9(7)   COMP-3  VALUE ZERO.  01660000
DJ0003     05  W-PTD-CNT                PIC 9(7)   COMP-3  VALUE ZERO.  01670000
LRM007     05  W-PTF-CNT                PIC 9(7)   COMP-3  VALUE ZERO.  01671000
DJ0003     05  W-PTR-CNT                PIC 9(7)   COMP-3  VALUE ZERO.  01680000
DJ0003     05  W-RCL-CNT                PIC 9(7)   COMP-3  VALUE ZERO.  01690000
DJ0003     05  W-RCR-CNT                PIC 9(7)   COMP-3  VALUE ZERO.  01700000
DJ0003     05  W-MFC-CNT                PIC 9(7)   COMP-3  VALUE ZERO.  01710000
DJ0003     05  W-FRV-CNT                PIC 9(7)   COMP-3  VALUE ZERO.  01720000
LRM010     05  WS-STTS-110-WIPED        PIC 9(7)   COMP-3  VALUE ZERO.  01721000
                                                                        01730000
       01  DATE-MSG.                                                    01740000
           03  FILLER              PIC X(38)       VALUE                01750000
           'BAD RETURN CODE FROM DTSEARCH         '.                    01760000
           03  FILLER              PIC X(22)       VALUE                01770000
           'DTSEARCH RETURN CDE - '.                                    01780000
           03  DMSG-CDE            PIC 999.                             01790000
                                                                        01800000
           COPY BPDATESC.                                               01810000
           EJECT                                                        01820000
           COPY BHINFO.                                                 01830000
           EJECT                                                        01840000
           COPY BHACAT.                                                 01850000
                                                                        01860000
           EJECT                                                        01870000
       01  ACAT-SPAD-HDR.                                               01880000
           05  FILLER                  PIC X(18) VALUE LOW-VALUES.      01890000
           05  FILLER                  PIC X(05) VALUE 'DATE='.         01900000
           05  SPAD-HDR-DATE           PIC X(08).                       01910000
                                                                        01920000
       01  ACAT-SPAD-REC.                                               01930000
LRM003*COPY SPADEXP3.                                                   01940000
00001 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 01950000
00002 ** SCRATCH PAD RECORD LAYOUT (SPADFILE)                           01960000
00004 *     BUT LAYOUT CODED AS MAXIMUM REC LENGTH 199                  01970000
00005 *                                                                 01980000
00006 *  SCRATCH PAD FILE IS COMPRISED OF FOUR (4) RECORD TYPES.        01990000
00007 *                                                                 02000000
00008 *  1.    CONTROL  REC.       FL(29 BYTES)     LAST UPDATE.        02010000
00009 *                 ID : BYTES 0-23  = X'0'                         02020000
00010 *  2.    KEY      REC.       FL(25 BYTES)     NEXT APPL.THIS KEY  02030000
00011 *                 ID : BYTES 12-22 = X'0'                         02040000
00012 *  3.    MESSAGE  REC.       VL(39/88 BYTES)  MESSAGE.            02050000
00013 *                 ID : BYTES 12-13 = INTERNAL APPL. CODE (PL2)    02060000
00014 *  4.    SECURITY REC.       VL(31/199 BYTES) USER SEC/APPL-IAP   02070000
00015 *                 ID : BYTES 12-15 = SECURITY CODE (CL4)          02080000
00016 *                                                                 02090000
00017 *  FILE KEY IS FIRST 23 BYTES OF RECORD.                          02100000
00018 *                                                                 02110000
           03  SPAD-OLD-REST-OF-RECORD.                                 02120000
00019      05  SPAD-REC.                                                02130000
             07 SPAD-REC-07.                                            02140000
00023          10  SPAD-REC-DATA           PIC X(120).                  02150000
00024 *                                                                 02160000
00025 *  CONTROL REC- REC LENGTH 29 + 4 BYTES RECLEN,KEY = LOW-VALUE    02170000
00026 *                                                                 02180000
00027      05  SPAD-CONTROL-REC            REDEFINES SPAD-REC.          02190000
00029          10  SPC-KEY                 PIC X(23).                   02200000
00030          10  SPC-LAST-PROC-DATE.                                  02210000
00031              15  SPC-LAST-PROC-YY    PIC X(02).                   02220000
00032              15  SPC-LAST-PROC-MM    PIC X(02).                   02230000
00033              15  SPC-LAST-PROC-DD    PIC X(02).                   02240000
00034 *                                                                 02250000
00035 * *                                                               02260000
00036 *  KEY RECORD - REC LENGTH 25 + 4 BYTES RECLEN,REC-ID = LOW-VALUE 02270000
00037 *                                                                 02280000
00038      05  SPAD-KEY-REC                REDEFINES SPAD-REC.          02290000
00040          10  SPK-KEY.                                             02300000
00041              15  SPK-CLT-ID          PIC 9(3)    COMP-3.          02310000
00041              15  SPK-CLT-ID-R REDEFINES SPK-CLT-ID PIC X(2).      02320000
00042              15  SPK-USER-KEY        PIC X(10).                   02330000
00043          10  SPK-REC-ID              PIC X(11).                   02340000
00044          10  SPK-NEXT-AVAIL-APPL-NO  PIC S9(3)   COMP-3.          02350000
00045 *                                                                 02360000
00046 *        END   KEY REC                                            02370000
00047 *                                                                 02380000
00048 * * *                                                             02390000
00049 *                                                                 02400000
00050 *  MESSAGE RECORD -  MAXI REC LENGTH 102 + 4 BYTES RECLEN         02410000
00051 *                                                                 02420000
00052      05  SPAD-MESG-REC               REDEFINES SPAD-REC.          02430000
00054          10  SPAD-MESG-REC-DATA.                                  02440000
                 12 SPAD-OLD-KEY-WITHOUT-MESG-NO.                       02450000
00055              15  SPM-KEY.                                         02460000
00056                  20  SPM-CLT-ID      PIC 9(3)    COMP-3.          02470000
00057                  20  SPM-USER-KEY    PIC X(10).                   02480000
00058              15  SPM-APPL-NO-X.                                   02490000
00059                  20  SPM-APPL-NO     PIC S9(3)   COMP-3.          02500000
00059                  20  SPM-APPL-NO-R REDEFINES SPM-APPL-NO          02510000
                                           PIC X(2).                    02520000
00060              15  SPM-EXP-DATE-CCYYMMDD PIC S9(11) COMP-3.         02530000
                 12 SPAD-MESG-KEY-WITH-MESG-NO.                         02540000
00061              15  SPM-MESG-NO         PIC 9(3).                    02550000
00062              15  SPM-DATE-ENTERED    PIC S9(11) COMP-3.           02560000
00063              15  SPM-TERMINAL-ID     PIC X(4).                    02570000
00063              15  SPM-LOCATION-CODE   PIC X(3).                    02580000
00064              15  FILLER              PIC X(2).                    02590000
00065              15  SPM-MESG.                                        02600000
00066                  20  SPM-MESG-1      OCCURS 50 TIMES              02610000
00067                                      PIC X.                       02620000
LRM003             15  SPM-ACAT-CONTROL-NUMBER   PIC X(14).             02630000
00068 *                                                                 02640000
00069 *        END MESSAGE REC                                          02650000
00070 *                                                                 02660000
00071 * * *                                                             02670000
00072 *                                                                 02680000
00073 *  SECURITY RECORD- MAXI REC LENGTH 199+ 4 BYTES RECLEN           02690000
00074 *                                                                 02700000
00075      05  SPAD-SEC-REC                REDEFINES SPAD-REC.          02710000
00077          10  SPS-KEY.                                             02720000
00078              15  SPS-CLT-ID          PIC 9(3)    COMP-3.          02730000
00079              15  SPS-USER-KEY        PIC X(10).                   02740000
00080          10  SPS-SEC-CODE            PIC X(4).                    02750000
00081          10  SPS-SEC-ID              PIC X(7).                    02760000
00082          10  SPS-APPL-CNT            PIC X(1).                    02770000
00083          10  SPS-APPL-TAB            OCCURS 13 TIMES.             02780000
00084              15  SPS-APPL-CD         PIC X(4).                    02790000
00085              15  SPS-APPL-NO         PIC S9(3)   COMP-3.          02800000
00086              15  SPS-USER-DEL-FLAG   PIC X.                       02810000
00087 *                                                                 02820000
00088 *        END SECURITY REC                                         02830000
00089 *                                                                 02840000
           EJECT                                                        02850000
       01  SPAD-HDR.                                                    02860000
           05  SPH-KEY                 PIC X(12).                       02870000
           05  FILLER                  PIC X(11) VALUE LOW-VALUES.      02880000
           05  FILLER                  PIC X(02) VALUE X'001C'.         02890000
                                                                        02900000
       01  SPAD-TRLR.                                                   02910000
           05  SPT-KEY                 PIC X(12).                       02920000
           05  FILLER                  PIC X(04)  VALUE 'GNRL'.         02930000
           05  FILLER                  PIC X(07)  VALUE LOW-VALUES.     02940000
           05  FILLER                  PIC X(01)  VALUE X'01'.          02950000
           05  FILLER                  PIC X(04)  VALUE 'MRGN'.         02960000
           05  FILLER                  PIC X(02)  VALUE X'000C'.        02970000
           05  FILLER                  PIC X(01)  VALUE LOW-VALUE.      02980000
                                                                        02990000
       01  SPAD-MESSAGE-WORKAREA.                                       03000000
           05  SPAD-FROM-MSG.                                           03010000
               10  FILLER              PIC X(09) VALUE 'TOA FROM '.     03020000
               10  SFM-CONTRA-BKR      PIC X(04) VALUE ' '.             03030000
               10  FILLER              PIC X(01) VALUE ' '.             03040000
               10  SFM-BKR-NAME        PIC X(20) VALUE ' '.             03050000
               10  FILLER              PIC X(01) VALUE ' '.             03060000
               10  SFM-CONTRA-ACCT     PIC X(15) VALUE ' '.             03070000
           05  SPAD-TO-MSG.                                             03080000
               10  FILLER              PIC X(07) VALUE 'TOA TO '.       03090000
               10  STM-CONTRA-BKR      PIC X(04) VALUE ' '.             03100000
               10  FILLER              PIC X(01) VALUE ' '.             03110000
               10  STM-BKR-NAME        PIC X(20) VALUE ' '.             03120000
               10  FILLER              PIC X(01) VALUE ' '.             03130000
               10  STM-CONTRA-ACCT     PIC X(15) VALUE ' '.             03140000
               10  FILLER              PIC X(02) VALUE ' '.             03150000
           05  SPAD-STATUS-MSG.                                         03160000
               10  FILLER              PIC X(11) VALUE 'TOA STATUS '.   03170000
               10  FILLER              PIC X(05) VALUE 'ACAT '.         03180000
               10  SSM-CNTL-NO         PIC X(10) VALUE ' '.             03190000
               10  FILLER              PIC X(01) VALUE ' '.             03200000
               10  SSM-STATUS          PIC X(08) VALUE ' '.             03210000
               10  FILLER              PIC X(01) VALUE ' '.             03220000
DJ0002         10  SSM-STATUS-REDEFINE.                                 03230000
DJ0002             15  SSM-STATUS-STTLM-DT PIC X(08) VALUE ' '.         03240000
DJ0002             15  FILLER              PIC X(06) VALUE ' '.         03250000
DJ0002         10  FILLER REDEFINES SSM-STATUS-REDEFINE.                03260000
DJ0002             15  SSM-STATUS-DAYS     PIC ZZZ.                     03270000
DJ0002             15  FILLER              PIC X(11).                   03280000
           05  SPAD-NON-FUL-STATUS-MSG.                                 03290000
               10  FILLER              PIC X(04) VALUE 'TOA '.          03300000
               10  SRSM-TYPE           PIC X(04) VALUE ' '.             03310000
               10  FILLER              PIC X(01) VALUE ' '.             03320000
               10  SRSM-CONTRA-BRKR    PIC X(04) VALUE ' '.             03330000
               10  FILLER              PIC X(01) VALUE ' '.             03340000
               10  SRSM-TRNFR-TYPE     PIC X(03) VALUE ' '.             03350000
               10  FILLER              PIC X(06) VALUE ' ACAT '.        03360000
               10  SRSM-CNTL-NO        PIC X(10) VALUE ' '.             03370000
               10  FILLER              PIC X(01) VALUE ' '.             03380000
               10  SRSM-STATUS         PIC X(07) VALUE ' '.             03390000
               10  FILLER              PIC X(01) VALUE ' '.             03400000
DJ0002         10  SRSM-STATUS-REDEFINE.                                03410000
DJ0002             15  SRSM-STATUS-STTLM-DT PIC X(08) VALUE ' '.        03420000
DJ0002         10  FILLER REDEFINES SRSM-STATUS-REDEFINE.               03430000
DJ0002             15  FILLER               PIC X(01).                  03440000
DJ0002             15  SRSM-STATUS-DAYS     PIC ZZ.                     03450000
DJ0002             15  FILLER               PIC X(05).                  03460000
           05  SPAD-REJECT-MSG.                                         03470000
               10  FILLER              PIC X(11) VALUE 'TOA REJECT '.   03480000
               10  SRM-REJECT-CODE     PIC X(02) VALUE ' '.             03490000
               10  FILLER              PIC X(06) VALUE ' ACAT '.        03500000
               10  SRM-CNTL-NO         PIC X(10) VALUE ' '.             03510000
               10  FILLER              PIC X(01) VALUE ' '.             03520000
               10  SRM-REJECT-EXPL     PIC X(20) VALUE ' '.             03530000
LRM003     05  SPAD-RESCIND-BLOCK-MSG.                                  03540000
LRM003         10  SRBM-EXPL           PIC X(50) VALUE ' '.             03550000
                                                                        03560000
       01  SPAD-ACCOUNT-WORKAREA.                                       03570000
           05  SPAD-WORK-ACCOUNT.                                       03580000
               10  SPAD-WK-BR          PIC X(3).                        03590000
               10  FILLER              PIC X      VALUE '-'.            03600000
               10  SPAD-WK-ACCT        PIC X(5).                        03610000
               10  FILLER              PIC X      VALUE SPACE.          03620000
                                                                        03630000
       01  SAVE-KEY                    PIC X(20).                       03640000
                                                                        03650000
       01  PREV-KEY                    PIC X(12).                       03660000
                                                                        03670000
       01  BRKR-NAME                   PIC X(20)  VALUE SPACES.         03680000
                                                                        03690000
DJ0002 01  W-STTLM-DT.                                                  03700000
DJ0002     05  W-STTLM-CC              PIC X(2).                        03710000
DJ0002     05  W-STTLM-YY              PIC X(2).                        03720000
DJ0002     05  W-STTLM-D1              PIC X(1).                        03730000
DJ0002     05  W-STTLM-MM              PIC X(2).                        03740000
DJ0002     05  W-STTLM-D2              PIC X(1).                        03750000
DJ0002     05  W-STTLM-DD              PIC X(2).                        03760000
                                                                        03770000
LRM001 01  WS-STTLM-DT.                                                 03780000
LRM001     05  WS-STTLM-CC             PIC X(2).                        03790000
LRM001     05  WS-STTLM-YY             PIC X(2).                        03800000
LRM001     05  WS-STTLM-MM             PIC X(2).                        03810000
LRM001     05  WS-STTLM-DD             PIC X(2).                        03820000
                                                                        03830000
LRM001 01  WS-DB2-PROCESS-DT           PIC X(10).                       03840000
LRM001 01  WS-DB2-PROCESS-DT-CCYYMMDD.                                  03850000
LRM001     05  WS-DB2-PROCESS-DT-CCYY  PIC X(4).                        03860000
LRM001     05  WS-DB2-PROCESS-DT-MM    PIC X(2).                        03870000
LRM001     05  WS-DB2-PROCESS-DT-DD    PIC X(2).                        03880000
                                                                        03890000
LRM001 01  WS-PRIOR-PROC-DATE          PIC X(8).                        03900000
                                                                        03910000
       01  PROC-DATE.                                                   03920000
           05  PD-CC                   PIC X(2).                        03930000
           05  PD-YY                   PIC X(2).                        03940000
           05  PD-MM                   PIC X(2).                        03950000
           05  PD-DD                   PIC X(2).                        03960000
                                                                        03970000
       01  PROC-DATE-N  REDEFINES PROC-DATE  PIC 9(8).                  03980000
                                                                        03990000
       01  NEXT-PROC-DATE.                                              04000000
           05  NPD-CC                  PIC X(2).                        04010000
           05  NPD-YY                  PIC X(2).                        04020000
           05  NPD-MM                  PIC X(2).                        04030000
           05  NPD-DD                  PIC X(2).                        04040000
                                                                        04050000
       01  NEXT-PROC-DATE-N REDEFINES NEXT-PROC-DATE   PIC 9(8).        04060000
                                                                        04070000
       01  PROC-DATE-PLUS-18MTHS.                                       04080000
           05  PD18-CC                 PIC X(2).                        04090000
           05  PD18-YY                 PIC X(2).                        04100000
           05  PD18-MM                 PIC X(2).                        04110000
           05  PD18-DD                 PIC X(2).                        04120000
                                                                        04130000
       01  PROC-DATE-PLUS-18MTHS-N REDEFINES PROC-DATE-PLUS-18MTHS      04140000
                                       PIC 9(8).                        04150000
C05762                                                                  04160000
C05762 01  PROC-DATE-PLUS-30DAYS       PIC X(8).                        04170000
C05762 01  PROC-DATE-PLUS-30DAYS-N REDEFINES PROC-DATE-PLUS-30DAYS      04180000
C05762                                 PIC 9(8).                        04190000
                                                                        04200000
       01  WORK-DATE.                                                   04210000
           05  WK-CC                   PIC 9(2).                        04220000
           05  WK-YY                   PIC 9(2).                        04230000
           05  WK-MM                   PIC 9(2).                        04240000
           05  WK-DD                   PIC 9(2).                        04250000
                                                                        04260000
LRM005 01  WS-JULIAN-PROC-DATE         PIC 9(7).                        04270000
LRM005 01  WS-JULIAN-PROC-DATE-CCCCDDD REDEFINES WS-JULIAN-PROC-DATE    04280000
LRM005                                 PIC X(7).                        04290000
LRM005 01  WS-PRIOR-TD-JULIAN          PIC X(7).                        04300000
DJ0003 01  W-B1-SPAD-MSG-DAYS          PIC 9(3).                        04310000
                                                                        04320000
DJ0004 01  W-COMPARE-DATE.                                              04330000
DJ0004     05  W-CURRENT-CC            PIC  X(002).                     04340000
DJ0004     05  W-CURRENT-YY            PIC  X(002).                     04350000
DJ0004     05  W-CURRENT-D1            PIC  X(001).                     04360000
DJ0004     05  W-CURRENT-MM            PIC  X(002).                     04370000
DJ0004     05  W-CURRENT-D2            PIC  X(001).                     04380000
DJ0004     05  W-CURRENT-DD            PIC  X(002).                     04390000
                                                                        04400000
LRM006 01  WS-90DT-DATE.                                                04401000
LRM006     05  WS-90DT-DATE-CC         PIC X(2).                        04401100
LRM006     05  WS-90DT-DATE-YY         PIC X(2).                        04401200
LRM006     05  WS-90DT-DATE-MM         PIC X(2).                        04401300
LRM006     05  WS-90DT-DATE-DD         PIC X(2).                        04401400
LRM006 01  FILLER REDEFINES WS-90DT-DATE.                               04401500
LRM006     05  WS-90DT-DATE-NUM        PIC 9(8).                        04402000
LRM006 01  WS-REGT-EXP-DATE.                                            04402100
LRM006     05  WS-REGT-EXP-DATE-NUM    PIC 9(8).                        04402200
                                                                        04403000
       01  BR-ACCT-TEST-AREA.                                           04410000
           05  BR-ACCT-IN              PIC X(15).                       04420000
           05  FILLER REDEFINES BR-ACCT-IN.                             04430000
               10  B-CHAR OCCURS 15 TIMES                               04440000
                                       PIC X.                           04450000
           05  BR-ACCT-CNV             PIC X(8).                        04460000
           05  FILLER REDEFINES BR-ACCT-CNV.                            04470000
               10  C-CHAR OCCURS 8 TIMES                                04480000
                                       PIC X.                           04490000
           EJECT                                                        04500000
       01  B1-TABLE-AREA.                                               04510000
           03  B1-TABLE OCCURS 500 TIMES.                               04520000
               05  B1-ADP-CL-NO             PIC 9(03).                  04530000
               05  B1-ADP-CL-NO-X REDEFINES B1-ADP-CL-NO PIC XXX.       04540000
               05  B1-BKR-CLR-NO            PIC X(04).                  04550000
               05  B1-CLI-NAME              PIC X(30).                  04560000
               05  B1-SPAD-IND              PIC X.                      04570000
LRM006         05  B1-CREATE-90DT-SPAD      PIC X.                      04571000
LRM006         05  B1-CREATE-REGT-MARGIN    PIC X.                      04572000
ET0001         05  B1-SPAD-MSG-RETENT       PIC X.                      04580000
DJ0003         05  B1-PTD-SPAD-MSG          PIC 9(03).                  04590000
LRM007         05  B1-PTF-SPAD-MSG          PIC 9(03).                  04591000
DJ0003         05  B1-PTR-SPAD-MSG          PIC 9(03).                  04600000
DJ0003         05  B1-RCL-SPAD-MSG          PIC 9(03).                  04610000
DJ0003         05  B1-RCR-SPAD-MSG          PIC 9(03).                  04620000
DJ0003         05  B1-MFC-SPAD-MSG          PIC 9(03).                  04631000
DJ0003         05  B1-FRV-SPAD-MSG          PIC 9(03).                  04640000
DJ0003         05  B1-PTD-EXP-DATE          PIC 9(08).                  04650000
LRM007         05  B1-PTF-EXP-DATE          PIC 9(08).                  04651000
DJ0003         05  B1-PTR-EXP-DATE          PIC 9(08).                  04660000
DJ0003         05  B1-RCL-EXP-DATE          PIC 9(08).                  04670000
DJ0003         05  B1-RCR-EXP-DATE          PIC 9(08).                  04680000
DJ0003         05  B1-MFC-EXP-DATE          PIC 9(08).                  04690000
DJ0003         05  B1-FRV-EXP-DATE          PIC 9(08).                  04700000
                                                                        04710000
       01  B1-WORK-TABLE-AREA.                                          04720000
           03  B1-WRK-TABLE.                                            04730000
               05  B1-WRK-ADP-CL-NO         PIC 9(03) VALUE 0.          04740000
               05  B1-WRK-ADP-CL-NO-X  REDEFINES B1-WRK-ADP-CL-NO       04750000
                                            PIC XXX.                    04760000
               05  B1-WRK-BKR-CLR-NO        PIC X(04).                  04770000
               05  B1-WRK-NAME              PIC X(30).                  04780000
               05  B1-WRK-SPAD-IND          PIC X.                      04790000
LRM006         05  B1-WRK-CREATE-90DT-SPAD  PIC X.                      04791000
LRM006         05  B1-WRK-CREATE-REGT-MARGIN PIC X.                     04792000
ET0001         05  B1-WRK-SPAD-MSG-RETENT   PIC X.                      04800000
DJ0003         05  B1-WRK-PTD-SPAD-MSG      PIC 9(03).                  04810000
LRM007         05  B1-WRK-PTF-SPAD-MSG      PIC 9(03).                  04811000
DJ0003         05  B1-WRK-PTR-SPAD-MSG      PIC 9(03).                  04820000
DJ0003         05  B1-WRK-RCL-SPAD-MSG      PIC 9(03).                  04830000
DJ0003         05  B1-WRK-RCR-SPAD-MSG      PIC 9(03).                  04840000
DJ0003         05  B1-WRK-MFC-SPAD-MSG      PIC 9(03).                  04850000
DJ0003         05  B1-WRK-FRV-SPAD-MSG      PIC 9(03).                  04860000
DJ0003         05  B1-WRK-PTD-EXP-DATE      PIC 9(08).                  04870000
LRM007         05  B1-WRK-PTF-EXP-DATE      PIC 9(08).                  04871000
DJ0003         05  B1-WRK-PTR-EXP-DATE      PIC 9(08).                  04880000
DJ0003         05  B1-WRK-RCL-EXP-DATE      PIC 9(08).                  04890000
DJ0003         05  B1-WRK-RCR-EXP-DATE      PIC 9(08).                  04900000
DJ0003         05  B1-WRK-MFC-EXP-DATE      PIC 9(08).                  04910000
DJ0003         05  B1-WRK-FRV-EXP-DATE      PIC 9(08).                  04920000
                                                                        04930000
           EJECT                                                        04940000
      *--------------------------------------------------------------   04950000
      *DCLGEN FOR ACAT ACTIVE TRANSFER TABLE                            04960000
      *--------------------------------------------------------------   04970000
           EXEC SQL                                                     04980000
               INCLUDE VTRNFR                                           04990000
           END-EXEC.                                                    05000000
                                                                        05010000
           EXEC SQL                                                     05020000
              DECLARE VTRNFR_CRSR CURSOR FOR                            05030000
                 SELECT                                                 05040000
                    CLIENT_NBR                                          05050000
                   ,ACAT_CONTROL_NBR                                    05060000
                   ,SBMTG_PRTCP_NBR                                     05070000
                   ,SBMT_PRT_NR_STS_CD                                  05080000
                   ,CONTROL_NBR_STS_CD                                  05090000
                   ,DLVR_NBR                                            05100000
                   ,DLVR_NBR_STTS_CD                                    05110000
                   ,ACCT_DLVR_NBR                                       05120000
                   ,ACCT_DLVR_STTS_CD                                   05130000
                   ,RCV_NBR                                             05140000
                   ,RCV_NBR_STTS_CD                                     05150000
                   ,ACCT_RCV_NBR                                        05160000
                   ,ACCT_RCV_STTS_CD                                    05170000
                   ,TRNFR_TYPE_CD                                       05180000
                   ,TRNFR_TYPE_STTS_CD                                  05190000
                   ,TRANS_TYPE_CD                                       05200000
                   ,TRANS_TYPE_STTS_CD                                  05210000
                   ,RCV_CUST_NM                                         05220000
                   ,RCV_CUST_NM_STS_CD                                  05230000
                   ,RCV_SS_PRIM_NBR                                     05240000
                   ,RCV_SS_PRIM_STS_CD                                  05250000
                   ,RCV_SS_SCNDY_NBR                                    05260000
                   ,RCV_SS_SCDY_STS_CD                                  05270000
                   ,RCV_ACCT_TYPE_CD                                    05280000
                   ,RCV_ACT_TYP_STS_CD                                  05290000
                   ,RCV_OCC_BRKR_NBR                                    05300000
                   ,RCV_OCC_STTS_CD                                     05310000
                   ,RCV_CRSPN_NBR                                       05320000
                   ,RCV_CRSPN_STTS_CD                                   05330000
                   ,ACAT_CNTL_ASTD_NBR                                  05340000
                   ,CNTL_ASTD_STTS_CD                                   05350000
                   ,CMNT_TXT                                            05360000
                   ,CMNT_STTS_CD                                        05370000
                   ,PRCS_DT                                             05380000
                   ,STTS_CD                                             05390000
                   ,STTLM_TM_CD                                         05400000
                   ,VAL_FREE_CD                                         05410000
                   ,TRANS_RFRN_ID_CD                                    05420000
                   ,TRANS_RFRN_STTS_CD                                  05430000
                   ,DB_CR_CD                                            05440000
                   ,DSTBN_SIDE_CD                                       05450000
                   ,SYS_ACT_CD                                          05460000
                   ,SYS_RJCT_RSN_CD                                     05470000
                   ,TRNFR_TYPE_RJC1_CD                                  05480000
                   ,TRNFR_TYPE_RJC2_CD                                  05490000
                   ,TRNFR_TYPE_RJCT_CD                                  05500000
                   ,TRN_TYP_RJC_STS_CD                                  05510000
                   ,PHSCL_SEQ_NBR                                       05520000
                   ,PHSCL_SEQ_STTS_CD                                   05530000
                   ,LGCL_SEQ_NBR                                        05540000
                   ,LGCL_SEQ_NR_STS_CD                                  05550000
                   ,RR_CD                                               05560000
                   ,BRANCH_CD                                           05570000
                   ,DVDND_NAA_CD                                        05580000
                   ,SELL_INSTN_NAA_CD                                   05590000
                   ,CASH_SWEEP_NAA_CD                                   05600000
                   ,PRTCP_CONTRA_CD                                     05610000
                   ,ACM_HOLDER_NAA_CD                                   05620000
                   ,ACCT_ACTIVITY_IND                                   05630000
                   ,ACCT_ORDERS_IND                                     05640000
                   ,ACCT_RJCT_RSBM_IND                                  05650000
                   ,ACCT_DB_BAL_T1_IND                                  05660000
                   ,ACCT_MRGN_DB_IND                                    05670000
                   ,ACCT_SHRT_PSTN_IND                                  05680000
                   ,ACCT_SEC_RSTRD_IND                                  05690000
                   ,ACCT_AST_EXCS_IND                                   05700000
                   ,ACCT_OPTN_PSTN_IND                                  05710000
                   ,ACCT_LTD_PRTNR_IND                                  05720000
                   ,ACCT_TIN_MSMTH_IND                                  05730000
                   ,ACCT_DPLCT_TRN_IND                                  05740000
                   ,ACCT_CUST_70_IND                                    05750000
                   ,ACCT_QULFD_PLN_IND                                  05760000
                   ,ACCT_MNGD_IND                                       05770000
                   ,ACCT_PRVT_RNG_IND                                   05780000
                   ,ACCT_BRKR_TIF_IND                                   05790000
                   ,NSCC_NON_ADP_IND                                    05800000
                   ,CYCLE_CD                                            05810000
                   ,DAYS_STTS_QTY                                       05820000
                   ,STTLM_DT                                            05830000
                   ,ACCT_NA_UPDT_IND                                    05840000
                   ,ACCT_TRNFR_FEE_AMT                                  05850000
                   ,ACCT_IRA_TRMNT_AMT                                  05860000
                   ,ACCT_IRA_MAINT_AMT                                  05870000
                   ,ACCT_DLRV_PRGR_IND                                  05880000
                   ,ACCT_CD                                             05890000
                   ,STTLM_ASCTD_DT                                      05900000
                   ,STTLM_ASCTD_STS_CD                                  05910000
                   ,RCRD_LNGTH_STTS_CD                                  05920000
                   ,RCRD_STTS_CD                                        05930000
                   ,NSCC_PEND_CD                                        05940000
                   ,NSCC_ACK_IND                                        05950000
                   ,CICS_TERM_ID_CD                                     05960000
                   ,PRGM_NM                                             05970000
                   ,CRT_TMSTP                                           05980000
                   ,UPDT_TMSTP                                          05990000
                   ,ACCT_EQUITY_AMT                                     06000000
LRM003             ,ACCT_CLT_RSCND_IND                                  06010000
LRM003             ,ACCT_LGL_BLK_IND                                    06020000
LRM006             ,RSTR_TRD_90_DY_IND                                  06021000
LRM006             ,REG_T_IND                                           06022000
LRM010             ,TRNFR_STTS_110_IND                                  06023000
                 FROM VTRNFR                                            06030000
                 ORDER BY CLIENT_NBR, ACAT_CONTROL_NBR                  06040000
           END-EXEC.                                                    06050000
                                                                        06060000
LRM006*--------------------------------------------------------------   06060100
LRM006*DCLGEN FOR ACTIVE ASSET                                          06060200
LRM006*--------------------------------------------------------------   06060300
LRM006     EXEC SQL                                                     06061000
LRM006         INCLUDE VASSET                                           06062000
LRM006     END-EXEC.                                                    06063000
                                                                        06064000
      *--------------------------------------------------------------   06070000
      *DCLGEN FOR PARTICIPANT PROFILE TABLE                             06080000
      *--------------------------------------------------------------   06090000
LRM004     EXEC SQL                                                     06100000
LRM004         INCLUDE VPRTCPPF                                         06110000
LRM004     END-EXEC.                                                    06120000
                                                                        06130000
      *--------------------------------------------------------------   06140000
      * INCLUDE FOR DB2 COMMUNICATIONS AREA.                            06150000
      *--------------------------------------------------------------   06160000
           EXEC SQL                                                     06170000
               INCLUDE SQLCA                                            06180000
           END-EXEC.                                                    06190000
                                                                        06200000
      /                                                                 06210000
      ***--->COBOL LE                                                   06220000
       01  W-ABEND-AREA.                                                06230000
           03  ABEND-CODE                PIC S9(04) COMP SYNC.          06240000
                                                                        06250000
           COPY STUBCPY.                                                06260000
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.    06270000
      ***<---COBOL LE                                                   06280000
                                                                        06290000
       01  DB2-ABEND-CODE                PIC S9(04) COMP VALUE +3999.   06300000
                                                                        06310000
      /                                                                 06320000
      ***************************************************************** 06330000
       LINKAGE SECTION.                                                 06340000
      ***************************************************************** 06350000
       01  PARM-AREA.                                                   06360000
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        06370000
           05  PARM-INFO.                                               06380000
               10  PARM-STREAM              PIC X.                      06390000
                   88  PARM-STREAM-VALID                VALUES ARE      06400000
                       'A' THRU 'Z' '0' THRU '9'.                       06410000
                                                                        06420000
       PROCEDURE DIVISION USING PARM-AREA.                              06430000
                                                                        06440000
           DISPLAY 'CAT754 - CREATE ACATS SPAD MESSAGE FILE'.           06450000
           COPY MSGCOBO.                                                06460000
           DISPLAY ' '.                                                 06470000
                                                                        06480000
           DISPLAY '*** CAT754 INITIAL ROUTINE ***'.                    06490000
                                                                        06500000
           PERFORM  100-HOUSEKEEPING THRU                               06510000
                    100-HOUSEKEEPING-EXIT.                              06520000
                                                                        06530000
           PERFORM  200-INIT-B1-LOOP THRU                               06540000
                    200-INIT-B1-LOOP-EXIT.                              06550000
                                                                        06560000
           SORT  SORT-FILE                                              06570000
                     ASCENDING KEY  S-CLI                               06580000
                                    S-BR-ACCT                           06590000
                                    S-CODE                              06600000
                                    S-EXP-DTE                           06610000
LRM005                              S-ACAT-CONTROL-NBR                  06620000
                     INPUT PROCEDURE  300-SORTIN-ROUTINE THRU           06630000
                                      300-SORTIN-ROUTINE-EXIT           06640000
                    OUTPUT PROCEDURE  600-SORTOUT-ROUTINE THRU          06650000
                                      600-SORTOUT-ROUTINE-EXIT.         06660000
                                                                        06670000
           IF  SORT-RETURN  NOT =  ZERO                                 06680000
                   DISPLAY  'INTERNAL SORT FAILED, SORT RC = '          06690000
                             SORT-RETURN                                06700000
                   CALL  ABEND            USING ABEND-CODE-8000         06710000
           END-IF.                                                      06720000
                                                                        06730000
           PERFORM  900-ENDJOB-ROUTINE                                  06740000
              THRU  900-ENDJOB-ROUTINE-EXIT.                            06750000
                                                                        06760000
           GOBACK.                                                      06770000
                                                                        06780000
           EJECT                                                        06790000
      ******************                                                06800000
       100-HOUSEKEEPING.                                                06810000
                                                                        06820000
DJ0004     DISPLAY 'PARM-STREAM = ' PARM-STREAM                         06830000
           IF PARM-LENGTH  > 0                                          06840000
             CONTINUE                                                   06850000
           ELSE                                                         06860000
             DISPLAY 'PARM LENGTH IS INVALID, LENGTH MUST BE 1 CHAR '   06870000
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        06880000
             DISPLAY 'PROGRAM CAT754 ABENDED '                          06890000
             CALL  ABEND         USING ABEND-CODE-2000.                 06900000
                                                                        06910000
           IF PARM-STREAM-VALID                                         06920000
             CONTINUE                                                   06930000
           ELSE                                                         06940000
             DISPLAY 'PARM INVALID, MUST BE 1 CHAR ALPHANUMERIC'        06950000
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        06960000
             DISPLAY 'PROGRAM CAT754 ABENDED '                          06970000
             CALL ABEND          USING ABEND-CODE-2000.                 06980000
                                                                        06990000
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.        07000000
           MOVE  'C'                     TO BPDATES-REQ-TYPE.           07010000
           CALL    BPDATES            USING BPDATES-PARAMETERS.         07020000
                                                                        07030000
           MOVE  BPD-PROC-DATE           TO  PROC-DATE                  07040000
                                             SPAD-HDR-DATE.             07050000
LRM001     MOVE  BPD-PRIOR-PROC-DATE     TO  WS-PRIOR-PROC-DATE.        07060000
LRM005     MOVE  BPD-JULIAN-PROC-DATE    TO  WS-JULIAN-PROC-DATE.       07070000
                                                                        07080000
           DISPLAY 'PROCESS DATE   = ' BPD-PROC-DATE.                   07090000
                                                                        07100000
      * GET NEXT PROCESSING DATE                                        07110000
                                                                        07120000
           MOVE  PGM-NAME             TO  BPDATES-CALLING-PGM.          07130000
           MOVE  BPD-PROC-DATE        TO  BPDATES-BASE-DATE.            07140000
           MOVE  'D'                  TO  BPDATES-REQ-TYPE.             07150000
           MOVE  'P'                  TO  BPDATES-DTSEARCH-IND.         07160000
           MOVE  'T'                  TO  BPDATES-DTSEARCH-TYPE.        07170000
           MOVE  SPACES               TO  BPDATES-CALENDAR-TYPE.        07180000
           MOVE  1                    TO  BPDATES-DTSEARCH-DISP.        07190000
                                                                        07200000
           CALL   BPDATES             USING  BPDATES-PARAMETERS.        07210000
                                                                        07220000
           IF BPD-VALID-RETURN                                          07230000
              MOVE BPD-DT-CALDATE        TO  NEXT-PROC-DATE             07240000
              DISPLAY 'NEXT PROC DATE = ' NEXT-PROC-DATE                07250000
           ELSE                                                         07260000
              MOVE BPDATES-RETURN-CODE TO DMSG-CDE                      07270000
              DISPLAY DATE-MSG                                          07280000
C05762        CALL ABEND          USING ABEND-CODE-2020                 07290000
C05762     END-IF.                                                      07300000
                                                                        07310000
      * GET PROCESSING DATE 18 MONTHS FROM NOW                          07320000
                                                                        07330000
           MOVE  PROC-DATE            TO  WORK-DATE.                    07340000
           ADD 1 TO WK-YY.                                              07350000
           IF WK-YY = ZERO                                              07360000
             MOVE 20 TO WK-CC.                                          07370000
           ADD 6 TO WK-MM.                                              07380000
           IF WK-MM > 12                                                07390000
             SUBTRACT 12 FROM WK-MM                                     07400000
             ADD 1 TO WK-YY                                             07410000
             IF WK-YY = ZERO                                            07420000
               MOVE 20 TO WK-CC                                         07430000
             END-IF                                                     07440000
           END-IF.                                                      07450000
           MOVE 01 TO WK-DD.                                            07460000
                                                                        07470000
           MOVE WORK-DATE  TO  PROC-DATE-PLUS-18MTHS                    07480000
           DISPLAY 'PROC DATE PLUS 18 MTHS - ' PROC-DATE-PLUS-18MTHS    07490000
C05762                                                                  07500000
C05762                                                                  07510000
C05762* GET EXPIRATION DATE FOR 9348 REC AT LEAST 30 DAYS AHEAD         07520000
C05762                                                                  07530000
C05762     MOVE  'D'                     TO  BPDATES-REQ-TYPE.          07540000
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE    07550100
CSG001* THE DEFAULT CALENDAR.                                           07550200
CSG001*    MOVE  'US'                    TO  BPDATES-CALENDAR-TYPE.     07550300
CSG001     MOVE  '  '                    TO  BPDATES-CALENDAR-TYPE.     07551000
C05762     MOVE  PROC-DATE               TO  BPDATES-BASE-DATE.         07560000
C05762     MOVE  'P'                     TO  BPDATES-DTSEARCH-IND.      07570000
C05762     MOVE  'C'                     TO  BPDATES-DTSEARCH-TYPE.     07580000
C05762     MOVE  30                      TO  BPDATES-DTSEARCH-DISP.     07590000
C05762     CALL   BPDATES             USING  BPDATES-PARAMETERS.        07600000
C05762                                                                  07610000
C05762     IF NOT BPD-VALID-RETURN                                      07620000
C05762        MOVE BPDATES-RETURN-CODE TO DMSG-CDE                      07630000
C05762        DISPLAY DATE-MSG                                          07640000
C05762        CALL ABEND          USING ABEND-CODE-2020                 07650000
C05762     END-IF.                                                      07660000
C05762                                                                  07670000
C05762     MOVE BPD-DT-CALDATE TO  PROC-DATE-PLUS-30DAYS                07680000
C05762     DISPLAY 'PROC DATE PLUS 30 DAYS - ' PROC-DATE-PLUS-30DAYS    07690000
                                                                        07700000
LRM005* GET PRIOR T/D JULIAN FOR QA COMPARE                             07710000
LRM005                                                                  07720000
LRM005     MOVE  'D'                     TO  BPDATES-REQ-TYPE.          07730000
CSG001*    MOVE  'US'                    TO  BPDATES-CALENDAR-TYPE.     07740000
CSG001     MOVE  '  '                    TO  BPDATES-CALENDAR-TYPE.     07741000
LRM005     MOVE  PROC-DATE               TO  BPDATES-BASE-DATE.         07750000
LRM005     MOVE  'M'                     TO  BPDATES-DTSEARCH-IND.      07760000
LRM005     MOVE  'T'                     TO  BPDATES-DTSEARCH-TYPE.     07770000
LRM005     MOVE  1                       TO  BPDATES-DTSEARCH-DISP.     07780000
LRM005     CALL   BPDATES             USING  BPDATES-PARAMETERS.        07790000
LRM005                                                                  07800000
LRM005     IF NOT BPD-VALID-RETURN                                      07810000
LRM005        MOVE BPDATES-RETURN-CODE TO DMSG-CDE                      07820000
LRM005        DISPLAY DATE-MSG                                          07830000
LRM005        CALL ABEND          USING ABEND-CODE-2020                 07840000
LRM005     END-IF.                                                      07850000
LRM005                                                                  07860000
LRM005     MOVE BPD-DT-JULDATE TO  WS-PRIOR-TD-JULIAN                   07870000
LRM005     DISPLAY 'PROC DATE MINUS 1 DAY  - ' WS-PRIOR-TD-JULIAN       07880000
DJ0004     DISPLAY ' '                                                  07890000
DJ0004                                                                  07900000
DJ0004     MOVE PD-CC              TO W-CURRENT-CC                      07910000
DJ0004     MOVE PD-YY              TO W-CURRENT-YY                      07920000
DJ0004     MOVE '-'                TO W-CURRENT-D1                      07930000
DJ0004     MOVE PD-MM              TO W-CURRENT-MM                      07940000
DJ0004     MOVE '-'                TO W-CURRENT-D2                      07950000
DJ0004     MOVE PD-DD              TO W-CURRENT-DD                      07960000
DJ0004     DISPLAY 'CAT754: W-COMPARE-DATE = ' W-COMPARE-DATE           07970000
                                                                        07980000
           OPEN INPUT BROKER-FILE.                                      07990000
                                                                        08000000
           OPEN OUTPUT ACAT-SPAD-FILE.                                  08010000
                                                                        08020000
           IF BRKR-FILE-OK                                              08030000
             CONTINUE                                                   08040000
           ELSE                                                         08050000
             DISPLAY  'BROKER FILE OPEN ERROR, STATUS = '               08060000
                         BROKER-FILE-STATUS                             08070000
                                                                        08080000
             CALL ABEND          USING ABEND-CODE-2020.                 08090000
                                                                        08100000
           WRITE ACAT-SPAD-REC-3 FROM ACAT-SPAD-HDR.                    08110000
                                                                        08120000
           MOVE LOW-VALUES       TO  SPAD-MESG-REC.                     08130000
           MOVE ZERO             TO  SPM-APPL-NO.                       08140000
           MOVE SPACES           TO  SPM-TERMINAL-ID.                   08150000
           MOVE PROC-DATE-N      TO  SPM-DATE-ENTERED.                  08160000
                                                                        08170000
       100-HOUSEKEEPING-EXIT. EXIT.                                     08180000
           EJECT                                                        08190000
      ***************                                                   08200000
       200-INIT-B1-LOOP.                                                08210000
      ***************                                                   08220000
                                                                        08230000
           DISPLAY ' '.                                                 08240000
           DISPLAY  'B1 TABLE VALUES'.                                  08250000
           MOVE 0                      TO  B1-TBL-CNT.                  08260000
           ADD  1                      TO  B1-SUB.                      08270000
           PERFORM  UNTIL  B1-SUB  >  500                               08280000
                                                                        08290000
             MOVE  ' '                    TO  BH-BROKER-HEADER-INFO     08300000
             MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N        08310000
             MOVE  '010'                  TO  BH-LOGICAL-RECORD-CODE    08320000
             MOVE  ' '                    TO  BH-B2-INFO-ID             08330000
             CALL   GETB1V              USING BH-BROKER-HEADER-INFO     08340000
             END-CALL                                                   08350000
                                                                        08360000
             IF  BH-BROKER-ACTIVE                                       08370000
                                                                        08380000
               IF  BH-BROKER-MINI-MAXI-SUBGROUP  >  SPACES              08390000
                   MOVE  BH-BROKER-MINI-MAXI-SUBGROUP  TO               08400000
                         BH-BROKER-MINI-MAXI-INDICATOR                  08410000
               END-IF                                                   08420000
                                                                        08430000
               IF  PARM-STREAM  =  BH-BROKER-MINI-MAXI-INDICATOR        08440000
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N     08450000
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE 08460000
                   MOVE  '434500'            TO  BH-B2-INFO-ID          08470000
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO, 08480000
                                                 BH-ACAT-INFO           08490000
                   END-CALL                                             08500000
                   IF  BH-ACAT-ACTIVE                                   08510000
                   AND BH-ACAT-SERVICE-STATUS = '1'                     08520000
                       ADD 1         TO B1-TBL-CNT                      08530000
                       MOVE  B1-SUB            TO                       08540000
                             B1-ADP-CL-NO               (B1-TBL-CNT)    08550000
                       MOVE  BH-BROKER-NAME     TO                      08560000
                             B1-CLI-NAME                (B1-TBL-CNT)    08570000
                       MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)  TO     08580000
                             B1-BKR-CLR-NO              (B1-TBL-CNT)    08590000
                                                                        08600000
                       MOVE  BH-ACAT-STATUS-SPAD-MESSAGES   TO          08610000
                             B1-SPAD-IND                (B1-TBL-CNT)    08620000
ET0001                 MOVE  BH-ACAT-SPAD-MESSG-RETENT      TO          08630000
ET0001                       B1-SPAD-MSG-RETENT         (B1-TBL-CNT)    08640000
DJ0003                 IF BH-ACAT-PTD-SPAD-MSG NUMERIC                  08650000
DJ0003                    MOVE BH-ACAT-PTD-SPAD-MSG         TO          08660000
DJ0003                              B1-PTD-SPAD-MSG     (B1-TBL-CNT)    08670000
DJ0003                 ELSE                                             08680000
DJ0003                    MOVE 0 TO B1-PTD-SPAD-MSG     (B1-TBL-CNT)    08690000
DJ0003                 END-IF                                           08700000
DJ0003                 IF BH-ACAT-PTR-SPAD-MSG NUMERIC                  08710000
DJ0003                    MOVE BH-ACAT-PTR-SPAD-MSG         TO          08720000
DJ0003                              B1-PTR-SPAD-MSG     (B1-TBL-CNT)    08730000
DJ0003                 ELSE                                             08740000
DJ0003                    MOVE 0 TO B1-PTR-SPAD-MSG     (B1-TBL-CNT)    08750000
DJ0003                 END-IF                                           08760000
DJ0003                 IF BH-ACAT-RCL-SPAD-MSG NUMERIC                  08770000
DJ0003                    MOVE BH-ACAT-RCL-SPAD-MSG         TO          08780000
DJ0003                              B1-RCL-SPAD-MSG     (B1-TBL-CNT)    08790000
DJ0003                 ELSE                                             08800000
DJ0003                    MOVE 0 TO B1-RCL-SPAD-MSG     (B1-TBL-CNT)    08810000
DJ0003                 END-IF                                           08820000
DJ0003                 IF BH-ACAT-RCR-SPAD-MSG NUMERIC                  08830000
DJ0003                    MOVE BH-ACAT-RCR-SPAD-MSG         TO          08840000
DJ0003                              B1-RCR-SPAD-MSG     (B1-TBL-CNT)    08850000
DJ0003                 ELSE                                             08860000
DJ0003                    MOVE 0 TO B1-RCR-SPAD-MSG     (B1-TBL-CNT)    08870000
DJ0003                 END-IF                                           08880000
DJ0003                 IF BH-ACAT-MFC-SPAD-MSG NUMERIC                  08890000
DJ0003                    MOVE BH-ACAT-MFC-SPAD-MSG         TO          08900000
DJ0003                              B1-MFC-SPAD-MSG     (B1-TBL-CNT)    08910000
DJ0003                 ELSE                                             08920000
DJ0003                    MOVE 0 TO B1-MFC-SPAD-MSG     (B1-TBL-CNT)    08930000
DJ0003                 END-IF                                           08940000
DJ0003                 IF BH-ACAT-FRV-SPAD-MSG NUMERIC                  08950000
DJ0003                    MOVE BH-ACAT-FRV-SPAD-MSG         TO          08960000
DJ0003                              B1-FRV-SPAD-MSG     (B1-TBL-CNT)    08970000
DJ0003                 ELSE                                             08980000
DJ0003                    MOVE 0 TO B1-FRV-SPAD-MSG     (B1-TBL-CNT)    08990000
DJ0003                 END-IF                                           09000000
LRM007                 IF BH-ACAT-PTF-SPAD-MSG NUMERIC                  09010100
LRM007                    MOVE BH-ACAT-PTF-SPAD-MSG         TO          09010200
LRM007                              B1-PTF-SPAD-MSG     (B1-TBL-CNT)    09010300
LRM007                 ELSE                                             09010400
LRM007                    MOVE 0 TO B1-PTF-SPAD-MSG     (B1-TBL-CNT)    09010500
LRM007                 END-IF                                           09010600
DJ0003                 PERFORM  210-NON-FUL-EXP-DATE THRU 210-EXIT      09010700
LRM006                 MOVE BH-ACAT-CREATE-90DT-SPAD        TO          09011000
LRM006                           B1-CREATE-90DT-SPAD    (B1-TBL-CNT)    09012000
LRM006                 MOVE BH-ACAT-CREATE-REGT-MARGIN      TO          09013000
LRM006                           B1-CREATE-REGT-MARGIN  (B1-TBL-CNT)    09014000
DJ0003                                                                  09020000
DJ0003                 DISPLAY B1-SUB                                   09030000
DJ0003                   ' '   BH-BROKER-NAME                           09040000
DJ0003                   ' '   BH-BROKER-OLD-CLEARING-HOUSE             09050000
DJ0003                 DISPLAY '     '                                  09060000
DJ0003                      'BH-ACAT-STATUS-SPAD-MESSAGES(434588) = '   09070000
DJ0003                       BH-ACAT-STATUS-SPAD-MESSAGES               09080000
DJ0003                 DISPLAY '     '                                  09090000
DJ0003                      'BH-ACAT-SPAD-MESSG-RETENT   (434683) = '   09100000
DJ0003                       BH-ACAT-SPAD-MESSG-RETENT                  09110000
DJ0003                 DISPLAY '     '                                  09120000
DJ0003                      'BH-ACAT-PTR-SPAD-MSG        (434700) = '   09130000
DJ0003                       BH-ACAT-PTR-SPAD-MSG                       09140000
DJ0003                      ' EXP-DATE = '                              09150000
DJ0003                       B1-PTR-EXP-DATE (B1-TBL-CNT)               09160000
DJ0003                 DISPLAY '     '                                  09170000
DJ0003                      'BH-ACAT-PTD-SPAD-MSG        (434701) = '   09180000
DJ0003                       BH-ACAT-PTD-SPAD-MSG                       09190000
DJ0003                      ' EXP-DATE = '                              09200000
DJ0003                       B1-PTD-EXP-DATE (B1-TBL-CNT)               09210000
DJ0003                 DISPLAY '     '                                  09220000
DJ0003                      'BH-ACAT-RCR-SPAD-MSG        (434702) = '   09230000
DJ0003                       BH-ACAT-RCR-SPAD-MSG                       09240000
DJ0003                      ' EXP-DATE = '                              09250000
DJ0003                       B1-RCR-EXP-DATE (B1-TBL-CNT)               09260000
DJ0003                 DISPLAY '     '                                  09270000
DJ0003                      'BH-ACAT-RCL-SPAD-MSG        (434703) = '   09280000
DJ0003                       BH-ACAT-RCL-SPAD-MSG                       09290000
DJ0003                      ' EXP-DATE = '                              09300000
DJ0003                       B1-RCL-EXP-DATE (B1-TBL-CNT)               09310000
DJ0003                 DISPLAY '     '                                  09320000
DJ0003                      'BH-ACAT-MFC-SPAD-MSG        (434704) = '   09330000
DJ0003                       BH-ACAT-MFC-SPAD-MSG                       09340000
DJ0003                      ' EXP-DATE = '                              09350000
DJ0003                       B1-MFC-EXP-DATE (B1-TBL-CNT)               09360000
DJ0003                 DISPLAY '     '                                  09370000
DJ0003                      'BH-ACAT-FRV-SPAD-MSG        (434705) = '   09380000
DJ0003                       BH-ACAT-FRV-SPAD-MSG                       09390000
DJ0003                      ' EXP-DATE = '                              09400000
DJ0003                       B1-FRV-EXP-DATE (B1-TBL-CNT)               09410000
LRM007                 DISPLAY '     '                                  09411000
LRM007                      'BH-ACAT-PTF-SPAD-MSG        (434745) = '   09412000
LRM007                       BH-ACAT-PTF-SPAD-MSG                       09413000
LRM007                      ' EXP-DATE = '                              09414000
LRM007                       B1-PTF-EXP-DATE (B1-TBL-CNT)               09415000
                   END-IF                                               09420000
               END-IF                                                   09430000
             END-IF                                                     09440000
             ADD  1                      TO  B1-SUB                     09450000
           END-PERFORM.                                                 09460000
           DISPLAY ' '.                                                 09470000
       200-INIT-B1-LOOP-EXIT.   EXIT.                                   09480000
                                                                        09490000
DJ0003 210-NON-FUL-EXP-DATE.                                            09500000
DJ0003     IF  B1-PTD-SPAD-MSG (B1-TBL-CNT) > 0                         09510000
DJ0003         MOVE B1-PTD-SPAD-MSG (B1-TBL-CNT) TO W-B1-SPAD-MSG-DAYS  09520000
DJ0003         PERFORM 220-CALC-EXP-DATE THRU 220-EXIT                  09530000
DJ0003         MOVE BPD-DT-CALDATE      TO B1-PTD-EXP-DATE (B1-TBL-CNT) 09540000
DJ0003     ELSE                                                         09550000
DJ0003         MOVE 00000000            TO B1-PTD-EXP-DATE (B1-TBL-CNT) 09560000
DJ0003     END-IF.                                                      09570000
LRM007     IF  B1-PTF-SPAD-MSG (B1-TBL-CNT) > 0                         09571000
LRM007         MOVE B1-PTF-SPAD-MSG (B1-TBL-CNT) TO W-B1-SPAD-MSG-DAYS  09572000
LRM007         PERFORM 220-CALC-EXP-DATE THRU 220-EXIT                  09573000
LRM007         MOVE BPD-DT-CALDATE      TO B1-PTF-EXP-DATE (B1-TBL-CNT) 09574000
LRM007     ELSE                                                         09575000
LRM007         MOVE 00000000            TO B1-PTF-EXP-DATE (B1-TBL-CNT) 09576000
LRM007     END-IF.                                                      09577000
DJ0003     IF  B1-PTR-SPAD-MSG (B1-TBL-CNT) > 0                         09580000
DJ0003         MOVE B1-PTR-SPAD-MSG (B1-TBL-CNT) TO W-B1-SPAD-MSG-DAYS  09590000
DJ0003         PERFORM 220-CALC-EXP-DATE THRU 220-EXIT                  09600000
DJ0003         MOVE BPD-DT-CALDATE      TO B1-PTR-EXP-DATE (B1-TBL-CNT) 09610000
DJ0003     ELSE                                                         09620000
DJ0003         MOVE 00000000            TO B1-PTR-EXP-DATE (B1-TBL-CNT) 09630000
DJ0003     END-IF.                                                      09640000
DJ0003     IF  B1-RCL-SPAD-MSG (B1-TBL-CNT) > 0                         09650000
DJ0003         MOVE B1-RCL-SPAD-MSG (B1-TBL-CNT) TO W-B1-SPAD-MSG-DAYS  09660000
DJ0003         PERFORM 220-CALC-EXP-DATE THRU 220-EXIT                  09670000
DJ0003         MOVE BPD-DT-CALDATE      TO B1-RCL-EXP-DATE (B1-TBL-CNT) 09680000
DJ0003     ELSE                                                         09690000
DJ0003         MOVE 00000000            TO B1-RCL-EXP-DATE (B1-TBL-CNT) 09700000
DJ0003     END-IF.                                                      09710000
DJ0003     IF  B1-RCR-SPAD-MSG (B1-TBL-CNT) > 0                         09720000
DJ0003         MOVE B1-RCR-SPAD-MSG (B1-TBL-CNT) TO W-B1-SPAD-MSG-DAYS  09730000
DJ0003         PERFORM 220-CALC-EXP-DATE THRU 220-EXIT                  09740000
DJ0003         MOVE BPD-DT-CALDATE      TO B1-RCR-EXP-DATE (B1-TBL-CNT) 09750000
DJ0003     ELSE                                                         09760000
DJ0003         MOVE 00000000            TO B1-RCR-EXP-DATE (B1-TBL-CNT) 09770000
DJ0003     END-IF.                                                      09780000
DJ0003     IF  B1-MFC-SPAD-MSG (B1-TBL-CNT) > 0                         09790000
DJ0003         MOVE B1-MFC-SPAD-MSG (B1-TBL-CNT) TO W-B1-SPAD-MSG-DAYS  09800000
DJ0003         PERFORM 220-CALC-EXP-DATE THRU 220-EXIT                  09810000
DJ0003         MOVE BPD-DT-CALDATE      TO B1-MFC-EXP-DATE (B1-TBL-CNT) 09820000
DJ0003     ELSE                                                         09830000
DJ0003         MOVE 00000000            TO B1-MFC-EXP-DATE (B1-TBL-CNT) 09840000
DJ0003     END-IF.                                                      09850000
DJ0003     IF  B1-FRV-SPAD-MSG (B1-TBL-CNT) > 0                         09860000
DJ0003         MOVE B1-FRV-SPAD-MSG (B1-TBL-CNT) TO W-B1-SPAD-MSG-DAYS  09870000
DJ0003         PERFORM 220-CALC-EXP-DATE THRU 220-EXIT                  09880000
DJ0003         MOVE BPD-DT-CALDATE      TO B1-FRV-EXP-DATE (B1-TBL-CNT) 09890000
DJ0003     ELSE                                                         09900000
DJ0003         MOVE 00000000            TO B1-FRV-EXP-DATE (B1-TBL-CNT) 09910000
DJ0003     END-IF.                                                      09920000
DJ0003 210-EXIT.   EXIT.                                                09930000
DJ0003 220-CALC-EXP-DATE.                                               09940000
DJ0003* GET EXPIRATION DATE FOR NON-FUL TRANSFERS BASED ON NUM OF DAYS  09950000
DJ0003     MOVE  'D'                     TO  BPDATES-REQ-TYPE.          09960000
CSG001*    MOVE  'US'                    TO  BPDATES-CALENDAR-TYPE.     09970000
CSG001     MOVE  '  '                    TO  BPDATES-CALENDAR-TYPE.     09971000
DJ0003     MOVE  PROC-DATE               TO  BPDATES-BASE-DATE.         09980000
DJ0003     MOVE  'P'                     TO  BPDATES-DTSEARCH-IND.      09990000
DJ0003     MOVE  'C'                     TO  BPDATES-DTSEARCH-TYPE.     10000000
LRM008     IF W-B1-SPAD-MSG-DAYS = 999                                  10010000
LRM008        MOVE '99999999' TO BPD-DT-CALDATE                         10010100
LRM008     ELSE                                                         10010200
DJ0003        MOVE  W-B1-SPAD-MSG-DAYS      TO  BPDATES-DTSEARCH-DISP   10011000
DJ0003        CALL   BPDATES             USING  BPDATES-PARAMETERS      10020000
DJ0003        IF NOT BPD-VALID-RETURN                                   10030000
DJ0003           MOVE BPDATES-RETURN-CODE TO DMSG-CDE                   10040000
DJ0003           DISPLAY DATE-MSG                                       10050000
LRM008           DISPLAY 'NBR OF DAYS ' W-B1-SPAD-MSG-DAYS              10051000
LRM008           ' CAUSED DTSERACH FAILURE; USE 99999999'               10052000
LRM008           MOVE '99999999' TO BPD-DT-CALDATE                      10053000
LRM008********CALL ABEND          USING ABEND-CODE-2020                 10054000
DJ0003     END-IF.                                                      10070000
DJ0003 220-EXIT. EXIT.                                                  10080000
                                                                        10090000
           EJECT                                                        10100000
      *****************                                                 10110000
       300-SORTIN-ROUTINE.                                              10120000
      *****************                                                 10130000
                                                                        10140000
           DISPLAY '*** CAT754 SORTINP ROUTINE ***'.                    10150000
           MOVE 1   TO B1-SUB.                                          10160000
           EXEC SQL                                                     10170000
                OPEN VTRNFR_CRSR                                        10180000
           END-EXEC.                                                    10190000
                                                                        10200000
           PERFORM UNTIL ACAT-EOF                                       10210000
             EXEC SQL                                                   10220000
                 FETCH VTRNFR_CRSR                                      10230000
                    INTO                                                10240000
                      :DCLVTRNFR.CLIENT-NBR                             10250000
                     ,:DCLVTRNFR.ACAT-CONTROL-NBR                       10260000
                     ,:DCLVTRNFR.SBMTG-PRTCP-NBR                        10270000
                     ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                     10280000
                     ,:DCLVTRNFR.CONTROL-NBR-STS-CD                     10290000
                     ,:DCLVTRNFR.DLVR-NBR                               10300000
                     ,:DCLVTRNFR.DLVR-NBR-STTS-CD                       10310000
                     ,:DCLVTRNFR.ACCT-DLVR-NBR                          10320000
                     ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                      10330000
                     ,:DCLVTRNFR.RCV-NBR                                10340000
                     ,:DCLVTRNFR.RCV-NBR-STTS-CD                        10350000
                     ,:DCLVTRNFR.ACCT-RCV-NBR                           10360000
                     ,:DCLVTRNFR.ACCT-RCV-STTS-CD                       10370000
                     ,:DCLVTRNFR.TRNFR-TYPE-CD                          10380000
                     ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                     10390000
                     ,:DCLVTRNFR.TRANS-TYPE-CD                          10400000
                     ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                     10410000
                     ,:DCLVTRNFR.RCV-CUST-NM                            10420000
                     ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                     10430000
                     ,:DCLVTRNFR.RCV-SS-PRIM-NBR                        10440000
                     ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                     10450000
                     ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                       10460000
                     ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                     10470000
                     ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                       10480000
                     ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                     10490000
                     ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                       10500000
                     ,:DCLVTRNFR.RCV-OCC-STTS-CD                        10510000
                     ,:DCLVTRNFR.RCV-CRSPN-NBR                          10520000
                     ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                      10530000
                     ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                     10540000
                     ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                      10550000
                     ,:DCLVTRNFR.CMNT-TXT                               10560000
                     ,:DCLVTRNFR.CMNT-STTS-CD                           10570000
                     ,:DCLVTRNFR.PRCS-DT                                10580000
                     ,:DCLVTRNFR.STTS-CD                                10590000
                     ,:DCLVTRNFR.STTLM-TM-CD                            10600000
                     ,:DCLVTRNFR.VAL-FREE-CD                            10610000
                     ,:DCLVTRNFR.TRANS-RFRN-ID-CD                       10620000
                     ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                     10630000
                     ,:DCLVTRNFR.DB-CR-CD                               10640000
                     ,:DCLVTRNFR.DSTBN-SIDE-CD                          10650000
                     ,:DCLVTRNFR.SYS-ACT-CD                             10660000
                     ,:DCLVTRNFR.SYS-RJCT-RSN-CD                        10670000
                     ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                     10680000
                     ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                     10690000
                     ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                     10700000
                     ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                     10710000
                     ,:DCLVTRNFR.PHSCL-SEQ-NBR                          10720000
                     ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                      10730000
                     ,:DCLVTRNFR.LGCL-SEQ-NBR                           10740000
                     ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                     10750000
                     ,:DCLVTRNFR.RR-CD                                  10760000
                     ,:DCLVTRNFR.BRANCH-CD                              10770000
                     ,:DCLVTRNFR.DVDND-NAA-CD                           10780000
                     ,:DCLVTRNFR.SELL-INSTN-NAA-CD                      10790000
                     ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                      10800000
                     ,:DCLVTRNFR.PRTCP-CONTRA-CD                        10810000
                     ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                      10820000
                     ,:DCLVTRNFR.ACCT-ACTIVITY-IND                      10830000
                     ,:DCLVTRNFR.ACCT-ORDERS-IND                        10840000
                     ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                     10850000
                     ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                     10860000
                     ,:DCLVTRNFR.ACCT-MRGN-DB-IND                       10870000
                     ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                     10880000
                     ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                     10890000
                     ,:DCLVTRNFR.ACCT-AST-EXCS-IND                      10900000
                     ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                     10910000
                     ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                     10920000
                     ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                     10930000
                     ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                     10940000
                     ,:DCLVTRNFR.ACCT-CUST-70-IND                       10950000
                     ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                     10960000
                     ,:DCLVTRNFR.ACCT-MNGD-IND                          10970000
                     ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                      10980000
                     ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                      10990000
                     ,:DCLVTRNFR.NSCC-NON-ADP-IND                       11000000
                     ,:DCLVTRNFR.CYCLE-CD                               11010000
                     ,:DCLVTRNFR.DAYS-STTS-QTY                          11020000
                     ,:DCLVTRNFR.STTLM-DT                               11030000
                     ,:DCLVTRNFR.ACCT-NA-UPDT-IND                       11040000
                     ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                     11050000
                     ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                     11060000
                     ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                     11070000
                     ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                     11080000
                     ,:DCLVTRNFR.ACCT-CD                                11090000
                     ,:DCLVTRNFR.STTLM-ASCTD-DT                         11100000
                     ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                     11110000
                     ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                     11120000
                     ,:DCLVTRNFR.RCRD-STTS-CD                           11130000
                     ,:DCLVTRNFR.NSCC-PEND-CD                           11140000
                     ,:DCLVTRNFR.NSCC-ACK-IND                           11150000
                     ,:DCLVTRNFR.CICS-TERM-ID-CD                        11160000
                     ,:DCLVTRNFR.PRGM-NM                                11170000
                     ,:DCLVTRNFR.CRT-TMSTP                              11180000
                     ,:DCLVTRNFR.UPDT-TMSTP                             11190000
                     ,:DCLVTRNFR.ACCT-EQUITY-AMT                        11200000
LRM003               ,:DCLVTRNFR.ACCT-CLT-RSCND-IND                     11210000
LRM003               ,:DCLVTRNFR.ACCT-LGL-BLK-IND                       11220000
LRM006               ,:DCLVTRNFR.RSTR-TRD-90-DY-IND                     11221000
LRM006               ,:DCLVTRNFR.REG-T-IND                              11222000
LRM010               ,:DCLVTRNFR.TRNFR-STTS-110-IND                     11223000
             END-EXEC                                                   11230000
             EVALUATE SQLCODE                                           11240000
                WHEN +0                                                 11250000
                  PERFORM 320-PROCESS-ACAT                              11260000
                         THRU 320-EXIT                                  11270000
                WHEN +100                                               11280000
                  SET ACAT-EOF TO TRUE                                  11290000
                WHEN OTHER                                              11300000
                  PERFORM SQL-ERROR-ROUTINE                             11310000
             END-EVALUATE                                               11320000
           END-PERFORM.                                                 11330000
                                                                        11340000
           EXEC SQL                                                     11350000
              CLOSE VTRNFR_CRSR                                         11360000
           END-EXEC.                                                    11370000
                                                                        11380000
       300-SORTIN-ROUTINE-EXIT.  EXIT.                                  11390000
                                                                        11400000
       320-PROCESS-ACAT.                                                11410000
                                                                        11420000
           IF  B1-WRK-ADP-CL-NO-X      NOT =                            11430000
                       CLIENT-NBR OF DCLVTRNFR (2 : 3)                  11440000
             MOVE 'N'  TO B1-ENTRY-FOUND-SW                             11450000
             PERFORM VARYING B1-SUB  FROM 1 BY 1                        11460000
                   UNTIL B1-SUB  > B1-TBL-CNT                           11470000
               IF  B1-ADP-CL-NO-X (B1-SUB) =                            11480000
                         CLIENT-NBR OF DCLVTRNFR (2 : 3)                11490000
                 AND (B1-SPAD-IND (B1-SUB) = '1' OR '2')                11500000
                   MOVE B1-TABLE (B1-SUB) TO B1-WRK-TABLE               11510000
                   MOVE B1-TBL-CNT   TO B1-SUB                          11520000
                   MOVE 'Y' TO B1-ENTRY-FOUND-SW                        11530000
               END-IF                                                   11540000
             END-PERFORM                                                11550000
           END-IF.                                                      11560000
                                                                        11570000
DJ0003     IF B1-ENTRY-FOUND                                            11580000
DJ0003         CONTINUE                                                 11590000
DJ0003     ELSE                                                         11600000
DJ0003         GO TO 320-EXIT                                           11610000
DJ0003     END-IF.                                                      11620000
                                                                        11630000
                                                                        11640000
           MOVE LOW-VALUES           TO  BROKER-KEY.                    11650000
           MOVE 'O'                  TO  BROKER-EXCHANGE.               11660000
           IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                          11670000
              MOVE DLVR-NBR OF DCLVTRNFR TO CONTRA-BROKER               11680000
           ELSE                                                         11690000
              MOVE RCV-NBR OF DCLVTRNFR  TO CONTRA-BROKER               11700000
           END-IF.                                                      11710000
           MOVE CONTRA-BROKER     TO BROKER-BADGE.                      11720000
           START BROKER-FILE                                            11730000
                KEY IS NOT < BROKER-KEY.                                11740000
                                                                        11750000
           IF NOT BRKR-FILE-OK                                          11760000
C03575         MOVE 'OTHER BROKER' TO BRKR-NAME                         11770000
LRM004         PERFORM 400-SELECT-NAME-FROM-VPRTCPPF                    11780000
           ELSE                                                         11790000
            READ BROKER-FILE NEXT                                       11800000
            IF    BRKR-FILE-OK                                          11810000
              AND BROKER-EXCHANGE = 'O'                                 11820000
              AND BROKER-BADGE    = CONTRA-BROKER                       11830000
                 MOVE BROKER-NAME    TO BRKR-NAME                       11840000
            ELSE                                                        11850000
C03575         MOVE 'OTHER BROKER' TO BRKR-NAME                         11860000
LRM004         PERFORM 400-SELECT-NAME-FROM-VPRTCPPF                    11870000
            END-IF                                                      11880000
           END-IF.                                                      11890000
                                                                        11900000
           MOVE B1-WRK-ADP-CL-NO  TO  SPM-CLT-ID.                       11910000
           MOVE BRANCH-CD OF DCLVTRNFR  TO  SPAD-WK-BR.                 11920000
           MOVE ACCT-CD OF DCLVTRNFR    TO  SPAD-WK-ACCT.               11930000
LRM003     MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO SPM-ACAT-CONTROL-NUMBER11940000
LRM005*****IF SPAD-WORK-ACCOUNT = SPM-USER-KEY                          11950000
LRM005*****   ADD 1                  TO  SPM-APPL-NO                    11960000
LRM005*****ELSE                                                         11970000
              MOVE ZERO              TO  SPM-APPL-NO.                   11980000
           MOVE SPAD-WORK-ACCOUNT TO SPM-USER-KEY.                      11990000
                                                                        12000000
DJ0004***IF REJECT WAS ADDED OR UPDATED TODAY, CREATE SPAD              12010000
DJ0004***IF REJECT NOT ADDED OR UPDATED TODAY, DO NOT CREATE SPAD       12020000
DJ0004     IF (STTS-CD OF DCLVTRNFR = '140' OR '600')                   12030000
DJ0004     AND (UPDT-TMSTP OF DCLVTRNFR (1:10) >= W-COMPARE-DATE)       12040000
                 PERFORM 560-ACAT-ERR-PROC                              12050000
DJ0004           DISPLAY '140/600 STATUS: ' SPM-CLT-ID                  12060000
DJ0004                ' ' SPAD-WK-BR ' ' SPAD-WK-ACCT                   12070000
DJ0004                ' ' SRM-REJECT-EXPL                               12080000
DJ0004                ' ' TRNFR-TYPE-CD OF DCLVTRNFR                    12090000
DJ0004                ' ' STTS-CD OF DCLVTRNFR                          12100000
DJ0004                ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                 12110000
DJ0004                ' ' UPDT-TMSTP OF DCLVTRNFR                       12120000
DJ0004                ' ' PRGM-NM    OF DCLVTRNFR                       12130000
                 GO TO 320-EXIT                                         12140000
           END-IF                                                       12150000
                                                                        12160000
           IF TRNFR-TYPE-CD OF DCLVTRNFR NOT = 'FUL'                    12170000
             PERFORM 555-ACAT-NON-FUL THRU 555-EXIT                     12180000
             GO TO 320-EXIT.                                            12190000
                                                                        12200000
                                                                        12210000
LRM005***--IF-TRNFR-TYPE-CD-OF-DCLVTRNFR-=-'FUL'------------------------12220000
      *-----------------------------------------------------------------12230000
      * TO AND FROM MESSAGES GENERATED FOR NEW 1 (1ST DAY ON FILE)      12240000
      * TWO RECORDS ARE GENERATED (FROM IS RECEIVE) (TO IS DELIVER)     12250000
LRM005     INITIALIZE SPAD-STATUS-MSG.                                  12260000
                                                                        12270000
LRM005***CREATE THIS MESSAGE ON DAY 1                                   12280000
LRM010***  OR WHEN ACCOUNT CHANGED (MARKED BY CAT513)                   12281000
LRM005*****IF    (STTS-CD OF DCLVTRNFR = '100' OR '110')                12290000
LRM005*******AND  DAYS-STTS-QTY OF DCLVTRNFR = +1                       12300000
LRM005     IF (ACAT-CONTROL-NBR OF DCLVTRNFR (1 : 7) =                  12310000
LRM005         WS-JULIAN-PROC-DATE-CCCCDDD                              12320000
LRM010     OR TRNFR-STTS-110-IND OF DCLVTRNFR = 'Y')                    12320100
LRM009*****OR (PARM-STREAM = 'Q'                                        12330000
LRM009*****AND ACAT-CONTROL-NBR OF DCLVTRNFR (1 : 7) =                  12340000
LRM009*********WS-PRIOR-TD-JULIAN))                                     12350000
LRM005     AND  (STTS-CD OF DCLVTRNFR NOT = '140' AND '600')            12360000
              MOVE PROC-DATE-PLUS-18MTHS-N TO  SPM-EXP-DATE-CCYYMMDD    12370000
LRM010        PERFORM 325-UPDATE-VTRNFR                                 12372006
              IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                       12380000
DJ0001         IF B1-WRK-SPAD-IND = '1'                                 12390000
C05762          MOVE  PROC-DATE-PLUS-30DAYS-N TO SPM-EXP-DATE-CCYYMMDD  12400000
                MOVE '9348 '               TO  SPM-MESG                 12410000
                PERFORM 575-RELEASE-REC THRU                            12420000
                        575-RELEASE-REC-EXIT                            12430000
DJ0001         END-IF                                                   12440000
C05762          MOVE PROC-DATE-PLUS-18MTHS-N TO  SPM-EXP-DATE-CCYYMMDD  12450000
                MOVE CONTRA-BROKER         TO  SFM-CONTRA-BKR           12460000
                MOVE BRKR-NAME             TO  SFM-BKR-NAME             12470000
                MOVE ACCT-DLVR-NBR OF DCLVTRNFR                         12480000
                                           TO  SFM-CONTRA-ACCT          12490000
                MOVE SPAD-FROM-MSG         TO  SPM-MESG                 12500000
                MOVE 1                     TO  SPM-APPL-NO              12510000
              ELSE                                                      12520000
DJ0001         IF B1-WRK-SPAD-IND = '1'                                 12530000
                MOVE '9340 '               TO  SPM-MESG                 12540000
                PERFORM 575-RELEASE-REC THRU                            12550000
                        575-RELEASE-REC-EXIT                            12560000
DJ0001         END-IF                                                   12570000
                MOVE CONTRA-BROKER         TO  STM-CONTRA-BKR           12580000
                MOVE BRKR-NAME             TO  STM-BKR-NAME             12590000
                MOVE ACCT-RCV-NBR OF DCLVTRNFR                          12600000
                                           TO  STM-CONTRA-ACCT          12610000
                MOVE SPAD-TO-MSG           TO  SPM-MESG                 12620000
                MOVE 1                     TO  SPM-APPL-NO              12630000
ET0001          IF B1-WRK-SPAD-MSG-RETENT = '1'                         12640000
ET0001             MOVE 99999999  TO  SPM-EXP-DATE-CCYYMMDD             12650000
ET0001          ELSE                                                    12660000
ET0001             MOVE PROC-DATE-PLUS-18MTHS-N                         12670000
ET0001               TO SPM-EXP-DATE-CCYYMMDD                           12680000
ET0001          END-IF                                                  12690000
              END-IF                                                    12700000
             PERFORM 575-RELEASE-REC THRU                               12710000
                     575-RELEASE-REC-EXIT                               12720000
             MOVE ZERO                  TO  SPM-APPL-NO                 12730000
             MOVE NEXT-PROC-DATE-N      TO  SPM-EXP-DATE-CCYYMMDD       12740000
             MOVE ACAT-CONTROL-NBR OF DCLVTRNFR (5 : 10)                12750000
                                        TO  SSM-CNTL-NO                 12760000
LRM005       EVALUATE STTS-CD OF DCLVTRNFR                              12770000
LRM005        WHEN '100'                                                12780000
LRM005         MOVE 'REQ'       TO   SSM-STATUS                         12790000
LRM005        WHEN '110'                                                12800000
LRM005         MOVE 'REQ ADJ'   TO   SSM-STATUS                         12810000
LRM005        WHEN '120'                                                12820000
LRM005         MOVE 'REQP ADJ'  TO   SSM-STATUS                         12830000
LRM005        WHEN '130'                                                12840000
LRM005         MOVE 'REQ PAST'  TO   SSM-STATUS                         12850000
LRM005        WHEN '140'                                                12860000
LRM005         MOVE 'REQ REJ'   TO   SSM-STATUS                         12870000
LRM005        WHEN '200'                                                12880000
LRM005         MOVE 'REV     '  TO   SSM-STATUS                         12890000
LRM005        WHEN '210'                                                12900000
LRM005         MOVE 'REV ADJ'   TO   SSM-STATUS                         12910000
LRM005        WHEN '220'                                                12920000
LRM005         MOVE 'REV ERR'   TO   SSM-STATUS                         12930000
LRM005        WHEN '230'                                                12940000
LRM005         MOVE 'REV XLE'   TO   SSM-STATUS                         12950000
LRM005        WHEN '300'                                                12960000
LRM005         MOVE 'STL PREP'  TO   SSM-STATUS                         12970000
LRM005        WHEN '310'                                                12980000
LRM005         MOVE 'STL CLOS'  TO   SSM-STATUS                         12990000
LRM005        WHEN '400'                                                13000000
LRM005         MOVE 'CLS PUR'   TO   SSM-STATUS                         13010000
LRM005        WHEN '510'                                                13020000
LRM005         MOVE 'MEM PUR'   TO   SSM-STATUS                         13030000
LRM005        WHEN '600'                                                13040000
LRM005         MOVE 'REJECT '   TO   SSM-STATUS                         13050000
LRM005       END-EVALUATE                                               13060000
             MOVE 1                     TO  SSM-STATUS-DAYS             13070000
             MOVE SPAD-STATUS-MSG       TO  SPM-MESG                    13080000
             PERFORM 575-RELEASE-REC THRU                               13090000
                     575-RELEASE-REC-EXIT                               13100000
DJ0002       MOVE ' '                   TO  SSM-STATUS-REDEFINE         13110000
             GO TO 320-EXIT.                                            13120000
                                                                        13130000
      * NOT NEW CREATE MESSAGE RECORD INDICATING CURRENT STATUS         13140000
           EVALUATE STTS-CD OF DCLVTRNFR                                13150000
            WHEN '100'                                                  13160000
             MOVE 'REQ'       TO   SSM-STATUS                           13170000
            WHEN '110'                                                  13180000
             MOVE 'REQ ADJ'   TO   SSM-STATUS                           13190000
            WHEN '120'                                                  13200000
             MOVE 'REQP ADJ'  TO   SSM-STATUS                           13210000
            WHEN '130'                                                  13220000
             MOVE 'REQ PAST'  TO   SSM-STATUS                           13230000
            WHEN '140'                                                  13240000
             MOVE 'REQ REJ'   TO   SSM-STATUS                           13250000
            WHEN '200'                                                  13260000
             MOVE 'REV     '  TO   SSM-STATUS                           13270000
            WHEN '210'                                                  13280000
             MOVE 'REV ADJ'   TO   SSM-STATUS                           13290000
            WHEN '220'                                                  13300000
             MOVE 'REV ERR'   TO   SSM-STATUS                           13310000
            WHEN '230'                                                  13320000
             MOVE 'REV XLE'   TO   SSM-STATUS                           13330000
            WHEN '300'                                                  13340000
             MOVE 'STL PREP'  TO   SSM-STATUS                           13350000
            WHEN '310'                                                  13360000
             MOVE 'STL CLOS'  TO   SSM-STATUS                           13370000
            WHEN '400'                                                  13380000
             MOVE 'CLS PUR'   TO   SSM-STATUS                           13390000
LRM005      WHEN '500'                                                  13400000
LRM005       MOVE 'MEM PTR'   TO   SSM-STATUS                           13410000
            WHEN '510'                                                  13420000
             MOVE 'MEM PUR'   TO   SSM-STATUS                           13430000
            WHEN '600'                                                  13440000
             MOVE 'REJECT '   TO   SSM-STATUS                           13450000
           END-EVALUATE.                                                13460000
                                                                        13470000
           IF  STTS-CD OF DCLVTRNFR = '310' OR '400'                    13480000
               MOVE PROC-DATE-PLUS-18MTHS-N    TO  SPM-EXP-DATE-CCYYMMDD13490000
DJ0002         IF  STTLM-DT OF DCLVTRNFR = '0001-01-01'                 13500000
DJ0002             MOVE PD-MM             TO  SSM-STATUS-STTLM-DT(1:2)  13510000
DJ0002             MOVE '/'               TO  SSM-STATUS-STTLM-DT(3:1)  13520000
DJ0002             MOVE PD-DD             TO  SSM-STATUS-STTLM-DT(4:2)  13530000
DJ0002             MOVE '/'               TO  SSM-STATUS-STTLM-DT(6:1)  13540000
DJ0002             MOVE PD-YY             TO  SSM-STATUS-STTLM-DT(7:2)  13550000
DJ0002         ELSE                                                     13560000
DJ0002             MOVE STTLM-DT OF DCLVTRNFR  TO  W-STTLM-DT           13570000
DJ0002             MOVE W-STTLM-MM        TO  SSM-STATUS-STTLM-DT(1:2)  13580000
LRM001                                        WS-STTLM-MM               13590000
DJ0002             MOVE '/'               TO  SSM-STATUS-STTLM-DT(3:1)  13600000
DJ0002             MOVE W-STTLM-DD        TO  SSM-STATUS-STTLM-DT(4:2)  13610000
LRM001                                        WS-STTLM-DD               13620000
DJ0002             MOVE '/'               TO  SSM-STATUS-STTLM-DT(6:1)  13630000
DJ0002             MOVE W-STTLM-YY        TO  SSM-STATUS-STTLM-DT(7:2)  13640000
LRM001                                        WS-STTLM-YY               13650000
LRM001             MOVE W-STTLM-CC        TO  WS-STTLM-CC               13660000
DJ0004             IF  WS-STTLM-DT <= PROC-DATE                         13670000
TEST**                 DISPLAY 'BYPASS SPAD ' SPM-CLT-ID                13680000
TEST**                      ' ' SPAD-WK-BR  ' '  SPAD-WK-ACCT           13690000
TEST**                      ' ' ACAT-CONTROL-NBR OF DCLVTRNFR           13700000
TEST**                      ' ' STTS-CD OF DCLVTRNFR                    13710000
TEST**                   ' SD ' WS-STTLM-DT ' <= PROC-DATE ' PROC-DATE  13720000
LRM006*** THE FOLLOWING 90DT LOGIC COMMENTED OUT UNTIL NSCC ACTIVATES.  13720100
LRM006*** THIS MUST BE QA TESTED.                                       13720200
LRM006***              IF RSTR-TRD-90-DY-IND = 'Y'                      13720300
LRM006***              AND WS-STTLM-DT = PROC-DATE                      13720400
LRM006***              AND B1-WRK-CREATE-90DT-SPAD = '1'                13720500
LRM006***              AND TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'           13720600
LRM006***              AND DSTBN-SIDE-CD OF DCLVTRNFR = 'R'             13720700
LRM006***                 PERFORM 330-SELECT-VASSET-90DT-RTN            13720800
LRM006***                 IF (SQLCODE = +0 OR -811)                     13720900
LRM006***                    PERFORM 340-CREATE-90DT-SPAD-RTN           13721000
LRM006***                       THRU 340-EXIT                           13721100
LRM006***                 END-IF                                        13721200
LRM006***              END-IF                                           13721300
LRM006                 IF REG-T-IND = 'Y'                               13721400
LRM006                 AND WS-STTLM-DT = PROC-DATE                      13721500
LRM006                 AND B1-WRK-CREATE-REGT-MARGIN = '1'              13721600
LRM006                 AND TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'           13721700
LRM006                 AND DSTBN-SIDE-CD OF DCLVTRNFR = 'R'             13721800
LRM006                    PERFORM 360-SELECT-VASSET-REGT-RTN            13721900
LRM006                    IF (SQLCODE = +0 OR -811)                     13722000
LRM006                       PERFORM 370-CREATE-REGT-SPAD-RTN           13722100
LRM006                          THRU 370-EXIT                           13722200
LRM006                    END-IF                                        13722300
LRM006                 END-IF                                           13722400
                                                                        13723000
LRM001                 GO TO 320-EXIT                                   13730000
LRM001             END-IF                                               13740000
DJ0002         END-IF                                                   13750000
           ELSE                                                         13760000
               MOVE DAYS-STTS-QTY OF DCLVTRNFR TO SSM-STATUS-DAYS       13770000
               MOVE NEXT-PROC-DATE-N           TO SPM-EXP-DATE-CCYYMMDD 13780000
DJ0002     END-IF.                                                      13790000
                                                                        13800000
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR (5 : 10)                  13810000
                                         TO  SSM-CNTL-NO.               13820000
                                                                        13830000
           MOVE SPAD-STATUS-MSG          TO  SPM-MESG.                  13840000
           PERFORM 575-RELEASE-REC THRU                                 13850000
                   575-RELEASE-REC-EXIT.                                13860000
DJ0002     MOVE ' '                   TO  SSM-STATUS-REDEFINE.          13870000
                                                                        13870100
       320-EXIT.                                                        13880000
           EXIT.                                                        13890000
                                                                        13900000
LRM010 325-UPDATE-VTRNFR.                                               13900100
LRM010     EXEC SQL UPDATE VTRNFR                                       13900200
LRM010       SET TRNFR_STTS_110_IND = 'S'                               13900300
LRM010          WHERE CLIENT_NBR     = :DCLVTRNFR.CLIENT-NBR            13900400
LRM010          AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR      13900500
LRM010     END-EXEC.                                                    13900600
LRM010     IF SQLCODE = +0                                              13900700
LRM010        ADD 1 TO WS-STTS-110-WIPED                                13900800
LRM010     ELSE                                                         13900900
LRM010        MOVE SQLCODE TO W-DB2-SQLCODE                             13901004
LRM010        DISPLAY 'VTRNFR UPDATE PROBLEM '                          13901100
LRM010        DISPLAY 'DB2 STATUS ' W-DB2-SQLCODE                       13901202
LRM010        MOVE 0 TO SQLCODE                                         13901300
LRM010     END-IF.                                                      13901400
LRM006 330-SELECT-VASSET-90DT-RTN.                                      13901500
LRM006     EXEC SQL SELECT ASSET_CMNT_TXT                               13902000
LRM006       INTO :DCLVASSET.ASSET-CMNT-TXT                             13903000
LRM006          FROM VASSET                                             13904000
LRM006       WHERE    CLIENT_NBR       =  :DCLVTRNFR.CLIENT-NBR         13905000
LRM006         AND    ACAT_CONTROL_NBR =  :DCLVTRNFR.ACAT-CONTROL-NBR   13905100
LRM006         AND    STTLM_RSN_CD     =  '90DT'                        13905200
LRM006     END-EXEC.                                                    13906000
LRM006                                                                  13907000
LRM006 340-CREATE-90DT-SPAD-RTN.                                        13908000
LRM006     MOVE ASSET-CMNT-TXT OF DCLVASSET (1 : 8) TO WS-90DT-DATE.    13908100
LRM006     IF ASSET-CMNT-TXT OF DCLVASSET (1 : 8) NOT NUMERIC           13908200
LRM006     OR (WS-90DT-DATE-MM  < '01' OR > '12')                       13908300
LRM006     OR (WS-90DT-DATE-DD  < '01' OR > '31')                       13908400
LRM006     OR  WS-90DT-DATE-CC  < '20'                                  13908700
LRM006     OR (WS-90DT-DATE-MM  = '02'                                  13908800
LRM006       AND WS-90DT-DATE-DD  > '28')                               13908900
LRM006     OR ((WS-90DT-DATE-MM  = '04' OR '06' OR '09' OR '11')        13909000
LRM006       AND WS-90DT-DATE-DD  > '30')                               13909100
LRM006        DISPLAY '90DT SPAD BYPASSED / DATE NOT DB2 COMPATIBLE '   13909200
LRM006           ASSET-CMNT-TXT OF DCLVASSET (1 : 8)                    13909300
LRM006        ' ' CLIENT-NBR OF DCLVTRNFR                               13909400
LRM006        ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                         13909500
LRM006        ' ' ACCT-RCV-NBR OF DCLVTRNFR                             13909600
LRM006     ELSE                                                         13909700
LRM006     IF ASSET-CMNT-TXT OF DCLVASSET (1 : 8) >= PROC-DATE          13909800
LRM006        MOVE WS-90DT-DATE-NUM      TO  SPM-EXP-DATE-CCYYMMDD      13909900
LRM006        MOVE '9203 '               TO  SPM-MESG                   13910000
LRM006        MOVE 'FUNDS IN ADVANCE DAY TRADING CALL NOT MET'          13910100
LRM006                                   TO  SPM-MESG (6 : 41)          13910200
LRM006        PERFORM 575-RELEASE-REC THRU                              13910300
LRM006                575-RELEASE-REC-EXIT                              13910400
LRM006     ELSE                                                         13910500
LRM006        DISPLAY '90DT SPAD BYPASSED / NOT FUTURE DATE CCYYMMDD '  13910600
LRM006           ASSET-CMNT-TXT OF DCLVASSET (1 : 8)                    13910700
LRM006        ' ' CLIENT-NBR OF DCLVTRNFR                               13910800
LRM006        ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                         13910900
LRM006        ' ' ACCT-RCV-NBR OF DCLVTRNFR                             13911000
LRM006     END-IF.                                                      13911100
LRM006                                                                  13911200
LRM006 340-EXIT.                                                        13911300
LRM006     EXIT.                                                        13911400
                                                                        13911500
LRM006 360-SELECT-VASSET-REGT-RTN.                                      13911600
LRM006     EXEC SQL SELECT ASSET_CMNT_TXT                               13911700
LRM006       INTO :DCLVASSET.ASSET-CMNT-TXT                             13911800
LRM006          FROM VASSET                                             13911900
LRM006       WHERE    CLIENT_NBR       =  :DCLVTRNFR.CLIENT-NBR         13912000
LRM006         AND    ACAT_CONTROL_NBR =  :DCLVTRNFR.ACAT-CONTROL-NBR   13912100
LRM006         AND    STTLM_RSN_CD     =  'REGT'                        13912200
LRM006     END-EXEC.                                                    13912300
LRM006                                                                  13912400
LRM006 370-CREATE-REGT-SPAD-RTN.                                        13912500
LRM006     IF ASSET-CMNT-TXT OF DCLVASSET (1 : 8) NUMERIC               13912600
LRM006     AND ASSET-CMNT-TXT OF DCLVASSET (1 : 8) <  PROC-DATE         13912700
LRM006        PERFORM 380-CALC-REGT-PLUS90-RTN                          13912800
LRM006        IF BPD-VALID-RETURN                                       13912900
LRM006           MOVE BPD-DT-CALDATE        TO  WS-REGT-EXP-DATE        13913000
LRM006           MOVE WS-REGT-EXP-DATE-NUM  TO  SPM-EXP-DATE-CCYYMMDD   13913100
LRM006           MOVE '9200 '               TO  SPM-MESG                13913200
LRM006           MOVE 'REGT RECEIVED'       TO  SPM-MESG (6 : 41)       13913300
LRM006           PERFORM 575-RELEASE-REC THRU                           13913400
LRM006                   575-RELEASE-REC-EXIT                           13913500
LRM006        END-IF                                                    13913600
LRM006     ELSE                                                         13913700
LRM006        DISPLAY 'REGT SPAD BYPASSED / NOT PEVIOUS DATE CCYYMMDD ' 13913800
LRM006           ASSET-CMNT-TXT OF DCLVASSET (1 : 8)                    13913900
LRM006        ' ' CLIENT-NBR OF DCLVTRNFR                               13914000
LRM006        ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                         13914100
LRM006        ' ' ACCT-RCV-NBR OF DCLVTRNFR                             13914200
LRM006     END-IF.                                                      13914300
LRM006                                                                  13914400
LRM006 370-EXIT.                                                        13914500
LRM006     EXIT.                                                        13914600
LRM006 380-CALC-REGT-PLUS90-RTN.                                        13914700
LRM006* GET EXPIRATION DATE FOR 9200 REC 90 DAYS AHEAD                  13914800
LRM006                                                                  13914900
LRM006     MOVE  'D'                     TO  BPDATES-REQ-TYPE.          13915000
CSG001*    MOVE  'US'                    TO  BPDATES-CALENDAR-TYPE.     13915100
CSG001     MOVE  '  '                    TO  BPDATES-CALENDAR-TYPE.     13915200
LRM006     MOVE  ASSET-CMNT-TXT OF DCLVASSET (1 : 8)                    13915300
LRM006                                   TO  BPDATES-BASE-DATE.         13915400
LRM006     MOVE  'P'                     TO  BPDATES-DTSEARCH-IND.      13915500
LRM006     MOVE  'C'                     TO  BPDATES-DTSEARCH-TYPE.     13915600
LRM006     MOVE  90                      TO  BPDATES-DTSEARCH-DISP.     13915700
LRM006     CALL   BPDATES             USING  BPDATES-PARAMETERS.        13915800
LRM006                                                                  13915900
LRM006     IF NOT BPD-VALID-RETURN                                      13916000
LRM006        DISPLAY 'BPDATES DISPL +90 DAY FAILED WITH RC = '         13916100
LRM006            BPDATES-RETURN-CODE  ' FOR ' BPDATES-BASE-DATE        13916200
LRM006        DISPLAY 'REGT SPAD BYPASSED'                              13916300
LRM006     END-IF.                                                      13916400
LRM006                                                                  13916500
LRM004 400-SELECT-NAME-FROM-VPRTCPPF.                                   13917000
LRM004     EXEC SQL SELECT                                              13920000
LRM004          PRTCP_NM                                                13930000
LRM004       INTO :PRTCP-NM                                             13940000
LRM004          FROM VPRTCPPF                                           13950000
LRM004       WHERE    PRTCP_NBR  =  :CONTRA-BROKER                      13960000
LRM004     END-EXEC.                                                    13970000
LRM004     IF SQLCODE = +0                                              13980000
LRM004         MOVE PRTCP-NM       TO BRKR-NAME                         13990000
LRM004     END-IF.                                                      14000000
                                                                        14010000
                                                                        14020000
           EJECT                                                        14030000
LRM005***--IF-TRNFR-TYPE-CD-OF-DCLVTRNFR-NOT-=-'FUL'--------------------14040000
      ******************************************************************14050000
       555-ACAT-NON-FUL.                                                14060000
      ******************************************************************14070000
                                                                        14080000
LRM005     INITIALIZE SPAD-NON-FUL-STATUS-MSG.                          14090000
           IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                          14100000
             MOVE 'FROM'      TO   SRSM-TYPE                            14110000
           ELSE                                                         14120000
             MOVE 'TO  '      TO   SRSM-TYPE.                           14130000
                                                                        14140000
           MOVE CONTRA-BROKER        TO  SRSM-CONTRA-BRKR.              14150000
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR (5 : 10)                  14160000
                                     TO  SRSM-CNTL-NO.                  14170000
                                                                        14180000
           MOVE DAYS-STTS-QTY OF DCLVTRNFR TO SRSM-STATUS-DAYS          14190000
                                                                        14200000
           IF STTS-CD OF DCLVTRNFR < '300'                              14210000
             MOVE 'NEW'       TO   SRSM-STATUS                          14220000
           ELSE                                                         14230000
           IF STTS-CD OF DCLVTRNFR < '400'                              14240000
             MOVE 'SETTLE'    TO   SRSM-STATUS                          14250000
LRM005     END-IF                                                       14260000
                                                                        14270000
LRM005     EVALUATE STTS-CD OF DCLVTRNFR                                14280000
LRM005      WHEN '100'                                                  14290000
LRM005       MOVE 'REQ'       TO   SRSM-STATUS                          14300000
LRM005      WHEN '110'                                                  14310000
LRM005       MOVE 'REQ ADJ'   TO   SRSM-STATUS                          14320000
LRM005      WHEN '120'                                                  14330000
LRM005       MOVE 'REQP ADJ'  TO   SRSM-STATUS                          14340000
LRM005      WHEN '130'                                                  14350000
LRM005       MOVE 'REQ PAST'  TO   SRSM-STATUS                          14360000
LRM005      WHEN '140'                                                  14370000
LRM005       MOVE 'REQ REJ'   TO   SRSM-STATUS                          14380000
LRM005      WHEN '200'                                                  14390000
LRM005       MOVE 'REV     '  TO   SRSM-STATUS                          14400000
LRM005      WHEN '210'                                                  14410000
LRM005       MOVE 'REV ADJ'   TO   SRSM-STATUS                          14420000
LRM005      WHEN '220'                                                  14430000
LRM005       MOVE 'REV ERR'   TO   SRSM-STATUS                          14440000
LRM005      WHEN '230'                                                  14450000
LRM005       MOVE 'REV XLE'   TO   SRSM-STATUS                          14460000
LRM005      WHEN '300'                                                  14470000
LRM005       MOVE 'STL PREP'  TO   SRSM-STATUS                          14480000
LRM005      WHEN '310'                                                  14490000
LRM005       MOVE 'STL CLOS'  TO   SRSM-STATUS                          14500000
LRM005      WHEN '400'                                                  14510000
LRM005       MOVE 'CLS PUR'   TO   SRSM-STATUS                          14520000
LRM005      WHEN '500'                                                  14530000
LRM005       MOVE 'MEM PTR'   TO   SRSM-STATUS                          14540000
LRM005      WHEN '510'                                                  14550000
LRM005       MOVE 'MEM PUR'   TO   SRSM-STATUS                          14560000
LRM005      WHEN '600'                                                  14570000
LRM005       MOVE 'REJECT '   TO   SRSM-STATUS                          14580000
LRM005     END-EVALUATE.                                                14590000
                                                                        14600000
LRM005     IF STTS-CD OF DCLVTRNFR < '400'                              14610000
LRM005        CONTINUE                                                  14620000
LRM005     ELSE                                                         14630000
DJ0002         IF  STTLM-DT OF DCLVTRNFR = '0001-01-01'                 14640000
DJ0002             MOVE PD-MM             TO  SRSM-STATUS-STTLM-DT(1:2) 14650000
DJ0002             MOVE '/'               TO  SRSM-STATUS-STTLM-DT(3:1) 14660000
DJ0002             MOVE PD-DD             TO  SRSM-STATUS-STTLM-DT(4:2) 14670000
DJ0002             MOVE '/'               TO  SRSM-STATUS-STTLM-DT(6:1) 14680000
DJ0002             MOVE PD-YY             TO  SRSM-STATUS-STTLM-DT(7:2) 14690000
DJ0002         ELSE                                                     14700000
DJ0002             MOVE STTLM-DT OF DCLVTRNFR  TO  W-STTLM-DT           14710000
DJ0002             MOVE W-STTLM-MM        TO  SRSM-STATUS-STTLM-DT(1:2) 14720000
LRM001                                        WS-STTLM-MM               14730000
DJ0002             MOVE '/'               TO  SRSM-STATUS-STTLM-DT(3:1) 14740000
DJ0002             MOVE W-STTLM-DD        TO  SRSM-STATUS-STTLM-DT(4:2) 14750000
LRM001                                        WS-STTLM-DD               14760000
DJ0002             MOVE '/'               TO  SRSM-STATUS-STTLM-DT(6:1) 14770000
DJ0002             MOVE W-STTLM-YY        TO  SRSM-STATUS-STTLM-DT(7:2) 14780000
LRM001                                        WS-STTLM-YY               14790000
LRM001             MOVE W-STTLM-CC        TO  WS-STTLM-CC               14800000
LRM001             IF WS-STTLM-DT LESS PROC-DATE                        14810000
LRM001                GO TO 555-EXIT                                    14820000
LRM001             END-IF                                               14830000
DJ0002         END-IF                                                   14840000
LRM005     END-IF.                                                      14850000
                                                                        14860000
      * EXPIRATION DATE IS NEXT DAY                                     14870000
           MOVE NEXT-PROC-DATE-N          TO  SPM-EXP-DATE-CCYYMMDD.    14880000
                                                                        14890000
DJ0003* GET EXPIRATION DATE FOR PTD,PTF,PTR,RCL,RCR,MFC,FRV             14900000
DJ0003     IF  STTS-CD OF DCLVTRNFR = '310' OR '400'                    14910000
DJ0003         PERFORM 565-GET-EXP-DATE THRU 565-EXIT                   14920000
DJ0003     END-IF.                                                      14930000
                                                                        14940000
           MOVE TRNFR-TYPE-CD OF DCLVTRNFR TO SRSM-TRNFR-TYPE.          14950000
                                                                        14960000
           MOVE SPAD-NON-FUL-STATUS-MSG   TO  SPM-MESG.                 14970000
           PERFORM 575-RELEASE-REC THRU                                 14980000
                   575-RELEASE-REC-EXIT.                                14990000
DJ0002     MOVE ' '                   TO  SRSM-STATUS-REDEFINE.         15000000
       555-EXIT.                                                        15010000
           EXIT.                                                        15020000
           EJECT                                                        15030000
       560-ACAT-ERR-PROC.                                               15040000
                                                                        15050000
           IF      TRNFR-TYPE-RJCT-CD OF DCLVTRNFR NOT = SPACES         15060000
             MOVE  TRNFR-TYPE-RJCT-CD OF DCLVTRNFR                      15070000
                                      TO  SRM-REJECT-CODE               15080000
           ELSE                                                         15090000
             MOVE SYS-RJCT-RSN-CD OF DCLVTRNFR                          15100000
                                      TO  SRM-REJECT-CODE.              15110000
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR (5 : 10)                  15120000
                                   TO  SRM-CNTL-NO.                     15130000
           EVALUATE  SYS-RJCT-RSN-CD OF DCLVTRNFR                       15140000
             WHEN   '01'                                                15150000
               MOVE 'INVALID FIELD        '      TO  SRM-REJECT-EXPL    15160000
             WHEN   '02'                                                15170000
               MOVE 'MISSED CUTOFF        '      TO  SRM-REJECT-EXPL    15180000
             WHEN   '03'                                                15190000
               MOVE 'MISSING ASSOCIATED AT'      TO  SRM-REJECT-EXPL    15200000
             WHEN   '04'                                                15210000
               MOVE 'OUT OF SEQUENCE      '      TO  SRM-REJECT-EXPL    15220000
             WHEN   '05'                                                15230000
               MOVE 'INVALID PHYSICAL SEQ '      TO  SRM-REJECT-EXPL    15240000
             WHEN   '06'                                                15250000
               MOVE 'LOGICAL OUT OF SEQ   '      TO  SRM-REJECT-EXPL    15260000
             WHEN   '07'                                                15270000
               MOVE 'INVALID LOGICAL SEQ  '      TO  SRM-REJECT-EXPL    15280000
             WHEN   '08'                                                15290000
               MOVE 'INVALID LENGTH       '      TO  SRM-REJECT-EXPL    15300000
             WHEN   '09'                                                15310000
               MOVE 'INVALID RECORD CONT. '      TO  SRM-REJECT-EXPL    15320000
             WHEN   '10'                                                15330000
               MOVE 'INVALID ADD          '      TO  SRM-REJECT-EXPL    15340000
             WHEN   '11'                                                15350000
               MOVE 'INVALID CHANGE       '      TO  SRM-REJECT-EXPL    15360000
             WHEN   '12'                                                15370000
               MOVE 'INVALID DELETE       '      TO  SRM-REJECT-EXPL    15380000
             WHEN   '13'                                                15390000
               MOVE 'INVALID ACTION       '      TO  SRM-REJECT-EXPL    15400000
             WHEN   '14'                                                15410000
               MOVE 'INVALID FOR CONTRA   '      TO  SRM-REJECT-EXPL    15420000
             WHEN   '15'                                                15430000
               MOVE 'INVALID TRANSACTION  '      TO  SRM-REJECT-EXPL    15440000
             WHEN   '16'                                                15450000
               MOVE 'INVALID PARTICIPANT  '      TO  SRM-REJECT-EXPL    15460000
           END-EVALUATE.                                                15470000
                                                                        15480000
           EVALUATE TRNFR-TYPE-RJCT-CD OF DCLVTRNFR                     15490000
             WHEN   '01'                                                15500000
               MOVE 'SS ID MISMATCH       '      TO  SRM-REJECT-EXPL    15510000
             WHEN   '02'                                                15520000
               MOVE 'ACCT TITLE MISMATCH  '      TO  SRM-REJECT-EXPL    15530000
             WHEN   '03'                                                15540000
               MOVE 'DOCUMENT NEEDED'            TO  SRM-REJECT-EXPL    15550000
             WHEN   '04'                                                15560000
               MOVE 'ACCT FLAT'                  TO  SRM-REJECT-EXPL    15570000
             WHEN   '05'                                                15580000
               MOVE 'INVALID ACCT'               TO  SRM-REJECT-EXPL    15590000
             WHEN   '06'                                                15600000
               MOVE 'DUPLICATE'                  TO  SRM-REJECT-EXPL    15610000
             WHEN   '07'                                                15620000
               MOVE 'ACCT IN DIST OR XFER'       TO  SRM-REJECT-EXPL    15630000
             WHEN   '08'                                                15640000
               MOVE 'CLIENT RESCINDED'           TO  SRM-REJECT-EXPL    15650000
             WHEN   '09'                                                15660000
               MOVE 'MISSING AUTH SIG'           TO  SRM-REJECT-EXPL    15670000
             WHEN   '21'                                                15680000
               MOVE 'VIOLATES CRED POLICY'       TO  SRM-REJECT-EXPL    15690000
             WHEN   '22'                                                15700000
               MOVE 'UNRECOGNIZED RCR'           TO  SRM-REJECT-EXPL    15710000
             WHEN   '23'                                                15720000
               MOVE 'UNRECOGNIZED PTD'           TO  SRM-REJECT-EXPL    15730000
             WHEN   '24'                                                15740000
               MOVE 'UNRECOGNIZED FRV'           TO  SRM-REJECT-EXPL    15750000
             WHEN   '25'                                                15760000
               MOVE 'UNRECOGNIZED RCL'           TO  SRM-REJECT-EXPL    15770000
             WHEN   '26'                                                15780000
               MOVE 'UNRECOGNIZED CRD'           TO  SRM-REJECT-EXPL    15790000
LRM005       WHEN   '27'                                                15800000
LRM005         MOVE 'UNRECOGNIZED MFC'           TO  SRM-REJECT-EXPL    15810000
           END-EVALUATE.                                                15820000
           MOVE SPAD-REJECT-MSG                TO  SPM-MESG.            15830000
                                                                        15840000
           MOVE PROC-DATE-PLUS-18MTHS-N     TO  SPM-EXP-DATE-CCYYMMDD.  15850000
                                                                        15860000
DJ0003* GET EXPIRATION DATE FOR PTD,PTF,PTR,RCL,RCR,MFC,FRV             15870000
DJ0003     IF  TRNFR-TYPE-CD OF DCLVTRNFR =                             15880000
LRM007      'PTD' OR 'PTF' OR 'PTR' OR 'RCL' OR 'RCR' OR 'MFC' OR 'FRV' 15890000
DJ0003         PERFORM 565-GET-EXP-DATE THRU 565-EXIT                   15900000
DJ0003     END-IF.                                                      15910000
                                                                        15920000
LRM001     MOVE PRCS-DT OF DCLVTRNFR TO WS-DB2-PROCESS-DT.              15930000
LRM001     MOVE WS-DB2-PROCESS-DT(1 : 4) TO WS-DB2-PROCESS-DT-CCYY.     15940000
LRM001     MOVE WS-DB2-PROCESS-DT(6 : 2) TO WS-DB2-PROCESS-DT-MM.       15950000
LRM001     MOVE WS-DB2-PROCESS-DT(9 : 2) TO WS-DB2-PROCESS-DT-DD.       15960000
LRM009*****IF PARM-STREAM = 'Q'                                         15970000
LRM009*****AND WS-DB2-PROCESS-DT-CCYYMMDD LESS WS-PRIOR-PROC-DATE       15980000
TEST***       DISPLAY 'DROPPED SPAD ERR ' SPM-CLT-ID                    15990000
TEST***              ' '  SPAD-WK-BR  ' '  SPAD-WK-ACCT                 16000000
TEST***              ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                  16010000
LRM009********CONTINUE                                                  16020000
LRM009*****ELSE                                                         16030000
              PERFORM 575-RELEASE-REC THRU                              16040000
                      575-RELEASE-REC-EXIT.                             16050000
                                                                        16060000
LRM003** CAUSE 2ND SPAD MESSAGE TO CLARIFY THE REJECT TO THE USER.      16070000
LRM009*****IF PARM-STREAM = 'Q'                                         16080000
LRM009*****AND WS-DB2-PROCESS-DT-CCYYMMDD LESS WS-PRIOR-PROC-DATE       16090000
LRM009********CONTINUE                                                  16100000
LRM009*****ELSE                                                         16110000
LRM003        IF (ACCT-LGL-BLK-IND = 'Y'                                16120000
LRM003        AND TRNFR-TYPE-RJCT-CD OF DCLVTRNFR = '03')               16130000
LRM003        OR (ACCT-CLT-RSCND-IND = 'Y'                              16140000
LRM003        AND TRNFR-TYPE-RJCT-CD OF DCLVTRNFR = '08')               16150000
LRM003             MOVE 'ON BLOCK FILE'           TO  SRBM-EXPL         16160000
LRM003             MOVE SPAD-RESCIND-BLOCK-MSG    TO  SPM-MESG          16170000
LRM003             ADD  1                         TO  SPM-APPL-NO       16180000
LRM003             PERFORM 575-RELEASE-REC THRU                         16190000
LRM003                     575-RELEASE-REC-EXIT                         16200000
LRM009********END-IF                                                    16210000
LRM003     END-IF.                                                      16220000
                                                                        16230000
           EJECT                                                        16240000
DJ0003 565-GET-EXP-DATE.                                                16250000
DJ0003     EVALUATE TRNFR-TYPE-CD OF DCLVTRNFR                          16260000
DJ0003     WHEN 'PTD'                                                   16270000
DJ0003          IF B1-WRK-PTD-EXP-DATE > 00000000                       16280000
DJ0003             MOVE B1-WRK-PTD-EXP-DATE TO SPM-EXP-DATE-CCYYMMDD    16290000
DJ0003             ADD 1 TO W-PTD-CNT                                   16300000
DJ0003          END-IF                                                  16310000
LRM007     WHEN 'PTF'                                                   16311000
LRM007          IF B1-WRK-PTF-EXP-DATE > 00000000                       16312000
LRM007             MOVE B1-WRK-PTF-EXP-DATE TO SPM-EXP-DATE-CCYYMMDD    16313000
LRM007             ADD 1 TO W-PTF-CNT                                   16314000
LRM007          END-IF                                                  16315000
DJ0003     WHEN 'PTR'                                                   16320000
DJ0003          IF B1-WRK-PTR-EXP-DATE > 00000000                       16330000
DJ0003             MOVE B1-WRK-PTR-EXP-DATE TO SPM-EXP-DATE-CCYYMMDD    16340000
DJ0003             ADD 1 TO W-PTR-CNT                                   16350000
DJ0003          END-IF                                                  16360000
DJ0003     WHEN 'RCL'                                                   16370000
DJ0003          IF B1-WRK-RCL-EXP-DATE > 00000000                       16380000
DJ0003             MOVE B1-WRK-RCL-EXP-DATE TO SPM-EXP-DATE-CCYYMMDD    16390000
DJ0003             ADD 1 TO W-RCL-CNT                                   16400000
DJ0003          END-IF                                                  16410000
DJ0003     WHEN 'RCR'                                                   16420000
DJ0003          IF B1-WRK-RCR-EXP-DATE > 00000000                       16430000
DJ0003             MOVE B1-WRK-RCR-EXP-DATE TO SPM-EXP-DATE-CCYYMMDD    16440000
DJ0003             ADD 1 TO W-RCR-CNT                                   16450000
DJ0003          END-IF                                                  16460000
DJ0003     WHEN 'MFC'                                                   16470000
DJ0003          IF B1-WRK-MFC-EXP-DATE > 00000000                       16480000
DJ0003             MOVE B1-WRK-MFC-EXP-DATE TO SPM-EXP-DATE-CCYYMMDD    16490000
DJ0003             ADD 1 TO W-MFC-CNT                                   16500000
DJ0003          END-IF                                                  16510000
DJ0003     WHEN 'FRV'                                                   16520000
DJ0003          IF B1-WRK-FRV-EXP-DATE > 00000000                       16530000
DJ0003             MOVE B1-WRK-FRV-EXP-DATE TO SPM-EXP-DATE-CCYYMMDD    16540000
DJ0003             ADD 1 TO W-FRV-CNT                                   16550000
DJ0003          END-IF                                                  16560000
DJ0003     END-EVALUATE.                                                16570000
DJ0003 565-EXIT.                                                        16580000
DJ0003     EXIT.                                                        16590000
                                                                        16600000
           EJECT                                                        16610000
       575-RELEASE-REC.                                                 16620000
                                                                        16630000
           RELEASE SORT-REC FROM ACAT-SPAD-REC.                         16640000
           ADD 1 TO ACAT-ACPT-RECS.                                     16650000
       575-RELEASE-REC-EXIT.  EXIT.                                     16660000
      *****************                                                 16670000
       600-SORTOUT-ROUTINE  SECTION.                                    16680000
      *****************                                                 16690000
                                                                        16700000
           DISPLAY '*** CAT754 SORTOUT ROUTINE ***'.                    16710000
                                                                        16720000
           IF ACAT-ACPT-RECS = ZERO                                     16730000
             GO TO 600-SORTOUT-ROUTINE-EXIT.                            16740000
                                                                        16750000
       610-NEXT-REC.                                                    16760000
                                                                        16770000
           RETURN SORT-FILE INTO ACAT-SPAD-REC                          16780000
             AT END GO TO 600-SORTOUT-ROUTINE-EXIT.                     16790000
                                                                        16800000
           IF SPM-APPL-NO = 1                                           16810000
             MOVE ZERO TO SPM-APPL-NO.                                  16820000
                                                                        16830000
           IF ACAT-FIRST-TIME                                           16840000
             MOVE 'N'             TO ACAT-FIRST-TIME-SW                 16850000
             MOVE ACAT-SPAD-REC (1:20) TO SAVE-KEY                      16860000
             MOVE 001                  TO MSGNO                         16870000
             MOVE MSGNO                TO SPM-MESG-NO                   16880000
             PERFORM 700-OUTPUT THRU                                    16890000
                     700-OUTPUT-EXIT                                    16900000
             GO TO 610-NEXT-REC.                                        16910000
                                                                        16920000
           IF ACAT-SPAD-REC (1:20) = SAVE-KEY                           16930000
             ADD   1         TO  MSGNO                                  16940000
             MOVE  MSGNO     TO  SPM-MESG-NO                            16950000
             PERFORM 700-OUTPUT THRU                                    16960000
                     700-OUTPUT-EXIT                                    16970000
             GO TO 610-NEXT-REC.                                        16980000
                                                                        16990000
           MOVE ACAT-SPAD-REC (1:20) TO SAVE-KEY.                       17000000
           MOVE 001                  TO MSGNO.                          17010000
           MOVE MSGNO                TO SPM-MESG-NO.                    17020000
           PERFORM 700-OUTPUT THRU                                      17030000
                   700-OUTPUT-EXIT.                                     17040000
           GO TO 610-NEXT-REC.                                          17050000
                                                                        17060000
       600-SORTOUT-ROUTINE-EXIT.  EXIT.                                 17070000
                                                                        17080000
       700-OUTPUT.                                                      17090000
                                                                        17100000
           IF ACAT-FIRST-WRITE                                          17110000
             MOVE 'N'              TO  ACAT-FIRST-WRITE-SW              17120000
             MOVE SPAD-REC (1:12)  TO  PREV-KEY                         17130000
                                       SPH-KEY                          17140000
             MOVE 'H'              TO  ACAT-TYPE-WRITE                  17150000
             PERFORM 750-WRITE-MESSAGE THRU                             17160000
                     750-WRITE-MESSAGE-EXIT                             17170000
             MOVE 'D'              TO  ACAT-TYPE-WRITE                  17180000
             PERFORM 750-WRITE-MESSAGE THRU                             17190000
                     750-WRITE-MESSAGE-EXIT                             17200000
             GO TO 700-OUTPUT-EXIT.                                     17210000
                                                                        17220000
           IF SPAD-REC (1:12) = PREV-KEY                                17230000
             MOVE 'D'              TO  ACAT-TYPE-WRITE                  17240000
             PERFORM 750-WRITE-MESSAGE THRU                             17250000
                     750-WRITE-MESSAGE-EXIT                             17260000
             GO TO 700-OUTPUT-EXIT.                                     17270000
                                                                        17280000
      * KEY (CLIENT, BRANCH AND ACCOUNT) HAS CHANGED                    17290000
                                                                        17300000
           MOVE PREV-KEY TO SPT-KEY.                                    17310000
           MOVE 'T'                TO  ACAT-TYPE-WRITE.                 17320000
           PERFORM 750-WRITE-MESSAGE THRU                               17330000
                   750-WRITE-MESSAGE-EXIT.                              17340000
           MOVE SPAD-REC (1:12)  TO  PREV-KEY                           17350000
                                     SPH-KEY.                           17360000
           MOVE 'H'              TO  ACAT-TYPE-WRITE.                   17370000
           PERFORM 750-WRITE-MESSAGE THRU                               17380000
                   750-WRITE-MESSAGE-EXIT.                              17390000
           MOVE 'D'              TO  ACAT-TYPE-WRITE.                   17400000
           PERFORM 750-WRITE-MESSAGE THRU                               17410000
                   750-WRITE-MESSAGE-EXIT.                              17420000
                                                                        17430000
       700-OUTPUT-EXIT. EXIT.                                           17440000
                                                                        17450000
       750-WRITE-MESSAGE.                                               17460000
                                                                        17470000
           IF WRITE-HDR                                                 17480000
             WRITE ACAT-SPAD-REC-1 FROM SPAD-HDR                        17490000
             ADD 1  TO  ACAT-SPAD-HDRS                                  17500000
             GO TO 750-WRITE-MESSAGE-EXIT.                              17510000
                                                                        17520000
           IF WRITE-DATA                                                17530000
             WRITE ACAT-SPAD-REC-2 FROM ACAT-SPAD-REC                   17540000
             ADD 1  TO  ACAT-SPAD-RECS                                  17550000
             GO TO 750-WRITE-MESSAGE-EXIT.                              17560000
                                                                        17570000
           IF WRITE-TRLR                                                17580000
             ADD 1  TO  ACAT-SPAD-TRLRS                                 17590000
             WRITE ACAT-SPAD-REC-3 FROM SPAD-TRLR.                      17600000
                                                                        17610000
       750-WRITE-MESSAGE-EXIT. EXIT.                                    17620000
                                                                        17630000
       900-ENDJOB-ROUTINE.                                              17640000
           DISPLAY '*** CAT754 900-ENDJOB-ROUTINE ***'.                 17650000
                                                                        17660000
           IF ACAT-ACPT-RECS = ZERO                                     17670000
             GO TO 925-DISPLAY-TOTALS.                                  17680000
                                                                        17690000
           MOVE PREV-KEY TO SPT-KEY.                                    17700000
           MOVE 'T'                TO  ACAT-TYPE-WRITE.                 17710000
           PERFORM 750-WRITE-MESSAGE THRU                               17720000
                   750-WRITE-MESSAGE-EXIT.                              17730000
                                                                        17740000
       925-DISPLAY-TOTALS.                                              17750000
           DISPLAY 'ACAT RCDS ACCEPTED      = ' ACAT-ACPT-RECS.         17760000
           DISPLAY 'ACAT SPAD HDRS WRTN     = ' ACAT-SPAD-HDRS.         17770000
           DISPLAY 'ACAT SPAD MSG RECS WRTN = ' ACAT-SPAD-RECS.         17780000
           DISPLAY 'ACAT SPAD TRLRS WRTN    = ' ACAT-SPAD-TRLRS.        17790000
DJ0003     DISPLAY ' '                                                  17800000
DJ0003     DISPLAY 'NEW B1 FOR PTD/PTF/PTR/RCL/RCR/MFC/FRV'             17810000
DJ0003             ' STL-CLOS,CLS-PUR,REJECT'                           17820000
DJ0003     DISPLAY 'W-PTD-CNT               = ' W-PTD-CNT               17830000
LRM007     DISPLAY 'W-PTF-CNT               = ' W-PTF-CNT               17831000
DJ0003     DISPLAY 'W-PTR-CNT               = ' W-PTR-CNT               17840000
DJ0003     DISPLAY 'W-RCL-CNT               = ' W-RCL-CNT               17850000
DJ0003     DISPLAY 'W-RCR-CNT               = ' W-RCR-CNT               17860000
DJ0003     DISPLAY 'W-MFC-CNT               = ' W-MFC-CNT               17870000
DJ0003     DISPLAY 'W-FRV-CNT               = ' W-FRV-CNT               17880000
LRM010     DISPLAY 'STATUS 110 UPDATED      = ' WS-STTS-110-WIPED       17881000
                                                                        17890000
           CLOSE ACAT-SPAD-FILE                                         17900000
                 BROKER-FILE.                                           17910000
                                                                        17920000
           IF BRKR-FILE-OK                                              17930000
             NEXT SENTENCE                                              17940000
           ELSE                                                         17950000
             DISPLAY 'BROKER FILE CLOSE ERROR, STATUS = '               17960000
              BROKER-FILE-STATUS.                                       17970000
                                                                        17980000
       900-ENDJOB-ROUTINE-EXIT. EXIT.                                   17990000
                                                                        18000000
       SQL-ERROR-ROUTINE.                                               18010000
                                                                        18020000
           CALL DSNTIAR               USING  SQLCA                      18030000
                                             WS-DB2-MESSAGE-AREA        18040000
                                             WS-ERR-LINE-LEN            18050000
                                                                        18060000
           DISPLAY ' '                                                  18070000
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   18080000
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      18090000
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              18100000
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        18110000
                 END-IF                                                 18120000
           END-PERFORM                                                  18130000
           DISPLAY ' '                                                  18140000
           DISPLAY ' *** CAT754 ABENDED ****'                           18150000
           DISPLAY ' ACAT-CONTROL-NBR = ' ACAT-CONTROL-NBR OF DCLVTRNFR 18160000
           DISPLAY ' '                                                  18170000
           CALL  ABEND     USING DB2-ABEND-CODE.                        18180000
                                                                        18190000
