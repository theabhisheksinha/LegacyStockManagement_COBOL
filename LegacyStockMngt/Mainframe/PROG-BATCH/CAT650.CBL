000001* PDX    - CAT650   C0357782 01/23/15 14:38:44 TBLAMUR            00001024
LRM054* SSR 102208 DST FUND MFC RECEIVE, B1 434669 = 0 CREATE N6 MEMO.  00001104
000001* PDX    - CAT650   C0354861 06/09/14 15:02:56 TBLAMUR            00001200
LRM053* SSR 101150 CETERA PM MEMO REVERSAL FIX ON MFC,FRV. B1 434764    00001300
000001* PDX    - CAT650   C0349436 04/25/14 15:08:52 TBLAMUR            00001400
LRM052* SSR 91504 DTCC CNS SETTLEMENT, USE NEW OFFSET B1 ACCOUNTS.      00001500
000001* PDX    - CAT650   C0332854 10/14/13 08:16:56 TBLAMUR            00001600
LRM043* SSR 85850 MEMO BOOKING CORRECTIONS, BATCH/ENTRY OVERRIDES ON    00001700
LRM043*   NON STANDARDS CONFLICT WITH 434760, AND QTY REFRESH.          00001800
000001* PDX    - CAT650   C0344128 09/11/13 14:01:33 TBLAMUR            00001900
LRM042* SSR 94296 FOR NEW COPYBOOK VERSION FOR NTWIOREC.                00002000
000001* PDX    - CAT650   C0339180 06/05/13 11:16:33 TBLAMUR            00002100
LRM041* SSR 90340 CREATE FUNDSERV MEMO FOR PENDING, REJECTED FUNDS      00002200
LRM041*   BASED ON B1 434764 NEW FIELD MEMO-ORG-RVRSL-QTY               00002300
LRM040* SSR 85742 CREATE N6 MEMO FOR DST/SCHWABB FUNDS.                 00002400
000001* PDX    - CAT650   C0329036 09/10/12 13:59:09 TBLAMUR            00002500
LRM039* SSR 84763 BOOK DELIVERY OUT OF FOREIGN CURRENCY BASED ON        00002600
LRM039* CAT650DB PASSING IT FROM VASSET, WHERE THE POSN IS HELD.        00002700
000001* PDX    - CAT650   C0327635 06/13/12 11:32:15 TBLAMUR            00002800
LRM038* SSR 83556 TAXLOT/DTCC CHANGE CBRS002.12 TO PASS ASSET SEQ NUMBER00002900
LRM038*   IN BOOKING TRAILER, WHEN NOT A PTF, IT ALREADY CONTAINS CATS. 00003000
LRM038*   THE FORMAT IS 'SEQN######'.                                   00003100
000001* PDX    - CAT650   C0325267 04/13/12 14:56:11 TBLAMUR            00003200
LRM037* SSR 84873 ONLY PASS NON FULL RECORDS ON CAGE13 FILE WHEN        00003300
LRM037*  SETTLE DATE IS TOMORROW, TO PREVENT THEM FROM GOING TWICE.     00003400
000001* PDX    - CAT650   C0321504 01/17/12 10:29:28 TBLAMUR            00003500
LRM036* SSR 80890 B1 434671 TO ALLOW BLOTTER CODE BY SETTLE LOC RSN.    00003600
000001* PDX    - CAT650   C0319295 11/21/11 07:56:49 TBLAMUR            00003700
000001* PDX    - CAT650   C0150647 11/17/11 15:20:52 TBLAMUR            00003800
LRM035* SSR 78938 CORRECTION FOR TLE-MISC UPDATE ON B204, MOVE '2' TO   00003900
LRM035*  POSITION 120 TO CAUSE P&S TO UPDATE.                           00004000
000001* PDX    - CAT650   C0313692 09/23/11 09:11:59 TBLAMUR            00004100
LRM034* SSR 78938 MOVE "CATS" FOLLOWED BY FUNDSERV CNTL NBR TO THE      00004200
LRM034*  FIRST BOOKING TRAILER RECORD FOR A PTF ONLY.                   00004300
000001* PDX    - CAT650   C0315896 09/01/11 09:39:54 TBLAMUR            00004400
LRM033* SSR 79797 SKIP SHADOW CREATE OF PTF WITH QTY=0.                 00004500
000001* PDX    - CAT650   C0312139 08/31/11 07:39:42 TBLAMUR            00004600
LRM032* SSR 77868 CREATE 2R MEMO ON RECIEVER SIDE SFK OR RSEC TO        00004700
LRM032*   REPLACE SK BASED ON B1 434760.                                00004800
000001* PDX    - CAT650   C0302790 11/18/10 14:54:36 TBLAMUR            00004900
LRM031* SSR 74566 ADD OVERRIDE B1S FOR PTR/DPT RECV/DELR BATCH,ENTRY CD.00005000
000001* PDX    - CAT650   C0298051 07/27/10 13:51:20 TBLAMUR            00005100
LRM030* SSR 69017 CAUSE MFC TO COME OUT ON SHADOW POST P2.              00005200
000001* PDX    - CAT650   C0297529 06/09/10 09:36:38 TBLAMUR            00005300
LRM029* SSR 69411 ADDITIONAL CHANGE, REMOVE NTWLVL 6 QUAL TO USE OFFSET.00005400
000001* PDX    - CAT650   C0290731 03/15/10 14:50:03 TBLAMUR            00005500
LRM029* SSR 69411 USE PNC OFFSET 540238 ON PNC FUNDS.                   00005600
LRM028* SSR 69694 PASS ORIG SETTLE LOCATION ON CAGE T3 FILE             00005700
LRM027* SSR 66209 434584=3 ADDITIONAL ACCT TYPES FOR IRA ROLLOVER       00005800
000001* PDX    - CAT650   C0266889 02/24/09 10:04:21 TBLAMUR            00005900
LRM026* SSR 52708 ADDITIONAL CHANGE, REQUIRE B1 434610=0 WITH POST      00006000
LRM026* SETTLE FAIL CREATE; 434669=2 WITH MFC FAIL CLEANUP TO CAGE.     00006100
000001* PDX    - CAT650   C0266889 01/30/09 09:49:58 TBYOHON            00006200
LRM025* SSR 61124 NEW B1S FOR PTF TRAILER AND BATCH/ENTRY               00006300
LRM025* BYPASS PTF ON CAGE T3RDFL.                                      00006400
000001* PDX    - CAT650   C0272055 10/23/08 11:33:04 TBLAMUR            00006500
LRM024* SSR 60125 ADDITIONAL FIELDS ON XTL REPORT.                      00006600
LRM023* SSR 57663 FORCE INBOUND SHORT POSN INTO TYPE1 FOM TYPE2         00006700
LRM023*    FOR NON MARGINABLE ACCOUNTS ONLY. WRITE OUT TO EXTRACT FILE. 00006800
000001* PDX    - CAT650   C0253565 10/29/07 08:51:06 TBLAMUR            00006900
LRM022* SSR 52712 B1 434734 TO FORCE INBOUND DEBIT BALS INTO TYPE1      00007000
LRM022* FOR NON MARGINABLE ACCOUNTS ONLY. WRITE OUT TO EXTRACT FILE.    00007100
000001* PDX    - CAT650   C0249522 07/31/07 09:57:56 TBLAMUR            00007200
LRM021* 06/01/07 SSR 51381 ADD OPTION OFFSET B1 434643.                 00007300
000001* PDX    - CAT650   C0249006 06/29/07 14:22:41 TBLAMUR            00007400
LRM020* SSR 47339 POPULATE GETMSD-CLIENT-NO WHEN CALLING GETMSD         00007500
000001* PDX    - CAT650   C0247164 05/03/07 14:58:00 TBLAMUR            00007600
LRM019* 04/10/07 SSR 47211 POST SETTLE FAILS. CHANGE B1 434617 TO       00007700
LRM019*          CREATE FAILS ON S/D, CHANGE POST-SETTLE-FILE PROCESS   00007800
LRM019*          TO REMOVE WEALTH MNGT HARD CODING POST STTL BOOKING    00007900
LRM019*          AND TO DRIVE FAIL SET-UP BASED ON THE INPUT.           00008000
LRM019* ADDL CHANGE FROM P2MKT TO MGR02MKV TO PERVENT BILL $ OVERFLOW.  00008100
000001* PDX    - CAT650   C0228344 01/24/06 12:14:23 TBLAMUR            00008200
LRM018* 12/21/05 SSR 37158 ONGOING, FLIP DB/CR ON WM FRV.               00008300
000001* PDX    - CAT650   C0225257 09/23/05 10:40:18 TBLAMUR            00008400
LRM017* SSR 42037 WEALTH MNGT, REVERSE PENDING WHEN REJECT AFTER S/D.   00008500
000001* PDX    - CAT650   C0222541 08/04/05 09:31:44 TBLAMUR            00008600
LRM016* 06/21/05 SSR 41374 USE ORIG 866 SECR NBR AND AMT IF AVAILABLE.  00008700
LRM017* WEALTH MNGT CHANGE, USE ADP NBR ON CNS CASH OFFSETS.            00008800
LRM017* USE ALTERNATE CNS ACCOUNT FOR WM.                               00008900
000001* PDX    - CAT650   C0222440 07/06/05 13:45:33 TBLAMUR            00009000
LRM015* 07/06/05 DON'T OVERRIDE MEMO TRIDS VIA PARTIAL B1S.             00009100
LRM014* 06/20/05 RETAIN ORIG 866 SECR NBR AND AMT; CREATE EXTR OF DTLS  00009200
000001* PDX    - CAT650   C0218221 06/07/05 15:19:37 TBLAMUR            00009300
LRM013* 03/28/05 SSR 0039561 TRAILERS (NEW B1S) FOR NON FULLS AND       00009400
LRM013*          NEW B1S FOR RCL, PTR BATCH ENTRY CODES.                00009500
LRM012* 03/07/05 SSR 0040438 WM FUNDSERV BOOKING. USE SPECIAL WM LOGIC. 00009600
LRM012*        - ALSO WM ONLY CREATE FAIL FOR REJ ON S/D.               00009700
000001* PDX    - CAT650   C0215216 02/14/05 08:29:59 TBLAMUR            00009800
LRM010* 12/29/04 SSR 0039562 USE ADP NBR 8661278 ON PTR,PTD FOR DLVY.   00009900
000001* PDX    - CAT650   C0215088 12/23/04 08:55:28 TBLAMUR            00010000
000001* PDX    - CAT650   C0210469 12/07/04 14:32:56 TBLAMUR            00010100
LRM009* 08/31/04 SSR 0034535 PASS CAGE TAG NUMBER ON FAIL CLEAN-UPS.    00010200
LRM009* CREATE EXTRACT FILE OFUND HAVE FUNDSERV INDICATORS ON S/D TO    00010300
LRM009* BE SAVED ON VASTHSTY.                                           00010400
000001* PDX    - CAT650   C0197426 04/29/04 11:44:47 TBLAMUR            00010500
000001* LRM008 SSR# 0036087 BANK HOLIDAY ISSUE. COMPARE FUNDSERV        00010600
000001*   DATE (REJECTED BY FUND THAT DAY) TO QUALIFY CAGE FAILS        00010700
000001*   TO NOT PASS T3RDFL ON MULTIPLE DAYS.                          00010800
000001* PDX    - CAT650   C0204283 04/06/04 09:48:15 TBLAMUR            00010900
000001* LRM007 - SSR# 0031094 MISSING SHADOW RCVR SIDE FUNDS            00011000
000001* PDX    - CAT650   C0200589 03/31/04 11:27:42 TBLAMUR            00011100
000001* LRM006 - SSR# 0029825 MFRS OFFSET ACCOUNT                       00011200
000001* PDX    - CAT650   C0199458 02/20/04 08:42:39 TBLAMUR            00011300
000001* LRM005 - SSR# 0031094 SHADOW POSTING                            00011400
000001* PDX    - CAT650   C0195977 09/19/03 12:07:54 TBLAMUR            00011500
000001* PDX    - CAT650   C0184969 04/07/03 21:41:28 TBLAMUR            00011600
000001* PDX    - CAT650   C0188213 03/21/03 08:49:08 TBLAMUR            00011700
000001* LRM004 - SSR# 0024350 USE SIAC 068 PARTICIPANT FILE             00011800
000001* PDX    - CAT650   C0187339 03/03/03 16:16:28 TBLAMUR            00011900
000001* PDX    - CAT650   C0179270 10/08/02 08:52:46 TBLAMUR            00012000
000001* LRM003 - SSR# 0029440 FUND PROCESSING FOR DST/MFE               00012100
000001* PDX    - CAT650   C0177984 07/24/02 11:56:23 TBEDTAK            00012200
000001* ET0001 - ADDITIONAL ACCT TYPE CODE FOR RETIREMENT ACCOUNT       00012300
000001* PDX    - CAT650   C0176431 06/24/02 16:01:32 TBLAMUR            00012400
000001* LRM002 - SSR# 0029188 MULTI PLATFORM O-NSCC                     00012500
000001* PDX    - CAT650   C0158537 08/23/01 10:19:08 TBLAMUR            00012600
      * DJ0001 - MFC MUTUAL FUND CLEANUP BOOKEEPING                     00012700
000001* PDX    - CAT650   C0160529 06/27/01 12:13:33 TBLAMUR            00012800
000001* PDX    - CAT650   C0158046 05/24/01 11:58:12 TBLAMUR            00012900
000011* PDX    - CAT650   C0155938 03/22/01 11:12:10 TBYOHON            00013000
000012* PDX    - CAT650   C0155408 03/07/01 08:40:46 TBLAMUR            00013100
000013* PDX    - CAT650   C0154401 02/26/01 11:47:55 TBLAMUR            00013200
000014* PDX    - CAT650   C0135778 04/06/00 14:53:19 TBLAMUR            00013300
000015* PDX    - CAT650   C0130138 09/13/99 08:06:47 TBLAMUR            00013400
000016* PDX    - CAT650   C0129778 08/13/99 14:11:22 TBTIKUO            00013500
000017* PDX    - CAT650   C0127169 06/22/99 08:37:27 TBTIKUO            00013600
000018* PDX    - CAT650   C0126741 06/18/99 15:44:42 TBTIKUO            00013700
000019* PDX    - CAT650   C0124431 05/14/99 09:59:09 TBLAMUR            00013800
000020* PDX    - CAT650   C0123163 03/15/99 15:13:05 TBLAMUR            00013900
000021* PDX    - CAT650   C0122583 03/05/99 09:14:38 TBLAMUR            00014000
000030* PDX    - CAT650   C0122432 03/01/99 08:03:07 TBLAMUR            00014100
000040* PDX    - CAT650   C0122392 02/26/99 14:02:15 TBYOHON            00014200
000050* PDX    - CAT650   C0122288 02/25/99 11:22:33 TBYOHON            00014300
000060* PDX    - CAT650   C0122068 02/22/99 15:22:26 TBYOHON            00014400
000070* PDX    - CAT650   C0121192 02/08/99 14:05:06 TBYOHON            00014500
000080* PDX    - CAT650   C0120641 01/28/99 17:52:26 TBYOHON            00014600
000090* PDX    - CAT650   C0120408 01/21/99 08:36:39 TBYOHON            00014700
000100* PDX    - CAT650   C0119489 01/08/99 10:13:37 TBLAMUR            00014800
000200* PDX    - CAT650   C0119083 12/10/98 11:44:02 TBLAMUR            00014900
000300* PDX    - CAT650   C0115132 11/13/98 08:51:14 TBLAMUR            00015000
000400***************************************************************** 00015100
000500 IDENTIFICATION DIVISION.                                         00015200
000600***************************************************************** 00015300
000700 PROGRAM-ID. CAT650.                                              00015400
000800*                                                                 00015500
000900*---------------------------------------------------------------  00015600
001000* COPIED SOURCE CAT15 FROM PRODUCTION 9/98 FOR REWRITE PROJECT.   00015700
001100* REMOVED SIAC103 AND WRAP AROUND PENDING ASSET FILES, REPLACED   00015800
001200* THEM WITH DB2 ACTIVE ASSETS.  REMOVED INTERNAL SORT.            00015900
001300* CHANGED CAGE/2 OUTPUT TO NEW LAYOUT BASED ON S/D +1; S/D +ZERO  00016000
001400* ARE RECORDS TO BE CONSIDER FOR BOOKKEEPING.                     00016100
001500*---------------------------------------------------------------  00016200
001600* ACAT NSCC SYSTEM ENHANCEMENTS FOR 5/31/96                       00016300
001700* ACAT YEAR 2000 CHANGES                                          00016400
001800* ADD LOGIC TO USE MODIFIED B1#501360 = '2' TO PROCESS TIF ACCOUNT00016500
001900*     TYPES OF I, Q & R. ALL FUNCTIONALITY BUILT AROUND ACCOUNT   00016600
002000*     TYPE 'R' IS NOW APPLIED TO ACCOUNT TYPES 'I' & 'Q' USING    00016700
002100*     HARDCODED SECURITY NUMBERS 8660301 & 8660314.               00016800
002200* NEW B1 TO HANDLE RECEIVE OF NON-CASH TYPE ASSETS                00016900
002300* NEW B1 TO OVERRIDE DELIVERER INDICATOR OF BEARER BONDS.         00017000
002400* NEW B1 TO NOT BOOK RESTRICTED SEC'S ON ACAT RECEIVE             00017100
002500*---------------------------------------------------------------  00017200
002600* PDX#0127169 - NEW B1 #434617 (ACAT FAILS FOR FUND SERVE ITEMS)  00017300
002700* FUNCTIONAL SPECS FOR THIS CHANGE IS -------> (TCK001)           00017400
002800*                                                                 00017500
002900* THE ACAT-FUND/SERV SYSTEM IS NOT PASSING FAILS TO CAGE FOR ITEMS00017600
003000* THAT ARE REJECTED ON OR AFTER SETTLEMENT DATE.  FAILS WILL BE   00018000
003100* PASSED TO THE CAGE AGAIN ONLY WHEN CLIENTS ACTIVATE B1 434617   00019000
003200* WITH A VALUE OF 1.  THE CLIENTS SHOULD SET B1 434610 TO A VALUE 00020000
003300* OF 0 ON THE SAME DAY SO THAT POST SETTLEMENT DATE BOOKKEEPING   00030000
003400* IS AGAIN ACTIVATED.                                             00040000
003500*                                                                 00050000
003600*---------------------------------------------------------------  00060000
003700* 06/22/99 - PDX#0129778   (TCK002)                               00070000
003800* ADD LOGIC TO HANDLE FUND/SERVS SURPAS(B1 537435) POST THE VALUE 00080000
003900* DATE ON THE BOOKKEEPING ENTRY (STTLMT DT). ADD A TRAILER RECORD 00090000
004000* TO INCLUDE THE CUSTOMER ACCOUNT NUMBER IN THE DISCRIPTION.      00100000
004100* (ON OR BEFORE SETTLEMENT DATE)                                  00110000
004200*---------------------------------------------------------------  00120000
004300* 07/16/99 - PDX#0129778   (TCK003)                               00130000
004400*            ALPHA-BRANCH                                         00140000
004500*---------------------------------------------------------------  00150000
004600* 08/04/99 - PDX#0129778, ACAT RESOLUTION LOG #470 (TCK004)       00160000
004700*   PENDING SETTLEMENT ACCOUNT B1- 434637 (RCV), 434638(DEL)      00170000
004800*---------------------------------------------------------------  00180000
004900* 08/27/99 - PDX#0130138,  ACAT RESOLUTION LOG  #471 (TCK005)     00190000
005000*   CORRECT THE ENTRY CODE LOGIC FOR DIRECT ROLLOVERS,            00200000
005100*   READ THE IRA B1(001202) IF THE VALUE IS '1', PROCESS AS IT    00210000
005200*   IS, IF THE VALUE IS '0', THEN SUPPRESS THE BOOKKEEPING        00220000
005300*   ENTRIES THAT CREATE THE MARKET VALUE ENTRIES WITH THE '866'   00230000
005301*   SECURITY NUMBERS.                                             00240000
005302*---------------------------------------------------------------  00250000
LRM001* CHANGE TO USE O-NSCC OFFSET ACCOUNT REGUARDLESS OF NETWORK LVL. 00260000
LRM001*---------------------------------------------------------------  00270000
005303/                                                                 00280000
005304***************************************************************** 00290000
005305 ENVIRONMENT DIVISION.                                            00300000
005306***************************************************************** 00310000
005307 INPUT-OUTPUT SECTION.                                            00320000
005308                                                                  00330000
005309 FILE-CONTROL.                                                    00340000
005310***********************  INPUT FILES  *************************** 00350000
005320                                                                  00360000
005330     SELECT  PEND-FILE           ASSIGN  TO  UT-S-IPEND           00370000
005340                            FILE STATUS  IS  PEND-FILE-STATUS.    00380000
005350                                                                  00390000
005360     SELECT  MFPEND-FILE         ASSIGN  TO  UT-S-IMFPEND.        00400000
005370                                                                  00410000
005380     SELECT NTWREG-FILE       ASSIGN  TO  NTWREGOP                00420000
005390        ORGANIZATION  IS  INDEXED                                 00430000
005400        ACCESS        IS  DYNAMIC                                 00440000
005500        RECORD KEY    IS  NTWREG-KEY-IN                           00450000
005600        FILE STATUS   IS  NTWREG-FILE-STATUS.                     00460000
005700                                                                  00470000
005800     SELECT  MEMO-FILE           ASSIGN  TO  FIDMSS               00480000
005900                           ORGANIZATION  IS  INDEXED              00490000
006000                                 ACCESS  IS  DYNAMIC              00500000
006100                             RECORD KEY  IS  MEMO-KEY             00510000
006200                            FILE STATUS  IS  MEMO-FILE-STATUS.    00520000
006300                                                                  00530000
006400     SELECT  PRNG-FILE           ASSIGN  TO  PRNGFL               00540000
006500                           ORGANIZATION  IS  INDEXED              00550000
006600                                 ACCESS  IS  DYNAMIC              00560000
006700                             RECORD KEY  IS  PRNGKEY              00570000
006800                            FILE STATUS  IS  PRNG-FILE-STATUS.    00580000
006900                                                                  00590000
007000     SELECT  BROKER-FILE         ASSIGN  TO  BRKRFL               00600000
007100                           ORGANIZATION  IS  INDEXED              00610000
007200                                 ACCESS  IS  DYNAMIC              00620000
007300                             RECORD KEY  IS  BROKER-KEY           00630000
007400                            FILE STATUS  IS  BROKER-FILE-STATUS.  00640000
007500                                                                  00650000
007600     SELECT ACATS-PARTICIPANT-FILE ASSIGN TO UT-S-ACATBRKR.       00660000
LRM012                                                                  00670000
LRM012     SELECT POST-SETTLE-FILE ASSIGN       TO UT-S-PSSETTLE.       00680000
007700/                                                                 00690000
007800***********************  OUTPUT FILES  ************************** 00700000
007900                                                                  00710000
008000     SELECT  P2BKPG-FILE         ASSIGN  TO  UT-S-P2BKPG          00720000
008100                            FILE STATUS  IS  P2BKPG-FILE-STATUS.  00730000
008200                                                                  00740000
008300     SELECT  T3RDFL-FILE         ASSIGN  TO  UT-S-T3RDFL          00750000
008400                            FILE STATUS  IS  T3RDFL-FILE-STATUS.  00760000
008500                                                                  00770000
008600     SELECT  CAG2FL-FILE         ASSIGN  TO  UT-S-CAG2FL          00780000
008700                            FILE STATUS  IS  CAG2FL-FILE-STATUS.  00790000
008800                                                                  00800000
008900     SELECT  CAGE-CAT13-FILE     ASSIGN  TO  UT-S-CAGE13.         00810000
009000                                                                  00820000
009100     SELECT  XSTLPI-FILE         ASSIGN  TO  UT-S-XSTLPI          00830000
009200                            FILE STATUS  IS  XSTLPI-FILE-STATUS.  00840000
LRM009                                                                  00850000
LRM009     SELECT  FUNDSERV-EXTR-FILE  ASSIGN  TO  UT-S-OFUND.          00860000
009300                                                                  00870000
LRM014     SELECT  ROLLOVER-866-EXTR   ASSIGN  TO  UT-S-ROLL866.        00880000
009350                                                                  00890000
LRM022     SELECT  TYPE2-CASH-EXTR     ASSIGN  TO  UT-S-TYP2CSH.        00900000
009400/                                                                 00910000
009500***************************************************************** 00920000
009600 DATA DIVISION.                                                   00930000
009700***************************************************************** 00940000
009800 FILE SECTION.                                                    00950000
009900                                                                  00960000
010000 FD  PEND-FILE                                                    00970000
010100     RECORDING MODE V                                             00980000
010200     BLOCK CONTAINS 0 RECORDS.                                    00990000
010300                                                                  01000000
010400     COPY ACATPEND  REPLACING ==:FMT:== BY ==PEND==.              01010000
010500                                                                  01020000
010600 FD  MFPEND-FILE                                                  01030000
010700     RECORDING MODE V                                             01040000
010800     BLOCK CONTAINS 0 RECORDS.                                    01050000
010900                                                                  01060000
011000     COPY ACATPEND  REPLACING ==:FMT:== BY ==MPND==.              01070000
011100                                                                  01080000
011200                                                                  01090000
011300 FD  MEMO-FILE                                                    01100000
011400     RECORD CONTAINS 250 CHARACTERS.                              01110000
011500                                                                  01120000
011600 01  MEMO-RECORD.                                                 01130000
011700     05  MEMO-KEY.                                                01140000
011800         10  MEMO-CLIENT         PIC X(03).                       01150000
011900         10  MEMO-CODE           PIC X(02).                       01160000
012000     05  FILLER                  PIC X(245).                      01170000
012100                                                                  01180000
012200 FD  NTWREG-FILE.                                                 01190000
012300 01  NTWREG-RECORD.                                               01200000
012400     05  NTWREG-KEY-IN                PIC  X(18).                 01210000
012500     05  FILLER                       PIC  X(262).                01220000
012600                                                                  01230000
012700                                                                  01240000
012800 FD  PRNG-FILE                                                    01250000
012900     RECORD CONTAINS 80 CHARACTERS.                               01260000
013000                                                                  01270000
013100     COPY PRNGRECC.                                               01280000
013200                                                                  01290000
013300 FD  BROKER-FILE.                                                 01300000
013400                                                                  01310000
013500 01  BROKER-REC.                                                  01320000
013600     05  BROKER-KEY.                                              01330000
013700         10  BROKER-EXCHANGE      PIC X.                          01340000
013800         10  BROKER-BADGE         PIC X(4).                       01350000
013900         10  FILLER               PIC X(6).                       01360000
014000     05  FILLER                   PIC X(12).                      01370000
014100     05  BROKER-NAME              PIC X(33).                      01380000
014200     05  FILLER                   PIC X(24).                      01390000
014300                                                                  01400000
014400 FD  ACATS-PARTICIPANT-FILE                                       01410000
014500     RECORDING MODE F                                             01420000
014600     BLOCK CONTAINS 0 RECORDS                                     01430000
014610     LABEL RECORDS ARE STANDARD                                   01440000
014620     RECORD CONTAINS 150 CHARACTERS.                              01450000
014630                                                                  01460000
014640 01  BANK-RECORD                 PIC X(150).                      01470000
014650                                                                  01480000
LRM012 FD  POST-SETTLE-FILE                                             01490000
LRM012     RECORDING MODE IS V                                          01500000
LRM012     BLOCK CONTAINS 0 RECORDS.                                    01510000
LRM012                                                                  01520000
010400     COPY ACATPEND  REPLACING ==:FMT:== BY ==POST==.              01530000
LRM012                                                                  01540000
014660 FD  P2BKPG-FILE                                                  01550000
014670     RECORDING MODE F                                             01560000
014680     BLOCK CONTAINS 0 RECORDS                                     01570000
014690     LABEL RECORDS ARE STANDARD                                   01580000
014700     RECORD CONTAINS 120 CHARACTERS.                              01590000
014800                                                                  01600000
014900 01  P2BKPG-RECORD               PIC X(120).                      01610000
015000                                                                  01620000
015100                                                                  01630000
015200 FD  T3RDFL-FILE                                                  01640000
015300     RECORDING MODE F                                             01650000
015400     BLOCK CONTAINS 0 RECORDS                                     01660000
015500     LABEL RECORDS ARE STANDARD                                   01670000
015600     RECORD CONTAINS 200 CHARACTERS.                              01680000
015700                                                                  01690000
015800 01  T3RDFL-RECORD               PIC X(200).                      01700000
015900                                                                  01710000
016000                                                                  01720000
016100 FD  CAG2FL-FILE                                                  01730000
016200     RECORDING MODE F                                             01740000
016300     BLOCK CONTAINS 0 RECORDS                                     01750000
016400     LABEL RECORDS ARE STANDARD                                   01760000
016500     RECORD CONTAINS 30 CHARACTERS.                               01770000
016600                                                                  01780000
016700 01  CAG2FL-RECORD               PIC X(30).                       01790000
016800                                                                  01800000
016900                                                                  01810000
017000 FD  CAGE-CAT13-FILE                                              01820000
017100     RECORDING MODE F                                             01830000
017200     BLOCK CONTAINS 0 RECORDS                                     01840000
017300     LABEL RECORDS ARE STANDARD                                   01850000
017400     RECORD CONTAINS 60 CHARACTERS.                               01860000
017500                                                                  01870000
017600*** NEW COPYBOOK FOR CAT13 CURRENT DAY CAGE FILE.                 01880000
017700     COPY ACATCG02 REPLACING ==:CAGE-02:== BY ==CAT13==.          01890000
017800                                                                  01900000
017900                                                                  01910000
018000 FD  XSTLPI-FILE                                                  01920000
018100     RECORDING MODE F                                             01930000
018200     BLOCK CONTAINS 0 RECORDS                                     01940000
018300     LABEL RECORDS ARE STANDARD                                   01950000
018400     RECORD CONTAINS 143 CHARACTERS.                              01960000
018500                                                                  01970000
018600 01  XSTLPI-RECORD               PIC X(143).                      01980000
018700                                                                  01990000
LRM009 FD  FUNDSERV-EXTR-FILE                                           02000000
LRM009     RECORDING MODE V                                             02010000
LRM009     BLOCK CONTAINS 0 RECORDS.                                    02020000
LRM009                                                                  02030000
LRM009     COPY ACATPEND  REPLACING ==:FMT:== BY ==OFUND==.             02040000
LRM009                                                                  02050000
LRM014 FD  ROLLOVER-866-EXTR                                            02060000
LRM014     RECORDING MODE F                                             02070000
LRM014     BLOCK CONTAINS 0 RECORDS                                     02080000
LRM014     LABEL RECORDS ARE STANDARD                                   02090000
LRM014     RECORD CONTAINS 80 CHARACTERS.                               02100000
LRM014                                                                  02110000
LRM014 01  ROLL866-RECORD              PIC X(80).                       02120000
018800                                                                  02130000
LRM022 FD  TYPE2-CASH-EXTR                                              02140000
LRM022     RECORDING MODE F                                             02150000
LRM022     BLOCK CONTAINS 0 RECORDS                                     02160000
LRM022     LABEL RECORDS ARE STANDARD                                   02170000
LRM023     RECORD CONTAINS 250 CHARACTERS.                              02180000
LRM022                                                                  02190000
LRM022 01  TYPE2-CASH-RECORD           PIC X(250).                      02200000
018800                                                                  02210000
018900***************************************************************** 02220000
019000 WORKING-STORAGE  SECTION.                                        02230000
019100***************************************************************** 02240000
019200 77  PGM-NAME                         PIC X(06)  VALUE 'CAT650'.  02250000
019300 77  NTWREG-FILE-STATUS               PIC  X(02)  VALUE '00'.     02260000
019400 77  MF-PROCESS-OPTION                PIC  X      VALUE ' '.      02270000
LRM003     88 DST-MFE-PROCESS        VALUE 'D'.                         02280000
019500     88 OMNIBUS-PROCESS        VALUE 'O'.                         02290000
LRM029     88 PNC-OMNIBUS-PROCESS    VALUE 'P'.                         02300000
019510 77  MF-TABLE-MAINTENANCE             PIC  X      VALUE ' '.      02310000
019520     88 MF-NSCC-SOURCE         VALUE 'Y'.                         02320000
LRM050     88 MF-DST-SCHWABB         VALUE 'S'.                         02330000
019600                                                                  02340000
019700***                                                               02350000
019800 77  WS-STLDT-MINUS-2                 PIC X(08)  VALUE ' '.       02360000
019900***                                                               02370000
020000                                                                  02380000
020100 77  ACAT-PROC-DATE                   PIC X(08)  VALUE ' '.       02390000
020200                                                                  02400000
020300 77  WS-TRADE-PLUS-1                  PIC X(08)  VALUE ' '.       02410000
020400                                                                  02420000
020500 77  WS-TRADE-PLUS-2                  PIC X(08)  VALUE ' '.       02430000
020600                                                                  02440000
020700 77  WS-DATE                          PIC 9(08)  VALUE 0.         02450000
020800                                                                  02460000
020900 77  ABEND-CODE-2000      COMP        PIC S9(4)  VALUE +2000.     02470000
021000                                                                  02480000
021100 77  ABEND-CODE-3000      COMP        PIC S9(4)  VALUE +3000.     02490000
021200                                                                  02500000
021300 77  ABEND-CODE-4000      COMP        PIC S9(4)  VALUE +4000.     02510000
021400                                                                  02520000
021500 77  ACAT-RECS-CLIENT      COMP       PIC S9(9)  VALUE +0.        02530000
021600 77  ACAT-RECS-TOTAL       COMP       PIC S9(9)  VALUE +0.        02540000
021700                                                                  02550000
021800 77  ACAT-FILE-LAST-RUN               PIC X(01)  VALUE '0'.       02560000
021900     88  NO-ACAT-FILE-LAST-RUN                   VALUE '1'.       02570000
022000                                                                  02580000
022100 77  PEND-FILE-STATUS                 PIC X(02).                  02590000
022200     88  PEND-FILE-OK                            VALUE '00'.      02600000
022300     88  PEND-OPEN-OK                            VALUE '00' '97'. 02610000
022400     88  PEND-ENDFILE                            VALUE '10'.      02620000
022500                                                                  02630000
022600                                                                  02640000
022700 77  MEMO-FILE-STATUS                 PIC X(02).                  02650000
022800     88  MEMO-FILE-OK                            VALUE '00'.      02660000
022900     88  MEMO-OPEN-OK                            VALUE '00' '97'. 02670000
023000     88  MEMO-ENDFILE                            VALUE '10'.      02680000
023100     88  MEMO-NOTFOUND                           VALUE '23'.      02690000
023200 77  MEMO-SUB              COMP       PIC S9(4)  VALUE +0.        02700000
023300                                                                  02710000
023400 77  PRNG-FILE-STATUS                 PIC X(02).                  02720000
023500     88  PRNG-FILE-OK                            VALUE '00'.      02730000
023600     88  PRNG-OPEN-OK                            VALUE '00' '97'. 02740000
023700     88  PRNG-ENDFILE                            VALUE '10'.      02750000
023800     88  PRNG-NOTFOUND                           VALUE '23'.      02760000
023900 77  PRNG-FILE-SWITCH                 PIC X(01)  VALUE 'N'.       02770000
024000                                                                  02780000
024100 77  BROKER-FILE-STATUS               PIC X(02).                  02790000
024200     88  BROKER-FILE-OK                          VALUE '00'.      02791000
024300     88  BROKER-OPEN-OK                          VALUE '00' '97'. 02792000
024400     88  BROKER-ENDFILE                          VALUE '10'.      02793000
024500     88  BROKER-NOTFOUND                         VALUE '23'.      02794000
024600 77  BROKER-FILE-SWITCH               PIC X(01)  VALUE 'N'.       02795000
024700                                                                  02796000
024800 77  CATPPL-BROKER-EOF-SW             PIC X(01)  VALUE 'N'.       02797000
024900     88  CATPPL-BROKER-EOF                       VALUE 'Y'.       02798000
025000                                                                  02799000
LRM012 77  POST-SETTLE-EOF-SW               PIC X(01)  VALUE 'N'.       02800000
LRM012     88  POST-SETTLE-EOF                         VALUE 'Y'.       02810000
LRM012                                                                  02820000
LRM013 77  WS-ENTRY-DEL-ROLL                PIC X(3) VALUE SPACES.      02830000
LRM013 77  WS-ENTRY-REC-ROLL                PIC X(3) VALUE SPACES.      02840000
025100 77  WS-NEW-TI-SW                     PIC X(1) VALUE SPACE.       02850000
025200     88  NEW-TI                                VALUE 'Y'.         02860000
025300     88  NOT-NEW-TI                            VALUE 'N'.         02870000
025400 77  WS-NEW-AT-SW                     PIC X(1) VALUE SPACE.       02880000
025500     88  NEW-AT                                VALUE 'Y'.         02890000
025600     88  NOT-NEW-AT                            VALUE 'N'.         02900000
025700*****                                                             02910000
025800 77  WS-BK-FAIL-SW                    PIC X(1) VALUE SPACE.       02920000
025900     88  BK-FAIL-CR         VALUE 'C'.                            02930000
026000     88  BK-FAIL-DB         VALUE 'D'.                            02940000
026100*****                                                             02950000
026200 77  P2BKPG-FILE-STATUS               PIC X(02).                  02960000
026300     88  P2BKPG-FILE-OK                          VALUE '00'.      02970000
026400     88  P2BKPG-OPEN-OK                          VALUE '00' '97'. 02980000
026500 77  P2BKPG-RECS                      PIC 9(11)  VALUE 0.         02990000
026600                                                                  03000000
026700 77  T3RDFL-FILE-STATUS               PIC X(02).                  03010000
026800     88  T3RDFL-FILE-OK                          VALUE '00'.      03020000
026900     88  T3RDFL-OPEN-OK                          VALUE '00' '97'. 03030000
027000 77  T3RDFL-RECS           COMP       PIC S9(9)  VALUE +0.        03040000
027100                                                                  03050000
027200 77  CAG2FL-FILE-STATUS               PIC X(02).                  03060000
027300     88  CAG2FL-FILE-OK                          VALUE '00'.      03070000
027400     88  CAG2FL-OPEN-OK                          VALUE '00' '97'. 03080000
027500 77  CAG2FL-RECS           COMP       PIC S9(9)  VALUE +0.        03090000
027600                                                                  03100000
027700 77  XSTLPI-FILE-STATUS               PIC X(02).                  03110000
027800     88  XSTLPI-FILE-OK                          VALUE '00'.      03120000
027900     88  XSTLPI-OPEN-OK                          VALUE '00' '97'. 03130000
028000 77  XSTLPI-RECS           COMP       PIC S9(9)  VALUE +0.        03140000
028100                                                                  03150000
028200 77  XBILL-SEC-ACAT-ACCTS             PIC 9(07)  VALUE  8093036.  03160000
028300                                                                  03170000
028400 77  XBILL-SEC-ACAT-ASSETS            PIC 9(07)  VALUE  8093037.  03180000
028500                                                                  03190000
028600 77  XBILL-SEC-FUND-SERV-RECV         PIC 9(07)  VALUE  8093043.  03200000
028700                                                                  03210000
028800 77  XBILL-SEC-FUND-SERV-DELV         PIC 9(07)  VALUE  8093039.  03220000
028900                                                                  03230000
029000 77  ROLL-SEC-NO                      PIC X(07)  VALUE '86678  '. 03240000
029100                                                                  03250000
029200 77  ACAT-CL-IS-ADP-CL-SWITCH         PIC X.                      03260000
029300     88  ACAT-CL-IS-ADP-CL                       VALUE 'Y'.       03270000
029400     88  ACAT-CL-IS-NOT-ADP-CL                   VALUE 'N'.       03280000
029500                                                                  03290000
029600 77  WS-ROLL-OFFSET-ACC       PIC X(10) VALUE '0000001909'.       03300000
029700                                                                  03310000
029800 77  WS-CBOE-OFFSET-ACCOUNT   PIC X(15) VALUE '(098-20080-1-3)'.  03320000
029900                                                                  03330000
030000 77  WS-AMEX-NYSE-OFFSET-ACCOUNT                                  03340000
030100                              PIC X(15) VALUE '(098-20090-1-1)'.  03350000
030200                                                                  03360000
030300 77  WS-PBW-OFFSET-ACCOUNT    PIC X(15) VALUE '(098-20015-1-3)'.  03370000
030400                                                                  03380000
030500 77  WS-PSE-OFFSET-ACCOUNT    PIC X(15) VALUE '(098-20016-1-2)'.  03390000
030600                                                                  03400000
030700 77  WS-DFLT-OFFSET-ACCOUNT   PIC X(15) VALUE '(098-20060-1-9)'.  03410000
030800                                                                  03420000
030900 77  END-OF-PEND-FILE-SWITCH          PIC X(01)  VALUE 'N'.       03430000
031000     88  END-OF-PEND-FILE                        VALUE 'Y'.       03440000
031100                                                                  03450000
031200 77  END-OF-MPND-FILE-SWITCH          PIC X(01)  VALUE 'N'.       03460000
031300     88  END-OF-MPND-FILE                        VALUE 'Y'.       03470000
031400                                                                  03480000
031500 77  CONTROL-REC-SWITCH               PIC X(01)  VALUE ' '.       03490000
031600     88  SET-IS-CONTROL-REC                      VALUE 'Y'.       03500000
031700                                                                  03510000
031800 77  ACAT-1ST-RECORD-SWITCH           PIC X(01)  VALUE ' '.       03520000
031900     88  ACAT-1ST-RECORD-FOUND                   VALUE 'Y'.       03530000
032000     88  ACAT-1ST-RECORD-NOT-FOUND               VALUE 'N'.       03540000
032100                                                                  03550000
032200 77  ACAT-2ND-RECORD-SWITCH           PIC X(01)  VALUE ' '.       03560000
032300     88  ACAT-2ND-RECORD-FOUND                   VALUE 'Y'.       03570000
032400     88  ACAT-2ND-RECORD-NOT-FOUND               VALUE 'N'.       03580000
032500                                                                  03590000
032600 77  ACAT-3RD-RECORD-SWITCH           PIC X(01)  VALUE ' '.       03600000
032700     88  ACAT-3RD-RECORD-FOUND                   VALUE 'Y'.       03610000
032800     88  ACAT-3RD-RECORD-NOT-FOUND               VALUE 'N'.       03620000
032900                                                                  03630000
033000 77  FMT-REC-IS-VALID-SWITCH          PIC X(01)  VALUE ' '.       03640000
033100     88  FMT-REC-IS-VALID                        VALUE 'Y'.       03650000
033200                                                                  03660000
033300 77  THIS-RECORD-PRINTED-SWITCH       PIC X(01)  VALUE 'N'.       03670000
033400     88  THIS-RECORD-WAS-PRINTED                 VALUE 'Y'.       03680000
033500     88  THIS-RECORD-WAS-NOT-PRINTED             VALUE 'N'.       03690000
033600                                                                  03700000
033700 77  RECORD-FROM-SWITCH               PIC X(01)  VALUE ' '.       03710000
033800     88  RECORD-IS-FROM-ACAT-FILE                VALUE 'A'.       03720000
033900     88  RECORD-IS-FROM-PEND-FILE                VALUE 'P'.       03730000
034000     88  RECORD-IS-FROM-MPND-FILE                VALUE 'M'.       03740000
034100                                                                  03750000
LRM015 77  MEMO-TRID-USED-SWITCH            PIC X(01)  VALUE 'N'.       03760000
LRM015     88  MEMO-TRID                               VALUE 'Y'.       03770000
LRM015     88  MEMO-TRID-NOT-USED                      VALUE 'N'.       03780000
LRM043 77  SFK-TRID-SW                      PIC X(01)  VALUE 'N'.       03790000
LRM043     88  SFK-TRID                                VALUE 'Y'.       03800000
LRM043 77  SFK-SAVE-TRID                    PIC X(3).                   03810000
LRM043 77  SFK-SAVE-BATCH                   PIC X(3).                   03820000
034200 77  WS-SAVE-SEC                      PIC X(7).                   03830000
034300 77  WS-QTY                   PIC S9(12)V9(5) COMP-3 VALUE 0.     03840000
034400                                                                  03850000
034500 77  TEMP-TOTAL       COMP-3          PIC S9(15) VALUE +0.        03860000
034600                                                                  03870000
034700 77  AMOUNT-OVERFLOW        PIC 9(16)V99 VALUE ZERO.              03880000
034800 77  TST-P2-BK-QTY          PIC 9(18)   VALUE ZERO.               03890000
034900 77  AMOUNT-FULL           PIC 9(16)V99 VALUE 9999999999999999.99.03900000
035000 77  OVERFLOW-SW                      PIC X(01)  VALUE ZERO.      03910000
035100     88  NO-MORE-OVERFLOW                        VALUE ZERO.      03920000
035200 77  FDL-TOT-CLIENTS        PIC 9999    VALUE ZERO.               03930000
035300 77  FDL-TOT-ACTS           PIC S9(15)  VALUE ZERO.               03940000
035400 77  FDL-TOT-ASSETS         PIC S9(15)  VALUE ZERO.               03950000
035500 77  FL-PHY-REC-WRITTEN     PIC S9(15)  COMP-3 VALUE ZERO.        03960000
035600 77  ERROR-MSG              PIC X(25)   VALUE SPACES.             03970000
035700 77  ERROR-VALUE            PIC X(15)   VALUE SPACES.             03980000
035800 77  LENGTH-KEY                  PIC 99   VALUE 9.                03990000
035900 77  FUND-SERV-ROLLOVER-SW       PIC X    VALUE 'N'.              04000000
036000     88  FUND-SERV-ROLLOVER               VALUE 'Y'.              04010000
036100 77  CNS-IND                     PIC X    VALUE 'N'.              04020000
036200     88  NON-CNS                          VALUE 'N'.              04030000
036300     88  CNS                              VALUE 'Y'.              04040000
036400 77  WK-DIV-CODE                 PIC XXX  VALUE ' '.              04050000
036500                                                                  04060000
036600 77  WS-PEND-TI-ADP-CL-NO-X      PIC XXX  VALUE SPACES.           04070000
036700 01  PREV-ADP-KEY.                                                04080000
036800     05  PREV-ADP-CLIENT    PIC 999     VALUE ZERO.               04090000
036900     05  PREV-ADP-BR-ACT    PIC X(8)    VALUE SPACES.             04100000
037000 01  INFSND-DATA.                                                 04110000
037010     05 FILLER PIC X(8) VALUE 'CAT650 '.                          04120000
037020     05 INFSND-MSG PIC X(45) VALUE SPACES.                        04130000
037030                                                                  04140000
037040****************************************************************  04150000
037050** THE FOLLOWING FLAGS WERE CREATED DURING RESTRUCTURING OF   **  04160000
037060** OF THIS PROGRAM.  THEY ENABLE A TEST TO BYPASS INSTRUCTIONS**  04170000
037070** INSTEAD OF USING A "GOTO" TO THE EXIT OF CERTAIN PARAGRAPHS**  04180000
037080** THE PARAGRAPH NAMES USING THESE FLAGS ARE:                 **  04190000
037090**      S-GET-ADP-BEARER-BOND                                 **  04200000
037100**      S-GET-ADP-REGISTERED-BOND                             **  04210000
037200**      S-GET-ADP-MUNI-BOND                                   **  04220000
037300**      S-GET-ADP-STOCK                                       **  04230000
037400****************************************************************  04240000
037500                                                                  04250000
037600 77  BEARER-BOND-FLAG       PIC X(01).                            04260000
037700     88  ENTER-BEARER-GET   VALUE 'E'.                            04270000
037800     88  EXIT-BEARER-GET    VALUE 'X'.                            04280000
037900 77  REGISTERED-BOND-FLAG   PIC X(01).                            04290000
038000     88  ENTER-REGISTERED-GET  VALUE 'E'.                         04300000
038100     88  EXIT-REGISTERED-GET   VALUE 'X'.                         04310000
038200 77  MUNI-BOND-FLAG         PIC X(01).                            04320000
038300     88  ENTER-MUNI-GET     VALUE 'E'.                            04330000
038400     88  EXIT-MUNI-GET      VALUE 'X'.                            04340000
038500 77  STOCK-FLAG             PIC X(01).                            04350000
038600     88  ENTER-STOCK-GET    VALUE 'E'.                            04360000
038700     88  EXIT-STOCK-GET     VALUE 'X'.                            04370000
038800 77  SEARCH-SYMBOL-FLAG      PIC X(01).                           04380000
038900     88  ENTER-SYMBOL-SEARCH VALUE 'E'.                           04390000
039000     88  EXIT-SYMBOL-SEARCH  VALUE 'X'.                           04400000
039100     COPY STUBCPY.                                                04410000
039200     03  GETXREF                  PIC X(08)  VALUE 'ZGETXREF'.    04420000
039210     03  CKDIGIT                  PIC X(08)  VALUE 'CKDIGIT'.     04430000
039220     03  ZXBILL                   PIC X(08)  VALUE 'ZXBILL'.      04440000
LRM019     03  MGR02MKV                 PIC X(08)  VALUE 'MGR02MKV'.    04450000
LRM002     03  BNWNTWIO                 PIC X(08)  VALUE 'BNWNTWIO'.    04460000
039300                                                                  04470000
039400 01  ALTERNATE-OFFSET-ACCOUNT.                                    04480000
039500     05  ALT-OFFSET-BR-ACCT-TYPE.                                 04490000
039600         10  ALT-OFFSET-BRANCH    PIC X(3).                       04500000
039700         10  ALT-OFFSET-ACCOUNT   PIC X(5).                       04510000
039800         10  ALT-OFFSET-TYPE      PIC 9.                          04520000
039900     05  ALT-OFFSET-CHECK-DIGIT   PIC X.                          04530000
040000                                                                  04540000
LRM021 01  ALT-OPTION-OFFSET-ACCOUNT.                                   04550000
LRM021     05  ALT-OPTION-OFFSET-BR-ACCT-TYPE.                          04560000
LRM021         10  ALT-OPTION-OFFSET-BRANCH PIC X(3).                   04570000
LRM021         10  ALT-OPTION-OFFSET-ACCT    PIC X(5).                  04580000
LRM021         10  ALT-OPTION-OFFSET-TYPE PIC 9.                        04590000
LRM021     05  ALT-OPTION-OFFSET-CHECK-DIGIT PIC X.                     04600000
LRM021                                                                  04610000
LRM024 01  CUST-ACCOUNT.                                                04620000
LRM024     05  CUST-BR-ACCT-TYPE.                                       04630000
LRM024         10  CUST-BRANCH          PIC X(3).                       04640000
LRM024         10  CUST-ACCT            PIC X(5).                       04650000
LRM024         10  CUST-TYPE            PIC X.                          04660000
LRM024     05  CUST-CHECK-DIGIT         PIC X.                          04670000
LRM024                                                                  04680000
040100 01  ROLLOVER-OFFSET-ACCOUNT.                                     04690000
040200     05  ROL-OFFSET-BR-ACCT-TYPE.                                 04700000
040300         10  ROL-OFFSET-BRANCH    PIC X(3).                       04710000
040400         10  ROL-OFFSET-ACCOUNT   PIC X(5).                       04720000
040500         10  ROL-OFFSET-TYPE      PIC 9.                          04730000
040600     05  ROL-OFFSET-CHECK-DIGIT   PIC X.                          04740000
040700                                                                  04750000
040800 01  CNS-BR-ACCT-T-C.                                             04760000
040900     05  CNS-BRANCH              PIC X(3)   VALUE '098'.          04770000
041000     05  CNS-ACCOUNT             PIC X(5)   VALUE '20100'.        04780000
041100     05  CNS-TYPE                PIC 9      VALUE 1.              04790000
041200     05  CNS-CHECK-DIGIT         PIC X      VALUE '9'.            04800000
LRM017 01  WM-CNS-BR-ACCT-T-C          PIC X(10) VALUE '0982100018'.    04810000
041300 01  CURRENT-ACTIVITY-CLIENT     PIC 9(3) COMP-3 VALUE ZERO.      04820000
041400***** 04/19/99 *****                                              04830000
041500**** ADD TWO NEW FAIL ACCOUNTS :                                  04840000
041600****     '00000406' =  THE FAIL TO DELIVER ACCOUNT,               04850000
041700****     '00000307' =  THE FAIL TO RECEIVE ACCOUNT.               04860000
041800****(THE FAIL TO DELIVER ACCOUNT WILL BE DEBITED FOR THE SHARES   04870000
041900**** AND MONEY; THE FAIL TO RECEIVE ACCOUNT WILL BE CREDITIED     04880000
042000**** FOR THE SHARES AND MONEY)                                    04890000
042100                                                                  04900000
042200 01  FAIL-DEL-ACCT.                                               04910000
042300     05  FAILD-BRANCH            PIC X(3)   VALUE '000'.          04920000
042400     05  FAILD-ACCOUNT           PIC X(5)   VALUE '00406'.        04930000
042500     05  FAILD-TYPE              PIC 9      VALUE 1.              04940000
042600                                                                  04950000
042700 01  FAIL-RCV-ACCT.                                               04960000
042800     05  FAILR-BRANCH            PIC X(3)   VALUE '000'.          04970000
042900     05  FAILR-ACCOUNT           PIC X(5)   VALUE '00307'.        04980000
043000     05  FAILR-TYPE              PIC 9      VALUE 1.              04990000
043100***** 04/19/99 *****                                              05000000
043200                                                                  05010000
LRM019 01  WS-BK-QUANTITY              PIC 9(12)V9999.                  05020000
043400 01  WS-BK-QUAN-SPL  REDEFINES   WS-BK-QUANTITY.                  05030000
LRM019     05  WS-BK-QUAN-WHOLE        PIC 9(12).                       05040000
043600     05  WS-BK-QUAN-FRACTION     PIC V9(4).                       05050000
043700 01  CUSIP-NUM.                                                   05060000
043800     03  CUSIP-1-9          PIC X(9).                             05070000
043900     03  CUSIP-10-11-12     PIC XXX.                              05080000
044000     03  FILLER             PIC X      VALUE SPACES.              05090000
                                                                        05100000
LRM012 01  WEALTH-MANAGEMENT-WORK-AREA.                                 05101000
LRM012     05  WM-SUB                    PIC 9(3) COMP-3 VALUE 0.       05102000
LRM012     05  WM-PENDING-ACCOUNT        PIC X(08) VALUE SPACES.        05103000
LRM012     05  WM-INTER-COMPANY-ACCOUNT  PIC X(08) VALUE SPACES.        05104000
044100                                                                  05105000
044200 77  WS-FMT-ACCOUNT              PIC X(15) VALUE ' '.             05106000
044300 77  WS-BAT                      PIC S999  VALUE +0  COMP-3.      05107000
044400 77  WS-BAT2                     PIC S999  VALUE +0  COMP-3.      05108000
044500                                                                  05109000
044600 01  TRLR-MESSAGE.                                                05109100
044700     05  TRLR-MSG                PIC X(09) VALUE ' '.             05109200
044800     05  TRLR-BRKR               PIC X(16) VALUE ' '.             05109300
DJ0001 01  TRLT-MESSAGE.                                                05109400
DJ0001     05  FILLER                  PIC X(04) VALUE 'ACAT'.          05109500
DJ0001     05  TRLT-CNTL-NBR           PIC X(14) VALUE ' '.             05109600
DJ0001     05  FILLER                  PIC X(05) VALUE ' BOS '.         05109700
DJ0001     05  TRLT-CNTRA-BKR          PIC X(04) VALUE ' '.             05109800
044900/                                                                 05109900
045000 01  FILLER                   PIC X(16) VALUE 'ACAT FORMAT AREA'. 05110000
045100***  FORMAT-IN-FILE-AREA REPLACED BY COPY:                        05120000
045200     COPY ACATPEND  REPLACING ==:FMT:== BY ==FMT==.               05130000
045300/                                                                 05140000
045400 01  WORK-P2-ACCOUNT-AREA.                                        05150000
045500     05  FILLER                  PIC X    VALUE '('.              05160000
045600     05  WORK-P2-BRANCH          PIC X(3).                        05170000
045700     05  FILLER                  PIC X    VALUE '-'.              05180000
045800     05  WORK-P2-ACCOUNT         PIC X(5).                        05190000
045900     05  FILLER                  PIC X    VALUE '-'.              05200000
046000     05  WORK-P2-TYPE            PIC 9.                           05210000
046100     05  FILLER                  PIC X    VALUE '-'.              05220000
046200     05  WORK-P2-CHECK-DIGIT     PIC 9.                           05230000
046300     05  FILLER                  PIC X    VALUE ')'.              05240000
046400/                                                                 05250000
046500 01  REQUEST-DATA.                                                05260000
046600     05  REQ-DATE             PIC X(6).                           05270000
046700     05  REQ-AREA             PIC X(2).                           05280000
046800     05  REQ-RC               PIC X(2).                           05290000
046900                                                                  05300000
047000     COPY RECDATZC.                                               05310000
047100/                                                                 05320000
047200     COPY BPDATESC.                                               05330000
047300/                                                                 05340000
047400     COPY BHINFO.                                                 05350000
047500/                                                                 05360000
047600     COPY BHACAT.                                                 05370000
047700/                                                                 05380000
047800     COPY BHICS.                                                  05390000
047900/                                                                 05400000
048000     COPY BHP1.                                                   05410000
048100/                                                                 05420000
048200     COPY BHMISC.                                                 05430000
048300/                                                                 05440000
048400     COPY BHMF.                                                   05450000
048500/                                                                 05460000
048600     COPY BHMF3.                                                  05470000
048700/                                                                 05480000
048800     COPY BHBTS2.                                                 05490000
048900/                                                                 05500000
049000     COPY GETNACOB.                                               05510000
049100 01  GETNA-SEGMENT-INCLUDES.                                      05520000
049200     COPY NASEGHDR.                                               05530000
049300     COPY NASEGPPA.                                               05540000
049400     COPY NASEGEND.                                               05550000
049500/                                                                 05560000
049600 01  CNTR-MASK.                                                   05570000
049700     05  CNTR-MASK-RECS          PIC ZZZZ,ZZZ,ZZZ,ZZZ,ZZ9.        05580000
049800     05  CNTR-MASK-MONEY REDEFINES CNTR-MASK-RECS                 05590000
049900                                 PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99.        05600000
050000     05  CNTR-MASK-SHARE REDEFINES CNTR-MASK-MONEY                05610000
050100                                 PIC ZZ,ZZZ,ZZZ,ZZZ.99999.        05620000
050200 01  CNTR-NINE-FIELD   PIC 9(9).                                  05630000
050300                                                                  05640000
050400 01  CL-COUNTER-AREA.                                             05650000
050500     02  FILLER        PIC X(19) VALUE 'CLIENT COUNTER AREA'.     05660000
050600     02  NUM-CL-IN-CNTRS   PIC S9(5) COMP SYNC  VALUE +12.        05670000
050700     02  CL-CNTR-MASK.                                            05680000
050800         03  CL-CNTR-MASK-RECS   PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.         05690000
050900                                                                  05700000
051000     02  CL-CNTR-DATA.                                            05710000
051100         03  FILLER  PIC X(31)                                    05720000
051200                          VALUE '******************************'. 05730000
051300         03  FILLER  PIC S9(15) COMP-3.                           05740000
051400                                                                  05750000
051500         03  FILLER  PIC X(31)                                    05760000
051600                          VALUE 'N****   TOTALS FOR CLIENT  ***'. 05770000
051700         03  NUM-CLIENT-NUMBER            PIC S9(15) COMP-3.      05780000
051800                                                                  05790000
051900         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT RECS READ'.     05800000
052000         03  NUM-CL-ACAT-RECS-READ        PIC S9(15) COMP-3.      05810000
052100                                                                  05820000
052200         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT 1ST RECS IN'.   05830000
052300         03  NUM-CL-ACAT-1ST-RECS-IN      PIC S9(15) COMP-3.      05840000
052400                                                                  05850000
052500         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT 2ND RECS IN'.   05860000
052600         03  NUM-CL-ACAT-2ND-RECS-IN      PIC S9(15) COMP-3.      05870000
052700                                                                  05880000
052800         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT 3RD RECS IN'.   05890000
052900         03  NUM-CL-ACAT-3RD-RECS-IN      PIC S9(15) COMP-3.      05900000
053000                                                                  05910000
053100         03  FILLER  PIC X(31) VALUE 'NTOTAL HEADERS READ'.       05920000
053200         03  NUM-CL-HEADERS-READ          PIC S9(15) COMP-3.      05930000
053300                                                                  05940000
053400         03  FILLER  PIC X(31) VALUE 'NTOTAL TRAILERS READ'.      05950000
053500         03  NUM-CL-TRAILERS-READ         PIC S9(15) COMP-3.      05960000
053600                                                                  05970000
053700         03  FILLER  PIC X(31)                                    05980000
053800                          VALUE '------------------------------'. 05990000
053900         03  FILLER  PIC S9(15) COMP-3.                           06000000
054000                                                                  06010000
054100         03  FILLER PIC X(31) VALUE 'NTOTAL FORMAT RECS SELECTED'.06020000
054200         03  NUM-CL-FMT-RECS-SELECTED      PIC S9(15) COMP-3.     06030000
054300                                                                  06040000
054400         03  FILLER PIC X(31)                                     06050000
054500                          VALUE 'NTOTAL FMT RECS NOT STL DROPPED'.06060000
054600         03  NUM-CL-FMT-RECS-NOT-STL       PIC S9(15) COMP-3.     06070000
054700                                                                  06080000
054800         03  FILLER  PIC X(31) VALUE 'NTOTAL FMT RECS INCOMPLETE'.06090000
054900         03  NUM-CL-FMT-RECS-INCOMPLETE    PIC S9(15) COMP-3.     06100000
055000                                                                  06110000
055100     02  CL-CNTR-TABLE REDEFINES CL-CNTR-DATA.                    06120000
055200         03  CL-CNTR-ENTRIES OCCURS 12 TIMES INDEXED BY CL-CNTR-X.06130000
055300             05  CL-CNTR-TYPE            PIC X.                   06140000
055400             05  CL-CNTR-DESC            PIC X(30).               06150000
055500             05  CL-CNTR-RECS            PIC S9(15) COMP-3.       06160000
055600/                                                                 06170000
055700 01  CL-OUT-COUNTER-AREA.                                         06180000
055800     02  FILLER        PIC X(23) VALUE 'CLIENT OUT COUNTER AREA'. 06190000
055900                                                                  06200000
056000     02  CL-OUT-CNTR-DATA.                                        06210000
056100         03  FILLER  PIC X(31)                                    06220000
056200                          VALUE '******************************'. 06230000
056300         03  FILLER  PIC S9(17) COMP-3.                           06240000
056400                                                                  06250000
056500         03  FILLER  PIC X(31)                                    06260000
056600                          VALUE 'N****   TOTALS FOR CLIENT  ***'. 06270000
056700         03  NUM-OUT-CLIENT-NUMBER         PIC S9(17) COMP-3.     06280000
056800                                                                  06290000
056900         03  FILLER  PIC X(31) VALUE 'NTOTAL BR ACCT NOT NUMERIC'.06300000
057000         03  NUM-CL-BR-ACT-NOT-NUMERIC     PIC S9(17) COMP-3.     06310000
057100                                                                  06320000
057200         03  FILLER  PIC X(31)                                    06330000
057300                          VALUE '******************************'. 06340000
057400         03  FILLER  PIC S9(17) COMP-3.                           06350000
057500                                                                  06360000
057600         03  FILLER  PIC X(31)                                    06370000
057700                          VALUE 'NTOT ASSETS BILLED'.             06380000
057800         03  TOT-CL-ASSETS   PIC S9(17)  COMP-3.                  06390000
057900                                                                  06400000
058000         03  FILLER  PIC X(31)                                    06410000
058100                          VALUE 'NTOT ACCOUNTS BILLED'.           06420000
058200         03  TOT-CL-ACCOUNTS    PIC S9(17)  COMP-3.               06430000
058300                                                                  06440000
058400         03  FILLER  PIC X(31)                                    06450000
058500                          VALUE 'NTOT FUNDSERV DELV BILLED'.      06460000
058600         03  TOT-CL-FS-DELV     PIC S9(17)  COMP-3.               06470000
058700                                                                  06480000
058800         03  FILLER  PIC X(31)                                    06490000
058900                          VALUE 'NTOT FUNDSERV RECV BILLED'.      06500000
059000         03  TOT-CL-FS-RECV     PIC S9(17)  COMP-3.               06510000
059100                                                                  06520000
059200         03  FILLER  PIC X(31)                                    06530000
059300                          VALUE '******************************'. 06540000
059400         03  FILLER  PIC S9(17) COMP-3.                           06550000
059500                                                                  06560000
059600         03  FILLER  PIC X(31) VALUE 'NTOTAL SORT RECORDS'.       06570000
059700         03  TOT-CL-SORT-RECS      PIC S9(17) COMP-3.             06580000
059800                                                                  06590000
059900         03  FILLER  PIC X(31) VALUE 'NTOTAL VALID SORT RECORDS'. 06600000
060000         03  TOT-CL-VALID-SORT-RECS PIC S9(17) COMP-3.            06610000
060100                                                                  06620000
060200         03  FILLER PIC X(31) VALUE 'NTOTAL INVALID SORT RECORDS'.06630000
060300         03  TOT-CL-INVALID-SORT-RECS  PIC S9(17) COMP-3.         06640000
060400                                                                  06650000
060500         03  FILLER  PIC X(31)                                    06660000
060600                          VALUE '******************************'. 06670000
060700         03  FILLER  PIC S9(17) COMP-3.                           06680000
060800                                                                  06690000
060900         03  FILLER  PIC X(31)                                    06700000
061000                          VALUE 'NTOT CL OLD PEND READ'.          06710000
061100         03  TOT-CL-PEND-READ          PIC S9(17)  COMP-3.        06720000
061200                                                                  06730000
061300         03  FILLER  PIC X(31)                                    06740000
061400                          VALUE 'NTOT CL NEW PEND WRITTEN'.       06750000
061500         03  TOT-CL-NEW-PEND-WRITTEN   PIC S9(17)  COMP-3.        06760000
061600                                                                  06770000
061700         03  FILLER  PIC X(31)                                    06780000
061800                          VALUE 'NTOT CL ACAT NEW PEND WRITTEN'.  06790000
061900         03  TOT-CL-ACAT-NEW-PEND-WRITTEN   PIC S9(17)  COMP-3.   06800000
062000                                                                  06810000
062100         03  FILLER  PIC X(31)                                    06820000
062200                          VALUE 'NTOT CL PEND NEW PEND WRITTEN'.  06830000
062300         03  TOT-CL-PEND-NEW-PEND-WRITTEN   PIC S9(17)  COMP-3.   06840000
062400                                                                  06850000
062500         03  FILLER  PIC X(31)                                    06860000
062600                          VALUE '******************************'. 06870000
062700         03  FILLER  PIC S9(17) COMP-3.                           06880000
062800                                                                  06890000
062900         03  FILLER  PIC X(31)                                    06900000
063000                          VALUE 'NTOTAL ACAT SELECTED FOR P2'.    06910000
063100         03  TOT-CL-ACAT-SELECTED-FOR-P2  PIC S9(17) COMP-3.      06920000
063200                                                                  06930000
063300         03  FILLER  PIC X(31)                                    06940000
063400                          VALUE 'NTOTAL PEND SELECTED FOR P2'.    06950000
063500         03  TOT-CL-PEND-SELECTED-FOR-P2  PIC S9(17) COMP-3.      06960000
063600                                                                  06970000
063700         03  FILLER  PIC X(31) VALUE 'NTOTAL SELECTED FOR P2'.    06980000
063800         03  TOT-CL-SELECTED-FOR-P2       PIC S9(17) COMP-3.      06990000
063900                                                                  07000000
064000         03  FILLER  PIC X(31) VALUE 'NTOTAL P2 RECORDS OUT'.     07010000
064100         03  TOT-CL-P2-RECS-WRITTEN           PIC S9(17) COMP-3.  07020000
064200                                                                  07030000
064300         03  FILLER  PIC X(31) VALUE 'NTOTAL CREDITED REJ FAILS'. 07040000
064400         03  TOT-REJ-FAIL-CR-REC           PIC S9(17) COMP-3.     07050000
064500                                                                  07060000
064600         03  FILLER  PIC X(31) VALUE 'NTOTAL DEBITED REJ FAILS'.  07070000
064700         03  TOT-REJ-FAIL-DB-REC           PIC S9(17) COMP-3.     07080000
064800                                                                  07090000
064900         03  FILLER  PIC X(31) VALUE 'NTOTAL CAGE FAILS'.         07100000
065000         03  TOT-CAGE-FAIL-REC             PIC S9(17) COMP-3.     07110000
065100                                                                  07120000
065200         03  FILLER  PIC X(31)                                    07130000
065300                          VALUE '******************************'. 07140000
065400         03  FILLER  PIC S9(17) COMP-3.                           07150000
065500                                                                  07160000
065600         03  FILLER  PIC X(31)                                    07170000
065700                          VALUE 'MTOT BK CUST DEBIT VALUE'.       07180000
065800         03  TOT-CL-BK-CUST-DB-VALUE    PIC S9(15)V99 COMP-3.     07190000
065900                                                                  07200000
066000         03  FILLER  PIC X(31)                                    07210000
066100                          VALUE 'MTOT BK CUST CREDIT VALUE'.      07220000
066200         03  TOT-CL-BK-CUST-CR-VALUE    PIC S9(15)V99 COMP-3.     07230000
066300                                                                  07240000
066400         03  FILLER  PIC X(31)                                    07250000
066500                          VALUE 'STOT BK CUST DEBIT QUANTITY'.    07260000
066600         03  TOT-CL-BK-CUST-DB-QTY      PIC S9(12)V9(5) COMP-3.   07270000
066700                                                                  07280000
066800         03  FILLER  PIC X(31)                                    07290000
066900                          VALUE 'STOT BK CUST CREDIT QUANTITY'.   07300000
067000         03  TOT-CL-BK-CUST-CR-QTY      PIC S9(12)V9(5) COMP-3.   07310000
067100                                                                  07320000
067200         03  FILLER  PIC X(31)                                    07330000
067300                          VALUE '******************************'. 07340000
067400         03  FILLER  PIC S9(17) COMP-3.                           07350000
067500                                                                  07360000
067600         03  FILLER  PIC X(31) VALUE 'MTOT BK OFFSET DEBIT VALUE'.07370000
067700         03  TOT-CL-OFFSET-DB-VALUE    PIC S9(15)V99 COMP-3.      07380000
067800                                                                  07390000
067900         03  FILLER PIC X(31) VALUE 'MTOT BK OFFSET CREDIT VALUE'.07400000
068000         03  TOT-CL-OFFSET-CR-VALUE    PIC S9(15)V99 COMP-3.      07410000
068100                                                                  07420000
068200         03  FILLER PIC X(31) VALUE 'MTOT BK OFFSET BYP DB VALUE'.07430000
068300         03  TOT-CL-OFFSET-BYP-DB-VALUE    PIC S9(15)V99 COMP-3.  07440000
068400                                                                  07450000
068500         03  FILLER PIC X(31) VALUE 'MTOT BK OFFSET BYP CR VALUE'.07460000
068600         03  TOT-CL-OFFSET-BYP-CR-VALUE    PIC S9(15)V99 COMP-3.  07470000
068700                                                                  07480000
068800         03  FILLER  PIC X(31)                                    07490000
068900                          VALUE '*****************************'.  07500000
069000         03  FILLER  PIC S9(17) COMP-3.                           07510000
069100                                                                  07520000
069200                                                                  07530000
069300         03  FILLER  PIC X(31) VALUE 'STOT BK CNS DEBIT QUANTITY'.07540000
069400         03  TOT-CL-BK-CNS-DB-QTY      PIC S9(12)V9(5) COMP-3.    07550000
069500                                                                  07560000
069600         03  FILLER PIC X(31) VALUE 'STOT BK CNS CREDIT QUANTITY'.07570000
069700         03  TOT-CL-BK-CNS-CR-QTY      PIC S9(12)V9(5) COMP-3.    07580000
069800                                                                  07590000
069900         03  FILLER  PIC X(31)                                    07600000
070000                          VALUE '******************************'. 07610000
070100         03  FILLER  PIC S9(17) COMP-3.                           07620000
070200                                                                  07630000
070300         03  FILLER  PIC X(31) VALUE 'MTOT CL BK DEBIT VALUE'.    07640000
070400         03  TOT-CL-BK-DB-VALUE    PIC S9(15)V99 COMP-3.          07650000
070500                                                                  07660000
070600         03  FILLER  PIC X(31) VALUE 'MTOT CL BK CREDIT VALUE'.   07670000
070700         03  TOT-CL-BK-CR-VALUE    PIC S9(15)V99 COMP-3.          07680000
070800                                                                  07690000
070900         03  FILLER  PIC X(31) VALUE 'STOT CL BK DEBIT QUANTITY'. 07700000
071000         03  TOT-CL-BK-DB-QTY      PIC S9(12)V9(5) COMP-3.        07710000
071100                                                                  07720000
071200         03  FILLER PIC X(31) VALUE 'STOT CL BK CREDIT QUANTITY'. 07730000
071300         03  TOT-CL-BK-CR-QTY      PIC S9(12)V9(5) COMP-3.        07740000
071400                                                                  07750000
071500         03  FILLER  PIC X(31)                                    07760000
071600                          VALUE '******************************'. 07770000
071700         03  FILLER  PIC S9(17) COMP-3.                           07780000
071800                                                                  07790000
071900         03  FILLER PIC X(31) VALUE 'MTOT RD CL DEBIT VALUE'.     07800000
072000         03  TOT-CL-RD-CL-DB-VALUE    PIC S9(15)V99 COMP-3.       07810000
072100                                                                  07820000
072200         03  FILLER  PIC X(31) VALUE 'MTOT RD CL CREDIT VALUE'.   07830000
072300         03  TOT-CL-RD-CL-CR-VALUE    PIC S9(15)V99 COMP-3.       07840000
072400                                                                  07850000
072500         03  FILLER  PIC X(31) VALUE 'STOT RD CL DEBIT QUANTITY'. 07860000
072600         03  TOT-CL-RD-CL-DB-QTY      PIC S9(12)V9(5) COMP-3.     07870000
072700                                                                  07880000
072800         03  FILLER  PIC X(31) VALUE 'STOT RD CL CREDIT QUANTITY'.07890000
072900         03  TOT-CL-RD-CL-CR-QTY      PIC S9(12)V9(5) COMP-3.     07900000
073000                                                                  07910000
073100         03  FILLER  PIC X(31)                                    07920000
073200                          VALUE '******************************'. 07930000
073300         03  FILLER  PIC S9(17) COMP-3.                           07940000
073400                                                                  07950000
073500         03  FILLER  PIC X(31)                                    07960000
073600                          VALUE 'STOT N1 MEMO DEBIT QUANTITY'.    07970000
073700         03  TOT-N1-MEMO-DB-QTY  PIC S9(12)V9(5) COMP-3.          07980000
073800                                                                  07990000
073900         03  FILLER  PIC X(31)                                    08000000
074000                          VALUE 'STOT N1 MEMO CREDIT QUANTITY'.   08010000
074100         03  TOT-N1-MEMO-CR-QTY  PIC S9(12)V9(5) COMP-3.          08020000
074200                                                                  08030000
074300         03  FILLER  PIC X(31)                                    08040000
074400                          VALUE 'STOT N2 MEMO DEBIT QUANTITY'.    08050000
074500         03  TOT-N2-MEMO-DB-QTY  PIC S9(12)V9(5) COMP-3.          08060000
074600                                                                  08070000
074700         03  FILLER  PIC X(31)                                    08080000
074800                          VALUE 'STOT N2 MEMO CREDIT QUANTITY'.   08090000
074900         03  TOT-N2-MEMO-CR-QTY  PIC S9(12)V9(5) COMP-3.          08100000
075000                                                                  08110000
075100         03  FILLER  PIC X(31)                                    08120000
075200                          VALUE 'STOT N3 MEMO DEBIT QUANTITY'.    08130000
075300         03  TOT-N3-MEMO-DB-QTY  PIC S9(12)V9(5) COMP-3.          08140000
075400                                                                  08150000
075500         03  FILLER  PIC X(31)                                    08160000
075600                          VALUE 'STOT N3 MEMO CREDIT QUANTITY'.   08170000
075700         03  TOT-N3-MEMO-CR-QTY  PIC S9(12)V9(5) COMP-3.          08180000
075800                                                                  08190000
075900         03  FILLER  PIC X(31)                                    08200000
076000                          VALUE 'STOT N4 MEMO DEBIT QUANTITY'.    08210000
076100         03  TOT-N4-MEMO-DB-QTY  PIC S9(12)V9(5) COMP-3.          08220000
076200                                                                  08230000
076300         03  FILLER  PIC X(31)                                    08240000
076400                          VALUE 'STOT N4 MEMO CREDIT QUANTITY'.   08250000
076500         03  TOT-N4-MEMO-CR-QTY  PIC S9(12)V9(5) COMP-3.          08260000
076600                                                                  08270000
LRM050         03  FILLER  PIC X(31)                                    08280000
LRM050                          VALUE 'STOT N6 MEMO DEBIT QUANTITY'.    08281000
LRM050         03  TOT-N6-MEMO-DB-QTY  PIC S9(12)V9(5) COMP-3.          08282000
LRM050                                                                  08283000
LRM050         03  FILLER  PIC X(31)                                    08284000
LRM050                          VALUE 'STOT N6 MEMO CREDIT QUANTITY'.   08285000
LRM050         03  TOT-N6-MEMO-CR-QTY  PIC S9(12)V9(5) COMP-3.          08286000
LRM050                                                                  08287000
076700         03  FILLER  PIC X(31)                                    08288000
076800                          VALUE 'STOT LEVEL-0 DEBIT QUANTITY'.    08289000
076900         03  TOT-N0-MEMO-DB-QTY  PIC S9(12)V9(5) COMP-3.          08290000
077000                                                                  08300000
077100         03  FILLER  PIC X(31)                                    08310000
077200                          VALUE 'STOT LEVEL-0 CREDIT QUANTITY'.   08320000
077300         03  TOT-N0-MEMO-CR-QTY  PIC S9(12)V9(5) COMP-3.          08330000
077400                                                                  08340000
077500         03  FILLER  PIC X(31)                                    08350000
077600                          VALUE 'STOT CL PEND REC DB QUANTITY'.   08360000
077700         03  TOT-CL-PEND-REC-DB-QTY  PIC S9(12)V9(5) COMP-3.      08370000
077800                                                                  08380000
077900         03  FILLER  PIC X(31)                                    08390000
078000                          VALUE 'STOT CL PEND REC CR QUANTITY'.   08400000
078100         03  TOT-CL-PEND-REC-CR-QTY  PIC S9(12)V9(5) COMP-3.      08410000
078200                                                                  08420000
078300         03  FILLER  PIC X(31)                                    08430000
078400                          VALUE 'STOT CL PEND DEL DB QUANTITY'.   08440000
078500         03  TOT-CL-PEND-DEL-DB-QTY  PIC S9(12)V9(5) COMP-3.      08450000
078600                                                                  08460000
078700         03  FILLER  PIC X(31)                                    08470000
078800                          VALUE 'STOT CL PEND DEL CR QUANTITY'.   08480000
078900         03  TOT-CL-PEND-DEL-CR-QTY  PIC S9(12)V9(5) COMP-3.      08490000
079000                                                                  08500000
079100         03  FILLER  PIC X(31)                                    08510000
079200                          VALUE 'MTOT CL PEND DEL DB VALUE'.      08520000
079300         03  TOT-CL-PEND-DEL-DB-VALUE  PIC S9(15)V99 COMP-3.      08530000
079400                                                                  08540000
079500         03  FILLER  PIC X(31)                                    08550000
079600                          VALUE 'MTOT CL PEND DEL CR VALUE'.      08560000
079700         03  TOT-CL-PEND-DEL-CR-VALUE  PIC S9(15)V99 COMP-3.      08570000
079800                                                                  08580000
079900         03  FILLER  PIC X(31)                                    08590000
080000                          VALUE 'MTOT CL PEND REC DB VALUE'.      08600000
080100         03  TOT-CL-PEND-REC-DB-VALUE  PIC S9(15)V99 COMP-3.      08610000
080200                                                                  08620000
080300         03  FILLER  PIC X(31)                                    08630000
080400                          VALUE 'MTOT CL PEND REC CR VALUE'.      08640000
080500         03  TOT-CL-PEND-REC-CR-VALUE  PIC S9(15)V99 COMP-3.      08650000
080600                                                                  08660000
080700         03  FILLER  PIC X(31)                                    08670000
080800                          VALUE '******************************'. 08680000
080900         03  FILLER  PIC S9(17) COMP-3.                           08690000
081000                                                                  08700000
081100         03  FILLER  PIC X(31) VALUE 'MTOT DEBIT VALUE'.          08710000
081200         03  TOT-CL-DB-VALUE          PIC S9(15)V99 COMP-3.       08720000
081300                                                                  08730000
081400         03  FILLER  PIC X(31) VALUE 'MTOT CREDIT VALUE'.         08740000
081500         03  TOT-CL-CR-VALUE          PIC S9(15)V99 COMP-3.       08750000
081600                                                                  08760000
081700         03  FILLER  PIC X(31) VALUE 'STOT DEBIT QUANTITY'.       08770000
081800         03  TOT-CL-DB-QTY            PIC S9(12)V9(5) COMP-3.     08780000
081900                                                                  08790000
082000         03  FILLER  PIC X(31) VALUE 'STOT CREDIT QUANTITY'.      08800000
082100         03  TOT-CL-CR-QTY            PIC S9(12)V9(5) COMP-3.     08810000
082200         03  FILLER  PIC X(31)                                    08820000
082300                          VALUE '******************************'. 08830000
082400         03  FILLER  PIC S9(17) COMP-3.                           08840000
082500                                                                  08850000
082600         03  FILLER  PIC X(31) VALUE 'NTOTAL EARLY RECORDS OUT'.  08860000
082700         03  TOT-CL-EARLY-WRITTEN    PIC S9(17) COMP-3.           08870000
082800                                                                  08880000
082900         03  FILLER PIC X(31) VALUE 'MTOT EARLY CL DEBIT VALUE'.  08890000
083000         03  TOT-CL-EARLY-DB-VALUE    PIC S9(15)V99 COMP-3.       08900000
083100                                                                  08910000
083200         03  FILLER  PIC X(31) VALUE 'MTOT EARLY CL CREDIT VALUE'.08920000
083300         03  TOT-CL-EARLY-CR-VALUE    PIC S9(15)V99 COMP-3.       08930000
083400                                                                  08940000
083500         03  FILLER  PIC X(31) VALUE 'STOT EARLY CL DEBIT QUANT'. 08950000
083600         03  TOT-CL-EARLY-DB-QTY      PIC S9(12)V9(5) COMP-3.     08960000
083700                                                                  08970000
083800         03  FILLER  PIC X(31) VALUE 'STOT EARLY CL CREDIT QUANT'.08980000
083900         03  TOT-CL-EARLY-CR-QTY      PIC S9(12)V9(5) COMP-3.     08990000
084000                                                                  09000000
084100         03  FILLER PIC X(31)                                     09010000
084200                         VALUE '******************************'.  09020000
084300         03  FILLER PIC S9(17) COMP-3.                            09030000
084400                                                                  09040000
084500         03  FILLER PIC X(31) VALUE 'STOT CL OPTION DB QUANT'.    09050000
084600         03  TOT-CL-BK-OPTION-DB-QTY  PIC S9(12)V9(5) COMP-3.     09060000
084700                                                                  09070000
084800         03  FILLER PIC X(31) VALUE 'STOT CL OPTION CR QUANT'.    09080000
084900         03  TOT-CL-BK-OPTION-CR-QTY  PIC S9(12)V9(5) COMP-3.     09090000
085000                                                                  09100000
085100         03  FILLER PIC X(31) VALUE 'STOT CL CBOE OFFSET DB QTY'. 09110000
085200         03  TOT-CL-OPT-CBOE-DB-QTY   PIC S9(12)V9(5) COMP-3.     09120000
085300                                                                  09130000
085400         03  FILLER PIC X(31) VALUE 'STOT CL CBOE OFFSET CR QTY'. 09140000
085500         03  TOT-CL-OPT-CBOE-CR-QTY   PIC S9(12)V9(5) COMP-3.     09150000
085600                                                                  09160000
085700         03  FILLER PIC X(31)                                     09170000
085800                         VALUE 'STOT CL AMEX NYSE OFFSET DB QTY'. 09180000
085900         03  TOT-CL-AMEX-NYSE-DB-QTY   PIC S9(12)V9(5) COMP-3.    09190000
086000                                                                  09200000
086100         03  FILLER PIC X(31)                                     09210000
086200                         VALUE 'STOT CL AMEX NYSE OFFSET CR QTY'. 09220000
086300         03  TOT-CL-AMEX-NYSE-CR-QTY   PIC S9(12)V9(5) COMP-3.    09230000
086400                                                                  09240000
086500         03  FILLER PIC X(31) VALUE 'STOT CL PBW OFFSET DB QTY'.  09250000
086600         03  TOT-CL-OPT-PBW-DB-QTY    PIC S9(12)V9(5) COMP-3.     09260000
086700                                                                  09270000
086800         03  FILLER PIC X(31) VALUE 'STOT CL PBW OFFSET CR QTY'.  09280000
086900         03  TOT-CL-OPT-PBW-CR-QTY    PIC S9(12)V9(5) COMP-3.     09290000
087000                                                                  09300000
087100         03  FILLER PIC X(31) VALUE 'STOT CL PSE OFFSET DB QTY'.  09310000
087200         03  TOT-CL-OPT-PSE-DB-QTY    PIC S9(12)V9(5) COMP-3.     09320000
087300                                                                  09330000
087400         03  FILLER PIC X(31) VALUE 'STOT CL PSE OFFSET CR QTY'.  09340000
087500         03  TOT-CL-OPT-PSE-CR-QTY    PIC S9(12)V9(5) COMP-3.     09350000
087600                                                                  09360000
087700         03  FILLER PIC X(31) VALUE 'STOT CL DFLT OFFSET DB QTY'. 09370000
087800         03  TOT-CL-OPT-DFLT-DB-QTY   PIC S9(12)V9(5) COMP-3.     09380000
087900                                                                  09390000
088000         03  FILLER PIC X(31) VALUE 'STOT CL DFLT OFFSET CR QTY'. 09400000
088100         03  TOT-CL-OPT-DFLT-CR-QTY   PIC S9(12)V9(5) COMP-3.     09410000
088200                                                                  09420000
088300         03  FILLER PIC X(31)                                     09430000
088400                         VALUE '******************************'.  09440000
088500         03  FILLER PIC S9(17) COMP-3.                            09450000
088600                                                                  09460000
088700     02  CL-OUT-CNTR-TABLE REDEFINES CL-OUT-CNTR-DATA.            09470000
088800***      03  CL-OUT-CNTR-ENTRIES OCCURS 89 TIMES                  09480000
LRM050         03  CL-OUT-CNTR-ENTRIES OCCURS 94 TIMES                  09490000
089000                                 INDEXED BY CL-O-CNTR-X.          09500000
089100             05  CL-OUT-CNTR-TYPE         PIC X.                  09510000
089200             05  CL-OUT-CNTR-DESC         PIC X(30).              09520000
089300             05  CL-OUT-CNTR-RECS         PIC S9(17) COMP-3.      09530000
089400             05  CL-OUT-CNTR-MONEY                                09540000
089500                 REDEFINES CL-OUT-CNTR-RECS                       09550000
089600                                          PIC S9(15)V99 COMP-3.   09560000
089700             05  CL-OUT-CNTR-SHARE                                09570000
089800                 REDEFINES CL-OUT-CNTR-MONEY                      09580000
089900                                          PIC S9(12)V9(5) COMP-3. 09590000
090000***  02  NUM-CL-OUT-CNTRS   PIC S9(5) COMP SYNC VALUE +89.        09600000
LRM050     02  NUM-CL-OUT-CNTRS   PIC S9(5) COMP SYNC VALUE +94.        09610000
090200/                                                                 09620000
090300 01  COUNTER-AREA.                                                09630000
090400     02  FILLER        PIC X(12) VALUE 'COUNTER-AREA'.            09640000
090500     02  CNTR-DATA.                                               09650000
090600         03  FILLER  PIC X(31)                                    09660000
090700                          VALUE '******************************'. 09670000
090800         03  FILLER  PIC S9(17) COMP-3.                           09680000
090900                                                                  09690000
091000         03  FILLER  PIC X(31)                                    09700000
091100                          VALUE '*****   CAT650  TOTALS   *****'. 09710000
091200         03  FILLER  PIC S9(17) COMP-3.                           09720000
091300                                                                  09730000
091400         03  FILLER  PIC X(31) VALUE 'NTOTAL B1 ACTIVE BROKERS'.  09740000
091500         03  NUM-B1-ACTV-BROKER-CL     PIC S9(17) COMP-3.         09750000
091600                                                                  09760000
091700         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT SYSTEM CLIENTS'.09770000
091800         03  NUM-ACAT-SYS-CLIENT       PIC S9(17) COMP-3.         09780000
091900                                                                  09790000
092000         03  FILLER PIC X(31) VALUE 'NNOT ACAT SYSTEM CL DROPPED'.09800000
092100         03  NUM-NOT-ACAT-SYS-DROP     PIC S9(17) COMP-3.         09810000
092200                                                                  09820000
092300         03  FILLER  PIC X(31)                                    09830000
092400                          VALUE '******************************'. 09840000
092500         03  FILLER  PIC S9(17) COMP-3.                           09850000
092600                                                                  09860000
092700         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT PHYS RECS IN'.  09870000
092800         03  NUM-ACAT-RECS-IN          PIC S9(17) COMP-3 VALUE 0. 09880000
092900                                                                  09890000
093000         03  FILLER  PIC X(31)                                    09900000
093100                          VALUE 'NTOTAL NOT ADP CL RECS BYPASSED'.09910000
093200         03  NUM-NOT-ADP-CL-RECS       PIC S9(17) COMP-3.         09920000
093300                                                                  09930000
093400         03  FILLER  PIC X(31) VALUE 'NTOTAL ADP CL RECORDS'.     09940000
093500         03  NUM-ACAT-RECS-READ        PIC S9(17) COMP-3.         09950000
093600                                                                  09960000
093700         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT 1ST RECS IN'.   09970000
093800         03  NUM-ACAT-1ST-RECS-IN      PIC S9(17) COMP-3.         09980000
093900                                                                  09990000
094000         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT 2ND RECS IN'.   10000000
094100         03  NUM-ACAT-2ND-RECS-IN      PIC S9(17) COMP-3.         10010000
094200                                                                  10020000
094300         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT 3RD RECS IN'.   10030000
094400         03  NUM-ACAT-3RD-RECS-IN      PIC S9(17) COMP-3.         10040000
094500                                                                  10050000
094600         03  FILLER  PIC X(31) VALUE 'NTOTAL HEADERS READ'.       10060000
094700         03  NUM-HEADERS-READ          PIC S9(17) COMP-3.         10070000
094800                                                                  10080000
094900         03  FILLER  PIC X(31) VALUE 'NTOTAL TRAILERS READ'.      10090000
095000         03  NUM-TRAILERS-READ         PIC S9(17) COMP-3.         10100000
095100                                                                  10110000
095200         03  FILLER  PIC X(31)                                    10120000
095300                          VALUE '******************************'. 10130000
095400         03  FILLER  PIC S9(17) COMP-3.                           10140000
095500                                                                  10150000
095600         03  FILLER PIC X(31) VALUE 'NTOTAL FORMAT RECS SELECTED'.10160000
095700         03  NUM-FMT-RECS-SELECTED      PIC S9(17) COMP-3.        10170000
095800                                                                  10180000
095900         03  FILLER  PIC X(31)                                    10190000
096000                          VALUE 'NTOTAL FMT RECS NOT STL DROPPED'.10200000
096100         03  NUM-FMT-RECS-NOT-STL       PIC S9(17) COMP-3.        10210000
096200                                                                  10220000
096300         03  FILLER  PIC X(31) VALUE 'NTOTAL FMT RECS INCOMPLETE'.10230000
096400         03  NUM-FMT-RECS-INCOMPLETE    PIC S9(17) COMP-3.        10240000
096500                                                                  10250000
096600         03  FILLER  PIC X(31)                                    10260000
096700                          VALUE '******************************'. 10270000
096800         03  FILLER  PIC S9(17) COMP-3.                           10280000
096900                                                                  10290000
097000         03  FILLER  PIC X(31) VALUE 'NTOTAL SORT RECORDS'.       10300000
097100         03  TOT-SORT-RECS      PIC S9(17) COMP-3.                10310000
097200                                                                  10320000
097300         03  FILLER  PIC X(31) VALUE 'NTOTAL VALID SORT RECORDS'. 10330000
097400         03  TOT-VALID-SORT-RECS PIC S9(17) COMP-3.               10340000
097500                                                                  10350000
097600         03  FILLER PIC X(31) VALUE 'NTOTAL INVALID SORT RECORDS'.10360000
097700         03  TOT-INVALID-SORT-RECS  PIC S9(17) COMP-3.            10370000
097800                                                                  10380000
097900         03  FILLER  PIC X(31)                                    10390000
098000                          VALUE '******************************'. 10400000
098100         03  FILLER  PIC S9(17) COMP-3.                           10410000
098200                                                                  10420000
098300         03  FILLER  PIC X(31) VALUE 'NTOTAL BR ACCT NOT NUMERIC'.10430000
098400         03  NUM-BR-ACT-NOT-NUMERIC    PIC S9(17) COMP-3.         10440000
098500                                                                  10450000
098600         03  FILLER  PIC X(31) VALUE 'NTOTAL PAST SETTLE DATES'.  10460000
098700         03  NUM-PAST-STL-DATES        PIC S9(17) COMP-3.         10470000
098800                                                                  10480000
098900         03  F  PIC X(31) VALUE 'NCASHBAL & CUSIP WRONG BYPASSED'.10490000
099000         03  NUM-CASHBAL-QSIP-WRONG    PIC S9(17) COMP-3.         10500000
099100                                                                  10510000
099200         03  FILLER PIC X(31) VALUE 'NTOTAL SYMBOL NOT MATCHED'.  10520000
099300         03  NUM-SYMBOL-NOT-MATCHED    PIC S9(17) COMP-3.         10530000
099400                                                                  10540000
099500         03  F  PIC X(31) VALUE 'NSETTLMNT IND INVALID BYPASSED'. 10550000
099600         03  NUM-SETTL-IND-INVALID     PIC S9(17) COMP-3.         10560000
099700                                                                  10570000
099800         03  FILLER  PIC X(31) VALUE 'NTOTAL ASSET TYPE NOT 0'.   10580000
099900         03  NUM-ASSET-TYPE-WRONG      PIC S9(17) COMP-3.         10590000
100000                                                                  10600000
100100         03  FILLER  PIC X(31) VALUE 'NSECURITY TYPE WHEN ISSUE'. 10610000
100200         03  NUM-SEC-TYPE-WRONG        PIC S9(17) COMP-3.         10620000
100300                                                                  10630000
100400         03  F  PIC X(31) VALUE 'NRECS WITH FRACTN QTY BYPASSED'. 10640000
100500         03  NUM-FRACTION-QTY          PIC S9(17) COMP-3.         10650000
100600                                                                  10660000
100700         03  FILLER  PIC X(31) VALUE 'NTOTAL CUSIP NOT MATCHED'.  10670000
100800         03  NUM-CUSIP-NOT-MATCHED     PIC S9(17) COMP-3.         10680000
100900                                                                  10690000
101000         03  FILLER  PIC X(31) VALUE 'NTOTAL CONTRA BROKER BAD'.  10700000
101100         03  NUM-CONTRA-BKR-NON-NUMERIC PIC S9(17) COMP-3.        10710000
101200                                                                  10720000
101300         03  FILLER  PIC X(31) VALUE 'NTOTAL PRIVATE RANGE BAD'.  10730000
101400         03  NUM-INVALID-PRIVATE-RANGE  PIC S9(17) COMP-3.        10740000
101500                                                                  10750000
101600         03  FILLER  PIC X(31) VALUE 'NTOTAL NON CASH BYPASSED'.  10760000
101700         03  NUM-CASH-TYPE-INVALID      PIC S9(17) COMP-3.        10770000
101800                                                                  10780000
101900         03  F  PIC X(31) VALUE '******************************'. 10790000
102000         03  FILLER  PIC S9(17) COMP-3.                           10800000
102100                                                                  10810000
102200         03  FILLER  PIC X(31) VALUE 'NTOTAL OF CLIENTS'.         10820000
102300         03  NUM-OF-CLIENTS            PIC S9(17) COMP-3.         10830000
102400                                                                  10840000
102500         03  FILLER  PIC X(31) VALUE 'NTOTAL OLD PEND RECS READ'. 10850000
102600         03  NUM-PEND-RECS-IN          PIC S9(17) COMP-3.         10860000
102700                                                                  10870000
102800         03  FILLER  PIC X(31)                                    10880000
102900                          VALUE 'NTOT OLD DATA PEND READ'.        10890000
103000         03  TOT-PEND-READ          PIC S9(17)  COMP-3.           10900000
103100                                                                  10910000
103200         03  FILLER  PIC X(31) VALUE 'NTOTAL NEW PEND WRITTEN'.   10920000
103300         03  NUM-NEW-PEND-WRITTEN      PIC S9(17) COMP-3.         10930000
103400                                                                  10940000
103500         03  FILLER  PIC X(31)                                    10950000
103600                          VALUE 'NTOT ACAT NEW PEND WRITTEN'.     10960000
103700         03  TOT-ACAT-NEW-PEND-WRITTEN   PIC S9(17)  COMP-3.      10970000
103800                                                                  10980000
103900         03  FILLER  PIC X(31)                                    10990000
104000                          VALUE 'NTOT PEND NEW PEND WRITTEN'.     11000000
104100         03  TOT-PEND-NEW-PEND-WRITTEN   PIC S9(17)  COMP-3.      11010000
104200                                                                  11020000
104300         03  FILLER  PIC X(31)                                    11030000
104400                          VALUE 'NTOT NEW DATA PEND WRITTEN'.     11040000
104500         03  TOT-NEW-PEND-WRITTEN   PIC S9(17)  COMP-3.           11050000
104600                                                                  11060000
104700         03  FILLER  PIC X(31)                                    11070000
104800                          VALUE '******************************'. 11080000
104900         03  FILLER  PIC S9(17) COMP-3.                           11090000
105000                                                                  11100000
105100         03  FILLER  PIC X(31) VALUE 'NTOTAL SELECTED FOR P2'.    11110000
105200         03  TOT-SELECTED-FOR-P2       PIC S9(17) COMP-3.         11120000
105300                                                                  11130000
105400         03  FILLER  PIC X(31)                                    11140000
105500                          VALUE 'NTOTAL ACAT SELECTED FOR P2'.    11150000
105600         03  TOT-ACAT-SELECTED-FOR-P2  PIC S9(17) COMP-3.         11160000
105700                                                                  11170000
105800         03  FILLER  PIC X(31)                                    11180000
105900                          VALUE 'NTOTAL PEND SELECTED FOR P2'.    11190000
106000         03  TOT-PEND-SELECTED-FOR-P2  PIC S9(17) COMP-3.         11200000
106100                                                                  11210000
106200         03  FILLER  PIC X(31) VALUE 'NTOTAL P2 RECORDS OUT'.     11220000
106300         03  TOT-P2-RECS-WRITTEN           PIC S9(17) COMP-3.     11230000
106400                                                                  11240000
106500                                                                  11250000
106600         03  FILLER  PIC X(31)                                    11260000
106700                          VALUE '******************************'. 11270000
106800         03  FILLER  PIC S9(17) COMP-3.                           11280000
106900                                                                  11290000
107000         03  FILLER  PIC X(31)                                    11300000
107100                          VALUE 'MTOT BK CUST DEBIT VALUE'.       11310000
107200         03  TOT-BK-CUST-DB-VALUE    PIC S9(15)V99 COMP-3.        11320000
107300                                                                  11330000
107400         03  FILLER  PIC X(31)                                    11340000
107500                          VALUE 'MTOT BK CUST CREDIT VALUE'.      11350000
107600         03  TOT-BK-CUST-CR-VALUE    PIC S9(15)V99 COMP-3.        11360000
107700                                                                  11370000
107800         03  FILLER  PIC X(31)                                    11380000
107900                          VALUE 'STOT BK CUST DEBIT QUANTITY'.    11390000
108000         03  TOT-BK-CUST-DB-QTY      PIC S9(12)V9(5) COMP-3.      11400000
108100                                                                  11410000
108200         03  FILLER  PIC X(31)                                    11420000
108300                          VALUE 'STOT BK CUST CREDIT QUANTITY'.   11430000
108400         03  TOT-BK-CUST-CR-QTY      PIC S9(12)V9(5) COMP-3.      11440000
108500                                                                  11450000
108600         03  FILLER  PIC X(31)                                    11460000
108700                          VALUE '******************************'. 11470000
108800         03  FILLER  PIC S9(17) COMP-3.                           11480000
108900                                                                  11490000
109000         03  FILLER  PIC X(31) VALUE 'MTOT BK OFFSET DEBIT VALUE'.11500000
109100         03  TOT-OFFSET-DB-VALUE       PIC S9(15)V99 COMP-3.      11510000
109200                                                                  11520000
109300         03  FILLER PIC X(31) VALUE 'MTOT BK OFFSET CREDIT VALUE'.11530000
109400         03  TOT-OFFSET-CR-VALUE       PIC S9(15)V99 COMP-3.      11540000
109500                                                                  11550000
109600         03  FILLER PIC X(31) VALUE 'MTOT BK OFFSET BYP DB VALUE'.11560000
109700         03  TOT-OFFSET-BYP-DB-VALUE       PIC S9(15)V99 COMP-3.  11570000
109800                                                                  11580000
109900         03  FILLER PIC X(31) VALUE 'MTOT BK OFFSET BYP CR VALUE'.11590000
110000         03  TOT-OFFSET-BYP-CR-VALUE       PIC S9(15)V99 COMP-3.  11600000
110100                                                                  11610000
110200         03  FILLER  PIC X(31)                                    11620000
110300                          VALUE '*****************************'.  11630000
110400         03  FILLER  PIC S9(17) COMP-3.                           11640000
110500                                                                  11650000
110600                                                                  11660000
110700         03  FILLER  PIC X(31) VALUE 'STOT BK CNS DEBIT QUANTITY'.11670000
110800         03  TOT-BK-CNS-DB-QTY      PIC S9(12)V9(5) COMP-3.       11680000
110900                                                                  11690000
111000         03  FILLER PIC X(31) VALUE 'STOT BK CNS CREDIT QUANTITY'.11700000
111100         03  TOT-BK-CNS-CR-QTY      PIC S9(12)V9(5) COMP-3.       11710000
111200                                                                  11720000
111300         03  FILLER  PIC X(31)                                    11730000
111400                          VALUE '******************************'. 11740000
111500         03  FILLER  PIC S9(17) COMP-3.                           11750000
111600                                                                  11760000
111700         03  FILLER  PIC X(31) VALUE 'MTOT BK DEBIT VALUE'.       11770000
111800         03  TOT-BK-DB-VALUE    PIC S9(15)V99 COMP-3.             11780000
111900                                                                  11790000
112000         03  FILLER  PIC X(31) VALUE 'MTOT BK CREDIT VALUE'.      11800000
112100         03  TOT-BK-CR-VALUE    PIC S9(15)V99 COMP-3.             11810000
112200                                                                  11820000
112300         03  FILLER  PIC X(31) VALUE 'STOT BK DEBIT QUANTITY'.    11830000
112400         03  TOT-BK-DB-QTY      PIC S9(12)V9(5) COMP-3.           11840000
112500                                                                  11850000
112600         03  FILLER PIC X(31) VALUE 'STOT BK CREDIT QUANTITY'.    11860000
112700         03  TOT-BK-CR-QTY      PIC S9(12)V9(5) COMP-3.           11870000
112800                                                                  11880000
112900         03  FILLER  PIC X(31)                                    11890000
113000                          VALUE '******************************'. 11900000
113100         03  FILLER  PIC S9(17) COMP-3.                           11910000
113200                                                                  11920000
113300         03  FILLER PIC X(31) VALUE 'MTOT RD CL DEBIT VALUE'.     11930000
113400         03  TOT-RD-CL-DB-VALUE    PIC S9(15)V99 COMP-3.          11940000
113500                                                                  11950000
113600         03  FILLER  PIC X(31) VALUE 'MTOT RD CL CREDIT VALUE'.   11960000
113700         03  TOT-RD-CL-CR-VALUE    PIC S9(15)V99 COMP-3.          11970000
113800                                                                  11980000
113900         03  FILLER  PIC X(31) VALUE 'STOT RD CL DEBIT QUANTITY'. 11990000
114000         03  TOT-RD-CL-DB-QTY      PIC S9(12)V9(5) COMP-3.        12000000
114100                                                                  12010000
114200         03  FILLER  PIC X(31) VALUE 'STOT RD CL CREDIT QUANTITY'.12020000
114300         03  TOT-RD-CL-CR-QTY      PIC S9(12)V9(5) COMP-3.        12030000
114400                                                                  12040000
114500         03  FILLER  PIC X(31)                                    12050000
114600                          VALUE '******************************'. 12060000
114700         03  FILLER  PIC S9(17) COMP-3.                           12070000
114800                                                                  12080000
114900         03  FILLER  PIC X(31) VALUE 'MTOT DEBIT VALUE'.          12090000
115000         03  TOT-DB-VALUE          PIC S9(15)V99 COMP-3.          12100000
115100                                                                  12110000
115200         03  FILLER  PIC X(31) VALUE 'MTOT CREDIT VALUE'.         12120000
115300         03  TOT-CR-VALUE          PIC S9(15)V99 COMP-3.          12130000
115400                                                                  12140000
115500         03  FILLER  PIC X(31) VALUE 'STOT DEBIT QUANTITY'.       12150000
115600         03  TOT-DB-QTY            PIC S9(12)V9(5) COMP-3.        12160000
115700                                                                  12170000
115800         03  FILLER  PIC X(31) VALUE 'STOT CREDIT QUANTITY'.      12180000
115900         03  TOT-CR-QTY            PIC S9(12)V9(5) COMP-3.        12190000
116000         03  FILLER  PIC X(31)                                    12200000
116100                          VALUE '******************************'. 12210000
116200         03  FILLER  PIC S9(17) COMP-3.                           12220000
116300                                                                  12230000
116400         03  FILLER  PIC X(31) VALUE 'NTOTAL EARLY RECORDS OUT'.  12240000
116500         03  TOT-EARLY-WRITTEN             PIC S9(17) COMP-3.     12250000
116600                                                                  12260000
116700         03  FILLER PIC X(31) VALUE 'MTOT EARLY DEBIT VALUE'.     12270000
116800         03  TOT-EARLY-DB-VALUE    PIC S9(15)V99 COMP-3.          12280000
116900                                                                  12290000
117000         03  FILLER  PIC X(31) VALUE 'MTOT EARLY CREDIT VALUE'.   12300000
117100         03  TOT-EARLY-CR-VALUE    PIC S9(15)V99 COMP-3.          12310000
117200                                                                  12320000
117300         03  FILLER  PIC X(31) VALUE 'STOT EARLY DEBIT QUANTITY'. 12330000
117400         03  TOT-EARLY-DB-QTY      PIC S9(12)V9(5) COMP-3.        12340000
117500                                                                  12350000
117600         03  FILLER  PIC X(31) VALUE 'STOT EARLY CREDIT QUANTITY'.12360000
117700         03  TOT-EARLY-CR-QTY      PIC S9(12)V9(5) COMP-3.        12370000
117800                                                                  12380000
117900         03  FILLER PIC X(31)                                     12390000
118000                         VALUE '******************************'.  12400000
118100         03  FILLER PIC S9(17) COMP-3.                            12410000
118200                                                                  12420000
118300         03  FILLER PIC X(31) VALUE 'STOT OPTION DB QUANT'.       12430000
118400         03  TOT-BK-OPTION-DB-QTY     PIC S9(12)V9(5) COMP-3.     12440000
118500                                                                  12450000
118600         03  FILLER PIC X(31) VALUE 'STOT OPTION CR QUANT'.       12460000
118700         03  TOT-BK-OPTION-CR-QTY     PIC S9(12)V9(5) COMP-3.     12470000
118800                                                                  12480000
118900         03  FILLER PIC X(31) VALUE 'STOT CBOE OFFSET DB QTY'.    12490000
119000         03  TOT-OPT-CBOE-DB-QTY      PIC S9(12)V9(5) COMP-3.     12500000
119100                                                                  12510000
119200         03  FILLER PIC X(31) VALUE 'STOT CBOE OFFSET CR QTY'.    12520000
119300         03  TOT-OPT-CBOE-CR-QTY      PIC S9(12)V9(5) COMP-3.     12530000
119400                                                                  12540000
119500         03  FILLER PIC X(31)                                     12550000
119600                         VALUE 'STOT AMEX NYSE OFFSET DB QTY'.    12560000
119700         03  TOT-AMEX-NYSE-DB-QTY     PIC S9(12)V9(5) COMP-3.     12570000
119800                                                                  12580000
119900         03  FILLER PIC X(31)                                     12590000
120000                         VALUE 'STOT AMEX NYSE OFFSET CR QTY'.    12600000
120100         03  TOT-AMEX-NYSE-CR-QTY     PIC S9(12)V9(5) COMP-3.     12610000
120200                                                                  12620000
120300         03  FILLER PIC X(31) VALUE 'STOT PBW OFFSET DB QTY'.     12630000
120400         03  TOT-OPT-PBW-DB-QTY       PIC S9(12)V9(5) COMP-3.     12640000
120500                                                                  12650000
120600         03  FILLER PIC X(31) VALUE 'STOT PBW OFFSET CR QTY'.     12660000
120700         03  TOT-OPT-PBW-CR-QTY       PIC S9(12)V9(5) COMP-3.     12670000
120800                                                                  12680000
120900         03  FILLER PIC X(31) VALUE 'STOT PSE OFFSET DB QTY'.     12690000
121000         03  TOT-OPT-PSE-DB-QTY       PIC S9(12)V9(5) COMP-3.     12700000
121100                                                                  12710000
121200         03  FILLER PIC X(31) VALUE 'STOT PSE OFFSET CR QTY'.     12720000
121300         03  TOT-OPT-PSE-CR-QTY       PIC S9(12)V9(5) COMP-3.     12730000
121400                                                                  12740000
121500         03  FILLER PIC X(31) VALUE 'STOT DFLT OFFSET DB QTY'.    12750000
121600         03  TOT-OPT-DFLT-DB-QTY      PIC S9(12)V9(5) COMP-3.     12760000
121700                                                                  12770000
121800         03  FILLER PIC X(31) VALUE 'STOT DFLT OFFSET CR QTY'.    12780000
121900         03  TOT-OPT-DFLT-CR-QTY      PIC S9(12)V9(5) COMP-3.     12790000
122000                                                                  12800000
122100         03  FILLER PIC X(31)                                     12810000
122200                         VALUE '******************************'.  12820000
122300         03  FILLER PIC S9(17) COMP-3.                            12830000
122400                                                                  12840000
122500     02  CNTR-TABLE REDEFINES CNTR-DATA.                          12850000
122600         03  CNTR-ENTRIES OCCURS 96 TIMES INDEXED BY CNTR-X.      12860000
122700             05  CNTR-TYPE            PIC X.                      12870000
122800             05  CNTR-DESC            PIC X(30).                  12880000
122900             05  CNTR-RECS            PIC S9(17) COMP-3.          12890000
123000             05  CNTR-RECS-MONEY REDEFINES CNTR-RECS              12900000
123100                                      PIC S9(15)V99 COMP-3.       12910000
123200             05  CNTR-RECS-SHARE REDEFINES CNTR-RECS-MONEY        12920000
123300                                      PIC S9(12)V9(5) COMP-3.     12930000
123400                                                                  12940000
123500     02  NUM-CNTRS           PIC S9(5) COMP SYNC VALUE +96.       12950000
123600                                                                  12960000
123700/                                                                 12970000
LRM019 01  FILLER                      PIC X(13) VALUE 'MGR02MVC AREA'. 12980000
LRM019     COPY MGR02MVC.                                               12990000
124000/                                                                 13000000
124100 01  FILLER                       PIC X(12) VALUE 'GETXREF AREA'. 13010000
124200                                                                  13020000
124300 01  MSD-SYM-CUSIP-XREF-RECORD.                                   13030000
124400*                                                                 13040000
124500*   C A L L I N G    P A R A M E T E R S                          13050000
124600*                                                                 13060000
124700     02  GETMSD-XREF-CALLING-INFO.                                13070000
124800         05  GETMSD-XREF-DEVICE           PIC X(01) VALUE 'D'.    13080000
124900         05  GETMSD-XREF-ACCESS           PIC X(01) VALUE 'R'.    13090000
125000         05  GETMSD-XREF-RETURN-CODE      PIC X(01).              13100000
125100             88 GETMSD-XREF-RETURN-VALID            VALUE SPACE.  13110000
125200             88 GETMSD-XREF-RETURN-EOF              VALUE 'E'.    13120000
125300             88 GETMSD-XREF-RETURN-INV-CUSIP        VALUE 'I'.    13130000
125400             88 GETMSD-XREF-RETURN-NOT-FOUND        VALUE 'N'.    13140000
125500             88 GETMSD-XREF-RETURN-KEY-IS-SEC       VALUE 'S'.    13150000
125600             88 GETMSD-XREF-RETURN-IO-ERROR         VALUE 'X'.    13160000
125700         05  GETMSD-XREF-SEARCH-KEY       PIC X(13) VALUE SPACES. 13170000
125800*                                                                 13180000
125900*   X R E F   R E C O R D   R E T U R N E D                       13190000
126000*                                                                 13200000
126100 02  MSD-XREF-RECORD-AREA.                                        13210000
126200     05  MSXREF-KEY-AREA.                                         13220000
126300         07  MSXREF-KEY                   PIC X(12).              13230000
126400         07  MSXREF-WI-CODE               PIC X(01).              13240000
126500     05  MSXREF-EXCHANGE                  PIC X(01).              13250000
126600     05  MSXREF-ADP-NO                    PIC X(07).              13260000
126700/                                                                 13270000
126800 01  FILLER                       PIC X(12) VALUE 'GETMSD AREA'.  13280000
126900*                                                                 13290000
127000*      INITIALIZE GETMSD CALLING PARAMETERS                       13300000
127100*                                                                 13310000
127200 01  GETMSD-INIT-CALLING-INFO.                                    13320000
127300     03  GETMSD-INIT-DEVICE       PIC X           VALUE 'D'.      13330000
127400     03  GETMSD-INIT-ACCESS       PIC X           VALUE 'R'.      13340000
127500     03  GETMSD-INIT-FORMAT       PIC X           VALUE 'N'.      13350000
127600     03  GETMSD-INIT-RETURN       PIC X           VALUE SPACE.    13360000
127700     03  GETMSD-INIT-SEARCH       PIC X(12)       VALUE SPACE.    13370000
127800     03  GETMSD-INIT-WICODE       PIC X           VALUE SPACES.   13380000
127900     03  GETMSD-INIT-CLIENT       PIC XXX         VALUE SPACE.    13390000
           03  FILLER REDEFINES GETMSD-INIT-CLIENT.                     13400000
               05  FILLER                  PIC X(01).                   13410000
               05  GETMSD-INIT-CLIENT-PL2  PIC 9(03) COMP-3.            13420000
128000                                                                  13430000
128100     COPY RECMSDC.                                                13440000
128200/                                                                 13450000
128300 01  WS-SEC-TYPE-PICX.                                            13460000
128400     05  FILLER                       PIC X.                      13470000
128500     05  WS-SEC-TYPE-PICX-BYTE2       PIC X.                      13480000
128600                                                                  13490000
128700 01  WS-SEC-TYPE-COMP3                PIC S9(3) COMP-3.           13500000
128800 01  FILLER REDEFINES WS-SEC-TYPE-COMP3.                          13510000
128900     05  WS-SEC-TYPE-COMP3-BYTE1      PIC X.                      13520000
129000     05  FILLER                       PIC X.                      13530000
129100                                                                  13540000
129200 01  WS-SEC-TYPE-PIC9                 PIC 9(3).                   13550000
129300 01  FILLER REDEFINES WS-SEC-TYPE-PIC9.                           13560000
129400     05  FILLER                       PIC X.                      13570000
129500     05  WS-EXCHANGE-CODE             PIC X.                      13580000
129600         88  CBOE-OPTION    VALUE '1'.                            13590000
129700         88  AMEX-OPTION    VALUE '2'.                            13600000
129800         88  PBW-OPTION     VALUE '3'.                            13610000
129900         88  PSE-OPTION     VALUE '4'.                            13620000
130000         88  NYSE-OPTION    VALUE '8'.                            13630000
130100     05  FILLER                       PIC X.                      13640000
130200                                                                  13650000
130300/                                                                 13660000
130400 01  SYMBOL-SW                        PIC X.                      13670000
130500     88  SYMBOL-IS-FOUND              VALUE 'Y'.                  13680000
130600     88  SYMBOL-NOT-FOUND             VALUE 'N'.                  13690000
130700                                                                  13700000
130800 01  WS-ADP-SYMBOL.                                               13710000
130900     05 WS-ADP-SYMBOL-CHAR OCCURS 13 TIMES PIC X.                 13720000
131000                                                                  13730000
131100 01  WS-FMT-SYMBOL.                                               13740000
131200     05 WS-FMT-SYMBOL-CHAR OCCURS 6 TIMES PIC X.                  13750000
131300                                                                  13760000
131400 01  SUBS.                                                        13770000
131500     05  ADP-SYMBOL-SUB               PIC S9(4) COMP SYNC.        13780000
131600     05  FMT-SYMBOL-SUB               PIC S9(4) COMP SYNC.        13790000
131700     05  SUB                          PIC S9(4) COMP SYNC.        13800000
131800                                                                  13810000
131900 01  EXP-MONTH-TABLE.                                             13820000
132000     05  FILLER                       PIC X(4) VALUE '01AM'.      13830000
132100     05  FILLER                       PIC X(4) VALUE '02BN'.      13840000
132200     05  FILLER                       PIC X(4) VALUE '03CO'.      13850000
132300     05  FILLER                       PIC X(4) VALUE '04DP'.      13860000
132400     05  FILLER                       PIC X(4) VALUE '05EQ'.      13870000
132500     05  FILLER                       PIC X(4) VALUE '06FR'.      13880000
132600     05  FILLER                       PIC X(4) VALUE '07GS'.      13890000
132700     05  FILLER                       PIC X(4) VALUE '08HT'.      13900000
132800     05  FILLER                       PIC X(4) VALUE '09IU'.      13910000
132900     05  FILLER                       PIC X(4) VALUE '10JV'.      13920000
133000     05  FILLER                       PIC X(4) VALUE '11KW'.      13930000
133100     05  FILLER                       PIC X(4) VALUE '12LX'.      13940000
133200                                                                  13950000
133300 01  FILLER REDEFINES EXP-MONTH-TABLE.                            13960000
133400     05  EXP-MONTH-ENTRY OCCURS 12 TIMES                          13970000
133500                         ASCENDING KEY IS EXP-MONTH               13980000
133600                         INDEXED BY EXP-MONTH-IND.                13990000
133700         10  EXP-MONTH                PIC X(2).                   14000000
133800         10  EXP-MONTH-CALL           PIC X(1).                   14010000
133900         10  EXP-MONTH-PUT            PIC X(1).                   14020000
134000                                                                  14030000
134100 01  STR-PRICE-TABLE.                                             14040000
134200     05  FILLER                       PIC X(3) VALUE 'T00'.       14050000
134300     05  FILLER                       PIC X(3) VALUE 'A05'.       14060000
134400     05  FILLER                       PIC X(3) VALUE 'U07'.       14070000
134500     05  FILLER                       PIC X(3) VALUE 'B10'.       14080000
134600     05  FILLER                       PIC X(3) VALUE 'V12'.       14090000
134700     05  FILLER                       PIC X(3) VALUE 'C15'.       14100000
134800     05  FILLER                       PIC X(3) VALUE 'W17'.       14110000
134900     05  FILLER                       PIC X(3) VALUE 'D20'.       14120000
135000     05  FILLER                       PIC X(3) VALUE 'X22'.       14130000
135100     05  FILLER                       PIC X(3) VALUE 'E25'.       14140000
135200     05  FILLER                       PIC X(3) VALUE 'F30'.       14150000
135300     05  FILLER                       PIC X(3) VALUE 'G35'.       14160000
135400     05  FILLER                       PIC X(3) VALUE 'H40'.       14170000
135500     05  FILLER                       PIC X(3) VALUE 'I45'.       14180000
135600     05  FILLER                       PIC X(3) VALUE 'J50'.       14190000
135700     05  FILLER                       PIC X(3) VALUE 'K55'.       14200000
135800     05  FILLER                       PIC X(3) VALUE 'L60'.       14210000
135900     05  FILLER                       PIC X(3) VALUE 'M65'.       14220000
136000     05  FILLER                       PIC X(3) VALUE 'N70'.       14230000
136100     05  FILLER                       PIC X(3) VALUE 'O75'.       14240000
136200     05  FILLER                       PIC X(3) VALUE 'P80'.       14250000
136300     05  FILLER                       PIC X(3) VALUE 'Q85'.       14260000
136400     05  FILLER                       PIC X(3) VALUE 'R90'.       14270000
136500     05  FILLER                       PIC X(3) VALUE 'S95'.       14280000
136600                                                                  14290000
136700 01  FILLER REDEFINES STR-PRICE-TABLE.                            14300000
136800     05  STR-PRICE-ENTRY OCCURS 24 TIMES                          14310000
136900                         ASCENDING KEY IS STR-PRICE               14320000
137000                         INDEXED BY STR-PRICE-IND.                14330000
137100         10  STR-PRICE-A              PIC X(1).                   14340000
137200         10  STR-PRICE                PIC X(2).                   14350000
137300                                                                  14360000
137400/                                                                 14370000
137500 01  FILLER                      PIC X(16) VALUE 'MEMO-REC-WS'.   14380000
137600                                                                  14390000
137700     COPY SRMSS  REPLACING ==:SRMSS:==  BY  ==MSS==.              14400000
137800                                                                  14410000
137900 01  MEMO-TABLE.                                                  14420000
138000     05  MEMO-CLNT               PIC 9(03).                       14430000
138100     05  FILLER                  PIC X(01).                       14440000
LRM050     05  MEMO-CODE-DETAIL                  OCCURS 6 TIMES.        14450000
138300         10  MEMO-VALUE          PIC X(02).                       14460000
138400         10  MEMO-ACCOUNT        PIC X(10).                       14470000
138500         10  MEMO-ONE-WAY-BATCH  PIC X(03).                       14480000
138600         10  MEMO-TWO-WAY-BATCH  PIC X(03).                       14490000
138700                                                                  14500000
138800/                                                                 14510000
138900 01  FILLER                      PIC X(16) VALUE 'P2BKPG-REC-WS'. 14520000
139000 01  BKCNS-ACAT-OUT-WORK-AREA.                                    14530000
139100     02  P2-BK-RECORD.                                            14540000
139200         03  P2-BK-TRID          PIC XXX   VALUE 'BNS'.           14550000
139300         03  FILLER-1  REDEFINES P2-BK-TRID.                      14560000
139400             05  P2-BK-TRID-X        PIC X.                       14570000
139500             05  P2-BK-BATCH-CODE    PIC XX.                      14580000
139600         03  P2-BK-BROKER-NBR    PIC XXX.                         14590000
139700         03  P2-BK-BUY-SELL-CODE PIC X.                           14600000
139800         03  P2-BK-QUANTITY  PIC 9(11) COMP-3.                    14610000
139900         03  P2-BK-QUANTITY-X                                     14620000
140000                    REDEFINES P2-BK-QUANTITY.                     14630000
140100             05  P2-BK-QUANTITY-SW   PIC X.                       14640000
140200             05  FILLER              PIC X(5).                    14650000
140300         03  P2-BK-SECURITY-NBR  PIC X(7).                        14660000
140400         03  FILLER              PIC XX    VALUE SPACES.          14670000
140500         03  P2-BK-ENTRY-CODE    PIC XXX   VALUE 'TFR'.           14680000
140600         03  FILLER              PIC X(5)  VALUE SPACES.          14690000
140700         03  P2-BK-BR-ACCT-T-C.                                   14700000
140800           05  P2-BK-BR-ACCT-T.                                   14710000
140900             07  P2-BK-BRANCH    PIC XXX.                         14720000
141000             07  P2-BK-ACCOUNT   PIC X(5).                        14730000
141100             07  P2-BK-TYPE      PIC 9.                           14740000
141200           05  P2-BK-CHECK-DIGIT PIC X.                           14750000
141300         03  P2-BK-SPIN-DTW      PIC XX    VALUE SPACES.          14760000
141400         03  P2-BK-AMOUNT        PIC 9(16)V99 COMP-3.             14770000
141500         03  P2-BK-AMOUNT-DOLLARS REDEFINES P2-BK-AMOUNT          14780000
141600                                 PIC 9(18)   COMP-3.              14790000
141700         03  P2-BK-DESCRIPTION.                                   14800000
141800             05  FILLER          PIC X(4)  VALUE 'ACAT'.          14810000
141900             05  P2-BK-CNTL-NBR  PIC X(14).                       14820000
142000             05  FILLER          PIC X(5)  VALUE ' BOS '.         14830000
142100             05  P2-BK-CNTRA-BKR PIC X(4).                        14840000
142200         03  FILLER              PIC X     VALUE SPACES.          14850000
142300         03  P2-BK-CURRENCY      PIC XXX   VALUE '000'.           14860000
142400***      03  FILLER              PIC X(10)  VALUE SPACES.         14870000
142500***   ADD P2-BK-VALUE-DT -- 0YYMMDD ---------------->             14880000
142600         03  P2-BK-VALUE-DT      PIC 9(07)  COMP-3.               14890000
142700         03  P2-BK-VALUE-DT-X  REDEFINES P2-BK-VALUE-DT           14900000
142800                                 PIC X(04).                       14910000
142900         03  FILLER              PIC X(06)  VALUE SPACES.         14920000
143000         03  P2-BK-FRACTION      PIC V9(5).                       14930000
143100         03  P2-BK-FRACTION-X    REDEFINES P2-BK-FRACTION         14940000
143200                                 PIC X(05).                       14950000
143300         03  FILLER              PIC X(22)  VALUE SPACES.         14960000
143400     02  P2-BK-TRAILER-RECORD.                                    14970000
139200         03  P2-BKT-TRID           PIC X(03).                     14980000
139300         03  FILLER-1  REDEFINES P2-BKT-TRID.                     14990000
139400             05  P2-BKT-TRID-X     PIC X(01).                     15000000
139500             05  P2-BKT-BATCH-CODE PIC X(02).                     15010000
139600         03  P2-BKT-BROKER-NBR     PIC X(03).                     15020000
139700         03  P2-BKT-BUY-SELL-CODE  PIC X(01).                     15030000
143700         03  P2-BKT-QUANTITY-X     PIC X(06).                     15040000
140300         03  P2-BKT-SECURITY-NBR   PIC X(07).                     15050000
140400         03  FILLER                PIC X(02).                     15060000
144000         03  P2-BKT-ENTRY-CODE     PIC X(03).                     15070000
140600         03  FILLER                PIC X(05).                     15080000
140700         03  P2-BKT-BR-ACCT-T-C.                                  15090000
140800           05  P2-BKT-BR-ACCT-T.                                  15100000
140900             07  P2-BKT-BRANCH     PIC X(03).                     15110000
141000             07  P2-BKT-ACCOUNT    PIC X(05).                     15120000
141100             07  P2-BKT-TYPE       PIC X(01).                     15130000
141200           05  P2-BKT-CHECK-DIGIT  PIC X(01).                     15140000
141300         03  FILLER                PIC X(02).                     15150000
144200         03  P2-BKT-AMOUNT-X       PIC X(10).                     15160000
144300         03  P2-BKT-DESCRIPTION.                                  15170000
144400             05  P2-BKT-RESCODE    PIC X(02).                     15180000
144500             05  P2-BKT-RESDESC    PIC X(25).                     15190000
144600         03  P2-BKT-HYPHEN         PIC X(01) VALUE SPACES.        15200000
144700         03  P2-BKT-FILLER1        PIC X(02) VALUE SPACES.        15210000
LRM034         03  P2-TRAILER-ORIG-SUFFIX.                              15220000
144800           05  P2-BKT-FILLER2        PIC X(11) VALUE SPACES.      15230000
143000           05  P2-BKT-FRACTION       PIC V9(5).                   15240000
143100           05  P2-BKT-FRACTION-X     REDEFINES P2-BKT-FRACTION    15250000
143200                                     PIC X(05).                   15260000
145000           05  FILLER                PIC X(21) VALUE SPACES.      15270000
LRM035           05  P2-BKT-TRAILER-CODE   PIC X     VALUE SPACES.      15280000
145000                                                                  15290000
145100 01  P2-DEBIT-SIGN               PIC X     VALUE '0'.             15300000
145200 01  P2-CREDIT-SIGN              PIC X     VALUE '-'.             15310000
145300 01  P2-QUANTITY-PRESENT         PIC X     VALUE LOW-VALUES.      15320000
145400 01  P2-NO-QUANTITY-PRESENT      PIC X     VALUE SPACE.           15330000
145500                                                                  15340000
145600/                                                                 15350000
145700*                                                                 15360000
145800 01  WS-BR-ACCT-TC.                                               15370000
145900     05  WS-BR-ACCT-T.                                            15380000
146000         10 WS-BRANCH            PIC X(3).                        15390000
146100         10 WS-ACCT              PIC X(5).                        15400000
146200         10 WS-TYPE              PIC 9(1).                        15410000
146300     05  WS-CHECK-DIGIT          PIC X(1).                        15420000
146400                                                                  15430000
146500 01  OB-BR-ACCT-TC.                                               15440000
146600     05  OB-BRANCH               PIC X(3).                        15450000
146700     05  FILLER                  PIC X(1)  VALUE '-'.             15460000
146800     05  OB-ACCT                 PIC X(5).                        15470000
146900     05  FILLER                  PIC X(1)  VALUE '-'.             15480000
147000     05  OB-TYPE                 PIC 9(1).                        15490000
147100     05  OB-CHECK                PIC X(1).                        15500000
147200*                                                                 15510000
147300 01  FILLER                      PIC X(16) VALUE 'T3RDFL-REC-WS'. 15520000
147400                                                                  15530000
147500      COPY ACATCG03 REPLACING ==:CAGE-03:== BY ==CAGE-03==.       15540000
147600/                                                                 15550000
147700 01  FILLER                      PIC X(16) VALUE 'CAG2FL-REC-WS'. 15560000
147800                                                                  15570000
147900     COPY ACATCG01 REPLACING ==:CAGE-01:== BY ==CAGE==.           15580000
148000/                                                                 15590000
148100     COPY XBILLCOB.                                               15600000
148200/                                                                 15610000
148300     COPY CPRTWORK.                                               15620000
148400/                                                                 15630000
148500 01  REG-OPT-RECORD-WS.                                           15640000
148600     COPY BNWREGOP.                                               15650000
148700/                                                                 15660000
148800 01  HOLD-PW-LINE                   PIC X(133) VALUE SPACES.      15670000
148900                                                                  15680000
149000 01  DATE-WORK-AREA.                                              15690000
149100     03  DATE-WORK-CC                PIC X(2).                    15700000
149200     03  DATE-WORK-YYMMDD            PIC X(6).                    15710000
149300                                                                  15720000
149400 01  DATE-WORK1-AREA.                                             15730000
149500     03  DATE-WORK1-MM               PIC X(2).                    15740000
149600     03  DATE-WORK1-DD               PIC X(2).                    15750000
149700     03  DATE-WORK1-YY               PIC X(2).                    15760000
149800 01  DATE-WORK1-AREAN  REDEFINES DATE-WORK1-AREA PIC 9(6).        15770000
149900                                                                  15780000
150000 01  WS-STTLM-DATE.                                               15790000
150100     05  WS-STTLM-DATE-CC        PIC 9(02).                       15800000
150200     05  WS-STTLM-DATE-YY        PIC 9(02).                       15810000
150300     05  FILLER                  PIC 9(01).                       15820000
150400     05  WS-STTLM-DATE-MM        PIC 9(02).                       15830000
150500     05  FILLER                  PIC 9(01).                       15840000
150600     05  WS-STTLM-DATE-DD        PIC 9(02).                       15850000
150700 01  WS-STTLM-DT-CCYYMMDD.                                        15860000
150800     05  WS-STTLM-DT-CC          PIC 9(02).                       15870000
150900     05  WS-STTLM-DT-YY          PIC 9(02).                       15880000
151000     05  WS-STTLM-DT-MM          PIC 9(02).                       15890000
151100     05  WS-STTLM-DT-DD          PIC 9(02).                       15900000
151200 01  WS-VALUE-DT-YYMMDD          PIC 9(06).                       15910000
151300 01  FILLER REDEFINES WS-VALUE-DT-YYMMDD.                         15920000
151400     05  WS-VALUE-DT-YY          PIC 9(02).                       15930000
151500     05  WS-VALUE-DT-MM          PIC 9(02).                       15940000
151600     05  WS-VALUE-DT-DD          PIC 9(02).                       15950000
151700 01  WS-DTSEARCH-DATE-CCYYMMDD.                                   15960000
151800     05  WS-DTSEARCH-DATE-CC     PIC X(02).                       15970000
151900     05  WS-DTSEARCH-DATE-YY     PIC X(02).                       15980000
152000     05  WS-DTSEARCH-DATE-MM     PIC X(02).                       15990000
152100     05  WS-DTSEARCH-DATE-DD     PIC X(02).                       16000000
152200 01  WS-DTSEARCH-DATE-9          PIC 9(08).                       16010000
152300 01  WS-LEAP-YEAR-AREA.                                           16020000
152400     05  WS-YEAR                     PIC X(02).                   16030000
152500     05  WS-YEAR-N    REDEFINES WS-YEAR                           16040000
152600                                     PIC 9(02).                   16050000
152700     05  WS-DIVIDED                  PIC 9(03).                   16060000
152800     05  WS-REMAIN                   PIC 9(03).                   16070000
152900     05  WS-LEAP-YR-SW               PIC X(01).                   16080000
153000         88  WS-LEAP-YR                        VALUE 'Y'.         16090000
153100 01  WS-CATPPL-TABLE.                                             16100000
153200     03  WS-CATPPL-RECORD-COUNT      PIC S9(4) COMP VALUE ZEROS.  16110000
153300     03  WS-CATPPL-RECORD OCCURS 500 TIMES.                       16120000
153410         05  WS-CATPPL-BROKER        PIC X(04).                   16130000
153430         05  WS-CATPPL-BROKER-NAME   PIC X(50).                   16140000
153440                                                                  16150000
153450 01  ERROR-WORK-LINE.                                             16160000
153460     03  ERROR-WORK1                 PIC X(100).                  16170000
153470     03  ERROR-WORK2                 PIC X(33).                   16180000
153480 01  TOTALS-TITLE-LINE.                                           16190000
153490     03  FILLER                     PIC X     VALUE '1'.          16200000
153500     03  FILLER                     PIC X(2)  VALUE SPACES.       16210000
153600     03  FILLER                     PIC X(6)  VALUE 'PGM = '.     16220000
153700     03  TTL-PGM-NAME               PIC X(8).                     16230000
153800     03  FILLER                     PIC X(7)  VALUE 'CLIENT '.    16240000
153900     03  TTL-CLIENT-NUMBER          PIC X(3).                     16250000
154000     03  FILLER                     PIC X(2)  VALUE SPACES.       16260000
154100     03  TTL-DESC                   PIC X(50) VALUE               16270000
154200     '           A C A T   T O T A L S              '.            16280000
154300     03  FILLER                     PIC X(12) VALUE               16290000
154400     '      DATE  '.                                              16300000
154500     03  TTL-DATE                   PIC X(08) VALUE SPACE.        16310000
154600     03  FILLER                     PIC X(11) VALUE '     PAGE  '.16320000
154700     03  TTL-PAGE                   PIC ZZ,ZZ9.                   16330000
154800                                                                  16340000
154900 01  TITLE-LINE1.                                                 16350000
155000     03  FILLER                     PIC X     VALUE '1'.          16360000
155100     03  FILLER                     PIC X(2)  VALUE SPACES.       16370000
155200     03  FILLER                     PIC X(6)  VALUE 'PGM = '.     16380000
155300     03  TL-PGM-NAME                PIC X(8).                     16390000
155400     03  FILLER                     PIC X(7)  VALUE 'CLIENT '.    16400000
155500     03  TL-CLIENT-NUMBER           PIC X(3).                     16410000
155600     03  FILLER                     PIC X(2)  VALUE SPACES.       16420000
155700     03  TL-DESC                    PIC X(50) VALUE               16430000
155800     '   A C A T   E X C E P T I O N   R E P O R T  '.            16440000
155900     03  FILLER                     PIC X(12) VALUE               16450000
156000     '      DATE  '.                                              16460000
156100     03  TL-DATE                    PIC X(8).                     16470000
156200     03  FILLER                     PIC X(11) VALUE '     PAGE  '.16480000
156300     03  T-PAGE                     PIC ZZ,ZZ9.                   16490000
156400                                                                  16500000
156500 01  HDG1.                                                        16510000
156600     03  FILLER                  PIC X     VALUE ZERO.            16520000
LRM024     03  FILLER                  PIC X(3)  VALUE SPACES.          16530000
156800     03  FILLER                  PIC X(13) VALUE ' CL-BR-ACCT'.   16540000
156900     03  FILLER                  PIC X(3)  VALUE SPACES.          16550000
157000     03  FILLER                  PIC X(9)  VALUE '  CUSIP  '.     16560000
157100     03  FILLER                  PIC X(2)  VALUE SPACES.          16570000
157200     03  FILLER                  PIC X(8)  VALUE ' CONTROL'.      16580000
157300     03  FILLER                  PIC X(2)  VALUE SPACES.          16590000
157400     03  FILLER                  PIC X(3)  VALUE 'S/B'.           16600000
157500     03  FILLER                  PIC X(13) VALUE SPACES.          16610000
157600     03  FILLER                  PIC X(21) VALUE 'DESCRIPTION'.   16620000
157700                                                                  16630000
157800 01  HDG2.                                                        16640000
157900     03  FILLER                  PIC X     VALUE SPACES.          16650000
LRM024     03  FILLER                  PIC X     VALUE SPACES.          16660000
158100     03  FILLER                  PIC X(16) VALUE ALL '-'.         16670000
158200     03  FILLER                  PIC X(2)  VALUE SPACES.          16680000
158300     03  FILLER                  PIC X(9)  VALUE '---------'.     16690000
158400     03  FILLER                  PIC X(2)  VALUE SPACES.          16700000
158500     03  FILLER                  PIC X(8)  VALUE '--------'.      16710000
158600     03  FILLER                  PIC X(2)  VALUE SPACES.          16720000
158700     03  FILLER                  PIC X(3)  VALUE '---'.           16730000
158800     03  FILLER                  PIC X(3)  VALUE SPACES.          16740000
158900     03  FILLER                  PIC X(50)                        16750000
159000         VALUE '-------------------------------------'.           16760000
159100                                                                  16770000
159200 01  DETAIL-LINE-1.                                               16780000
159300     03  FILLER                  PIC X     VALUE ZERO.            16790000
159400     03  FILLER                  PIC X     VALUE SPACES.          16800000
159500     03  DL-CLIENT-NO            PIC XXX.                         16810000
159600     03  FILLER                  PIC X     VALUE '-'.             16820000
159700     03  DL-BRANCH               PIC XXX.                         16830000
159800     03  FILLER                  PIC X     VALUE '-'.             16840000
159900     03  DL-ACCOUNT              PIC X(5).                        16850000
LRM024     03  FILLER                  PIC X     VALUE '-'.             16860000
LRM024     03  DL-ACCOUNT-TYPE         PIC X(1).                        16870000
LRM024     03  DL-ACCOUNT-CKDGT        PIC X(1).                        16880000
160000     03  FILLER                  PIC X(1)  VALUE SPACES.          16890000
160100     03  DL-CUSIP                PIC X(9).                        16900000
160200     03  FILLER                  PIC X(1)  VALUE SPACES.          16910000
160300     03  DL-CONTROL-NBR          PIC X(12).                       16920000
160400     03  FILLER                  PIC X(1)  VALUE SPACES.          16930000
160500     03  DL-STK-BND              PIC X.                           16940000
160600     03  FILLER                  PIC X(1)  VALUE SPACES.          16950000
160700     03  DL-DESCRIPTION          PIC X(76).                       16960000
160800     03  FILLER                  PIC X(1)  VALUE SPACES.          16970000
160900     03  DL-SETTLE-DATE          PIC X(8).                        16980000
161000                                                                  16990000
161100 01  DETAIL-LINE-1A.                                              17000000
161200     05  FILLER                  PIC X(60)  VALUE SPACES.         17010000
LRM024     05  DL-DESCRIPTION-2        PIC X(64).                       17020000
161400                                                                  17030000
161500 01  DETAIL-LINE-2.                                               17040000
161600     03  DL-2-CTL                PIC X     VALUE SPACE.           17050000
LRM024     03  FILLER                  PIC X(41) VALUE SPACE.           17060000
161800     03  DL-ERROR-AREA.                                           17070000
161900         05  FILLER              PIC XXX   VALUE '** '.           17080000
162000         05  DL-ERROR-VALUE      PIC X(15).                       17090000
162100         05  FILLER              PIC XXX   VALUE ' **'.           17100000
162200         05  FILLER              PIC X(3)  VALUE SPACES.          17110000
162300         05  DL-ERROR-MSG        PIC X(25).                       17120000
162400         05  FILLER              PIC XX    VALUE SPACES.          17130000
LRM024 01  DETAIL-LINE-3.                                               17140000
LRM024     03  DL-3-CTL                PIC X     VALUE SPACE.           17150000
LRM024     03  FILLER                  PIC X(03) VALUE SPACE.           17160000
LRM024     03  FILLER                  PIC X(07) VALUE 'CONTRA:'.       17170000
LRM024     03  DL-3-CONTRA             PIC X(04).                       17180000
LRM024     03  FILLER                  PIC X(14) VALUE '   SETTLE LOC:'.17190000
LRM024     03  DL-3-SLOC               PIC X(02).                       17200000
LRM024     03  FILLER                  PIC X(18) VALUE                  17210000
LRM024                                           '   SETTLE LOC RSN:'.  17220000
LRM024     03  DL-3-SLOC-RSN           PIC X(04).                       17230000
LRM024     03  FILLER                  PIC X(12) VALUE '   CURRENCY:'.  17240000
LRM024     03  DL-3-ISO-CRNCY-CD       PIC X(03).                       17250000
LRM024     03  FILLER                  PIC X(15) VALUE                  17260000
LRM024                                           '           QTY:'.     17270000
LRM024     03  DL-3-QTY                PIC ZZZ,ZZZ,ZZZ,ZZZ.9999-.       17280000
LRM024     03  FILLER                  PIC X(07) VALUE                  17290000
LRM024                                           '   AMT:'.             17300000
LRM024     03  DL-3-AMT                PIC ZZZ,ZZZ,ZZZ,ZZZ.99-.         17310000
LRM024 01  DETAIL-LINE-4.                                               17320000
LRM024     03  DL-4-CTL                PIC X     VALUE SPACE.           17330000
LRM024     03  FILLER                  PIC X(03) VALUE SPACE.           17340000
LRM024     03  DL-4-RECORD-TYPE        PIC X(02).                       17350000
LRM024     03  FILLER                  PIC X(06) VALUE ' CMNT:'.        17360000
LRM024     03  DL-4-COMMENT            PIC X(120).                      17370000
162500 01  DETAIL1-RECORD-LAYOUT.                                       17380000
162600                                                                  17390000
162700     03  DET-ERR-1A.                                              17400000
162800                                                                  17401000
162900         05  FILLER                     PIC X(50)  VALUE          17402000
163000         '....5...10....5...20....5...30....5...40....5...50'.    17403000
163100         05  FILLER                     PIC X(50)  VALUE          17404000
163200         '....5...60....5...70....5...80....5...90....5..100'.    17405000
163300         05  FILLER                     PIC X(33)  VALUE SPACES.  17406000
163400                                                                  17407000
163500     03  DET-DATA-1A.                                             17408000
163600                                                                  17409000
163700         05  DETAIL1-1-100               PIC X(100).              17410000
163800         05  FILLER                      PIC X(33).               17420000
163900                                                                  17430000
164000     03  DET-ERR-1B.                                              17440000
164100                                                                  17450000
164200         05  FILLER                     PIC X(33)  VALUE          17460000
164300         '....5..110....5..120....5..130...'.                     17470000
164400         05  FILLER                     PIC X(100) VALUE SPACES.  17480000
164500                                                                  17490000
164600     03  DET-DATA-1B.                                             17500000
164700                                                                  17510000
164800         05  DETAIL1-101-133             PIC X(33).               17520000
164900         05  FILLER                      PIC X(100) VALUE SPACES. 17530000
165000                                                                  17540000
165100 01  DETAIL2-RECORD-LAYOUT.                                       17550000
165200                                                                  17560000
165300     03  DET-ERR-2A.                                              17570000
165400                                                                  17580000
165500         05  FILLER                     PIC X(50)  VALUE          17590000
165600         '....5...10....5...20....5...30....5...40....5...50'.    17600000
165700         05  FILLER                     PIC X(50)  VALUE          17610000
165800         '....5...60....5...70....5...80....5...90....5..100'.    17620000
165900         05  FILLER                     PIC X(33).                17630000
166000                                                                  17640000
166100     03  DET-DATA-2A.                                             17650000
166200                                                                  17651000
166300         05  DETAIL2-1-100              PIC X(100).               17651100
166400         05  FILLER                     PIC X(33).                17651200
166500                                                                  17651300
166600     03  DET-ERR-2B.                                              17651400
166700                                                                  17651500
166800         05  FILLER                     PIC X(33)  VALUE          17651600
166900         '....5..110....5..120....5..130...'.                     17651700
167000         05  FILLER                     PIC X(100) VALUE SPACES.  17651800
167100                                                                  17651900
167200     03  DET-DATA-2B.                                             17652000
167300                                                                  17652100
167400         05  DETAIL2-101-133            PIC X(33).                17652200
167500         05  FILLER                     PIC X(100).               17652300
167600                                                                  17652400
167700 01  DETAIL3-RECORD-LAYOUT.                                       17652500
167800                                                                  17652600
167900     03  DET-ERR-3A.                                              17652700
168000                                                                  17652800
168100         05  FILLER                     PIC X(50)  VALUE          17652900
168200         '....5...10....5...20....5...30....5...40....5...50'.    17653000
168300         05  FILLER                     PIC X(50)  VALUE          17654000
168400         '....5...60....5...70....5...80....5...90....5..100'.    17655000
168500         05  FILLER                     PIC X(33)  VALUE SPACES.  17656000
168600                                                                  17657000
168700     03  DET-DATA-3A.                                             17658000
168800                                                                  17659000
168900         05  DETAIL3-1-100               PIC X(100).              17660000
169000         05  FILLER                      PIC X(33).               17670000
169100                                                                  17680000
169200     03  DET-ERR-3B.                                              17690000
169300                                                                  17700000
169400         05  FILLER                     PIC X(33)  VALUE          17710000
169500         '....5..110....5..120....5..130...'.                     17720000
169600         05  FILLER                     PIC X(100) VALUE SPACES.  17730000
169700                                                                  17740000
169800     03  DET-DATA-3B.                                             17750000
169900                                                                  17760000
170000         05  DETAIL3-101-133            PIC X(33).                17770000
170100         05  FILLER                     PIC X(100) VALUE SPACES.  17780000
170200                                                                  17790000
170300 01  FUND-SERV-TOTAL-LINE.                                        17800000
170400     03  FILLER                     PIC X     VALUE '0'.          17810000
170500     03  FILLER                     PIC X(11) VALUE SPACES.       17820000
170600     03  FILLER                     PIC X(28) VALUE               17830000
170700     'TOTAL FUND/SERV DELIVER     '.                              17840000
170800     03  CTL-FS-DELV                PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      17850000
170900     03  FILLER                     PIC X(10) VALUE SPACES.       17860000
171000     03  FILLER                     PIC X(26) VALUE               17870000
171100     'TOTAL FUND/SERV RECEIVE   '.                                17880000
171200     03  CTL-FS-RECV                PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      17890000
171300                                                                  17900000
171400 01  CLIENT-TOTAL-LINE.                                           17910000
171500     03  FILLER                     PIC X     VALUE '0'.          17920000
171600     03  FILLER                     PIC X(11) VALUE SPACES.       17930000
171700     03  FILLER                     PIC X(28) VALUE               17940000
171800     'TOTAL ACCOUNTS FOR CLIENT   '.                              17950000
171900     03  CTL-ACCOUNTS               PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      17960000
172000     03  FILLER                     PIC X(10) VALUE SPACES.       17970000
172100     03  FILLER                     PIC X(26) VALUE               17980000
172200     'TOTAL ASSETS FOR CLIENT   '.                                17990000
172300     03  CTL-ASSETS                 PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18000000
172400                                                                  18010000
172500 01  CLIENT-P2-COL-HEADER.                                        18020000
172600     03  FILLER              PIC X     VALUE ZERO.                18030000
172700     03  FILLER              PIC X(11) VALUE 'DESTINATION'.       18040000
172800     03  FILLER                  PIC X(15) VALUE SPACES.          18050000
172900     03  FILLER              PIC X(20) VALUE '   DEBIT VALUE'.    18060000
173000     03  FILLER              PIC X(2)  VALUE SPACES.              18070000
173100     03  FILLER              PIC X(20) VALUE '  CREDIT VALUE'.    18080000
173200     03  FILLER              PIC X(2)  VALUE SPACES.              18090000
173300     03  FILLER              PIC X(19) VALUE ' DEBIT QUANTITY'.   18100000
173400     03  FILLER              PIC X(2)  VALUE SPACES.              18110000
173500     03  FILLER              PIC X(19) VALUE ' CREDIT QUANTITY'.  18120000
173600                                                                  18130000
173700 01  CLIENT-P2-TOTAL-LINE.                                        18140000
173800     03  FILLER                     PIC X     VALUE SPACE.        18150000
173900     03  CTL-P2-DEST-LIT            PIC X(08) VALUE SPACES.       18160000
174000     03  CTL-P2-CNS-ACCT            PIC X(15) VALUE SPACES.       18170000
174100     03  FILLER                     PIC X(02) VALUE SPACES.       18180000
174200     03  CTL-P2-DB-VALUE            PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99.     18190000
174300     03  FILLER                     PIC X(2)  VALUE SPACES.       18200000
174400     03  CTL-P2-CR-VALUE            PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99.     18210000
174500     03  FILLER                     PIC X(2)  VALUE SPACES.       18220000
174600     03  CTL-P2-DB-QTY              PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18230000
174700     03  CTL-P2-DB-QTY-FS REDEFINES CTL-P2-DB-QTY                 18240000
174800                                    PIC ZZZZZ,ZZZ,ZZ9.99999.      18250000
174900     03  FILLER                     PIC X(2)  VALUE SPACES.       18260000
175000     03  CTL-P2-CR-QTY              PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18270000
175100     03  CTL-P2-CR-QTY-FS REDEFINES CTL-P2-CR-QTY                 18280000
175200                                    PIC ZZZZZ,ZZZ,ZZ9.99999.      18290000
175300                                                                  18300000
175400 01  CLIENT-P2-TOTAL-LINE-LINE.                                   18310000
175500     03  FILLER                     PIC X     VALUE SPACE.        18320000
175600     03  FILLER                     PIC X(26) VALUE SPACES.       18330000
175700     03  FILLER                     PIC X(20)                     18340000
175800         VALUE '--------------------'.                            18350000
175900     03  FILLER                     PIC X(2)  VALUE SPACES.       18360000
176000     03  FILLER                     PIC X(20)                     18370000
176100         VALUE '--------------------'.                            18380000
176200     03  FILLER                     PIC X(2)  VALUE SPACES.       18390000
176300     03  FILLER                     PIC X(19)                     18400000
176400         VALUE '-------------------'.                             18410000
176500     03  FILLER                     PIC X(2)  VALUE SPACES.       18420000
176600     03  FILLER                     PIC X(19)                     18430000
176700         VALUE '-------------------'.                             18440000
176800                                                                  18450000
176900 01  CLIENT-REC-COL-HEADER.                                       18460000
177000     03  FILLER              PIC X     VALUE '-'.                 18470000
177100     03  FILLER              PIC X(27) VALUE SPACES.              18480000
177200     03  FILLER              PIC X(19) VALUE '  A C A T     '.    18490000
177300     03  FILLER              PIC X(2)  VALUE SPACES.              18500000
177400     03  FILLER              PIC X(19) VALUE '  P E N D     '.    18510000
177500     03  FILLER              PIC X(2)  VALUE SPACES.              18520000
177600     03  FILLER              PIC X(19) VALUE '  T O T A L   '.    18530000
177700                                                                  18540000
177800 01  CLIENT-REC-TOTAL-LINE.                                       18550000
177900     03  FILLER                     PIC X     VALUE SPACE.        18560000
178000     03  CTL-REC-LITERAL            PIC X(20).                    18570000
178100     03  FILLER                     PIC X(2)  VALUE SPACES.       18580000
178200     03  CTL-REC-TOT-ACAT           PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18590000
178300     03  FILLER                     PIC X(2)  VALUE SPACES.       18600000
178400     03  CTL-REC-TOT-PEND           PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18610000
178500     03  FILLER                     PIC X(2)  VALUE SPACES.       18620000
178600     03  CTL-REC-TOT-TOT            PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18630000
178700     03  FILLER                     PIC X(2)  VALUE SPACES.       18640000
178800                                                                  18650000
178900 01  FINAL-TOTAL-LINE.                                            18660000
179000     03  FDL-CTL                    PIC X     VALUE ' '.          18670000
179100     03  FILLER                     PIC X(26) VALUE               18680000
179200     'TOTAL NUMBER OF CLIENTS   '.                                18690000
179300     03  TOT-CLIENTS                PIC Z,ZZ9.                    18700000
179400     03  FILLER                     PIC X(27) VALUE               18710000
179500     '          TOTAL ACCOUNTS   '.                               18720000
179600     03  TOT-ACTS                   PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18730000
179700     03  FILLER                     PIC X(25) VALUE               18740000
179800     '          TOTAL ASSETS   '.                                 18750000
179900     03  TOT-ASSETS                 PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18760000
180000                                                                  18770000
180100/                                                                 18780000
180200 77  B1-SUB                           PIC 9(4)    VALUE 0.        18790000
180300 01  B1-TABLE-AREA.                                               18800000
180400     05  B1-TABLE   OCCURS     500 TIMES                          18810000
180600                   INDEXED BY B1-IND.                             18820000
180700         10  B1-ADP-CL-NO             PIC 9(03).                  18830000
180800         10  FILLER                   PIC X(01).                  18840000
180900         10  B1-SERVICE-STATUS        PIC X(01).                  18850000
181000         10  B1-UPDATE-SMA            PIC X(01).                  18860000
181100         10  B1-CLRNG-NO              PIC X(04).                  18870000
181200         10  B1-OFFSET-ACC-NUM        PIC X(09).                  18880000
181300         10  B1-OFFSET-ROLL-ACC       PIC X(09).                  18890000
181400         10  B1-OPTION-OFFSET-IND     PIC X(01).                  18900000
LRM021         10  B1-OPTION-OFFSET-ACCOUNT PIC X(09).                  18910000
181500         10  B1-ENTRY-CODE-DEL        PIC X(03).                  18920000
181600         10  B1-ENTRY-CODE-REC        PIC X(03).                  18930000
181700         10  B1-ENTRY-DEL-ROLL        PIC X(03).                  18940000
181800         10  B1-ENTRY-REC-ROLL        PIC X(03).                  18950000
LRM013         10  B1-ENTRY-PTR-DEL-ROLL    PIC X(03).                  18960000
LRM013         10  B1-ENTRY-PTR-REC-ROLL    PIC X(03).                  18970000
181900         10  B1-FRAC-QTY-PROC         PIC X(01).                  18980000
182000         10  B1-MISC-IRA-CLIENT       PIC X(01).                  18990000
182100         10  B1-ROLLOVER-CLIENT       PIC X(01).                  19000000
182200         10  B1-BLOTTER-CODE          PIC X(02).                  19010000
182300         10  B1-OFFSET-AMT-BYPASS     PIC X(01).                  19020000
182400         10  B1-FUND-SERV-CLIENT      PIC X(01).                  19030000
182500         10  B1-FAILS-T3-OR-T4        PIC X(01).                  19040000
182600         10  B1-POST-STL-REJ-BKP      PIC X(01).                  19050000
182700****     10  B1-PEND-STL-ACCT         PIC X(09).                  19060000
182800         10  B1-RCV-PEND-STL-ACCT     PIC X(09).                  19070000
182900         10  B1-DEL-PEND-STL-ACCT     PIC X(09).                  19080000
183000         10  B1-PEND-STL-BATCH-CODE   PIC X(03).                  19090000
LRM005         10  B1-SHADOW-POST           PIC X(01).                  19100000
LRM022         10  B1-ACAT-BOOK-DEBIT-BAL-TYPE1 PIC X(01).              19110000
183100         10  B1-MFRS-ACTIVE           PIC X(01).                  19120000
183200         10  B1-MFRS-BB-OFFSET        PIC X(09).                  19130000
183300         10  B1-MFRS-OMNIBUS-OFFSET   PIC X(09).                  19140000
LRM003         10  B1-MFRS-DST-MFE-OFFSET   PIC X(09).                  19150000
183310         10  B1-MFRS-NSCCSRC-OFFSET   PIC X(09).                  19160000
183400         10  B1-MFRS-BN-OFFSET        PIC X(09).                  19170000
LRM029         10  B1-PNC-SURPAS-OFFSET     PIC X(09).                  19180000
LRM052         10  B1-ACAT-CNS-LONG-R-ACCT  PIC X(09).                  19182000
LRM052         10  B1-ACAT-CNS-SHORT-S-ACCT PIC X(09).                  19184000
LRM002         10  B1-MFN-OMNIBUS-MULTI-PLAT-OPT  PIC X(1).             19190000
183500         10  B1-ACAT-P2-TRAILER       PIC X.                      19200000
183600         10  B1-RECV-NON-CASH-TYP     PIC X.                      19210000
183700         10  B1-RES-CREDIT-P2-TRLR    PIC X.                      19220000
183800         10  B1-ENTRY-DEL-CASH        PIC X(03).                  19230000
183900         10  B1-ENTRY-REC-CASH        PIC X(03).                  19240000
184000         10  B1-BEARER-BOND-OPT       PIC X.                      19250000
184100         10  B1-RESTRICTED-OPT        PIC X.                      19260000
184200         10  B1-MFRS-NOLOAD-CLIENT    PIC X.                      19270000
               10  B1-ACAT-MFC-RECEIVER-ACCOUNT   PIC X(9).             19280000
               10  B1-ACAT-MFC-DELIVERER-ACCOUNT  PIC X(9).             19290000
               10  B1-ACAT-DONT-BOOK-MFC-TRANSF   PIC X(1).             19300000
               10  B1-ACAT-MFC-BOOKING-BATCH-ENT.                       19310000
                   15  B1-ACAT-MFC-BOOKING-BATCH  PIC X(2).             19320000
                   15  B1-ACAT-MFC-BOOKING-ENTRE  PIC X(3).             19330000
LRM013         10  B1-ACAT-FRV-TRAILER            PIC X(30).            19340000
LRM013         10  B1-ACAT-RCL-TRAILER            PIC X(30).            19350000
LRM013         10  B1-ACAT-PTR-TRAILER            PIC X(30).            19360000
LRM013         10  B1-ACAT-PTD-TRAILER            PIC X(30).            19370000
LRM025         10  B1-ACAT-PTF-TRAILER            PIC X(30).            19380000
LRM013         10  B1-ACAT-MFC-TRAILER            PIC X(30).            19390000
LRM013         10  B1-ACAT-RCL-BATCH-ENTRY.                             19400000
LRM013             15  B1-ACAT-RCL-BATCH          PIC X(2).             19410000
LRM013             15  B1-ACAT-RCL-ENTRY          PIC X(3).             19420000
LRM013         10  B1-ACAT-PTR-BATCH-ENTRY.                             19430000
LRM013             15  B1-ACAT-PTR-BATCH          PIC X(2).             19440000
LRM013             15  B1-ACAT-PTR-ENTRY          PIC X(3).             19450000
LRM013         10  B1-ACAT-PTD-BATCH-ENTRY.                             19460000
LRM013             15  B1-ACAT-PTD-BATCH          PIC X(2).             19470000
LRM013             15  B1-ACAT-PTD-ENTRY          PIC X(3).             19480000
LRM031         10  B1-ACAT-PTR-BATCH-ENTRY-RECV.                        19490000
LRM031             15  B1-ACAT-PTR-BATCH-RECV     PIC X(2).             19500000
LRM031             15  B1-ACAT-PTR-ENTRY-RECV     PIC X(3).             19510000
LRM031         10  B1-ACAT-PTR-BATCH-ENTRY-DELIV.                       19520000
LRM031             15  B1-ACAT-PTR-BATCH-DELIV    PIC X(2).             19530000
LRM031             15  B1-ACAT-PTR-ENTRY-DELIV    PIC X(3).             19540000
LRM031         10  B1-ACAT-PTD-BATCH-ENTRY-RECV.                        19550000
LRM031             15  B1-ACAT-PTD-BATCH-RECV     PIC X(2).             19560000
LRM031             15  B1-ACAT-PTD-ENTRY-RECV     PIC X(3).             19570000
LRM031         10  B1-ACAT-PTD-BATCH-ENTRY-DELIV.                       19580000
LRM031             15  B1-ACAT-PTD-BATCH-DELIV    PIC X(2).             19590000
LRM031             15  B1-ACAT-PTD-ENTRY-DELIV    PIC X(3).             19600000
LRM025         10  B1-ACAT-PTF-BATCH-ENTRY.                             19610000
LRM025             15  B1-ACAT-PTF-BATCH          PIC X(2).             19620000
LRM025             15  B1-ACAT-PTF-ENTRY          PIC X(3).             19630000
LRM013         10  B1-ACAT-FRV-BATCH-ENTRY.                             19640000
LRM013             15  B1-ACAT-FRV-BATCH          PIC X(2).             19650000
LRM013             15  B1-ACAT-FRV-ENTRY          PIC X(3).             19660000
YH0001         10  B1-NTWRK-CNTL-CD               PIC X.                19670000
YH0001         10  B1-DST-OFFSET                  PIC X.                19680000
YH0001         10  B1-NS-BRCH-OFFSET              PIC X.                19690000
LRM032         10  B1-SFK-RSEC-MEMO               PIC X(2).             19700000
LRM036         10  B1-ACAT-BLOT-CD-OVERD-NO       PIC 9(3) COMP-3.      19700100
LRM036         10  B1-ACAT-BLOT-CD-OVERD-ENTRY   OCCURS 20.             19700200
LRM036             15  B1-ACAT-BLOT-CD-OVERD-LOC-RSN  PIC X(4).         19700300
LRM036             15  B1-ACAT-BLOT-CD-OVERD-CODE     PIC X(2).         19700400
LRM041         10  B1-ACAT-FUNDSERV-PEND-MEMO     PIC X(2).             19700500
YH0001 01  PASS-DATA.                                                   19700600
YH0001     03  PASS-PGM-NAME     PIC X(08)  VALUE 'CAT650'.             19700700
YH0001     03  PASS-MESSAGE      PIC X(45)  VALUE SPACES.               19700800
YH0001 01  PASS-MSG.                                                    19700900
YH0001     05  PASS-TABLE-NAME PIC X(15) VALUE SPACES.                  19701000
YH0001     05  FILLER          PIC X(21) VALUE                          19702000
YH0001                                   ' TABLE IS 85% FULL : '.       19703000
YH0001     05  PASS-COUNTER    PIC Z(09) VALUE ZEROES.                  19704000
YH0001 01  INFSND-MSG-SEND-SW-AREA.                                     19705000
YH0001     03  INFSND-MSG-SEND-SW          PIC X(01) VALUE SPACE.       19706000
YH0001         88  INFSND-MSG-SEND-YES               VALUE 'Y'.         19707000
YH0001 01  MFC-ERR-AREA.                                                19708000
YH0001     05  MFC-MAX   PIC  9(4) COMP-3  VALUE 0.                     19709000
YH0001     05  MFC-ERR   OCCURS 500 TIMES                               19710000
YH0001                   INDEXED BY MFC-IND.                            19720000
YH0001         10  MFC-ERR-LINE1            PIC X(133).                 19730000
YH0001         10  MFC-ERR-LINE1A           PIC X(133).                 19740000
YH0001         10  MFC-ERR-LINE2            PIC X(133).                 19750000
YH0001         10  MFC-ERR-LINE3            PIC X(133).                 19760000
YH0001         10  MFC-ERR-LINE4            PIC X(133).                 19770000
YH0001         10  MFC-ERR-LINE5            PIC X(133).                 19780000
                                                                        19790000
LRM002     COPY NTWIOREC REPLACING ==:NTWIO:== BY ==NTWIO==.            19800000
184950/                                                                 19810000
LRM004     COPY ACATPRTC.                                               19820000
185000/                                                                 19830000
LRM014     COPY ACAT866 REPLACING ==:FMT:== BY ==FMT-ROLL==.            19840000
LRM014/                                                                 19850000
LRM022     COPY ACATCASH REPLACING ==:PFX:== BY ==TYPE2-CASH==.         19860000
LRM022/                                                                 19870000
185100***************************************************************** 19880000
185200 LINKAGE SECTION.                                                 19890000
185300***************************************************************** 19900000
185400 01  PARM-AREA.                                                   19910000
185500     05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        19920000
185600         88  PARM-LENGTH-VALID                    VALUE +16.      19930000
185700     05  PARM-INFO.                                               19940000
185800         10  PARM-STREAM              PIC X(01).                  19950000
185900         10  FILLER                   PIC X(03).                  19960000
186000         10  PARM-CAGE-FILE-HDRS      PIC X(01).                  19970000
186100             88  CAGE-FILE-HDRS                   VALUE 'Y'.      19980000
186200         10  FILLER                   PIC X(01).                  19990000
186300         10  PARM-ABEND-OVERIDE       PIC X(01).                  20000000
186400             88  ABEND-OVERIDE                    VALUE 'Y'.      20010000
186500         10  FILLER                   PIC X(01).                  20020000
186600         10  PARM-RUN-TYPE            PIC X(08).                  20030000
186700             88  PARM-CAGE-RUN                  VALUE 'ACATCAGE'. 20040000
YH0001             88  PARM-INTR-RUN                  VALUE 'ACATINTR'. 20050000
186800             88  PARM-BOOK-RUN                  VALUE 'ACATPEND'. 20060000
186900             88  PARM-MRGN-RUN                  VALUE 'ACATMRGN'. 20070000
LRM005             88  PARM-SHAD-RUN                  VALUE 'ACATSHAD'. 20080000
187000/                                                                 20090000
187100***************************************************************** 20100000
187200 PROCEDURE DIVISION USING PARM-AREA.                              20110000
187300******************************************************************20120000
187400 MAINLINE SECTION.                                                20130000
187500******************************************************************20140000
187600     COPY MSGCOBO.                                                20150000
187700                                                                  20160000
187800     PERFORM  INITIAL-ROUTINE                                     20170000
187900        THRU  INITIAL-ROUTINE-EXIT.                               20180000
188000                                                                  20190000
188100     PERFORM PROCESS-BOTH-FILE                                    20200000
188200         UNTIL END-OF-PEND-FILE                                   20210000
188300           AND END-OF-MPND-FILE.                                  20220000
188400                                                                  20230000
188500** THE FOLLOWING 3 LINES ADDED TO CAUSE LAST CLIENT TO BE ADDED   20240000
188600** TO THE BOOKING RECORD TOTALS AND PRINT THEM OUT.               20250000
188700     IF PREV-ADP-CLIENT NOT ZERO                                  20251000
188800        PERFORM O-CLIENT-BREAK                                    20252000
188900     END-IF.                                                      20253000
189000                                                                  20254000
LRM012     PERFORM PROCESS-POST-SETTLE-FUNDSERV                         20255000
LRM019        UNTIL POST-SETTLE-EOF.                                    20256000
LRM012                                                                  20257000
189100     PERFORM  ENDJOB-ROUTINE                                      20258000
189200        THRU  ENDJOB-ROUTINE-EXIT.                                20259000
189300                                                                  20260000
189400     GOBACK.                                                      20270000
189500/                                                                 20280000
189600*****************                                                 20290000
189700 INITIAL-ROUTINE  SECTION.                                        20300000
189800*****************                                                 20310000
189900                                                                  20320000
190000     DISPLAY ' '.                                                 20330000
190100     DISPLAY '*** ' PGM-NAME ' BEGINNING INITIAL ROUTINE ***'.    20340000
190200                                                                  20350000
190300     PERFORM  INIT-CHECK-PARM.                                    20360000
190400                                                                  20370000
190500     PERFORM  INIT-CLEAR-CNTR-LOOP.                               20380000
190600                                                                  20390000
190700     PERFORM  INIT-B1-LOOP.                                       20400000
190800                                                                  20410000
190900     PERFORM  INIT-OPEN-FILES.                                    20420000
191000                                                                  20430000
191100     PERFORM  LOAD-CATPPL-BROKER-TABLE.                           20440000
191200                                                                  20450000
191300     PERFORM  INIT-READ-INPUT-HDRS.                               20460000
191400                                                                  20470000
191500     PERFORM  INIT-WRITE-OUTPUT-HDRS.                             20480000
191600                                                                  20490000
191700     PERFORM O-CLIENT-BREAK-CLEAR-TOTALS                          20500000
191800         VARYING CL-O-CNTR-X                                      20510000
191900         FROM 1 BY 1                                              20520000
192000         UNTIL   CL-O-CNTR-X IS GREATER THAN NUM-CL-OUT-CNTRS.    20530000
192100                                                                  20540000
192200     DISPLAY '*** ' PGM-NAME ' COMPLETED INITIAL ROUTINE ***'.    20550000
192300                                                                  20560000
192400***********************                                           20570000
192500 INITIAL-ROUTINE-EXIT.  EXIT.                                     20580000
192600***********************                                           20590000
192700/                                                                 20600000
192800******************                                                20610000
192900 INIT-CHECK-PARM.                                                 20620000
193000******************                                                20630000
193100                                                                  20640000
193200     DISPLAY ' '.                                                 20650000
193300     DISPLAY 'PARM LENGTH = ' PARM-LENGTH.                        20660000
193400     DISPLAY 'PARM VALUES = ' PARM-AREA.                          20670000
193500     DISPLAY ' '.                                                 20680000
193600                                                                  20690000
193700     IF  NOT  PARM-LENGTH-VALID                                   20700000
193800         DISPLAY  'INVALID EXEC PARM, MUST BE 16 BYTES LONG'      20710000
193900         CALL ABEND                 USING ABEND-CODE-3000         20720000
194000     END-IF.                                                      20730000
194100                                                                  20740000
194200     IF  PARM-STREAM  NOT >  SPACE                                20750000
194300         DISPLAY 'INVALID EXEC PARM, (&CL) MUST BE NON-SPACE'     20760000
194400         CALL ABEND                 USING ABEND-CODE-3000         20770000
194500     END-IF.                                                      20780000
194600                                                                  20790000
194700     MOVE  'CAT650'                     TO BPDATES-CALLING-PGM.   20800000
194800     MOVE  'C'                          TO BPDATES-REQ-TYPE.      20810000
194900                                                                  20820000
195000     CALL    BPDATES            USING BPDATES-PARAMETERS.         20830000
195100                                                                  20840000
195200     MOVE  +57                     TO  PC-MAX-LINES.              20850000
195300     MOVE  +999                    TO  PC-LINE-CNT.               20860000
195400     MOVE  PGM-NAME                TO  TL-PGM-NAME.               20870000
195500     MOVE  PGM-NAME                TO  TTL-PGM-NAME.              20880000
195600     MOVE  BPD-PROC-DATE (5 : 2)   TO  TTL-DATE (1 : 2).          20890000
195700     MOVE  BPD-PROC-DATE (7 : 2)   TO  TTL-DATE (4 : 2).          20900000
195800     MOVE  BPD-PROC-DATE (3 : 2)   TO  TTL-DATE (7 : 2).          20910000
195900     MOVE  '/'                     TO  TTL-DATE (3 : 1)           20920000
196000                                       TTL-DATE (6 : 1).          20930000
196100     MOVE  BPD-PROC-DATE (3:2)     TO  ROLL-SEC-NO (6:2).         20940000
196200     MOVE  TTL-DATE        TO TL-DATE.                            20950000
196300     MOVE  BPD-PROC-PLUS-ONE-TD   TO WS-TRADE-PLUS-1.             20960000
196400     MOVE  BPD-PROC-PLUS-TWO-TD   TO WS-TRADE-PLUS-2.             20970000
196500                                                                  20980000
196600/                                                                 20990000
196700***********************                                           21000000
196800 INIT-CLEAR-CNTR-LOOP.                                            21010000
196900***********************                                           21020000
197000                                                                  21030000
197100     SET  CNTR-X                      TO  1.                      21040000
197200     PERFORM  UNTIL  CNTR-X  >  NUM-CNTRS                         21050000
197300         MOVE  ZEROS                  TO  CNTR-RECS (CNTR-X)      21060000
197400         SET  CNTR-X  UP BY  1                                    21070000
197500     END-PERFORM.                                                 21080000
197600                                                                  21090000
197700     PERFORM                                                      21100000
197800         VARYING  CL-CNTR-X                                       21110000
197900         FROM  1 BY 1                                             21120000
198000         UNTIL  CL-CNTR-X  >  NUM-CL-IN-CNTRS                     21130000
198100             IF  CL-CNTR-TYPE (CL-CNTR-X)  =  'N'                 21140000
198200                 MOVE  ZERO          TO  CL-CNTR-RECS (CL-CNTR-X) 21150000
198300             END-IF                                               21160000
198400     END-PERFORM.                                                 21170000
198500                                                                  21180000
198600/                                                                 21190000
198700***************                                                   21200000
198800 INIT-B1-LOOP.                                                    21210000
198900***************                                                   21220000
199000                                                                  21230000
199100     DISPLAY ' '.                                                 21240000
199200     DISPLAY  'B1 TABLE VALUES'.                                  21250000
199300     SET  B1-IND                 TO  1.                           21260000
199400     ADD  1                      TO  B1-SUB.                      21270000
199500     PERFORM  UNTIL  B1-SUB  >  500                               21280000
199600                                                                  21290000
199700       SET  B1-IND  TO B1-SUB                                     21300000
199800       MOVE  '0'  TO  B1-SERVICE-STATUS (B1-IND)                  21310000
199900       MOVE  ' '                    TO  BH-BROKER-HEADER-INFO     21320000
200000       MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N        21330000
200100       MOVE  '010'                  TO  BH-LOGICAL-RECORD-CODE    21340000
200200       MOVE  ' '                    TO  BH-B2-INFO-ID             21350000
200300       CALL  GETB1V               USING BH-BROKER-HEADER-INFO     21360000
200400       END-CALL                                                   21370000
200500                                                                  21380000
200600       IF  BH-BROKER-ACTIVE                                       21390000
200700                                                                  21400000
200800         IF  PARM-STREAM  =  BH-BROKER-MINI-MAXI-INDICATOR        21410000
200900             MOVE  ' '                 TO  BH-ICS-INFO            21420000
201000             MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N     21430000
201100             MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE 21440000
201200             MOVE  '434500'            TO  BH-B2-INFO-ID          21450000
201300             CALL  GETB1V            USING BH-BROKER-HEADER-INFO, 21460000
201400                                           BH-ACAT-INFO           21470000
201500             END-CALL                                             21480000
201600             IF  BH-ACAT-ACTIVE                                   21490000
201700                 ADD  1                TO  NUM-ACAT-SYS-CLIENT    21500000
201800                 MOVE  B1-SUB                              TO     21510000
201900                       B1-ADP-CL-NO               (B1-IND)        21520000
202000                 MOVE  BH-ACAT-SERVICE-STATUS              TO     21530000
202100                       B1-SERVICE-STATUS          (B1-IND)        21540000
202200                 MOVE  BH-ACAT-UPDATE-SMA                  TO     21550000
202300                       B1-UPDATE-SMA              (B1-IND)        21560000
202400                 MOVE  BH-ACAT-CLIENT-OFFSET-ACCT          TO     21570000
202500                       B1-OFFSET-ACC-NUM          (B1-IND)        21580000
202600                 MOVE  BH-ACAT-ROLLOVER-OFFSET-ACCT    TO         21590000
202700                       B1-OFFSET-ROLL-ACC         (B1-IND)        21600000
202800                 MOVE  BH-ACAT-ROLLOVER-CLIENT         TO         21610000
202900                       B1-ROLLOVER-CLIENT         (B1-IND)        21620000
203000                 MOVE  BH-ACAT-BLOTTER-CODE-FOR-FAILS      TO     21630000
203100                       B1-BLOTTER-CODE            (B1-IND)        21640000
203200                 MOVE  BH-ACAT-MF-FUND-SERV-CLIENT         TO     21650000
203300                       B1-FUND-SERV-CLIENT        (B1-IND)        21660000
203400                 MOVE  BH-ACAT-ENTRY-CODE-RECV         TO         21670000
203500                       B1-ENTRY-CODE-REC          (B1-IND)        21680000
203600                 MOVE  BH-ACAT-ENTRY-CODE-DELV         TO         21690000
203700                       B1-ENTRY-CODE-DEL          (B1-IND)        21700000
203800                 MOVE  BH-ACAT-ENTRY-CODE-REC-ROLLOVR  TO         21710000
203900                       B1-ENTRY-REC-ROLL          (B1-IND)        21720000
204000                 MOVE  BH-ACAT-ENTRY-CODE-DEL-ROLLOVR  TO         21730000
204100                       B1-ENTRY-DEL-ROLL          (B1-IND)        21740000
LRM013                 MOVE  BH-ACAT-ENTRY-PTR-RECV-ROLLOVR  TO         21750000
LRM013                       B1-ENTRY-PTR-REC-ROLL      (B1-IND)        21760000
LRM013                 MOVE  BH-ACAT-ENTRY-PTR-DELV-ROLLOVR  TO         21770000
LRM013                       B1-ENTRY-PTR-DEL-ROLL      (B1-IND)        21780000
204200                 MOVE  BH-ACAT-FUNDSERV-POST-SD-BKP        TO     21790000
204300                       B1-POST-STL-REJ-BKP        (B1-IND)        21800000
204400                 MOVE  BH-ACAT-MF-DELV-PEND-STL-ACCT       TO     21810000
204500                       B1-DEL-PEND-STL-ACCT       (B1-IND)        21820000
204600                 MOVE  BH-ACAT-MF-RECV-PEND-STL-ACCT       TO     21830000
204700                       B1-RCV-PEND-STL-ACCT       (B1-IND)        21840000
204800                 MOVE  BH-ACAT-MF-PEND-ACT-BATCH-CODE      TO     21850000
204900                       B1-PEND-STL-BATCH-CODE     (B1-IND) (2:2)  21860000
LRM005                 MOVE  BH-ACAT-SHADOW-POST                 TO     21870000
LRM005                       B1-SHADOW-POST             (B1-IND)        21880000
LRM022                 MOVE  BH-ACAT-BOOK-DEBIT-BAL-TYPE1        TO     21890000
LRM022                       B1-ACAT-BOOK-DEBIT-BAL-TYPE1 (B1-IND)      21900000
205000                 IF    BH-ACAT-MF-PEND-ACT-BATCH-CODE  NOT = ' '  21910000
205100                       MOVE  'B'                           TO     21920000
205200                       B1-PEND-STL-BATCH-CODE     (B1-IND) (1:1)  21930000
205300                 ELSE                                             21940000
205400                       MOVE 'BNS'                          TO     21950000
205500                       B1-PEND-STL-BATCH-CODE     (B1-IND)        21960000
205600                 END-IF                                           21970000
205700                 MOVE BH-ACAT-P2-CONTRA-TRAILER   TO              21980000
205800                         B1-ACAT-P2-TRAILER   (B1-IND)            21990000
205900                    MOVE BH-ACAT-BEARER-BOND-OPT     TO           22000000
206000                         B1-BEARER-BOND-OPT   (B1-IND)            22010000
206100                    MOVE BH-ACAT-CASH-ENTRY-CODE-DELV     TO      22020000
206200                         B1-ENTRY-DEL-CASH    (B1-IND)            22030000
206300                    IF   BH-ACAT-CASH-ENTRY-CODE-DELV = SPACES    22040000
206400                       MOVE BH-ACAT-ENTRY-CODE-DELV   TO          22050000
206500                         B1-ENTRY-DEL-CASH    (B1-IND)            22060000
206600                    END-IF                                        22070000
206700                    MOVE BH-ACAT-CASH-ENTRY-CODE-RECV  TO         22080000
206800                         B1-ENTRY-REC-CASH    (B1-IND)            22090000
206900                    IF   BH-ACAT-CASH-ENTRY-CODE-RECV = SPACES    22100000
207000                       MOVE BH-ACAT-ENTRY-CODE-RECV   TO          22110000
207100                         B1-ENTRY-REC-CASH    (B1-IND)            22120000
207200                    END-IF                                        22130000
207300                 MOVE  BH-ACAT-CLIENT-OFFSET-ACCT-OPT  TO         22140000
207400                       B1-OFFSET-AMT-BYPASS       (B1-IND)        22150000
210300                 END-IF                                           22160000
      *** CARD-434641                                                   22170000
                       MOVE BH-ACAT-MFC-RECEIVER-ACCOUNT                22180000
                         TO B1-ACAT-MFC-RECEIVER-ACCOUNT (B1-IND)       22190000
      *** CARD-434642                                                   22200000
                       MOVE BH-ACAT-MFC-DELIVERER-ACCOUNT               22210000
                         TO B1-ACAT-MFC-DELIVERER-ACCOUNT (B1-IND)      22220000
      *** CARD-434669                                                   22230000
                       MOVE BH-ACAT-DONT-BOOK-MFC-TRANSF                22240000
                         TO B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND)       22250000
      *** CARD-434673                                                   22260000
                       MOVE BH-ACAT-MFC-BOOKING-BATCH                   22270000
                         TO B1-ACAT-MFC-BOOKING-BATCH (B1-IND)          22280000
                       MOVE BH-ACAT-MFC-BOOKING-ENTRE                   22290000
                         TO B1-ACAT-MFC-BOOKING-ENTRE (B1-IND)          22300000
LRM013                 MOVE BH-ACAT-RCL-TRAILER                         22310000
LRM013                   TO B1-ACAT-RCL-TRAILER (B1-IND)                22320000
LRM013                 MOVE BH-ACAT-PTR-TRAILER                         22330000
LRM013                   TO B1-ACAT-PTR-TRAILER (B1-IND)                22340000
LRM013                 MOVE BH-ACAT-PTD-TRAILER                         22350000
LRM013                   TO B1-ACAT-PTD-TRAILER (B1-IND)                22360000
LRM025                 MOVE BH-ACAT-PTF-TRAILER                         22370000
LRM025                   TO B1-ACAT-PTF-TRAILER (B1-IND)                22380000
LRM013                 MOVE BH-ACAT-MFC-TRAILER                         22390000
LRM013                   TO B1-ACAT-MFC-TRAILER (B1-IND)                22400000
LRM013                 MOVE BH-ACAT-FRV-TRAILER                         22410000
LRM013                   TO B1-ACAT-FRV-TRAILER (B1-IND)                22420000
LRM013                 IF BH-ACAT-RCL-BATCH-ENTRY > SPACES              22430000
LRM013                    MOVE BH-ACAT-RCL-BATCH                        22440000
LRM013                      TO B1-ACAT-RCL-BATCH (B1-IND)               22450000
LRM013                    MOVE BH-ACAT-RCL-ENTRY                        22460000
LRM013                      TO B1-ACAT-RCL-ENTRY (B1-IND)               22470000
LRM013                 END-IF                                           22480000
LRM013                 IF BH-ACAT-PTR-BATCH-ENTRY > SPACES              22490000
LRM013                    MOVE BH-ACAT-PTR-BATCH                        22500000
LRM013                      TO B1-ACAT-PTR-BATCH (B1-IND)               22510000
LRM013                    MOVE BH-ACAT-PTR-ENTRY                        22520000
LRM013                      TO B1-ACAT-PTR-ENTRY (B1-IND)               22530000
LRM013                 END-IF                                           22540000
LRM013                 IF BH-ACAT-PTD-BATCH-ENTRY > SPACES              22550000
LRM013                    MOVE BH-ACAT-PTD-BATCH                        22560000
LRM013                      TO B1-ACAT-PTD-BATCH (B1-IND)               22570000
LRM013                    MOVE BH-ACAT-PTD-ENTRY                        22580000
LRM013                      TO B1-ACAT-PTD-ENTRY (B1-IND)               22590000
LRM013                 END-IF                                           22600000
LRM031                 MOVE BH-ACAT-PTR-BATCH-ENTRY-RECV                22610000
LRM031                      TO B1-ACAT-PTR-BATCH-ENTRY-RECV (B1-IND)    22620000
LRM031                 MOVE BH-ACAT-PTR-BATCH-ENTRY-DELIV               22630000
LRM031                      TO B1-ACAT-PTR-BATCH-ENTRY-DELIV(B1-IND)    22640000
LRM031                 MOVE BH-ACAT-PTD-BATCH-ENTRY-RECV                22650000
LRM031                      TO B1-ACAT-PTD-BATCH-ENTRY-RECV (B1-IND)    22660000
LRM031                 MOVE BH-ACAT-PTD-BATCH-ENTRY-DELIV               22670000
LRM031                      TO B1-ACAT-PTD-BATCH-ENTRY-DELIV(B1-IND)    22680000
LRM025                 IF BH-ACAT-PTF-BATCH-ENTRY > SPACES              22690000
LRM025                    MOVE BH-ACAT-PTF-BATCH-CODE                   22700000
LRM025                      TO B1-ACAT-PTF-BATCH (B1-IND)               22710000
LRM025                    MOVE BH-ACAT-PTF-ENTRY-CODE                   22720000
LRM025                      TO B1-ACAT-PTF-ENTRY (B1-IND)               22730000
LRM025                 END-IF                                           22731000
LRM013                 IF BH-ACAT-FRV-BATCH-ENTRY > SPACES              22732000
LRM013                    MOVE BH-ACAT-FRV-BATCH                        22733000
LRM013                      TO B1-ACAT-FRV-BATCH (B1-IND)               22734000
LRM013                    MOVE BH-ACAT-FRV-ENTRY                        22735000
LRM013                      TO B1-ACAT-FRV-ENTRY (B1-IND)               22736000
LRM013                 END-IF                                           22737000
LRM012                 IF B1-SUB = 235                                  22738000
LRM012                    PERFORM SAVE-WM-ACCOUNT-RTN                   22739000
LRM012                 END-IF                                           22740000
LRM021                 MOVE BH-ACAT-OPTION-OFFSET-ACCOUNT               22750000
LRM021                      TO B1-OPTION-OFFSET-ACCOUNT (B1-IND)        22751000
YH0001                 MOVE SPACE          TO                           22752000
YH0001                           B1-NTWRK-CNTL-CD   (B1-IND)            22753000
YH0001                           B1-DST-OFFSET      (B1-IND)            22754000
YH0001                           B1-NS-BRCH-OFFSET  (B1-IND)            22755000
LRM032                 MOVE BH-ACAT-SFK-RSEC-MEMO                       22756000
LRM032                        TO B1-SFK-RSEC-MEMO   (B1-IND)            22757000
LRM036** CARD-434761                                                    22758000
LRM036                 MOVE BH-ACAT-BLOT-CD-OVERD-NO                    22759000
LRM036                   TO B1-ACAT-BLOT-CD-OVERD-NO (B1-IND)           22760000
LRM036                 PERFORM VARYING SUB FROM 1 BY 1                  22761000
LRM036                             UNTIL SUB > 20                       22762000
LRM036                   MOVE BH-ACAT-BLOT-CD-OVERD-ENTRY(SUB)          22763000
LRM036                     TO B1-ACAT-BLOT-CD-OVERD-ENTRY(B1-SUB, SUB)  22764000
LRM036                 END-PERFORM                                      22765000
LRM041                 MOVE BH-ACAT-FUNDSERV-PEND-MEMO                  22766000
LRM041                   TO B1-ACAT-FUNDSERV-PEND-MEMO  (B1-IND)        22766100
LRM052                 MOVE  BH-ACAT-CNS-LONG-R-ACCT                    22766200
LRM052                   TO B1-ACAT-CNS-LONG-R-ACCT  (B1-IND)           22766300
LRM052                 MOVE  BH-ACAT-CNS-SHORT-S-ACCT                   22766400
LRM052                   TO B1-ACAT-CNS-SHORT-S-ACCT (B1-IND)           22766500
210400                                                                  22766600
210500             MOVE  '501000'            TO  BH-B2-INFO-ID          22766700
210600             CALL  GETB1V            USING BH-BROKER-HEADER-INFO, 22766800
210700                                           BH-ICS-INFO            22766900
210800             END-CALL                                             22767000
210900             IF  BH-ICS-ACTIVE                                    22767100
211000                                                                  22767200
211100             IF  BH-ICS-ACAT-DATA-EXTRACT  NOT =  '0'             22767300
211200                 MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)  TO     22767400
211300                       B1-CLRNG-NO                (B1-IND)        22768000
211400                 MOVE  BH-BTS-ACAT-SETUP-FUNDSER-FAIL      TO     22769000
211500                       B1-FAILS-T3-OR-T4          (B1-IND)        22770000
211600                                                                  22780000
211700                 MOVE  ' '             TO  BH-P1-INFO             22790000
211800                 MOVE  B1-SUB          TO  BH-BROKER-NUMBER-N     22800000
211900                 MOVE  '103'           TO  BH-LOGICAL-RECORD-CODE 22810000
212000                 MOVE  ' '             TO  BH-B2-INFO-ID          22820000
212100                 CALL  GETB1V        USING BH-BROKER-HEADER-INFO, 22830000
212200                                           BH-P1-INFO             22840000
212300                 END-CALL                                         22850000
212400                 IF  BH-P1-BROKER-STATUS  =  'A'                  22860000
212500                     MOVE  BH-P2-OPTION-B                  TO     22870000
212600                           B1-OPTION-OFFSET-IND   (B1-IND)        22880000
212700                 END-IF                                           22890000
212800                                                                  22900000
212900                 MOVE  ' '             TO  BH-MISC-INFO           22910000
213000                 MOVE  B1-SUB          TO  BH-BROKER-NUMBER-N     22920000
213100                 MOVE  '008'           TO  BH-LOGICAL-RECORD-CODE 22930000
213200                 MOVE  ' '             TO  BH-B2-INFO-ID          22940000
213300                 CALL  GETB1V        USING BH-BROKER-HEADER-INFO, 22950000
213400                                           BH-MISC-INFO           22960000
213500                 END-CALL                                         22970000
213600                 IF  BH-MISC-ACTIVE                               22980000
213700                     MOVE  BH-MISC-FRACT-QTY               TO     22990000
213800                           B1-FRAC-QTY-PROC       (B1-IND)        23000000
213900                     MOVE  BH-MISC-IRA-CLIENT              TO     23010000
214000                           B1-MISC-IRA-CLIENT     (B1-IND)        23020000
214100                 END-IF                                           23030000
214200                                                                  23040000
214300                 MOVE  ' '             TO  BH-MF-INFO             23050000
214400                 MOVE  B1-SUB          TO  BH-BROKER-NUMBER-N     23060000
214500                 MOVE  '015'           TO  BH-LOGICAL-RECORD-CODE 23070000
214600                 MOVE  '537000'        TO  BH-B2-INFO-ID          23080000
214700                 CALL  GETB1V        USING BH-BROKER-HEADER-INFO, 23090000
214800                                           BH-MF-INFO             23100000
214900                 END-CALL                                         23110000
215000                 IF  BH-MF-STATUS  =  'A'                         23120000
215100                     MOVE  BH-MF-STATUS                   TO      23130000
215200                           B1-MFRS-ACTIVE         (B1-IND)        23140000
215300*** 537323           MOVE  BH-MF-FIRM-NA-BOOK-SHR-CTL      TO     23150000
215400                     MOVE  BH-MF-OMNIBUS-SHARE-BOX-ACT  TO        23160000
215500                           B1-MFRS-OMNIBUS-OFFSET      (B1-IND)   23170000
215501                     IF  BH-MFN-STATUS  =  'A'                    23180000
215510                       MOVE  BH-MFN-OMNIBUS-NSCC-BOX-ACCT  TO     23190000
215520                           B1-MFRS-NSCCSRC-OFFSET      (B1-IND)   23200000
LRM003                       MOVE  BH-MFN-DST-MFE-NSCC-BOX-ACCT  TO     23210000
LRM003                           B1-MFRS-DST-MFE-OFFSET      (B1-IND)   23220000
215530                     END-IF                                       23230000
215600                     MOVE  BH-MF-FIRM-NA-BOOK-SHR-CTL-ACT  TO     23240000
215700                           B1-MFRS-BB-OFFSET      (B1-IND)        23250000
215800*** 537324           MOVE  BH-MF-BKR-NOM-BOOK-SHR-CTL      TO     23260000
215900                     MOVE  BH-MF-BKR-NOMINEE-BOOK-SHR-CTL  TO     23270000
216000                           B1-MFRS-BN-OFFSET      (B1-IND)        23280000
LRM002                     MOVE  BH-MFN-OMNIBUS-MULTI-PLAT-OPT   TO     23290000
LRM002                           B1-MFN-OMNIBUS-MULTI-PLAT-OPT (B1-IND) 23300000
YH0001                     MOVE  BH-ACAT-MF-REG-NETWRK-CTRL-IND  TO     23310000
YH0001                           B1-NTWRK-CNTL-CD              (B1-IND) 23320000
YH0001                     IF BH-MFN-OMNIBUS-NSCC-BOX-ACCT NOT = SPACE  23330000
YH0001                        MOVE  'Y'   TO B1-NS-BRCH-OFFSET (B1-IND) 23340000
YH0001                     END-IF                                       23350000
YH0001                     IF BH-MFN-DST-MFE-NSCC-BOX-ACCT NOT = SPACE  23360000
YH0001                        MOVE  'Y'   TO B1-DST-OFFSET     (B1-IND) 23370000
YH0001                     END-IF                                       23380000
216100                 END-IF                                           23390000
216200                                                                  23400000
216300                 MOVE  ' '             TO  BH-MF3-INFO            23410000
216400                 MOVE  B1-SUB          TO  BH-BROKER-NUMBER-N     23420000
216500                 MOVE  '015'           TO  BH-LOGICAL-RECORD-CODE 23430000
216600                 MOVE  '540000'        TO  BH-B2-INFO-ID          23440000
216700                 CALL  GETB1V        USING BH-BROKER-HEADER-INFO, 23450000
216800                                           BH-MF3-INFO            23460000
216900                 END-CALL                                         23470000
217000                 IF  BH-MF3-STATUS  =  'A'                        23480000
217100**** TEMPORARY HARDCODE FOR MISSING B1 540113 OPTION *********    23490000
217200                   IF B1-SUB = 30                                 23500000
217300                     MOVE '1'                             TO      23510000
217400                           B1-MFRS-NOLOAD-CLIENT  (B1-IND)        23520000
217500                   ELSE                                           23530000
217600                     MOVE '0'                             TO      23540000
217700                           B1-MFRS-NOLOAD-CLIENT  (B1-IND)        23550000
217800                   END-IF                                         23560000
LRM029                   MOVE BH-MF3-PNC-SURPAS-BOX-ACCOUNT     TO      23570000
LRM029                           B1-PNC-SURPAS-OFFSET   (B1-IND)        23580000
LRM029                 ELSE                                             23590000
LRM029                   MOVE SPACES                            TO      23600000
LRM029                           B1-PNC-SURPAS-OFFSET   (B1-IND)        23610000
217900                 END-IF                                           23620000
218000                                                                  23630000
218100                 MOVE  ' '             TO  BH-BTS2-INFO           23640000
218200                 MOVE  B1-SUB          TO  BH-BROKER-NUMBER-N     23650000
218300                 MOVE  '015'           TO  BH-LOGICAL-RECORD-CODE 23660000
218400                 MOVE  '511000'        TO  BH-B2-INFO-ID          23670000
218500                 CALL  GETB1V        USING BH-BROKER-HEADER-INFO, 23680000
218600                                           BH-BTS2-INFO           23690000
218700                                                                  23700000
218800                 IF BH-BTS2-ACTIVE                                23710000
218900                                                                  23720000
219000                    MOVE '0'                             TO       23730000
219100                         B1-RESTRICTED-OPT   (B1-IND)             23740000
219200                                                                  23750000
219300                    MOVE '0'                              TO      23760000
219400                         B1-RECV-NON-CASH-TYP (B1-IND)            23770000
219500                                                                  23780000
219600                    MOVE BH-BTS2-ACAT-P2-RES-CREDIT-TRL   TO      23790000
219700                         B1-RES-CREDIT-P2-TRLR(B1-IND)            23800000
219800                                                                  23810000
219900                 END-IF                                           23820000
220000****             DISPLAY  B1-TABLE (B1-IND)                       23830000
220100               END-IF                                             23840000
220300             END-IF                                               23850000
220400           END-IF                                                 23860000
220500         END-IF                                                   23870000
220600         ADD  1                      TO  B1-SUB                   23880000
220700     END-PERFORM.                                                 23890000
220800     DISPLAY ' '.                                                 23900000
220900     IF  NUM-ACAT-SYS-CLIENT  =  0                                23910000
221000         DISPLAY  'ZERO (&CL) STREAM CLIENTS ARE B1-ACAT CLIENTS' 23920000
221100         DISPLAY  'INPUT ACAT & OLDPEND FILES WILL BE BYPASSED'   23930000
221200     END-IF.                                                      23940000
221300                                                                  23950000
LRM012 SAVE-WM-ACCOUNT-RTN.                                             23960000
LRM012     PERFORM VARYING WM-SUB FROM 1 BY 1                           23970000
LRM012        UNTIL WM-SUB > BH-ACAT-WM-OMNI-BOOKING-NO                 23980000
LRM012        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'INCMPY'       23990000
LRM012           MOVE BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              24000000
LRM012                          TO WM-INTER-COMPANY-ACCOUNT             24010000
LRM012           DISPLAY 'CL235 INNER CMPY AC ' WM-INTER-COMPANY-ACCOUNT24020000
LRM012            ' ' BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB)             24030000
LRM012        ELSE                                                      24040000
LRM012        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'PEND  '       24050000
LRM012           MOVE BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              24060000
LRM012                          TO WM-PENDING-ACCOUNT                   24070000
LRM012           DISPLAY 'WM235 PENDING ACCOUNT ' WM-PENDING-ACCOUNT    24080000
LRM012        END-IF END-IF                                             24090000
LRM012     END-PERFORM.                                                 24100000
                                                                        24110000
221400     EJECT                                                        24120000
221500******************                                                24130000
221600 INIT-OPEN-FILES.                                                 24140000
221700******************                                                24150000
221800                                                                  24160000
221900     OPEN  INPUT  PEND-FILE  MFPEND-FILE.                         24170000
222000     IF  NOT  PEND-OPEN-OK                                        24180000
222100         DISPLAY  'OLDPEND FILE OPEN ERROR, STATUS = '            24190000
222200                   PEND-FILE-STATUS                               24200000
222300     END-IF.                                                      24210000
222400                                                                  24220000
222500     OPEN  INPUT  NTWREG-FILE.                                    24230000
222600     OPEN  INPUT  MEMO-FILE.                                      24240000
222700     IF  NOT  MEMO-OPEN-OK                                        24250000
222800         DISPLAY  'MEMO FILE OPEN ERROR, STATUS = '               24260000
222900                   MEMO-FILE-STATUS                               24270000
223000     END-IF.                                                      24280000
223100                                                                  24290000
223200     OPEN  INPUT  PRNG-FILE.                                      24300000
223300     IF  NOT  PRNG-OPEN-OK                                        24310000
223400         DISPLAY  'PRNG FILE OPEN ERROR, STATUS = '               24320000
223500                   PRNG-FILE-STATUS                               24330000
223600     END-IF.                                                      24340000
223700                                                                  24350000
223800     OPEN  INPUT  BROKER-FILE.                                    24360000
223900     IF  NOT  BROKER-OPEN-OK                                      24370000
224000         DISPLAY  'BROKER FILE OPEN ERROR, STATUS = '             24380000
224100                   BROKER-FILE-STATUS                             24390000
224200     END-IF.                                                      24400000
224300     OPEN INPUT  ACATS-PARTICIPANT-FILE                           24410000
LRM012     OPEN INPUT  POST-SETTLE-FILE                                 24420000
224400                                                                  24430000
224500     OPEN  OUTPUT  P2BKPG-FILE.                                   24440000
224600     IF  NOT  P2BKPG-OPEN-OK                                      24450000
224700         DISPLAY  'P2BKPG FILE OPEN ERROR, STATUS = '             24460000
224800                   P2BKPG-FILE-STATUS                             24470000
224900     END-IF.                                                      24480000
225000                                                                  24490000
225100     OPEN  OUTPUT  T3RDFL-FILE.                                   24500000
225200     IF  NOT  T3RDFL-OPEN-OK                                      24510000
225300         DISPLAY  'T3RDFL FILE OPEN ERROR, STATUS = '             24520000
225400                   T3RDFL-FILE-STATUS                             24530000
225500     END-IF.                                                      24540000
225600                                                                  24550000
225700     OPEN  OUTPUT  CAG2FL-FILE.                                   24560000
225800     IF  NOT  CAG2FL-OPEN-OK                                      24570000
225900         DISPLAY  'CAG2FL FILE OPEN ERROR, STATUS = '             24580000
226000                   CAG2FL-FILE-STATUS                             24590000
226100     END-IF.                                                      24600000
226200                                                                  24610000
226300     OPEN OUTPUT  CAGE-CAT13-FILE.                                24620000
226400                                                                  24630000
226500     OPEN  OUTPUT  XSTLPI-FILE.                                   24640000
226600     IF  NOT  XSTLPI-OPEN-OK                                      24650000
226700         DISPLAY  'XSTLPI FILE OPEN ERROR, STATUS = '             24660000
226800                   XSTLPI-FILE-STATUS                             24670000
226900     END-IF.                                                      24680000
227000                                                                  24690000
227100     MOVE  'O'                        TO  GETNA-REQ-FUNC.         24700000
227200     MOVE  'R'                        TO  GETNA-REQ-FILE.         24710000
227300     MOVE  'R'                        TO  GETNA-REQ-FUNC2.        24720000
227400     MOVE  'N'                        TO  GETNA-REQ-YEAREND.      24730000
227500     MOVE  PGM-NAME                   TO  GETNA-PGM-NAME.         24740000
227600     CALL    GETNA               USING GETNA-PARAMETERS           24750000
227700                                       GETNA-SEGMENT-INCLUDES     24760000
227800     END-CALL.                                                    24770000
227900     IF  GETNA-RETURN-FOUND                                       24780000
228000         MOVE  'R'                    TO  GETNA-REQ-FUNC          24790000
228100         MOVE  SPACES                 TO  GETNA-KEY               24800000
228200     ELSE                                                         24810000
228300         DISPLAY 'NAFILE A/I OPEN ERROR, GETNA RC = '             24820000
228400                  GETNA-RETURN-CODE                               24830000
228500     END-IF.                                                      24840000
228600                                                                  24850000
228700     IF  PEND-OPEN-OK AND                                         24860000
228800         MEMO-OPEN-OK     AND                                     24870000
228900         PRNG-OPEN-OK     AND                                     24880000
229000         BROKER-OPEN-OK   AND                                     24890000
229100         P2BKPG-OPEN-OK   AND                                     24900000
229200         T3RDFL-OPEN-OK   AND                                     24910000
229300         CAG2FL-OPEN-OK   AND                                     24920000
229400         XSTLPI-OPEN-OK   AND                                     24930000
229500         GETNA-RETURN-FOUND  CONTINUE                             24940000
229600     ELSE                                                         24950000
229700         CALL ABEND                 USING ABEND-CODE-4000         24960000
229800     END-IF.                                                      24970000
LRM002     MOVE  SPACES      TO NTWIO-PARAMETERS.                       24980000
LRM002     MOVE  'CAT650'    TO NTWIO-PGM-NAME.                         24990000
LRM002     MOVE  'O'         TO NTWIO-FUNCTION-CODE.                    25000000
LRM002     MOVE  'ALL'       TO NTWIO-REQUEST-TYPE.                     25010000
LRM002     CALL  BNWNTWIO USING NTWIO-PARAMETERS.                       25020000
229900                                                                  25030000
LRM009     OPEN OUTPUT FUNDSERV-EXTR-FILE.                              25040000
LRM014     OPEN OUTPUT ROLLOVER-866-EXTR.                               25050000
LRM022     OPEN OUTPUT TYPE2-CASH-EXTR.                                 25060000
230000     EJECT                                                        25070000
230100***********************                                           25080000
230200 INIT-READ-INPUT-HDRS.                                            25090000
230300***********************                                           25100000
230400     PERFORM  O-READ-PEND-FILE.                                   25110000
230500                                                                  25120000
YH0001     IF  END-OF-PEND-FILE  AND NOT PARM-INTR-RUN                  25130000
230700           DISPLAY 'ACATPEND FILE HAS ZERO RECORDS'               25140000
230800           CALL ABEND                 USING ABEND-CODE-4000       25150000
230900     END-IF                                                       25160000
231000     IF  NOT PEND-HEADER-ID                                       25170000
231100           DISPLAY 'ACATPEND FILE HEADER MISSING'                 25180000
231200           CALL ABEND                 USING ABEND-CODE-4000       25190000
231300     END-IF.                                                      25200000
231400     MOVE PEND-HEADER-RECORD TO FMT-HEADER-RECORD.                25210000
231500     DISPLAY 'PROCESS DATE  = ' BPD-PROC-DATE.                    25220000
231600     DISPLAY 'BOOKING DATE  = ' FMT-BOOK-DATE.                    25230000
231700     IF PARM-MRGN-RUN                                             25240000
231800        DISPLAY 'PARM HAS MRGN RUN'                               25250000
231900     ELSE                                                         25260000
232000     IF PARM-CAGE-RUN                                             25270000
232010        DISPLAY 'PARM HAS CAGE RUN'                               25280000
232020     ELSE                                                         25290000
LRM005     IF PARM-SHAD-RUN                                             25300000
LRM005        DISPLAY 'PARM HAS SHADOW RUN'                             25310000
YH0001     ELSE                                                         25320000
YH0001     IF PARM-INTR-RUN                                             25330000
LRM005        DISPLAY 'PARM HAS CAGE INTRA DAY RUN'                     25340000
LRM005     ELSE                                                         25350000
232030        DISPLAY 'PARM HAS BOOKING RUN'                            25360000
232040        MOVE '    A C A T   B O O K I N G   T O T A L S     '     25370000
232050             TO TTL-DESC                                          25380000
232060     END-IF.                                                      25390000
232070     MOVE BPD-PROC-DATE TO ACAT-PROC-DATE.                        25400000
232080     DISPLAY 'CAGE DATE  = ' WS-TRADE-PLUS-1.                     25410000
232090     DISPLAY '             ' WS-TRADE-PLUS-2.                     25420000
232100                                                                  25430000
YH0001     IF PARM-INTR-RUN                                             25440000
YH0001        MOVE 'Y' TO END-OF-PEND-FILE-SWITCH                       25450000
YH0001        MOVE ALL '9' TO PEND-TI-ADP-CL-NO-X                       25460000
YH0001     ELSE                                                         25470000
YH0001        PERFORM O-READ-PEND-FILE                                  25480000
           END-IF                                                       25490000
                                                                        25500000
232300     PERFORM O-READ-MPND-FILE.                                    25510000
232400                                                                  25520000
YH0001     IF PARM-CAGE-RUN                                             25530000
YH0001        MOVE 'Y' TO END-OF-MPND-FILE-SWITCH                       25540000
YH0001        MOVE ALL '9' TO MPND-TI-ADP-CL-NO-X                       25550000
YH0001     END-IF.                                                      25560000
232400                                                                  25570000
232500     EJECT                                                        25580000
232600*************************                                         25590000
232700 INIT-WRITE-OUTPUT-HDRS.                                          25600000
232800*************************                                         25610000
232900     MOVE  SPACES                     TO  P2BKPG-RECORD.          25620000
233000     MOVE  'DATE='                    TO  P2BKPG-RECORD (1:5).    25630000
233100     MOVE  ACAT-PROC-DATE (5:4)       TO  P2BKPG-RECORD (6:4).    25640000
233200     MOVE  ACAT-PROC-DATE (3:2)       TO  P2BKPG-RECORD (10:2).   25650000
233300     WRITE  P2BKPG-RECORD.                                        25660000
233400     IF  NOT  P2BKPG-FILE-OK                                      25670000
233500         DISPLAY  'P2BKPG FILE WRITE HEADER ERROR, STATUS = '     25680000
233600                   P2BKPG-FILE-STATUS                             25690000
233700         CALL ABEND            USING ABEND-CODE-4000              25700000
233800     END-IF.                                                      25710000
233900                                                                  25720000
234000                                                                  25730000
234100     IF  CAGE-FILE-HDRS                                           25740000
234200         MOVE  SPACES                 TO  CAGE-03-DETAIL-AREA     25750000
234300         SET CAGE-03-HDR-DATE-LITERAL TO TRUE                     25760000
234400         MOVE BPD-PROC-DATE           TO  CAGE-03-HDR-PROC-DATE   25770000
234500         WRITE  T3RDFL-RECORD FROM CAGE-03-HEADER-AREA            25780000
234600         IF  NOT  T3RDFL-FILE-OK                                  25790000
234700             DISPLAY  'T3RDFL FILE WRITE HEADER ERROR, STATUS = ' 25800000
234800                       T3RDFL-FILE-STATUS                         25810000
234900             CALL ABEND            USING  ABEND-CODE-4000         25820000
235000         END-IF                                                   25830000
235100                                                                  25840000
235200         MOVE  SPACES                 TO  CAGE-RECORD             25850000
235300         SET CAGE-HDR-DATE-LITERAL TO TRUE                        25860000
235400         MOVE  BPD-PROC-DATE          TO  CAGE-HDR-PROC-DATE      25870000
235500         WRITE  CAG2FL-RECORD FROM CAGE-HEADER-AREA               25880000
235600         IF  NOT  CAG2FL-FILE-OK                                  25890000
235700             DISPLAY  'CAG2FL FILE WRITE HEADER ERROR, STATUS = ' 25900000
235800                       CAG2FL-FILE-STATUS                         25910000
235900             CALL ABEND            USING  ABEND-CODE-4000         25920000
236000         END-IF                                                   25930000
236100     END-IF.                                                      25940000
236200                                                                  25950000
236300                                                                  25960000
236400     MOVE SPACES TO CAT13-RECORD.                                 25970000
236500                                                                  25980000
236600     SET CAT13-HDR-DATE-LITERAL  TO TRUE.                         25990000
236700     MOVE BPD-PROC-DATE TO CAT13-HDR-PROC-DATE.                   26000000
236800     WRITE CAT13-RECORD.                                          26010000
236900                                                                  26020000
LRM009     MOVE SPACES TO OFUND-HEADER-RECORD.                          26030000
LRM009     SET OFUND-HEADER-ID  TO TRUE.                                26040000
LRM009     SET OFUND-HEADER-LIT1 TO TRUE.                               26050000
LRM009     SET OFUND-HEADER-LIT2 TO TRUE.                               26060000
LRM009     SET OFUND-HEADER-LIT3 TO TRUE.                               26070000
LRM009     MOVE ACAT-PROC-DATE  TO  OFUND-BOOK-DATE                     26080000
LRM009     MOVE WS-TRADE-PLUS-1 TO  OFUND-CAGE-DATE                     26090000
LRM009     WRITE OFUND-HEADER-RECORD.                                   26100000
LRM014     MOVE  SPACES                     TO  ROLL866-RECORD          26110000
LRM014     MOVE  'DATE='                    TO  ROLL866-RECORD (1:5).   26120000
LRM014     MOVE  ACAT-PROC-DATE (5:4)       TO  ROLL866-RECORD (6:4).   26130000
LRM014     MOVE  ACAT-PROC-DATE (3:2)       TO  ROLL866-RECORD (10:2).  26140000
LRM014     WRITE ROLL866-RECORD.                                        26150000
LRM022     MOVE  SPACES                 TO  TYPE2-CASH-RECORD           26160000
LRM022     MOVE  'DATE='                TO  TYPE2-CASH-RECORD (1:5).    26170000
LRM022     MOVE  ACAT-PROC-DATE (5:4)   TO  TYPE2-CASH-RECORD (6:4).    26180000
LRM022     MOVE  ACAT-PROC-DATE (3:2)   TO  TYPE2-CASH-RECORD (10:2).   26190000
LRM022     WRITE TYPE2-CASH-RECORD.                                     26200000
237000 LOAD-CATPPL-BROKER-TABLE.                                        26210000
237100     PERFORM UNTIL CATPPL-BROKER-EOF                              26220000
237200                 OR WS-CATPPL-RECORD-COUNT GREATER 499            26230000
237300        READ ACATS-PARTICIPANT-FILE                               26240000
                     INTO WS-ACAT-PARTICIPANT-RECORD                    26250000
237400           AT END                                                 26260000
237500              SET CATPPL-BROKER-EOF TO TRUE                       26270000
237600           NOT AT END                                             26280000
237610              ADD 1 TO WS-CATPPL-RECORD-COUNT                     26290000
237620              MOVE WS-PRTCP-NBR TO                                26300000
153410                    WS-CATPPL-BROKER(WS-CATPPL-RECORD-COUNT)      26310000
                    MOVE WS-PRTCP-NM TO                                 26320000
153430                    WS-CATPPL-BROKER-NAME(WS-CATPPL-RECORD-COUNT) 26330000
237640        END-READ                                                  26340000
237650     END-PERFORM.                                                 26350000
237660     IF NOT CATPPL-BROKER-EOF                                     26360000
237670        DISPLAY 'TABLE OVERFLOW ON CATPPL BROKER'                 26370000
237680        MOVE 'NEED TABLE EXPANSION' TO INFSND-MSG                 26380000
237681        CALL  INFSND  USING INFSND-DATA                           26390000
237682     ELSE                                                         26400000
237683        IF WS-CATPPL-RECORD-COUNT > 450                           26410000
237684          MOVE 'MAY NEED EXPANSION SOON BROKER' TO INFSND-MSG     26420000
237685          CALL  INFSND  USING INFSND-DATA                         26430000
237686     END-IF.                                                      26440000
237687     EJECT                                                        26450000
237688 PROCESS-BOTH-FILE.                                               26460000
237689                                                                  26470000
237690     PERFORM                                                      26480000
237700         UNTIL PEND-TI-ADP-CL-NO-X > MPND-TI-ADP-CL-NO-X          26490000
237800            OR END-OF-PEND-FILE                                   26500000
237900         MOVE 'P' TO RECORD-FROM-SWITCH                           26510000
238000         IF  PEND-TI-RECORD-ID                                    26520000
238100           MOVE PEND-TI-RECORD      TO FMT-TI-RECORD              26530000
238200           SET NEW-TI TO TRUE                                     26540000
238300         ELSE                                                     26550000
238400           MOVE PEND-AT-RECORD      TO FMT-AT-RECORD              26560000
238500           SET NEW-AT TO TRUE                                     26561000
238600           PERFORM PROCESS-PEND-FILE                              26562000
LRM012              THRU PROCESS-PEND-EXIT                              26563000
238700         END-IF                                                   26564000
238800         PERFORM O-READ-PEND-FILE                                 26565000
238900     END-PERFORM.                                                 26565100
239000                                                                  26565200
239100     PERFORM                                                      26565300
239200         UNTIL MPND-TI-ADP-CL-NO-X NOT < PEND-TI-ADP-CL-NO-X      26565400
239300            OR END-OF-MPND-FILE                                   26565500
239400         MOVE 'M' TO RECORD-FROM-SWITCH                           26565600
YH0001         IF  MPND-TI-RECORD-ID                                    26565700
YH0001           MOVE MPND-TI-RECORD    TO FMT-TI-RECORD                26565800
YH0001           PERFORM O-READ-MPND-FILE                               26565900
YH0001           MOVE MPND-AT-RECORD    TO FMT-AT-RECORD                26566000
YH0001         ELSE                                                     26567000
YH0001           MOVE MPND-AT-RECORD    TO FMT-AT-RECORD                26568000
YH0001                                     FMT-TI-RECORD                26569000
               END-IF                                                   26570000
239700         PERFORM SET-AT-RECORD                                    26580000
239800                                                                  26590000
239900         PERFORM PROCESS-PEND-FILE                                26600000
LRM012            THRU PROCESS-PEND-EXIT                                26610000
240000         PERFORM O-READ-MPND-FILE                                 26620000
240100     END-PERFORM.                                                 26630000
240200                                                                  26640000
240300 PROCESS-PEND-FILE.                                               26650000
240400                                                                  26660000
240500     IF PREV-ADP-CLIENT = ZERO                                    26670000
240600         SET B1-IND TO FMT-TI-ADP-CL-NO                           26680000
240700         PERFORM O-CLIENT-BREAK-SET-UP-NEXT-CL                    26690000
240800     ELSE                                                         26700000
240900        IF FMT-TI-ADP-CL-NO-X NOT = PREV-ADP-CLIENT               26710000
241000           PERFORM O-CLIENT-BREAK                                 26720000
241100           IF NOT (END-OF-PEND-FILE AND END-OF-MPND-FILE)         26730000
241200               SET B1-IND TO FMT-TI-ADP-CL-NO                     26740000
241300               PERFORM O-CLIENT-BREAK-SET-UP-NEXT-CL              26750000
241400     END-IF.                                                      26760000
241500                                                                  26770000
           PERFORM READ-NTWREGOP.                                       26780000
                                                                        26790000
           IF  RECORD-IS-FROM-MPND-FILE                                 26800000
              SET NON-CNS  TO TRUE                                      26810000
              IF  FMT-FUND-SERV                                         26820000
                PERFORM O-FUND-FAIL-PAST                                26830000
              END-IF                                                    26840000
           ELSE                                                         26850000
             SET FMT-REC-IS-VALID TO TRUE                               26860000
             PERFORM O-EDIT-PEND-RECS                                   26870000
                                                                        26880000
DJ0001       IF FMT-TRNFR-TYPE = 'MFC'                                  26890000
DJ0001          IF  B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) NOT = '0'     26900000
DJ0001              CONTINUE                                            26900110
DJ0001          ELSE                                                    26920000
LRM030           IF PARM-SHAD-RUN                                       26930000
LRM030           AND B1-SERVICE-STATUS (B1-IND) = '1'                   26940000
LRM030           AND B1-SHADOW-POST   (B1-IND) = '1'                    26950000
LRM030           AND (FMT-SETTL-DATE  =   WS-TRADE-PLUS-1               26960000
LRM030           OR  FMT-SETTL-DATE  =  WS-TRADE-PLUS-2)                26970000
LRM030           AND (FMT-STATUS-CD  = '300' OR '310')                  26980000
LRM030              PERFORM O-MFC-P2-CREATE                             26990000
LRM030           ELSE                                                   27000000
DJ0001              IF  B1-SERVICE-STATUS (B1-IND) = '1'                27010000
DJ0001              AND (FMT-SETTL-DATE =  ACAT-PROC-DATE)              27020000
DJ0001              AND (FMT-STATUS-CD  =  '300' OR '310')              27030000
DJ0001              AND (NOT FMT-MEMO)                                  27040000
DJ0001                  PERFORM O-MFC-P2-CREATE                         27050000
DJ0001              END-IF                                              27060000
DJ0001          END-IF                                                  27070000
LRM007     END-IF.                                                      27080000
                                                                        27090000
                                                                        27099510
LRM007     IF RECORD-IS-FROM-MPND-FILE                                  27100000
LRM007       CONTINUE                                                   27110000
LRM007     ELSE                                                         27120000
YH0001       IF  FMT-REC-IS-VALID                                       27130000
YH0001           ADD 1 TO TOT-CL-PEND-READ                              27140000
YH0001           PERFORM O-DETERMINE-P2-VS-PENDING                      27150000
YH0001       ELSE                                                       27160000
YH0001           ADD 1 TO TOT-CL-INVALID-SORT-RECS                      27170000
YH0001       END-IF                                                     27180000
                                                                        27181000
           END-IF.                                                      27182000
LRM012 PROCESS-PEND-EXIT. EXIT.                                         27183000
                                                                        27184000
243900 SET-AT-RECORD.                                                   27185000
244000                                                                  27186000
244100        SET      MPND-TI-RECORD-ID TO TRUE.                       27187000
244200        MOVE MPND-AT-CONTRA-BRK-NUM                               27188000
244300                             TO  FMT-CONTRA-BRK-NUM.              27189000
244400        MOVE MPND-AT-CONTRA-ACCOUNT                               27190000
244500                             TO  FMT-CONTRA-ACCOUNT.              27200000
244600/                                                                 27210000
244700******************************************************************27220000
244800*** PERFORMED BY:                                              ***27230000
244900***     O-PROCESS-PEND-RECORD                                  ***27240000
245000******************************************************************27250000
245100                                                                  27260000
245200 O-DETERMINE-P2-VS-PENDING.                                       27270000
245300     IF FMT-CNS                                                   27280000
245400        SET CNS TO TRUE                                           27290000
245500     ELSE                                                         27300000
245600        SET NON-CNS  TO TRUE                                      27310000
245700     END-IF.                                                      27320000
245800                                                                  27330000
245900** CHECK IF RECORD GOES TO CAT13 CAGE FILE **                     27340000
246000                                                                  27350000
LRM022     IF B1-ACAT-BOOK-DEBIT-BAL-TYPE1(B1-IND) = '1'                27360000
TEST**********DISPLAY 'READING N/A FOR ' FMT-TI-CUST-ACCOUNT            27370000
LRM022        PERFORM O-PROC-GETNA-FILE                                 27380000
LRM022           THRU O-PROC-GETNA-FILE-EXIT                            27390000
LRM022     END-IF.                                                      27400000
LRM022     IF B1-ACAT-BOOK-DEBIT-BAL-TYPE1 (B1-IND) = '1'               27410000
LRM022     AND GETNA-RETURN-FOUND                                       27420000
LRM022     AND NOT  NAPPA-SEGMENT-MISSING                               27430000
LRM022     AND NAPPA-MGN-AGRMNT NOT = '1'                               27440000
LRM022     AND FMT-CASH                                                 27450000
LRM022     AND NOT FMT-CASH-ACT                                         27460000
LRM022     AND FMT-DEBIT                                                27470000
LRM022     AND FMT-CLNT-IS-RECEIVER                                     27480000
LRM022     AND (FMT-TRNFR-TYPE = 'PTD' OR 'PTR' OR 'FUL' OR 'RCR')      27490000
LRM022        SET FMT-CASH-ACT TO TRUE                                  27500000
TEST          DISPLAY 'FORCING CASH DEBIT TO TYPE 1 '                   27510000
TEST              FMT-TI-ADP-CL-NO-X ' ' FMT-TI-CUST-ACCOUNT            27520000
              MOVE SPACES TO TYPE2-CASH-DETAIL-RECORD                   27530000
              MOVE FMT-TI-ADP-CL-NO-X TO TYPE2-CASH-ADP-CL-NO-X         27540000
              MOVE FMT-TI-CUST-ACCOUNT TO TYPE2-CASH-BRANCH-ACCOUNT     27550000
              MOVE FMT-ASSET-VALUE     TO TYPE2-CASH-AMOUNT             27560000
LRM023        MOVE FMT-STTLM-LCTN-CD   TO TYPE2-CASH-SETTLE-LOC         27570000
              WRITE TYPE2-CASH-RECORD FROM TYPE2-CASH-DETAIL-RECORD     27580000
LRM022     END-IF.                                                      27590000
                                                                        27600000
LRM023     IF B1-ACAT-BOOK-DEBIT-BAL-TYPE1 (B1-IND) = '1'               27610000
LRM023     AND GETNA-RETURN-FOUND                                       27620000
LRM023     AND NOT  NAPPA-SEGMENT-MISSING                               27630000
LRM023     AND NAPPA-MGN-AGRMNT NOT = '1'                               27640000
LRM023     AND NOT FMT-CASH                                             27650000
LRM023     AND NOT FMT-CASH-ACT                                         27660000
LRM023     AND FMT-SHORT                                                27670000
LRM023     AND FMT-CLNT-IS-RECEIVER                                     27680000
LRM023     AND FMT-ADP-SEC-NO > SPACES                                  27690000
LRM023     AND (FMT-TRNFR-TYPE = 'PTD' OR 'PTR' OR 'FUL' OR 'RCR')      27700000
LRM023        SET FMT-CASH-ACT TO TRUE                                  27710000
LRM023        DISPLAY 'FORCING NON CASH SHORT TO TYPE 1 '               27720000
LRM023            FMT-TI-ADP-CL-NO-X ' ' FMT-TI-CUST-ACCOUNT            27730000
LRM023        MOVE SPACES TO TYPE2-CASH-DETAIL-RECORD                   27740000
LRM023        MOVE FMT-TI-ADP-CL-NO-X TO TYPE2-CASH-ADP-CL-NO-X         27750000
LRM023        MOVE FMT-TI-CUST-ACCOUNT TO TYPE2-CASH-BRANCH-ACCOUNT     27760000
LRM023        MOVE FMT-ASSET-VALUE     TO TYPE2-CASH-AMOUNT             27770000
LRM023        MOVE FMT-STTLM-LCTN-CD   TO TYPE2-CASH-SETTLE-LOC         27780000
LRM023        MOVE FMT-ADP-SEC-NO      TO TYPE2-CASH-ADP-NUMBER         27790000
LRM023        MOVE FMT-CUSIP-NUM       TO TYPE2-CASH-CUSIP              27800000
LRM023        MOVE FMT-ASSET-QUAN      TO TYPE2-CASH-QUANTITY           27810000
LRM023        MOVE FMT-SEC-DESC-1      TO TYPE2-CASH-ASSET-DESC         27820000
LRM023        WRITE TYPE2-CASH-RECORD FROM TYPE2-CASH-DETAIL-RECORD     27830000
LRM023     END-IF.                                                      27840000
                                                                        27850000
246100     IF NOT FMT-MEMO                                              27860000
246200       AND ((FMT-SETTL-DATE  =  WS-TRADE-PLUS-2                   27870000
246300       AND FMT-TRNFR-TYPE  = 'FUL')                               27880000
246300       OR (FMT-TRNFR-TYPE  NOT = 'FUL'                            27890000
LRM037       AND FMT-SETTL-DATE  = WS-TRADE-PLUS-1))                    27900000
246400         PERFORM WRITE-CAT13-RECORD-RTN                           27910000
246500     END-IF.                                                      27920000
246600                                                                  27930000
246700** CHECK IF RECORD GOES TO T+1 FILE OF NON-CNS FAILS FOR CAGE **  27940000
YH0001                                                                  27950000
247000     IF ((FMT-SETTL-DATE  =  WS-TRADE-PLUS-2                      27960000
LRM         AND FMT-TRNFR-TYPE      = 'FUL')                            27970000
LRM        OR  (FMT-SETTL-DATE  =  WS-TRADE-PLUS-1                      27980000
LRM         AND FMT-TRNFR-TYPE  NOT = 'FUL'))                           27990000
247200       IF  NOT FMT-MEMO                                           28000000
247300       AND NOT FMT-CASH                                           28010000
247400       AND NOT FMT-OCC                                            28020000
247500       IF (NON-CNS  AND NOT FMT-FUND-SERV)                        28030000
247600                    OR                                            28040000
247700          (FMT-FUND-SERV    AND                                   28050000
247800           B1-FUND-SERV-CLIENT  (B1-IND)  =  '0')                 28060000
247900           PERFORM  O-FORMAT-T3RDFL-RECORD                        28070000
248000           PERFORM  O-WRITE-CAGE-NOTIFY-UPD-REC                   28080000
248100       END-IF                                                     28090000
248200     END-IF.                                                      28091000
248300                                                                  28092000
248400** CHECK IF RECORD GOES TO THE CAG2FL OUTPUT FILE **              28093000
248500                                                                  28094000
248600     IF  FMT-SETTL-DATE  =  WS-TRADE-PLUS-1                       28095000
248700         AND NOT FMT-MEMO                                         28096000
248800         AND  FMT-CLNT-IS-DELIVERER                               28097000
248900         AND  ( FMT-ACT-TYPE = 'SN' OR 'JT' OR 'DR' OR 'OT' OR    28098000
249000                               'ES' OR 'CU' OR 'TR' OR 'CO' )     28099000
249100         AND  CNS                                                 28100000
249200         AND  FMT-CASH-ACT                                        28100100
249300         PERFORM  O-FORMAT-CAG2FL-RECORD                          28100200
249400     END-IF.                                                      28100300
249500                                                                  28100400
249600** CHECK B1 OPTION AND STATUS FOR FUNDSERV FAILS FOR CAGE **      28100500
249700                                                                  28100600
249800     IF  FMT-FUND-SERV                                            28100700
249900     AND NOT FMT-MEMO                                             28100800
250000     AND B1-FUND-SERV-CLIENT  (B1-IND)  =  '1'                    28100900
YH0001       IF   (FMT-TRNFR-TYPE =  'FRV' OR 'MFC')                    28101000
YH0001         IF     FMT-SETTL-DATE  =  WS-TRADE-PLUS-1                28102000
YH0001           AND (FMT-TRNFR-TYPE =  'FRV'                           28103000
YH0001                OR (FMT-CAGE-TAG > SPACE AND                      28104000
YH0001                   B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) = '0'))  28105000
YH0001           PERFORM  O-FORMAT-T3RDFL-RECORD                        28106000
YH0001         END-IF                                                   28107000
YH0001       ELSE                                                       28108000
250100                                                                  28109000
250200         IF  FMT-REJECTED-BY-FUND                                 28110000
250300             IF  B1-FAILS-T3-OR-T4  (B1-IND)  =  '1'              28120000
250400****************IF  FMT-SETTL-DATE  =  BPD-PROC-DATE              28130000
LRM008                IF (FMT-SETTL-DATE  =  WS-TRADE-PLUS-2            28140000
LRM008                OR (FMT-SETTL-DATE  =  WS-TRADE-PLUS-1            28150000
LRM008                   AND  PEND-FNDSRVS-PRCS-DT = BPD-PROC-DATE))    28160000
250500*******************AND  PEND-UPDT-TMSTP = BPD-PROC-DATE           28170000
TEST  *******    DISPLAY 'T+1 FAIL ' FMT-TRNFR-TYPE                     28180000
TEST  ******       ' S/D ' FMT-SETTL-DATE                               28190000
250600                   PERFORM  O-FORMAT-T3RDFL-RECORD                28200000
250700                   PERFORM  O-WRITE-CAGE-REJECT-UPD-REC           28210000
250800                   MOVE 'Y' TO FMT-FAIL-OPEN-CAGE-IND             28220000
250900                END-IF                                            28230000
251000              ELSE                                                28240000
251100                IF  FMT-SETTL-DATE  =  WS-TRADE-PLUS-1            28250000
251200                   PERFORM  O-FORMAT-T3RDFL-RECORD                28260000
251300                   PERFORM  O-WRITE-CAGE-REJECT-UPD-REC           28270000
251400                   MOVE 'Y' TO FMT-FAIL-OPEN-CAGE-IND             28280000
251500                END-IF                                            28290000
251600             END-IF                                               28300000
251700         END-IF                                                   28310000
251800                                                                  28320000
251900         IF  FMT-ACCEPTED-BY-FUND                                 28330000
252000         AND FMT-FAIL-OPEN-CAGE-IND = 'Y'                         28340000
252100             IF  B1-FAILS-T3-OR-T4  (B1-IND)  =  '1'              28350000
252200                 PERFORM  O-WRITE-CAGE-ACCEPT-UPD-REC             28360000
252300         END-IF                                                   28370000
252400     END-IF.                                                      28380000
252500                                                                  28390000
252600                                                                  28400000
LRM005     IF PARM-SHAD-RUN                                             28410000
LRM005        IF B1-SERVICE-STATUS (B1-IND) = '1'                       28420000
LRM005        AND B1-SHADOW-POST   (B1-IND) = '1'                       28430000
LRM005        AND FMT-SETTL-DATE  =   WS-TRADE-PLUS-1                   28440000
LRM005***      OR  FMT-SETTL-DATE  =  WS-TRADE-PLUS-2)                  28450000
LRM005        AND (FMT-STATUS-CD  = '300' OR '310')                     28460000
LRM005        AND NOT FMT-MEMO                                          28470000
LRM005           PERFORM O-FORMAT-P2-RECORD                             28480000
LRM005        ELSE                                                      28490000
LRM005           CONTINUE                                               28500000
LRM005     ELSE                                                         28510000
252700     IF  FMT-SETTL-DATE  =  ACAT-PROC-DATE                        28520000
252800     AND B1-SERVICE-STATUS (B1-IND) = '1'                         28530000
252900     AND (FMT-STATUS-CD  = '300' OR '310')                        28540000
253000     AND NOT FMT-MEMO                                             28550000
253100         PERFORM O-FORMAT-P2-RECORD                               28560000
253200       IF  FMT-FUND-SERV    AND                                   28570000
253300           B1-FUND-SERV-CLIENT  (B1-IND)  =  '1'                  28580000
253400           IF  FMT-CLNT-IS-RECEIVER                               28590000
253500               ADD  1                   TO  TOT-CL-FS-RECV        28600000
253600           ELSE                                                   28610000
253700               ADD  1                   TO  TOT-CL-FS-DELV        28620000
253800           END-IF                                                 28630000
LRM009           PERFORM WRITE-FUNDSERV-EXTRACT                         28640000
253900       END-IF                                                     28650000
254000       IF NEW-TI                                                  28660000
254100       AND NOT PARM-CAGE-RUN                                      28670000
254200          ADD 1 TO TOT-CL-ACCOUNTS                                28680000
254300          SET NOT-NEW-TI TO TRUE                                  28690000
254400       END-IF                                                     28700000
254500       IF NEW-AT                                                  28710000
254600       AND NOT PARM-CAGE-RUN                                      28720000
254700          ADD 1 TO TOT-CL-ASSETS                                  28730000
254800          SET NOT-NEW-AT TO TRUE                                  28740000
254900       END-IF                                                     28750000
255000     END-IF.                                                      28760000
255100                                                                  28770000
255200** NEVER OUTPUT SMA FOR SHADOW POSTING RUN                        28780000
LRM005     IF PARM-SHAD-RUN                                             28790000
LRM005     AND FMT-SMA                                                  28800000
LRM005        CONTINUE                                                  28810000
LRM005     ELSE                                                         28820000
255300     IF  FMT-SETTL-DATE  =  ACAT-PROC-DATE                        28830000
255400     AND B1-SERVICE-STATUS (B1-IND) = '1'                         28840000
255500     AND B1-UPDATE-SMA (B1-IND) = '1'                             28850000
255600     AND (FMT-STATUS-CD  = '300' OR '310')                        28860000
255700     AND FMT-SMA                                                  28870000
255800     AND FMT-CLNT-IS-RECEIVER                                     28880000
255900         PERFORM O-FORMAT-SMA-RTN                                 28890000
256000     END-IF.                                                      28900000
256100/                                                                 28910000
256200 O-FUND-FAIL-PAST.                                                28920000
256300*** NO CAHNGES TO ACCEPTED BY MF       OR SETTLEMENT DATES ARE    28930000
256400*** IF REJECTED ON OR AFTER S/D                                   28940000
256500***   CREATE INTRA FILE ON ALL SITUATION                          28950000
256500***   IF S/D = TODAY BOOKEEPING FROM PEND FILE                    28960000
256500***   IF S/D < TODAY FORCE BOOKKEEPING FROM MPEND(NOT ON PEND)    28970000
256500**                                                                28980000
256600*-------------------------------------------------------------    28990000
256700*   IN HERE FUND-FAILS RECORD IS CREATED TO CAGE-FEED             29000000
256800*-------------------------------------------------------------    29010000
YH0001     IF  B1-SERVICE-STATUS (B1-IND) = '1'                         29020000
YH0001      IF     FMT-SETTL-DATE  <  ACAT-PROC-DATE                    29030000
YH0001        AND  FMT-ACCEPTED-BY-FUND                                 29040000
YH0001         PERFORM O-FORMAT-P2-RECORD                               29050000
YH0001      ELSE                                                        29060000
YH0001       IF   FMT-SETTL-DATE  NOT > ACAT-PROC-DATE                  29070000
YH0001        AND FMT-REJECTED-BY-FUND                                  29080000
YH0001         IF B1-POST-STL-REJ-BKP  (B1-IND)  = '0'                  29090000
YH0001         AND (FMT-UPDT-TMSTP  = ACAT-PROC-DATE                    29100000
YH0001               OR  FMT-SETTL-DATE  < ACAT-PROC-DATE )             29110000
YH0001         AND PARM-INTR-RUN                                        29120000
YH0001              PERFORM O-FORMAT-T3RDFL-RECORD                      29130000
YH0001              ADD +1  TO TOT-CAGE-FAIL-REC                        29140000
YH0001         END-IF                                                   29150000
YH0001                                                                  29160000
YH0001         IF   FMT-SETTL-DATE  <  ACAT-PROC-DATE                   29170000
YH0001           PERFORM O-FORMAT-P2-RECORD                             29180000
YH0001                                                                  29190000
YH0001       END-IF                                                     29200000
YH0001      END-IF                                                      29210000
YH0001     END-IF.                                                      29220000
261900                                                                  29230000
262000 O-FORMAT-SMA-RTN.                                                29240000
262100     MOVE 'MNS' TO P2-BK-TRID                                     29250000
262200     MOVE FMT-TI-ADP-CL-NO   TO P2-BK-BROKER-NBR                  29260000
262300** ALWAYS BOOK SMA AS A CREDIT.                                   29270000
262400     MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE                  29280000
262500     PERFORM O-CUST-ACT-MOVE-BR-ACT                               29290000
262600     MOVE SPACES TO P2-BK-SECURITY-NBR.                           29300000
262700     MOVE 'TFR'  TO P2-BK-ENTRY-CODE.                             29310000
262800     MOVE 'SMA TRANSFERED' TO P2-BK-DESCRIPTION                   29320000
262900     MULTIPLY FMT-ASSET-VALUE BY 1                                29330000
263000                         GIVING P2-BK-AMOUNT-DOLLARS.             29340000
263100     MOVE SPACES             TO P2-BK-QUANTITY-X                  29350000
263200     MOVE ZERO               TO P2-BK-FRACTION                    29360000
263300     MOVE 'D '  TO  P2-BK-SPIN-DTW                                29370000
263400     PERFORM O-WRITE-P2-ENTRY-CODE                                29380000
263500     WRITE P2BKPG-RECORD FROM P2-BK-RECORD                        29390000
263600     ADD 1 TO TOT-CL-P2-RECS-WRITTEN.                             29400000
263700                                                                  29410000
263800     MOVE '  '  TO  P2-BK-SPIN-DTW.                               29420000
263900 O-WRITE-CAGE-NOTIFY-UPD-REC.                                     29430000
264000**   DISPLAY 'NEED TO UPD CAGE IND'                               29440000
264100**                                    ' ' WS-SAVE-SEC             29450000
264200**         FMT-TI-ADP-CL-NO  ' '   FMT-TI-CUST-ACCOUNT.           29460000
264300 O-WRITE-CAGE-REJECT-UPD-REC.                                     29470000
264400**   DISPLAY 'NEED TO UPD CAGE REJECT'                            29480000
264500**                                    ' ' WS-SAVE-SEC             29490000
264600**         FMT-TI-ADP-CL-NO  ' '   FMT-TI-CUST-ACCOUNT.           29500000
264700 O-WRITE-CAGE-ACCEPT-UPD-REC.                                     29510000
264800**   DISPLAY 'NEED TO UPD CAGE ACCEPT'                            29511000
264900**                                    ' ' WS-SAVE-SEC             29512000
265000**         FMT-TI-ADP-CL-NO  ' '   FMT-TI-CUST-ACCOUNT.           29513000
265100******************************************************************29514000
265200*** PERFORMED BY:                                              ***29515000
265300***     O-DETERMINE-P2-VS-PENDING                              ***29516000
265400******************************************************************29517000
265500                                                                  29518000
265600 O-FORMAT-T3RDFL-RECORD.                                          29519000
265700     MOVE  FMT-TI-ADP-CL-NO           TO  CAGE-03-ADP-CLIENT-NBR. 29520000
265800     MOVE  FMT-SETTL-DATE             TO  CAGE-03-SETTLE-DATE.    29530000
LRM019**** PROBLEM FOUND IN CAGE QA TESTING; USE PROCESS DATE ON POST   29540000
LRM019**** S/D FAIL SETUP. NEXT 8 LINES COMMENTED OUT.                  29550000
YH0001**** IF    FMT-TRNFR-TYPE = 'MFC'                                 29560000
YH0001****   AND FMT-STTLM-ASCTD-DT > SPACES                            29570000
YH0001****   MOVE FMT-STTLM-ASCTD-DT        TO  CAGE-03-SETTLE-DATE     29580000
YH0001****   MOVE FMT-STTLM-ASCTD-DT (6 : 2)  TO                        29590000
YH0001****                                 CAGE-03-SETTLE-DATE (5 : 2)  29600000
YH0001****   MOVE FMT-STTLM-ASCTD-DT (9 : 2)  TO                        29610000
YH0001****                                 CAGE-03-SETTLE-DATE (7 : 2)  29620000
YH0001**** END-IF.                                                      29630000
                                                                        29640000
265900     IF  (FMT-LONG AND FMT-CLNT-IS-RECEIVER) OR                   29650000
266000         (FMT-SHORT AND FMT-CLNT-IS-DELIVERER)                    29660000
266100        MOVE '1'                      TO  CAGE-03-SPIN-CODE       29670000
266200     ELSE                                                         29680000
266300        MOVE '2'                      TO  CAGE-03-SPIN-CODE       29690000
266400     END-IF.                                                      29700000
266500     MOVE  SPACE                    TO  CAGE-03-NON-CNS-SK-IND.   29710000
266600     IF FMT-SAFE-KEEPING                                          29720000
266700      MOVE 'X'                        TO  CAGE-03-NON-CNS-SK-IND. 29730000
LRM036     MOVE SPACES TO CAGE-03-BLOTTER-CODE.                         29740000
LRM036     IF B1-ACAT-BLOT-CD-OVERD-NO (B1-IND) > ZERO                  29750000
LRM036        SET B1-SUB TO B1-IND                                      29760000
LRM036        PERFORM VARYING SUB FROM 1 BY 1                           29770000
LRM036              UNTIL SUB > B1-ACAT-BLOT-CD-OVERD-NO (B1-SUB)       29780000
LRM036           IF B1-ACAT-BLOT-CD-OVERD-LOC-RSN(B1-SUB, SUB)          29790000
LRM036                      = FMT-STTLM-RSN-CD                          29800000
LRM036              MOVE B1-ACAT-BLOT-CD-OVERD-CODE(B1-SUB, SUB)        29810000
LRM036                                      TO  CAGE-03-BLOTTER-CODE    29820000
LRM036              MOVE 20 TO SUB                                      29820100
LRM036            END-IF                                                29820200
LRM036        END-PERFORM                                               29820300
LRM036     END-IF.                                                      29820400
LRM036     IF CAGE-03-BLOTTER-CODE = SPACES                             29820500
266800        MOVE  B1-BLOTTER-CODE (B1-IND) TO CAGE-03-BLOTTER-CODE.   29820600
266900     MOVE  FMT-TI-CUST-ACCOUNT (1:3)  TO  CAGE-03-BRANCH-NBR.     29820700
267000     MOVE  FMT-TI-CUST-ACCOUNT (4:5)  TO  CAGE-03-ACCOUNT-NBR.    29820800
267100     MOVE  FMT-CASH-MGN-IND           TO  CAGE-03-ACCOUNT-TYPE.   29820900
267200     MOVE  FMT-ACT-TITLE              TO  CAGE-03-ACCOUNT-NAME.   29821000
267300     MOVE  FMT-ACT-TYPE               TO  CAGE-03-NSCC-CUST-TYPE. 29822000
267400     MOVE  FMT-ADP-SEC-NO             TO  CAGE-03-ADP-SECURITY-NBR29823000
267500     MOVE  FMT-CUSIP-NUM              TO  CAGE-03-CUSIP.          29824000
267600     MOVE  SPACES                     TO  CAGE-03-CURRENCY-CODE.  29825000
267700     MOVE  FMT-ASSET-VALUE            TO  CAGE-03-AMOUNT.         29826000
267800     MOVE  FMT-ASSET-QUAN             TO  CAGE-03-QUANTITY.       29827000
267900     MOVE  FMT-CONTRA-BRK-NUM         TO  CAGE-03-CONTRA-BROKER.  29828000
268000     MOVE  FMT-CONTRA-ACCOUNT         TO  CAGE-03-CONTRA-ACCOUNT. 29829000
268100     MOVE  FMT-TI-CONTROL-NUM         TO  CAGE-03-CONTROL-NBR.    29830000
268200     MOVE  '00'               TO  CAGE-03-ASSET-SEQ-NBR(1 : 2).   29840000
268300     MOVE  FMT-ASSET-SEQ-NO   TO  CAGE-03-ASSET-SEQ-NBR(3 : 4).   29850000
LRM009     IF (FMT-TRNFR-TYPE = 'MFC' OR 'FRV')                         29860000
LRM028        MOVE FMT-ORIG-STTLM-LCTN-CD   TO CAGE-03-AT-STL-LOC       29870000
LRM009        MOVE 'R'           TO CAGE-03-FAIL-REVERSAL-IND           29880000
LRM009        IF FMT-CAGE-TAG > SPACES                                  29890000
LRM009           MOVE FMT-CAGE-TAG  TO CAGE-03-CAGE-TAG                 29900000
LRM009        ELSE                                                      29910000
LRM009           MOVE 'ACAT'        TO CAGE-03-CAGE-TAG                 29920000
LRM009        END-IF                                                    29930000
LRM009     ELSE                                                         29940000
LRM028        MOVE FMT-STTLM-LCTN-CD        TO CAGE-03-AT-STL-LOC       29950000
LRM009        MOVE SPACES        TO CAGE-03-FAIL-REVERSAL-IND           29960000
LRM009                              CAGE-03-CAGE-TAG                    29970000
LRM009     END-IF.                                                      29980000
268400                                                                  29990000
268500     IF  (FMT-LONG AND FMT-CLNT-IS-RECEIVER) OR                   30000000
268600         (FMT-SHORT AND FMT-CLNT-IS-DELIVERER)                    30010000
268700          ADD  FMT-ASSET-VALUE        TO  TOT-CL-EARLY-CR-VALUE   30020000
268800          ADD  FMT-ASSET-QUAN         TO  TOT-CL-EARLY-CR-QTY     30030000
268900     END-IF.                                                      30040000
269000     IF  (FMT-LONG AND FMT-CLNT-IS-DELIVERER) OR                  30050000
269100         (FMT-SHORT AND FMT-CLNT-IS-RECEIVER)                     30060000
269200          ADD  FMT-ASSET-VALUE        TO  TOT-CL-EARLY-DB-VALUE   30070000
269300          ADD  FMT-ASSET-QUAN         TO  TOT-CL-EARLY-DB-QTY     30071000
269400     END-IF.                                                      30072000
269500                                                                  30073000
LRM025* NEVER SEND FAIL SETUP FOR PTF                                   30074000
LRM026* ONLY SEND INTRA-DAY FAIL SET-UP (POST SETTLE F/R REJECT) WHEN   30075000
LRM026*     CLIENT B1 434610 = 0 (THEY WANT POST SETTLE BOOKEEPING).    30076000
LRM026* ONLY SEND FAIL REVERSAL FOR MFC WHEN WE HAVE A TAG AND          30077000
LRM026*     CLIENT B1 434669 = 2 (THEY WANT MFC BOOKEEPING).            30078000
LRM025     IF    FMT-TRNFR-TYPE = 'PTF'                                 30079000
LRM026     OR (B1-POST-STL-REJ-BKP       (B1-IND) = '1'                 30080000
LRM026        AND PARM-INTR-RUN)                                        30090000
LRM026     OR (FMT-TRNFR-TYPE = 'MFC'                                   30100000
LRM026        AND (B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) NOT = '2'      30110000
LRM026         OR FMT-CAGE-TAG NOT > SPACE))                            30120000
LRM025        CONTINUE                                                  30130000
LRM025     ELSE                                                         30140000
269600        WRITE  T3RDFL-RECORD       FROM CAGE-03-RECORD            30150000
269700        IF  NOT  T3RDFL-FILE-OK                                   30160000
269800          DISPLAY  'T3RDFL FILE WRITE ERROR, STATUS = '           30170000
269900                    T3RDFL-FILE-STATUS                            30180000
270000          CALL ABEND            USING ABEND-CODE-4000             30190000
270100        END-IF                                                    30200000
270200        ADD  1                      TO  TOT-CL-EARLY-WRITTEN.     30210000
270300                                                                  30220000
270400/                                                                 30230000
270500******************************************************************30240000
270600*** PERFORMED BY:                                              ***30250000
270700***     O-DETERMINE-P2-VS-PENDING                              ***30260000
270800******************************************************************30270000
270900                                                                  30280000
271000 O-FORMAT-CAG2FL-RECORD.                                          30290000
271100                                                                  30300000
271200     MOVE  FMT-TI-ADP-CL-NO           TO  CAGE-ADP-CLIENT-NBR.    30310000
271300     MOVE  FMT-ADP-SEC-NO             TO  CAGE-ADP-SECURITY-NBR.  30320000
271400     MOVE  FMT-TI-CUST-ACCOUNT(1 : 8) TO  CAGE-ACCOUNT-NBR.       30330000
271500     MOVE  FMT-ASSET-QUAN             TO  CAGE-QUANTITY.          30340000
271600     MOVE  FMT-CASH-MGN-IND           TO  CAGE-ACCOUNT-TYPE.      30350000
271700     WRITE CAG2FL-RECORD             FROM CAGE-DETAIL-AREA.       30360000
271800     IF  NOT  CAG2FL-FILE-OK                                      30370000
271900         DISPLAY  'CAG2FL FILE WRITE ERROR, STATUS = '            30380000
272000                   CAG2FL-FILE-STATUS                             30390000
272100         CALL ABEND                 USING ABEND-CODE-4000         30400000
272200     END-IF.                                                      30410000
272300     ADD  +1                          TO  CAG2FL-RECS.            30420000
272400                                                                  30430000
272500/                                                                 30440000
272600 WRITE-CAT13-RECORD-RTN.                                          30450000
272700                                                                  30460000
272800     MOVE FMT-TI-ADP-CL-NO   TO CAT13-ADP-CLIENT-NBR.             30470000
272900     MOVE FMT-DSTBN-SIDE-CD  TO CAT13-TRANSFER-SIDE.              30480000
273000     MOVE FMT-AT-CUST-ACCOUNT TO CAT13-BRANCH-NBR.                30490000
273100     MOVE FMT-AT-CUST-ACCOUNT(4 : 5) TO CAT13-ACCOUNT-NBR.        30491000
273200     MOVE FMT-CASH-MGN-IND    TO CAT13-ACCOUNT-TYPE.              30491100
273300     MOVE FMT-CUSIP-NUM       TO  CAT13-CUSIP.                    30491200
273400     MOVE FMT-ASSET-QUAN      TO CAT13-QUANTITY.                  30491300
273400     IF   FMT-SHORT                                               30491400
273400      MULTIPLY -1             BY CAT13-QUANTITY                   30491500
273900     END-IF.                                                      30491600
273500     IF CNS                                                       30491700
273600         SET CAT13-SETTLE-CNS TO TRUE                             30491800
273700     ELSE                                                         30491900
273800         SET CAT13-SETTLE-NON-CNS TO TRUE                         30492000
273900     END-IF.                                                      30493000
274000     MOVE FMT-SETTL-DATE      TO CAT13-SETTLE-DATE.               30494000
274100     WRITE CAT13-RECORD.                                          30495000
274200                                                                  30496000
LRM009 WRITE-FUNDSERV-EXTRACT.                                          30497000
LRM009     IF (FMT-TRNFR-TYPE = 'FUL' OR 'PTR' OR 'PTD' OR 'RCR')       30498000
LRM009        MOVE PEND-AT-RECORD    TO OFUND-AT-RECORD                 30499000
LRM009        MOVE MF-PROCESS-OPTION TO OFUND-FUND-PROC-CD              30500000
LRM009        WRITE OFUND-AT-RECORD                                     30510000
LRM009     END-IF.                                                      30520000
274300/                                                                 30530000
274400******************************************************************30540000
274500*** PERFORMED BY:                                              ***30550000
274600***     O-PROCESS-ACAT-CLIENT                                  ***30560000
274700******************************************************************30570000
274800                                                                  30580000
274900 O-CLIENT-BREAK.                                                  30590000
275000                                                                  30600000
275100     MOVE B1-ADP-CL-NO (B1-IND) TO NUM-OUT-CLIENT-NUMBER          30610000
275200                                                                  30620000
YH0001     IF  PC-LINE-CNT NOT = 999                                    30630000
              MOVE 999     TO PC-LINE-CNT.                              30640000
           PERFORM VARYING MFC-IND FROM 1 BY 1                          30650000
                UNTIL MFC-IND > MFC-MAX                                 30660000
              MOVE MFC-ERR-LINE1 (MFC-IND) TO PW-LINE                   30670000
              PERFORM O-PRINT-LINE                                      30680000
              IF   MFC-ERR-LINE1A (MFC-IND) NOT = SPACES                30690000
               MOVE MFC-ERR-LINE1A (MFC-IND) TO PW-LINE                 30700000
               PERFORM O-PRINT-LINE                                     30710000
              END-IF                                                    30720000
              MOVE MFC-ERR-LINE3 (MFC-IND) TO PW-LINE                   30730000
              PERFORM O-PRINT-LINE                                      30740000
              IF   MFC-ERR-LINE4 (MFC-IND) NOT = SPACES                 30750000
               MOVE MFC-ERR-LINE4 (MFC-IND) TO PW-LINE                  30760000
               PERFORM O-PRINT-LINE                                     30770000
              END-IF                                                    30780000
              IF   MFC-ERR-LINE5 (MFC-IND) NOT = SPACES                 30790000
               MOVE MFC-ERR-LINE5 (MFC-IND) TO PW-LINE                  30800000
               PERFORM O-PRINT-LINE                                     30810000
              END-IF                                                    30820000
              MOVE MFC-ERR-LINE2 (MFC-IND) TO PW-LINE                   30830000
              PERFORM O-PRINT-LINE                                      30840000
           END-PERFORM.                                                 30850000
           MOVE   0         TO MFC-MAX.                                 30860000
                                                                        30870000
275300     PERFORM O-CLIENT-BREAK-ADD-TOT-DB-CR                         30880000
275400                                                                  30890000
275500     PERFORM O-PRINT-CLIENT-TOTALS                                30900000
275600                                                                  30910000
275700     IF PARM-BOOK-RUN                                             30920000
275800        PERFORM O-CLIENT-BREAK-BILLING                            30930000
275900     END-IF.                                                      30940000
276000                                                                  30950000
276100     PERFORM O-CLIENT-BREAK-DISPLAY-TOTALS                        30960000
276200         VARYING CL-O-CNTR-X                                      30970000
276300         FROM 1 BY 1                                              30980000
276400         UNTIL   CL-O-CNTR-X IS GREATER THAN NUM-CL-OUT-CNTRS     30990000
276500                                                                  31000000
276600     PERFORM O-CLIENT-BREAK-ROLL-TOTALS                           31010000
276700                                                                  31020000
276800     PERFORM O-CLIENT-BREAK-CLEAR-TOTALS                          31030000
276900         VARYING CL-O-CNTR-X                                      31040000
277000         FROM 1 BY 1                                              31050000
277100         UNTIL   CL-O-CNTR-X IS GREATER THAN NUM-CL-OUT-CNTRS.    31060000
277200/                                                                 31070000
277300******************************************************************31080000
277400*** PERFORMED BY:                                              ***31090000
277500***     O-PROCESS-ACAT-CLIENT                                  ***31100000
277600******************************************************************31110000
277700                                                                  31120000
277800 O-CLIENT-BREAK-SET-UP-NEXT-CL.                                   31130000
277900                                                                  31140000
278000     ADD 1 TO NUM-OF-CLIENTS                                      31150000
278100     MOVE B1-ADP-CL-NO (B1-IND) TO TL-CLIENT-NUMBER               31160000
278200     MOVE B1-ADP-CL-NO (B1-IND) TO TTL-CLIENT-NUMBER              31170000
278300     MOVE B1-ADP-CL-NO (B1-IND) TO PREV-ADP-CLIENT                31180000
278400     MOVE B1-ADP-CL-NO (B1-IND) TO PW-CL                          31190000
278500*    DISPLAY 'NEW CLIENT SET-UP ' PREV-ADP-CLIENT.                31200000
278600****************************************************************  31210000
278700     DISPLAY  ' '                                                 31211000
278800     DISPLAY  '*===============================================*' 31212000
278900     DISPLAY  '     CAT650: B1 VALUES FOR ACAT CLIENT: '          31213000
279000                                         B1-ADP-CL-NO (B1-IND)    31214000
279100     DISPLAY  '*===============================================*' 31215000
279200     DISPLAY                                                      31216000
279300     'CAT650: B1-SERVICE-STATUS                 (434502) = '      31217000
279400              B1-SERVICE-STATUS (B1-IND)                          31218000
279500     DISPLAY                                                      31219000
279600     'CAT650: B1-UPDATE-SMA                     (434513) = '      31219100
279700              B1-UPDATE-SMA (B1-IND)                              31219200
279800     DISPLAY                                                      31219300
279900     'CAT650: B1-OFFSET-ACC-NUM                 (434639) = '      31219400
280000              B1-OFFSET-ACC-NUM (B1-IND)                          31219500
280100     DISPLAY                                                      31219600
280200     'CAT650: B1-OFFSET-ROLL-ACC                (434640) = '      31219700
280300              B1-OFFSET-ROLL-ACC (B1-IND)                         31219800
280400     DISPLAY                                                      31219900
280500     'CAT650: B1-P2-OPTION-B                    (006200) = '      31220000
280600              B1-OPTION-OFFSET-IND (B1-IND)                       31230000
280700     DISPLAY                                                      31240000
280800     'CAT650: B1-ENTRY-CODE-DEL                 (434627) = '      31250000
280900              B1-ENTRY-CODE-DEL (B1-IND)                          31260000
281000     DISPLAY                                                      31270000
281100     'CAT650: B1-ENTRY-CODE-REC                 (434626) = '      31280000
281200              B1-ENTRY-CODE-REC (B1-IND)                          31290000
281300     DISPLAY                                                      31300000
281400     'CAT650: B1-ENTRY-DEL-ROLL                 (434628) = '      31310000
281500              B1-ENTRY-DEL-ROLL (B1-IND)                          31320000
281600     DISPLAY                                                      31330000
281700     'CAT650: B1-ENTRY-REC-ROLL                 (434629) = '      31340000
281800              B1-ENTRY-REC-ROLL (B1-IND)                          31350000
LRM013     DISPLAY                                                      31360000
LRM013     'CAT650: B1-ENTRY-PTR-DEL-ROLL             (434630) = '      31370000
LRM013              B1-ENTRY-PTR-DEL-ROLL (B1-IND)                      31380000
LRM013     DISPLAY                                                      31390000
LRM013     'CAT650: B1-ENTRY-PTR-REC-ROLL             (434631) = '      31400000
LRM013              B1-ENTRY-PTR-REC-ROLL (B1-IND)                      31410000
281810     DISPLAY                                                      31420000
281820     'CAT650: B1-MISC-FRACT-QTY                 (001209) = '      31430000
281830              B1-FRAC-QTY-PROC  (B1-IND)                          31440000
281840     DISPLAY                                                      31450000
281850     'CAT650: B1-MISC-IRA-CLIENT                (001202) = '      31460000
281860              B1-MISC-IRA-CLIENT (B1-IND)                         31470000
281870     DISPLAY                                                      31480000
281880     'CAT650: B1-ROLLOVER-CLIENT                (434584) = '      31490000
281890              B1-ROLLOVER-CLIENT (B1-IND)                         31500000
281900     DISPLAY                                                      31510000
282000     'CAT650: B1-BLOTTER-CODE-FOR-FAILS         (434622) = '      31520000
282100              B1-BLOTTER-CODE (B1-IND)                            31530000
282200     DISPLAY                                                      31540000
282300     'CAT650: B1-OFFSET-AMT-BYPASS              (434585) = '      31550000
282400              B1-OFFSET-AMT-BYPASS (B1-IND)                       31560000
282500     DISPLAY                                                      31570000
282600     'CAT650: B1-FUND-MF-SERV-CLIENT            (434606) = '      31580000
282700              B1-FUND-SERV-CLIENT (B1-IND)                        31590000
282800     DISPLAY                                                      31600000
282900     'CAT650: B1-FAILS-T3-OR-T4                 (501361) = '      31610000
283000              B1-FAILS-T3-OR-T4 (B1-IND)                          31620000
283100     DISPLAY                                                      31630000
283200     'CAT650: B1-POST-STL-REJ-BKP               (434610) = '      31640000
283300              B1-POST-STL-REJ-BKP (B1-IND)                        31650000
LRM026     DISPLAY                                                      31660000
LRM026     'CAT650: B1-ACAT-DONT-BOOK-MFC-TRANSF      (434669) = '      31670000
LRM026              B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND)               31680000
283400     DISPLAY                                                      31690000
283500     'CAT650: B1-RCV-PEND-STL-ACCT              (434637) = '      31700000
283600              B1-RCV-PEND-STL-ACCT (B1-IND)                       31710000
283700     DISPLAY                                                      31720000
283800     'CAT650: B1-DEL-PEND-STL-ACCT              (434638) = '      31730000
283900              B1-DEL-PEND-STL-ACCT (B1-IND)                       31740000
284000     DISPLAY                                                      31750000
284100     'CAT650: B1-PEND-STL-BATCH-CODE            (434623) = '      31760000
284200              B1-PEND-STL-BATCH-CODE (B1-IND)                     31770000
284300     DISPLAY                                                      31780000
284400     'CAT650: B1-MFRS-ACTIVE                    (537011) = '      31790000
284500              B1-MFRS-ACTIVE (B1-IND)                             31800000
284600     DISPLAY                                                      31810000
284700     'CAT650: BH-MF-FIRM-NA-BOOK-SHR-CTL-ACT    (537448) = '      31820000
284800              B1-MFRS-BB-OFFSET (B1-IND)                          31830000
284900     DISPLAY                                                      31840000
285000     'CAT650: B1-MFRS-OMNIBUS-OFFSET            (537435) = '      31850000
285100              B1-MFRS-OMNIBUS-OFFSET (B1-IND)                     31860000
285110     DISPLAY                                                      31870000
285120     'CAT650: B1-MFRS-NSCCSRC-OFFSET            (537596) = '      31880000
285130              B1-MFRS-NSCCSRC-OFFSET (B1-IND)                     31890000
LRM003     DISPLAY                                                      31900000
LRM003     'CAT650: BH-MFN-DST-MFE-NSCC-BOX-ACCT      (537601) = '      31910000
LRM003              B1-MFRS-DST-MFE-OFFSET (B1-IND)                     31920000
LRM029     DISPLAY                                                      31930000
LRM029     'CAT650: BH-MF3-PNC-SURPAS-BOX-ACCOUNT     (540238) = '      31940000
LRM029              B1-PNC-SURPAS-OFFSET   (B1-IND)                     31950000
285200     DISPLAY                                                      31960000
285300     'CAT650: BH-MF-BKR-NOMINEE-BOOK-SHR-CTL    (537449) = '      31970000
285400              B1-MFRS-BN-OFFSET (B1-IND)                          31980000
285500     DISPLAY                                                      31990000
285600     'CAT650: B1-ACAT-P2-CONTRA-TRAILER         (434587) = '      32000000
285700              B1-ACAT-P2-TRAILER (B1-IND)                         32010000
285800     DISPLAY                                                      32020000
285900     'CAT650: B1-RES-CREDIT-P2-TRLR             (511224) = '      32030000
286000               B1-RES-CREDIT-P2-TRLR (B1-IND)                     32040000
286100     DISPLAY                                                      32050000
286200     'CAT650: B1-ENTRY-DEL-CASH                 (434625) = '      32060000
286300               B1-ENTRY-DEL-CASH (B1-IND)                         32070000
286400     DISPLAY                                                      32080000
286500     'CAT650: B1-ENTRY-REC-CASH                 (434624) = '      32090000
286600               B1-ENTRY-REC-CASH (B1-IND)                         32100000
286700     DISPLAY                                                      32110000
286800     'CAT650: B1-BEARER-BOND-OPT                (434591) = '      32120000
286900               B1-BEARER-BOND-OPT (B1-IND)                        32130000
287000     DISPLAY                                                      32140000
287100     'CAT650: B1-RESTRICTED-OPT  =                         '      32150000
287200               B1-RESTRICTED-OPT (B1-IND)                         32160000
287300     DISPLAY                                                      32170000
287400     'CAT650: B1-MFRS-NOLOAD-CLIENT             (540113) = '      32180000
287500               B1-MFRS-NOLOAD-CLIENT (B1-IND)                     32190000
287600**** DISPLAY                                                      32200000
287700**** 'CAT650: B1-POST-STL-REJ-BKP               (434610) = '      32210000
287800****           B1-POST-STL-REJ-BKP       (B1-IND)                 32220000
287900**** DISPLAY                                                      32221000
288000**** 'CAT650: B1-FAIL-DELIVR-BATCH-ENTRY        (434656) = '      32222000
288100****          B1-FAIL-DELIVR-BATCH-ENTRY (B1-IND)                 32223000
LRM005     DISPLAY                                                      32224000
LRM005     'CAT650: B1-ACAT-SHADOW-POST               (434686) = '      32225000
LRM005              B1-SHADOW-POST   (B1-IND).                          32226000
LRM022     DISPLAY                                                      32227000
LRM022     'CAT650: B1-ACAT-BOOK-DEBIT-BAL-TYPE1      (434734) = '      32228000
LRM022              B1-ACAT-BOOK-DEBIT-BAL-TYPE1 (B1-IND).              32229000
LRM032     DISPLAY                                                      32230000
LRM032     'CAT650: B1-SFK-RSEC-MEMO                  (434760) = '      32240000
LRM032              B1-SFK-RSEC-MEMO (B1-IND).                          32250000
LRM041     DISPLAY                                                      32260000
LRM041     'CAT650: B1-ACAT-FUNDSERV-PEND-MEMO        (434764) = '      32270000
LRM041              B1-ACAT-FUNDSERV-PEND-MEMO (B1-IND).                32280000
289700****************************************************************  32290000
289800     IF  B1-OFFSET-ACC-NUM (B1-IND) GREATER THAN SPACES           32300000
289900         MOVE  B1-OFFSET-ACC-NUM (B1-IND)                         32310000
290000            TO ALT-OFFSET-BR-ACCT-TYPE                            32320000
290100         CALL  CKDIGIT  USING                                     32330000
290200                        ALT-OFFSET-BR-ACCT-TYPE                   32340000
290300                        LENGTH-KEY                                32350000
290400                        ALT-OFFSET-CHECK-DIGIT                    32360000
290500         END-CALL                                                 32370000
290600     ELSE                                                         32380000
290700         MOVE  CNS-BR-ACCT-T-C TO ALTERNATE-OFFSET-ACCOUNT        32390000
290800     END-IF                                                       32400000
290900                                                                  32410000
LRM021     IF B1-OPTION-OFFSET-ACCOUNT (B1-IND) > SPACES                32420000
LRM021         MOVE  B1-OPTION-OFFSET-ACCOUNT (B1-IND)                  32430000
LRM021            TO ALT-OPTION-OFFSET-BR-ACCT-TYPE                     32440000
LRM021         CALL  CKDIGIT  USING                                     32450000
LRM021                        ALT-OPTION-OFFSET-BR-ACCT-TYPE            32460000
LRM021                        LENGTH-KEY                                32470000
LRM021                        ALT-OPTION-OFFSET-CHECK-DIGIT             32480000
LRM021         END-CALL                                                 32490000
LRM021     ELSE                                                         32500000
LRM021         MOVE  SPACES          TO ALT-OPTION-OFFSET-ACCOUNT       32510000
LRM021     END-IF                                                       32520000
LRM021                                                                  32530000
291000     IF  B1-OFFSET-ROLL-ACC (B1-IND) GREATER THAN SPACES          32540000
291100         MOVE  B1-OFFSET-ROLL-ACC (B1-IND)                        32550000
291200            TO ROL-OFFSET-BR-ACCT-TYPE                            32560000
291300         CALL  CKDIGIT  USING                                     32570000
291400                        ROL-OFFSET-BR-ACCT-TYPE                   32580000
291500                        LENGTH-KEY                                32590000
291600                        ROL-OFFSET-CHECK-DIGIT                    32600000
291700         END-CALL                                                 32610000
291800     ELSE                                                         32620000
291900         MOVE  WS-ROLL-OFFSET-ACC TO ROLLOVER-OFFSET-ACCOUNT      32630000
292000     END-IF.                                                      32640000
292100                                                                  32650000
292200     IF  B1-FUND-SERV-CLIENT (B1-IND)  =  '1'                     32660000
292300         PERFORM  O-LOAD-MEMO-TABLE                               32670000
292400     END-IF.                                                      32680000
292500/                                                                 32690000
292600******************************************************************32700000
292700*** PERFORMED BY:                                              ***32710000
292800***     O-CLIENT-BREAK-SET-UP-NEXT-CL                          ***32720000
292900******************************************************************32730000
293000                                                                  32740000
293100 O-LOAD-MEMO-TABLE.                                               32750000
293200     INITIALIZE  MEMO-TABLE.                                      32760000
293300     MOVE  +1                         TO  MEMO-SUB.               32770000
293400     MOVE  B1-ADP-CL-NO (B1-IND)      TO  MEMO-CLIENT.            32780000
293500     MOVE  B1-ADP-CL-NO (B1-IND)      TO  MEMO-CLNT.              32790000
293600     PERFORM                                                      32800000
293700       UNTIL  MEMO-ENDFILE  OR                                    32810000
LRM050              MEMO-SUB  >  +6                                     32820000
293900         EVALUATE  MEMO-SUB                                       32830000
294000           WHEN  1    MOVE  'N1'      TO  MEMO-CODE               32840000
294100           WHEN  2    MOVE  'N2'      TO  MEMO-CODE               32850000
294200           WHEN  3    MOVE  'N3'      TO  MEMO-CODE               32860000
294300           WHEN  4    MOVE  'N4'      TO  MEMO-CODE               32870000
294400           WHEN  5    MOVE  'M9'      TO  MEMO-CODE               32880000
LRM050           WHEN  6    MOVE  'N6'      TO  MEMO-CODE               32890000
294500         END-EVALUATE                                             32900000
294600         READ  MEMO-FILE             INTO MSS-RECORD              32910000
294700         IF  MEMO-ENDFILE  OR                                     32920000
294800             MEMO-NOTFOUND                                        32930000
294900*            PERFORM O-PRINT-ERROR??????                          32940000
295000             CONTINUE                                             32950000
295100         ELSE                                                     32960000
295200           IF  NOT  MEMO-FILE-OK                                  32970000
295300               DISPLAY  'MEMO FILE READ KEY ERROR, STATUS = '     32980000
295400                         MEMO-FILE-STATUS                         32990000
295500               CALL  ABEND          USING ABEND-CODE-4000         33000000
295600           ELSE                                                   33010000
295700               MOVE  MEMO-CODE  TO  MEMO-VALUE (MEMO-SUB)         33020000
295800               MOVE  MSS-SS-LOW-1 (3:3)                           33030000
295900                 TO  MEMO-ACCOUNT (MEMO-SUB) (1:3)                33040000
296000               MOVE  MSS-SS-LOW-1 (11:5)                          33050000
296100                 TO  MEMO-ACCOUNT (MEMO-SUB) (4:5)                33060000
296200               MOVE  MSS-SS-LOW-1 (16:2)                          33070000
296300                 TO  MEMO-ACCOUNT (MEMO-SUB) (9:2)                33080000
296400               MOVE  'S'                                          33090000
296500                 TO  MEMO-ONE-WAY-BATCH (MEMO-SUB) (1:1)          33100000
296600               MOVE  'S'                                          33110000
296700                 TO  MEMO-TWO-WAY-BATCH (MEMO-SUB) (1:1)          33120000
296800               EVALUATE  MSS-NUMBER-OF-OFFSETS                    33130000
296900                 WHEN  1                                          33140000
297000                   MOVE  MSS-MEMO                                 33150000
297100                     TO  MEMO-ONE-WAY-BATCH (MEMO-SUB) (2:2)      33160000
297200                 WHEN  2                                          33170000
297300                   MOVE  MSS-MEMO                                 33180000
297400                     TO  MEMO-TWO-WAY-BATCH (MEMO-SUB) (2:2)      33190000
297500               END-EVALUATE                                       33200000
297600               EVALUATE  MSS-CORR-MEMO-1-NUM-OFFSETS              33210000
297700                 WHEN  1                                          33220000
297800                   MOVE  MSS-CORR-MEMO1                           33230000
297900                     TO  MEMO-ONE-WAY-BATCH (MEMO-SUB) (2:2)      33240000
298000                 WHEN  2                                          33250000
298100                   MOVE  MSS-CORR-MEMO1                           33260000
298200                     TO  MEMO-TWO-WAY-BATCH (MEMO-SUB) (2:2)      33270000
298300               END-EVALUATE                                       33280000
298400               EVALUATE  MSS-CORR-MEMO-2-NUM-OFFSETS              33290000
298500                 WHEN  1                                          33300000
298600                   MOVE  MSS-CORR-MEMO2                           33310000
298700                     TO  MEMO-ONE-WAY-BATCH (MEMO-SUB) (2:2)      33320000
298800                 WHEN  2                                          33330000
298900                   MOVE  MSS-CORR-MEMO2                           33340000
299000                     TO  MEMO-TWO-WAY-BATCH (MEMO-SUB) (2:2)      33350000
299100               END-EVALUATE                                       33360000
299200           END-IF                                                 33370000
299300         END-IF                                                   33380000
299400         ADD  +1                      TO  MEMO-SUB                33390000
299500     END-PERFORM.                                                 33400000
299600     DISPLAY  'MEMO TABLE VALUES'.                                33410000
299700     DISPLAY   MEMO-TABLE.                                        33420000
299800                                                                  33430000
299900/                                                                 33440000
300000******************************************************************33450000
300100*** PERFORMED BY:                                              ***33460000
300200***     O-CLIENT-BREAK                                         ***33470000
300300******************************************************************33480000
300400                                                                  33490000
300500 O-CLIENT-BREAK-ADD-TOT-DB-CR.                                    33500000
300600                                                                  33510000
300700     COMPUTE TOT-CL-BK-DB-VALUE = TOT-CL-BK-CUST-DB-VALUE         33520000
300800                                + TOT-CL-OFFSET-DB-VALUE          33530000
300900                                + TOT-CL-OFFSET-BYP-DB-VALUE      33540000
301000                                + TOT-CL-PEND-DEL-DB-VALUE        33550000
301100                                + TOT-CL-PEND-REC-DB-VALUE        33560000
301200     END-COMPUTE                                                  33570000
301300                                                                  33580000
301400     COMPUTE TOT-CL-BK-CR-VALUE = TOT-CL-BK-CUST-CR-VALUE         33590000
301500                                + TOT-CL-OFFSET-CR-VALUE          33600000
301600                                + TOT-CL-OFFSET-BYP-CR-VALUE      33610000
301700                                + TOT-CL-PEND-DEL-CR-VALUE        33620000
301800                                + TOT-CL-PEND-REC-CR-VALUE        33630000
301900     END-COMPUTE                                                  33640000
302000                                                                  33650000
302100     COMPUTE TOT-CL-BK-DB-QTY = TOT-CL-BK-CUST-DB-QTY             33660000
302200                              + TOT-CL-BK-CNS-DB-QTY              33670000
302300                              + TOT-CL-BK-OPTION-DB-QTY           33680000
302400                              + TOT-CL-OPT-CBOE-DB-QTY            33690000
302500                              + TOT-CL-AMEX-NYSE-DB-QTY           33700000
302600                              + TOT-CL-OPT-PBW-DB-QTY             33710000
302700                              + TOT-CL-OPT-PSE-DB-QTY             33720000
302800                              + TOT-CL-OPT-DFLT-DB-QTY            33730000
302900                              + TOT-N1-MEMO-DB-QTY                33740000
303000                              + TOT-N2-MEMO-DB-QTY                33750000
303100                              + TOT-N3-MEMO-DB-QTY                33760000
303200                              + TOT-N4-MEMO-DB-QTY                33770000
LRM050                              + TOT-N6-MEMO-DB-QTY                33780000
303300                              + TOT-N0-MEMO-DB-QTY                33781000
303400                                + TOT-CL-PEND-DEL-DB-QTY          33782000
303500                                + TOT-CL-PEND-REC-DB-QTY          33783000
303600     END-COMPUTE                                                  33784000
303700                                                                  33785000
303800     COMPUTE TOT-CL-BK-CR-QTY = TOT-CL-BK-CUST-CR-QTY             33786000
303900                              + TOT-CL-BK-CNS-CR-QTY              33787000
304000                              + TOT-CL-BK-OPTION-CR-QTY           33788000
304100                              + TOT-CL-OPT-CBOE-CR-QTY            33789000
304200                              + TOT-CL-AMEX-NYSE-CR-QTY           33790000
304300                              + TOT-CL-OPT-PBW-CR-QTY             33800000
304400                              + TOT-CL-OPT-PSE-CR-QTY             33810000
304500                              + TOT-CL-OPT-DFLT-CR-QTY            33820000
304600                              + TOT-N1-MEMO-CR-QTY                33830000
304700                              + TOT-N2-MEMO-CR-QTY                33840000
304800                              + TOT-N3-MEMO-CR-QTY                33850000
304900                              + TOT-N4-MEMO-CR-QTY                33860000
LRM050                              + TOT-N6-MEMO-CR-QTY                33870000
305000                              + TOT-N0-MEMO-CR-QTY                33880000
305100                                + TOT-CL-PEND-DEL-CR-QTY          33890000
305200                                + TOT-CL-PEND-REC-CR-QTY          33900000
305300     END-COMPUTE                                                  33910000
305400                                                                  33920000
305500     COMPUTE TOT-CL-DB-VALUE = TOT-CL-BK-CUST-DB-VALUE            33930000
305600                             + TOT-CL-OFFSET-DB-VALUE             33940000
305700                             + TOT-CL-OFFSET-BYP-DB-VALUE         33950000
305800                             + TOT-CL-RD-CL-DB-VALUE              33960000
305900                                + TOT-CL-PEND-DEL-DB-VALUE        33970000
306000                                + TOT-CL-PEND-REC-DB-VALUE        33980000
306100     END-COMPUTE                                                  33990000
306200                                                                  34000000
306300     COMPUTE TOT-CL-CR-VALUE = TOT-CL-BK-CUST-CR-VALUE            34010000
306400                             + TOT-CL-OFFSET-CR-VALUE             34020000
306500                             + TOT-CL-OFFSET-BYP-CR-VALUE         34030000
306600                             + TOT-CL-RD-CL-CR-VALUE              34040000
306700                                + TOT-CL-PEND-DEL-CR-VALUE        34050000
306800                                + TOT-CL-PEND-REC-CR-VALUE        34060000
306900     END-COMPUTE                                                  34070000
307000                                                                  34080000
307100     COMPUTE TOT-CL-DB-QTY   = TOT-CL-BK-CUST-DB-QTY              34090000
307200                             + TOT-CL-BK-CNS-DB-QTY               34100000
307300                             + TOT-CL-RD-CL-DB-QTY                34110000
307400                             + TOT-CL-BK-OPTION-DB-QTY            34120000
307500                             + TOT-CL-OPT-CBOE-DB-QTY             34130000
307600                             + TOT-CL-AMEX-NYSE-DB-QTY            34140000
307700                             + TOT-CL-OPT-PBW-DB-QTY              34150000
307800                             + TOT-CL-OPT-PSE-DB-QTY              34160000
307900                             + TOT-CL-OPT-DFLT-DB-QTY             34170000
308000                              + TOT-N1-MEMO-DB-QTY                34180000
308100                              + TOT-N2-MEMO-DB-QTY                34190000
308200                              + TOT-N3-MEMO-DB-QTY                34200000
308300                              + TOT-N4-MEMO-DB-QTY                34210000
LRM050                              + TOT-N6-MEMO-DB-QTY                34220000
308400                              + TOT-N0-MEMO-DB-QTY                34230000
308500                                + TOT-CL-PEND-DEL-DB-QTY          34240000
308600                                + TOT-CL-PEND-REC-DB-QTY          34250000
308700     END-COMPUTE                                                  34260000
308800                                                                  34270000
308900     COMPUTE TOT-CL-CR-QTY   = TOT-CL-BK-CUST-CR-QTY              34280000
309000                             + TOT-CL-BK-CNS-CR-QTY               34290000
309100                             + TOT-CL-RD-CL-CR-QTY                34300000
309200                             + TOT-CL-BK-OPTION-CR-QTY            34310000
309300                             + TOT-CL-OPT-CBOE-CR-QTY             34320000
309400                             + TOT-CL-AMEX-NYSE-CR-QTY            34330000
309500                             + TOT-CL-OPT-PBW-CR-QTY              34340000
309600                             + TOT-CL-OPT-PSE-CR-QTY              34350000
309700                             + TOT-CL-OPT-DFLT-CR-QTY             34360000
309800                              + TOT-N1-MEMO-CR-QTY                34370000
309900                              + TOT-N2-MEMO-CR-QTY                34380000
310000                              + TOT-N3-MEMO-CR-QTY                34390000
310100                              + TOT-N4-MEMO-CR-QTY                34400000
LRM050                              + TOT-N6-MEMO-CR-QTY                34410000
310200                              + TOT-N0-MEMO-CR-QTY                34420000
310300                                + TOT-CL-PEND-DEL-CR-QTY          34430000
310400                                + TOT-CL-PEND-REC-CR-QTY          34440000
310500     END-COMPUTE                                                  34450000
310600                                                                  34460000
310700     IF  TOT-CL-DB-VALUE  NOT =  TOT-CL-CR-VALUE                  34470000
310800         DISPLAY 'CLIENT TOTAL VALUE DEBITS & CREDITS DONT AGREE' 34480000
310900         DISPLAY 'CLIENT VALUE DEBITS  = ' TOT-CL-DB-VALUE        34490000
311000         DISPLAY 'CLIENT VALUE CREDITS = ' TOT-CL-CR-VALUE        34500000
311100*        CALL  ABEND        USING ABEND-CODE-4000                 34510000
311200     END-IF                                                       34520000
311300                                                                  34530000
311400     IF  TOT-CL-DB-QTY    NOT =  TOT-CL-CR-QTY                    34540000
311500         DISPLAY 'CLIENT TOTAL QTY DEBITS & CREDITS DONT AGREE'   34550000
311600         DISPLAY 'CLIENT QTY DEBITS  = ' TOT-CL-DB-QTY            34560000
311700         DISPLAY 'CLIENT QTY CREDITS = ' TOT-CL-CR-QTY            34570000
311800*        CALL  ABEND        USING ABEND-CODE-4000                 34580000
311900     END-IF.                                                      34590000
312000/                                                                 34600000
312100******************************************************************34610000
312200*** PERFORMED BY:                                              ***34620000
312300***     O-CLIENT-BREAK                                         ***34630000
312400******************************************************************34640000
312500                                                                  34650000
312600 O-CLIENT-BREAK-DISPLAY-TOTALS.                                   34660000
312700                                                                  34670000
312800     IF  CL-OUT-CNTR-TYPE (CL-O-CNTR-X) = 'N'                     34680000
312900         MOVE CL-OUT-CNTR-RECS (CL-O-CNTR-X)                      34690000
313000                                   TO CNTR-MASK-RECS              34700000
313100     ELSE                                                         34710000
313200         IF  CL-OUT-CNTR-TYPE (CL-O-CNTR-X) = 'M'                 34720000
313300             MOVE CL-OUT-CNTR-MONEY (CL-O-CNTR-X)                 34730000
313400                                   TO CNTR-MASK-MONEY             34740000
313500         ELSE                                                     34750000
313600           IF  CL-OUT-CNTR-TYPE (CL-O-CNTR-X) = 'S'               34760000
313700               MOVE CL-OUT-CNTR-SHARE (CL-O-CNTR-X)               34770000
313800                                   TO CNTR-MASK-SHARE             34780000
313900           ELSE                                                   34790000
314000             MOVE SPACES TO CNTR-MASK                             34800000
314100           END-IF                                                 34810000
314200         END-IF                                                   34820000
314300     END-IF                                                       34830000
314400                                                                  34840000
314500     DISPLAY CL-OUT-CNTR-DESC (CL-O-CNTR-X) CNTR-MASK.            34850000
314600/                                                                 34860000
314700******************************************************************34870000
314800*** PERFORMED BY:                                              ***34880000
314900***     O-CLIENT-BREAK                                         ***34890000
315000******************************************************************34900000
315100                                                                  34910000
315200 O-CLIENT-BREAK-ROLL-TOTALS.                                      34920000
315300                                                                  34930000
315400     ADD TOT-CL-ASSETS            TO FDL-TOT-ASSETS               34940000
315500     ADD TOT-CL-ACCOUNTS          TO FDL-TOT-ACTS                 34950000
315600     ADD TOT-CL-VALID-SORT-RECS   TO TOT-VALID-SORT-RECS          34960000
315700     ADD TOT-CL-INVALID-SORT-RECS TO TOT-INVALID-SORT-RECS        34970000
315800     ADD TOT-CL-SELECTED-FOR-P2   TO TOT-SELECTED-FOR-P2          34980000
315900     ADD TOT-CL-ACAT-SELECTED-FOR-P2 TO TOT-ACAT-SELECTED-FOR-P2  34990000
316000     ADD TOT-CL-PEND-SELECTED-FOR-P2 TO TOT-PEND-SELECTED-FOR-P2  35000000
316100     ADD TOT-CL-P2-RECS-WRITTEN   TO TOT-P2-RECS-WRITTEN          35010000
316200     ADD TOT-CL-PEND-READ         TO TOT-PEND-READ                35020000
316300     ADD TOT-CL-BK-CUST-DB-VALUE  TO TOT-BK-CUST-DB-VALUE         35030000
316400     ADD TOT-CL-BK-CUST-CR-VALUE  TO TOT-BK-CUST-CR-VALUE         35040000
316500     ADD TOT-CL-BK-CUST-DB-QTY    TO TOT-BK-CUST-DB-QTY           35050000
316600     ADD TOT-CL-BK-CUST-CR-QTY    TO TOT-BK-CUST-CR-QTY           35060000
316700     ADD TOT-CL-OFFSET-DB-VALUE TO TOT-OFFSET-DB-VALUE            35070000
316800     ADD TOT-CL-OFFSET-CR-VALUE TO TOT-OFFSET-CR-VALUE            35080000
316900     ADD TOT-CL-OFFSET-BYP-DB-VALUE TO TOT-OFFSET-BYP-DB-VALUE    35090000
317000     ADD TOT-CL-OFFSET-BYP-CR-VALUE TO TOT-OFFSET-BYP-CR-VALUE    35100000
317100     ADD TOT-CL-BK-CNS-DB-QTY     TO TOT-BK-CNS-DB-QTY            35110000
317200     ADD TOT-CL-BK-CNS-CR-QTY     TO TOT-BK-CNS-CR-QTY            35120000
317300     ADD TOT-CL-BK-DB-VALUE       TO TOT-BK-DB-VALUE              35130000
317400     ADD TOT-CL-BK-CR-VALUE       TO TOT-BK-CR-VALUE              35140000
317500     ADD TOT-CL-BK-DB-QTY         TO TOT-BK-DB-QTY                35150000
317600     ADD TOT-CL-BK-CR-QTY         TO TOT-BK-CR-QTY                35160000
317700     ADD TOT-CL-RD-CL-DB-VALUE    TO TOT-RD-CL-DB-VALUE           35170000
317800     ADD TOT-CL-RD-CL-CR-VALUE    TO TOT-RD-CL-CR-VALUE           35180000
317900     ADD TOT-CL-RD-CL-DB-QTY      TO TOT-RD-CL-DB-QTY             35190000
318000     ADD TOT-CL-RD-CL-CR-QTY      TO TOT-RD-CL-CR-QTY             35200000
318100     ADD TOT-CL-DB-VALUE          TO TOT-DB-VALUE                 35210000
318200     ADD TOT-CL-CR-VALUE          TO TOT-CR-VALUE                 35220000
318300     ADD TOT-CL-DB-QTY            TO TOT-DB-QTY                   35230000
318400     ADD TOT-CL-CR-QTY            TO TOT-CR-QTY                   35240000
318500     ADD TOT-CL-EARLY-WRITTEN     TO TOT-EARLY-WRITTEN            35250000
318600     ADD TOT-CL-EARLY-DB-VALUE    TO TOT-EARLY-DB-VALUE           35260000
318700     ADD TOT-CL-EARLY-CR-VALUE    TO TOT-EARLY-CR-VALUE           35270000
318800     ADD TOT-CL-EARLY-DB-QTY      TO TOT-EARLY-DB-QTY             35280000
318900     ADD TOT-CL-EARLY-CR-QTY      TO TOT-EARLY-CR-QTY             35290000
319000     ADD TOT-CL-BK-OPTION-DB-QTY TO TOT-BK-OPTION-DB-QTY          35300000
319100     ADD TOT-CL-BK-OPTION-CR-QTY TO TOT-BK-OPTION-CR-QTY          35310000
319200     ADD TOT-CL-OPT-CBOE-DB-QTY  TO TOT-OPT-CBOE-DB-QTY           35320000
319300     ADD TOT-CL-OPT-CBOE-CR-QTY  TO TOT-OPT-CBOE-CR-QTY           35330000
319400     ADD TOT-CL-AMEX-NYSE-DB-QTY TO TOT-AMEX-NYSE-DB-QTY          35340000
319500     ADD TOT-CL-AMEX-NYSE-CR-QTY TO TOT-AMEX-NYSE-CR-QTY          35350000
319600     ADD TOT-CL-OPT-PBW-DB-QTY   TO TOT-OPT-PBW-DB-QTY            35360000
319700     ADD TOT-CL-OPT-PBW-CR-QTY   TO TOT-OPT-PBW-CR-QTY            35370000
319800     ADD TOT-CL-OPT-PSE-DB-QTY   TO TOT-OPT-PSE-DB-QTY            35380000
319900     ADD TOT-CL-OPT-PSE-CR-QTY   TO TOT-OPT-PSE-CR-QTY            35390000
320000     ADD TOT-CL-OPT-DFLT-DB-QTY  TO TOT-OPT-DFLT-DB-QTY           35400000
320100     ADD TOT-CL-OPT-DFLT-CR-QTY  TO TOT-OPT-DFLT-CR-QTY.          35410000
320200/                                                                 35420000
320300******************************************************************35430000
320400*** PERFORMED BY:                                              ***35440000
320500***     SORTED-OUTPUT SECTION                                  ***35450000
320600***     O-CLIENT-BREAK                                         ***35460000
320700******************************************************************35470000
320800                                                                  35480000
320900 O-CLIENT-BREAK-CLEAR-TOTALS.                                     35490000
321000                                                                  35500000
321100     IF  CL-OUT-CNTR-TYPE (CL-O-CNTR-X) = 'N' OR 'M' OR 'S'       35510000
321200         MOVE ZERO TO CL-OUT-CNTR-RECS (CL-O-CNTR-X)              35520000
321300     END-IF.                                                      35530000
321400/                                                                 35540000
321500******************************************************************35550000
321600*** PERFORMED BY:                                              ***35560000
321700***     O-CLIENT-BREAK                                         ***35570000
321800******************************************************************35580000
321900                                                                  35590000
322000 O-CLIENT-BREAK-BILLING.                                          35600000
322100                                                                  35610000
322200     MOVE  B1-ADP-CL-NO (B1-IND)      TO  XBILL-CLT.              35620000
322300     MOVE  'X'                        TO  XBILL-XMS.              35630000
322400                                                                  35640000
322500     IF  TOT-CL-ACCOUNTS  NOT =  0                                35650000
322600         MOVE  XBILL-SEC-ACAT-ACCTS   TO  XBILL-APPL              35660000
322700         MOVE  TOT-CL-ACCOUNTS        TO  XBILL-CNT               35670000
322800         CALL   ZXBILL              USING XBILL-LIST              35680000
322900         IF  XBILL-RC  NOT =  ' '                                 35690000
323000             DISPLAY  'ZXBILL ROUTINE FAILED, RC = ' XBILL-RC     35700000
323100         END-IF                                                   35710000
323200     END-IF.                                                      35720000
323300                                                                  35730000
323400     IF  TOT-CL-ASSETS  NOT =  0                                  35740000
323500         MOVE  XBILL-SEC-ACAT-ASSETS  TO  XBILL-APPL              35750000
323600         MOVE  TOT-CL-ASSETS          TO  XBILL-CNT               35760000
323700         CALL   ZXBILL              USING XBILL-LIST              35770000
323800         IF  XBILL-RC  NOT =  ' '                                 35780000
323900             DISPLAY  'ZXBILL ROUTINE FAILED, RC = ' XBILL-RC     35790000
324000         END-IF                                                   35800000
324100     END-IF.                                                      35810000
324200                                                                  35820000
324300     IF  TOT-CL-FS-RECV  NOT =  0                                 35830000
324400         MOVE  XBILL-SEC-FUND-SERV-RECV TO  XBILL-APPL            35840000
324500         MOVE  TOT-CL-FS-RECV         TO  XBILL-CNT               35850000
324600         CALL   ZXBILL              USING XBILL-LIST              35860000
324700         IF  XBILL-RC  NOT =  ' '                                 35870000
324800             DISPLAY  'ZXBILL ROUTINE FAILED, RC = ' XBILL-RC     35880000
324900         END-IF                                                   35890000
325000     END-IF.                                                      35900000
325100                                                                  35910000
325200     IF  TOT-CL-FS-DELV  NOT =  0                                 35920000
325300         MOVE  XBILL-SEC-FUND-SERV-DELV TO  XBILL-APPL            35930000
325400         MOVE  TOT-CL-FS-DELV         TO  XBILL-CNT               35940000
325500         CALL   ZXBILL              USING XBILL-LIST              35950000
325600         IF  XBILL-RC  NOT =  ' '                                 35960000
325700             DISPLAY  'ZXBILL ROUTINE FAILED, RC = ' XBILL-RC     35970000
325800         END-IF                                                   35980000
325900     END-IF.                                                      35990000
326000                                                                  36000000
326100/                                                                 36010000
326200******************************************************************36020000
326300*** PERFORMED BY:                                              ***36030000
326400***     O-DETERMINE-P2-VS-PENDING                              ***36040000
326500******************************************************************36050000
326600                                                                  36060000
326700 O-FORMAT-P2-RECORD.                                              36070000
326800                                                                  36080000
327300                                                                  36090000
327400     ADD 1 TO TOT-CL-SELECTED-FOR-P2                              36100000
327500     MOVE  'ACAT               BOS' TO P2-BK-DESCRIPTION.         36110000
327600     IF  RECORD-IS-FROM-ACAT-FILE                                 36120000
327700         ADD 1 TO TOT-CL-ACAT-SELECTED-FOR-P2                     36130000
327800     ELSE                                                         36140000
327900         ADD 1 TO TOT-CL-PEND-SELECTED-FOR-P2                     36150000
328000     END-IF                                                       36160000
328100                                                                  36170000
328200     IF CNS OR NON-CNS                                            36180000
328300       IF  NOT (FMT-OPTION OR FMT-CASH)                           36190000
328400          IF  NOT FMT-SHORT                                       36200000
328500             SET FMT-LONG TO TRUE.                                36210000
328600                                                                  36220000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    36230000
              IF  B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) NOT = '2'       36240000
                  CONTINUE                                              36250000
              ELSE                                                      36260000
LRM030           IF PARM-SHAD-RUN                                       36270000
LRM030           AND B1-SERVICE-STATUS (B1-IND) = '1'                   36280000
LRM030           AND B1-SHADOW-POST   (B1-IND) = '1'                    36290000
LRM030           AND (FMT-SETTL-DATE  =   WS-TRADE-PLUS-1               36300000
LRM030           OR  FMT-SETTL-DATE  =  WS-TRADE-PLUS-2)                36310000
LRM030           AND (FMT-STATUS-CD  = '300' OR '310')                  36320000
LRM030                PERFORM O-MFC-P2-CREATE-NEW                       36330000
LRM030           ELSE                                                   36340000
                  IF  B1-SERVICE-STATUS (B1-IND) = '1'                  36350000
                  AND (FMT-SETTL-DATE =  ACAT-PROC-DATE)                36360000
                  AND (FMT-STATUS-CD  =  '300' OR '310')                36370000
                  AND (NOT FMT-MEMO)                                    36380000
                      PERFORM O-MFC-P2-CREATE-NEW                       36390000
                  END-IF                                                36400000
LRM030           END-IF                                                 36410000
              END-IF                                                    36420000
           ELSE                                                         36430000
328700     IF  FMT-CLNT-IS-DELIVERER                                    36440000
328800         PERFORM O-SETUP-DELIVERER-P2                             36450000
328900     ELSE                                                         36460000
329000         PERFORM O-SETUP-RECEIVER-P2                              36461000
329100     END-IF.                                                      36462000
329200/                                                                 36463000
329300******************************************************************36464000
329400*** PERFORMED BY:                                              ***36465000
329500***     O-FORMAT-P2-RECORD                                     ***36466000
329600******************************************************************36467000
329700                                                                  36468000
329800 O-SETUP-DELIVERER-P2.                                            36469000
329900                                                                  36470000
330000     EVALUATE TRUE                                                36480000
330100         WHEN FMT-OPTION                                          36490000
330200             PERFORM O-SETUP-DELIVERER-P2-OPTION                  36500000
330300         WHEN FMT-CASH AND FMT-DEBIT                              36510000
330400             PERFORM O-DLVR-DB-CASH-BAL                           36520000
330500         WHEN FMT-CASH AND FMT-CREDIT                             36530000
330600             PERFORM O-DLVR-CR-CASH-BAL                           36540000
330700         WHEN FMT-LONG                                            36550000
330800             AND CNS                                              36560000
330900             PERFORM O-DLVR-LONG-CNS                              36570000
331000         WHEN FMT-LONG                                            36580000
331100             AND (FMT-FUND-SERV    AND                            36590000
331200                  B1-FUND-SERV-CLIENT  (B1-IND)  =  '1')          36600000
331300             PERFORM O-DLVR-LONG-FUND-SERV                        36610000
LRM005                THRU O-DLVR-LONG-FUND-SERV-EXIT                   36620000
331400         WHEN FMT-LONG                                            36630000
331500             AND (NON-CNS  OR                                     36640000
331600                 (FMT-FUND-SERV    AND                            36650000
331700                  B1-FUND-SERV-CLIENT  (B1-IND)  =  '0'))         36660000
331800           IF  RECORD-IS-FROM-PEND-FILE                           36670000
331900             PERFORM O-DLVR-LONG-NON-CNS                          36680000
332000           END-IF                                                 36690000
332100         WHEN FMT-SHORT                                           36700000
332200             AND CNS                                              36710000
332300             PERFORM O-DLVR-SHORT-CNS                             36720000
332400         WHEN FMT-SHORT                                           36730000
332500             AND NON-CNS                                          36740000
332600             PERFORM O-DLVR-SHORT-NON-CNS                         36750000
332700         WHEN OTHER                                               36751000
332800             CONTINUE                                             36752000
332900     END-EVALUATE.                                                36753000
333000/                                                                 36754000
333100******************************************************************36755000
333200*** PERFORMED BY:                                              ***36756000
333300***     O-SETUP-DELIVERER-P2                                   ***36757000
333400******************************************************************36758000
333500                                                                  36759000
333600 O-SETUP-DELIVERER-P2-OPTION.                                     36760000
333700                                                                  36770000
333800     IF  FMT-BUY                                                  36780000
333900         PERFORM O-DLVR-LONG-OPTION                               36790000
334000     ELSE                                                         36800000
334100         IF  FMT-SELL                                             36810000
334200             PERFORM O-DLVR-SHORT-OPTION                          36820000
334300         END-IF                                                   36830000
334400     END-IF.                                                      36840000
334500/                                                                 36850000
334600******************************************************************36860000
334700*** PERFORMED BY:                                              ***36870000
334800***     O-SETUP-DELIVERER-P2-OPTION                            ***36880000
334900******************************************************************36890000
335000                                                                  36900000
335100 O-DLVR-SHORT-OPTION.                                             36910000
335200                                                                  36920000
335300     MOVE FMT-ADP-SEC-NO TO P2-BK-SECURITY-NBR                    36930000
335400     PERFORM O-BK-OPTION-CR-QUANTITY                              36940000
LRM005     IF NOT PARM-SHAD-RUN                                         36950000
335500        PERFORM O-BK-OPTION-OFFSET-DB-QTY.                        36960000
335600/                                                                 36970000
335700******************************************************************36980000
335800*** PERFORMED BY:                                              ***36990000
335900***     O-SETUP-DELIVERER-P2-OPTION                            ***37000000
336000******************************************************************37010000
336100                                                                  37020000
336200 O-DLVR-LONG-OPTION.                                              37030000
336300     MOVE FMT-ADP-SEC-NO TO P2-BK-SECURITY-NBR                    37040000
336400     PERFORM O-BK-OPTION-DB-QUANTITY                              37050000
LRM005     IF NOT PARM-SHAD-RUN                                         37060000
336500        PERFORM O-BK-OPTION-OFFSET-CR-QTY.                        37070000
336600/                                                                 37080000
336700******************************************************************37090000
336800*** PERFORMED BY:                                              ***37100000
336900***     O-SETUP-DELIVERER-P2                                   ***37110000
337000******************************************************************37120000
337100                                                                  37130000
337200 O-DLVR-DB-CASH-BAL.                                              37140000
337300                                                                  37150000
337400     MOVE SPACES          TO P2-BK-SECURITY-NBR                   37160000
337500     PERFORM O-BK-CUST-CR-VALUE                                   37170000
LRM005     IF NOT PARM-SHAD-RUN                                         37180000
337600        PERFORM O-BK-OFFSET-DB-CASH-VALUE.                        37190000
337700/                                                                 37200000
337800******************************************************************37210000
337900*** PERFORMED BY:                                              ***37220000
338000***     O-SETUP-DELIVERER-P2                                   ***37230000
338100******************************************************************37240000
338200                                                                  37250000
338300 O-DLVR-CR-CASH-BAL.                                              37260000
338400                                                                  37270000
338500     MOVE SPACES          TO P2-BK-SECURITY-NBR                   37280000
338600     PERFORM O-BK-CUST-DB-VALUE                                   37290000
LRM005     IF NOT PARM-SHAD-RUN                                         37300000
338700        PERFORM O-BK-OFFSET-CR-CASH-VALUE.                        37310000
338800/                                                                 37320000
338900******************************************************************37330000
339000*** PERFORMED BY:                                              ***37340000
339100***     O-SETUP-DELIVERER-P2                                   ***37350000
339200******************************************************************37360000
339300                                                                  37370000
339400 O-DLVR-LONG-CNS.                                                 37380000
339500                                                                  37390000
339600     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   37400000
339700     PERFORM O-BK-CUST-CR-QUANTITY                                37410000
LRM005     IF NOT PARM-SHAD-RUN                                         37420000
339800        PERFORM O-BK-CNS-DB-QUANTITY.                             37430000
339900/                                                                 37440000
340000******************************************************************37450000
340100*** PERFORMED BY:                                              ***37460000
340200***     O-SETUP-DELIVERER-P2                                   ***37470000
340300******************************************************************37480000
340400                                                                  37490000
340500 O-DLVR-LONG-FUND-SERV.                                           37500000
340600                                                                  37510000
340700*****                                                             37520000
340800*    DISPLAY '  '                                                 37530000
340900*    DISPLAY '=============================='                     37540000
341000*    DISPLAY 'O-DLVR-LONG-FUND-SERV =======>'                     37550000
341100*    DISPLAY '=============================='                     37560000
341200*****                                                             37570000
341300     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   37580000
341400                                                                  37590000
341500******************************************************************37600000
341600****  CHANGES MADE FOR ACAT FAILS FOR FUND SERVE ITEMS      ******37610000
341700**** AS PER SPECS: (NEW B1 = 434617)                          ****37620000
341800***  DELIVER REJECTED ON SETTLEMENT DATE =====>                  *37630000
341900* FAIL ACCOUNT :                                                 *37640000
342000*     THE FAIL TO DELIVER ACCOUNT 4-06, WILL BE DEBITED FOR THE  *37650000
342100*     SHARES & MONEY.  THE BATCH CODE AND THE ENTRY CODE ARE USED*37660000
342200*     ARE DEFINED IN B1434656                                    *37670000
342300* NOTE: THE SYSTEM IS CURRENTLY GENERATEING A DEBIT ENTRY TO THE *37680000
342400*       PENDING ACCOUNT FOR SHARES & MONEY.  THIS ENTRY WILL BE  *37690000
342500*       DISCONTINUED.                                            *37700000
342600*                                                                *37710000
342700***  DELIVER REJECTED AFTER SETTLEMENT DATE =====>               *37720000
342800* FAIL ACCOUNT :                                                 *37730000
342900*     THE FAIL TO DELIVER ACCOUNT 4-06, WILL BE DEBITED FOR THE  *37740000
343000*     SHARES & MONEY.  THE BATCH CODE AND THE ENTRY CODE ARE USED*37750000
343100*     ARE DEFINED IN B1434657(THESE ARE THE SAME BATCH & ENTRY   *37760000
343200*     CODES THAT ARE USED TO SET UP FAILS ON SETTLEMENT DATE,    *37770000
343300*     THE CREATION OF THIS ENTRY IS ALSO CONTROLLED BY B1# 434610*37780000
343400* PENDING ACCOUNT :                                              *37790000
343500*     IS CREDITED THE SHARES AND MONEY. IF B1434610 HAS A VALUE  *37800000
343600*     OF 1, NO ENTRY IS MADE TO THE PENDING ACCOUNT.             *37810000
343700*                                                                *37820000
343800******************************************************************37830000
LRM005     IF PARM-SHAD-RUN                                             37840000
LRM005        IF FMT-SETTL-DATE = WS-TRADE-PLUS-1                       37850000
LRM005           PERFORM O-BK-CUST-CR-QUANTITY                          37860000
LRM005        END-IF                                                    37870000
LRM005        GO TO O-DLVR-LONG-FUND-SERV-EXIT                          37880000
LRM005     END-IF                                                       37890000
                                                                        37900000
343900     IF  FMT-SETTL-DATE  =  ACAT-PROC-DATE                        37910000
344000         PERFORM O-BK-CUST-CR-QUANTITY                            37920000
344100         PERFORM O-BK-OFFSET-CR-VALUE                             37930000
344200       EVALUATE TRUE                                              37940000
344300         WHEN  FMT-ACCEPTED-BY-FUND                               37950000
LRM050         WHEN  FMT-PENDING-FUND-APPROV                            37960000
LRM050               AND  DST-DIRECT                                    37970000
LRM050               AND NTWIO-MATRIX-LEVEL = '6'                       37980000
LRM050               AND  MEMO-TWO-WAY-BATCH (6) > SPACES               37990000
344400           PERFORM O-BK-MEMO-CR-QUANTITY                          38000000
344500           PERFORM O-BK-PEND-DB-VALUE                             38010000
344600         WHEN  FMT-REJECTED-BY-FUND                               38020000
345100*******     TREATE THIS AS PENDING FOR ANOTHER DAY IF POST S/D    38030000
345100*******     B1 IS NOT ON                                          38040000
                                                                        38050000
345000***YH01 FOR REJECTED, CAGEFAIL WILL BE THE OFFSET                 38060000
345000***YH01      IF FMT-SETTL-DATE  =  FMT-UPDT-TMSTP                 38070000
345600***YH01          PERFORM O-BK-PEND-DB-BOTH                        38080000
345800***YH01      ELSE                                                 38090000
345900***YH01          PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY             38100000
346000***YH01      END-IF                                               38110000
YH0001           IF  B1-POST-STL-REJ-BKP    (B1-IND) = '0'              38120000
345900                 PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY             38130000
                 ELSE                                                   38140000
                  IF  FMT-TI-ADP-CL-NO  =  63                           38150000
                      PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY              38160000
                  ELSE                                                  38170000
345000             IF FMT-SETTL-DATE  =  FMT-UPDT-TMSTP                 38180000
345600                 PERFORM O-BK-PEND-DB-BOTH                        38190000
345800             ELSE                                                 38200000
345900                 PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY             38210000
346000             END-IF                                               38220000
346000            END-IF                                                38230000
                 END-IF                                                 38240000
346200         WHEN  OTHER                                              38250000
346300           PERFORM O-BK-PEND-DB-BOTH                              38260000
346400       END-EVALUATE                                               38270000
346500     ELSE                                                         38280000
346600       EVALUATE TRUE                                              38290000
346700         WHEN  FMT-ACCEPTED-BY-FUND                               38300000
346800           PERFORM O-BK-MEMO-CR-QUANTITY                          38310000
LRM005           IF PARM-SHAD-RUN                                       38320000
LRM005              GO TO O-DLVR-LONG-FUND-SERV-EXIT                    38330000
LRM005           END-IF                                                 38340000
346900           PERFORM O-BK-PEND-CR-QUANTITY                          38350000
347000         WHEN  FMT-REJECTED-BY-FUND                               38360000
YH0001****** THIS SWITCH IS ALREADY ON  BUT........                     38370000
YH0001           IF  B1-POST-STL-REJ-BKP    (B1-IND) = '0'              38380000
347500               PERFORM O-BK-PEND-CR-BOTH                          38390000
347900           END-IF                                                 38400000
YH0001*** THIS SEEMS TO BE MAING OUT OF BALANCE IN SHARES               38410000
YH0001***        PERFORM O-RD-CL-DB-QUANTITY                            38420000
348100         WHEN  OTHER                                              38430000
348200           CONTINUE                                               38440000
348300       END-EVALUATE                                               38450000
348400     END-IF.                                                      38460000
LRM005 O-DLVR-LONG-FUND-SERV-EXIT. EXIT.                                38470000
348500/                                                                 38480000
348600******************************************************************38481000
348700*** PERFORMED BY:                                              ***38482000
348800***     O-SETUP-DELIVERER-P2                                   ***38483000
348900******************************************************************38484000
349000                                                                  38485000
349100 O-DLVR-LONG-NON-CNS.                                             38486000
349300                                                                  38487000
349400     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   38488000
349500     PERFORM O-BK-CUST-CR-QUANTITY                                38489000
LRM005     IF NOT PARM-SHAD-RUN                                         38489100
349600        PERFORM O-BK-OFFSET-CR-VALUE                              38489200
349700        PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY.                     38489300
LRM053     IF B1-ACAT-FUNDSERV-PEND-MEMO (B1-IND) > SPACES              38489400
LRM053     AND ((FMT-TRNFR-TYPE = 'MFC'                                 38489500
LRM053       AND B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) NOT = '1')       38489600
LRM053     OR (FMT-TRNFR-TYPE = 'FRV'                                   38489700
LRM053     AND NOT FMT-SAFE-KEEPING                                     38489800
LRM053     AND FMT-MUTUAL-FUND))                                        38489900
LRM053       PERFORM O-CUST-ACT-MOVE-BR-ACT                             38490000
LRM053       IF FMT-MEMO-ORG-RVRSL-QTY > ZERO                           38490100
LRM053       AND FMT-MEMO-ORG-RVRSL-QTY NOT =  FMT-ASSET-QTY-DEC        38490200
LRM053          MOVE FMT-MEMO-ORG-RVRSL-QTY TO P2-BK-QUANTITY           38490300
LRM053                                         P2-BK-FRACTION           38490400
LRM053          DISPLAY 'LONG-NON-CNS ORIG DLVY QTY ON FUNDSERV MEMO'   38490500
LRM053          DISPLAY '    RCVR-LONG-NON ' FMT-ADP-SEC-NO             38490600
LRM053           ' ' FMT-MEMO-ORG-RVRSL-QTY ' BK= ' P2-BK-QUANTITY      38490700
LRM053       ELSE                                                       38490800
LRM053          MOVE FMT-ASSET-QTY-DEC      TO P2-BK-QUANTITY           38490900
LRM053                                         P2-BK-FRACTION           38491000
LRM053          DISPLAY 'RCVR-LONG-NON ' FMT-ADP-SEC-NO                 38491100
LRM053          DISPLAY '    LONG-NON-CNS FUNDSERV MEMO1 '              38491215
LRM053            ' BK= ' P2-BK-QUANTITY                                38491300
LRM053       END-IF                                                     38491400
LRM053       MOVE 'S' TO P2-BK-TRID-X                                   38491500
LRM053       MOVE B1-ACAT-FUNDSERV-PEND-MEMO(B1-IND) TO P2-BK-BATCH-CODE38491600
LRM053       MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE                38491700
LRM053       MOVE ZERO            TO P2-BK-AMOUNT                       38491800
LRM053       WRITE P2BKPG-RECORD FROM P2-BK-RECORD                      38491900
LRM053       ADD 1 TO TOT-CL-P2-RECS-WRITTEN                            38492000
LRM053     END-IF.                                                      38492100
349800/                                                                 38492200
349900******************************************************************38492300
350000*** PERFORMED BY:                                              ***38492400
350100***     O-SETUP-DELIVERER-P2                                   ***38492500
350200******************************************************************38492600
350300                                                                  38492700
350400 O-DLVR-SHORT-CNS.                                                38493000
350600                                                                  38500000
351400     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   38510000
351500     PERFORM O-BK-CUST-DB-QUANTITY                                38520000
LRM005     IF NOT PARM-SHAD-RUN                                         38530000
351600        PERFORM O-BK-CNS-CR-QUANTITY.                             38540000
351700/                                                                 38550000
351800******************************************************************38560000
351900*** PERFORMED BY:                                              ***38570000
352000***     O-SETUP-DELIVERER-P2                                   ***38580000
352100******************************************************************38590000
352200                                                                  38600000
352300 O-DLVR-SHORT-NON-CNS.                                            38610000
352500                                                                  38620000
352600     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   38630000
352700     PERFORM O-BK-CUST-DB-QUANTITY                                38640000
LRM005     IF NOT PARM-SHAD-RUN                                         38650000
352800        PERFORM O-BK-OFFSET-DB-VALUE                              38660000
352900        PERFORM O-RD-CL-CR-VALUE-CR-QUANTITY.                     38670000
353000/                                                                 38680000
353100******************************************************************38690000
353200*** PERFORMED BY:                                              ***38700000
353300***     O-FORMAT-P2-RECORD                                     ***38710000
353400******************************************************************38720000
353500                                                                  38730000
353600 O-SETUP-RECEIVER-P2.                                             38740000
353700                                                                  38750000
353800     EVALUATE TRUE                                                38760000
353900         WHEN  FMT-OPTION                                         38770000
354000             PERFORM O-SETUP-RECEIVER-P2-OPTION                   38780000
354100         WHEN  FMT-CASH AND FMT-DEBIT                             38790000
354200             PERFORM O-RCVR-DB-CASH-BAL                           38800000
354300         WHEN  FMT-CASH AND FMT-CREDIT                            38810000
354400             PERFORM O-RCVR-CR-CASH-BAL                           38820000
354500         WHEN  FMT-LONG                                           38830000
354600             AND CNS                                              38840000
354700             PERFORM O-RCVR-LONG-CNS                              38850000
354800         WHEN  FMT-LONG                                           38860000
354900             AND (FMT-FUND-SERV    AND                            38870000
355000                  B1-FUND-SERV-CLIENT  (B1-IND)  =  '1')          38880000
355100             PERFORM O-RCVR-LONG-FUND-SERV                        38890000
LRM005                THRU O-RCVR-LONG-FUND-SERV-EXIT                   38900000
355200         WHEN  FMT-LONG                                           38910000
355300             AND (NON-CNS  OR                                     38920000
355400                 (FMT-FUND-SERV    AND                            38930000
355500                  B1-FUND-SERV-CLIENT  (B1-IND)  =  '0'))         38940000
355600           IF  RECORD-IS-FROM-PEND-FILE                           38950000
355700             PERFORM O-RCVR-LONG-NON-CNS                          38960000
355800           END-IF                                                 38970000
355900         WHEN FMT-SHORT                                           38980000
356000             AND CNS                                              38990000
356100             PERFORM O-RCVR-SHORT-CNS                             39000000
356200         WHEN  FMT-SHORT                                          39010000
356300             AND NON-CNS                                          39020000
356400             PERFORM O-RCVR-SHORT-NON-CNS                         39030000
356500         WHEN  OTHER                                              39040000
356600             CONTINUE                                             39050000
356700     END-EVALUATE.                                                39060000
356800/                                                                 39070000
356900******************************************************************39080000
357000*** PERFORMED BY:                                              ***39090000
357100***     O-SETUP-RECEIVER-P2                                    ***39100000
357200******************************************************************39110000
357300                                                                  39120000
357400 O-SETUP-RECEIVER-P2-OPTION.                                      39130000
357500                                                                  39140000
357600     IF  FMT-BUY                                                  39150000
357700         PERFORM O-RCVR-LONG-OPTION                               39160000
357800     ELSE                                                         39170000
357900         IF  FMT-SELL                                             39180000
358000             PERFORM O-RCVR-SHORT-OPTION                          39190000
358100         END-IF                                                   39200000
358200     END-IF.                                                      39210000
358300/                                                                 39220000
358400******************************************************************39230000
358500*** PERFORMED BY:                                              ***39240000
358600***     O-SETUP-RECEIVER-P2-OPTION                             ***39250000
358700******************************************************************39260000
358800                                                                  39270000
358900 O-RCVR-LONG-OPTION.                                              39280000
359000                                                                  39290000
359100     MOVE FMT-ADP-SEC-NO TO P2-BK-SECURITY-NBR                    39300000
359200     PERFORM O-BK-OPTION-DB-QUANTITY                              39310000
LRM005     IF NOT PARM-SHAD-RUN                                         39320000
359300        PERFORM O-BK-OPTION-OFFSET-CR-QTY.                        39330000
359400/                                                                 39340000
359500******************************************************************39350000
359600*** PERFORMED BY:                                              ***39360000
359700***     O-SETUP-RECEIVER-P2-OPTION                             ***39370000
359800******************************************************************39380000
359900                                                                  39390000
360000 O-RCVR-SHORT-OPTION.                                             39400000
360100     MOVE FMT-ADP-SEC-NO TO P2-BK-SECURITY-NBR                    39410000
360200     PERFORM O-BK-OPTION-CR-QUANTITY                              39420000
LRM005     IF NOT PARM-SHAD-RUN                                         39430000
360300        PERFORM O-BK-OPTION-OFFSET-DB-QTY.                        39440000
360400/                                                                 39450000
360500******************************************************************39460000
360600*** PERFORMED BY:                                              ***39470000
360700***     O-SETUP-RECEIVER-P2                                    ***39480000
360800******************************************************************39490000
360900                                                                  39500000
361000 O-RCVR-DB-CASH-BAL.                                              39510000
361100                                                                  39520000
361200     MOVE SPACES          TO P2-BK-SECURITY-NBR                   39530000
361300     PERFORM O-BK-CUST-DB-VALUE                                   39540000
LRM005     IF NOT PARM-SHAD-RUN                                         39550000
361400        PERFORM O-BK-OFFSET-CR-CASH-VALUE.                        39560000
361500/                                                                 39570000
361600******************************************************************39580000
361700*** PERFORMED BY:                                              ***39590000
361800***     O-SETUP-RECEIVER-P2                                    ***39600000
361900******************************************************************39610000
362000                                                                  39620000
362100 O-RCVR-CR-CASH-BAL.                                              39630000
362200                                                                  39640000
362300     MOVE SPACES          TO P2-BK-SECURITY-NBR                   39650000
362400     PERFORM O-BK-CUST-CR-VALUE                                   39660000
LRM005     IF NOT PARM-SHAD-RUN                                         39670000
362500        PERFORM O-BK-OFFSET-DB-CASH-VALUE.                        39680000
362600/                                                                 39690000
362700******************************************************************39700000
362800*** PERFORMED BY:                                              ***39710000
362900***     O-SETUP-RECEIVER-P2                                    ***39720000
363000******************************************************************39730000
363100                                                                  39740000
363200 O-RCVR-LONG-CNS.                                                 39750000
363400                                                                  39760000
363500     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   39770000
363600     PERFORM O-BK-CUST-DB-QUANTITY                                39780000
LRM005     IF NOT PARM-SHAD-RUN                                         39790000
363700        PERFORM O-BK-CNS-CR-QUANTITY.                             39800000
363800/                                                                 39810000
363900******************************************************************39820000
364000*** PERFORMED BY:                                              ***39830000
364100***     O-SETUP-RECEIVER-P2                                    ***39840000
364200******************************************************************39850000
364300                                                                  39860000
364400 O-RCVR-LONG-FUND-SERV.                                           39870000
364600                                                                  39880000
364700******************************************************************39890000
364800****  CHANGES MADE FOR ACAT FAILS FOR FUND SERVE ITEMS      ******39900000
364900**** AS PER SPECS: (NEW B1 = 434617)                          ****39910000
365000***  RECEIVER REJECTED ON SETTLEMENT DATE =====>                 *39920000
365100* FAIL ACCOUNT :                                                 *39930000
365200*     THE FAIL TO RECEIVR ACCOUNT 3-07, WILL BE CREDITED FOR THE *39940000
365300*     SHARES & MONEY.  THE BATCH CODE AND THE ENTRY CODE ARE USED*39950000
365400*     ARE DEFINED IN B1434657                                    *39960000
365500* NOTE: THE SYSTEM IS CURRENTLY GENERATEING A CREDIT ENTRY TO THE*39970000
365600*       PENDING ACCOUNT FOR SHARES & MONEY.  THIS ENTRY WILL BE  *39980000
365700*       DISCONTINUED.                                            *39990000
365800*                                                                *40000000
365900***  RECEIVER REJECTED AFTER SETTLEMENT DATE =====>              *40010000
366000* FAIL ACCOUNT :                                                 *40020000
366100*     THE FAIL TO RECEIVER ACCOUNT 3-07, WILL BE CREDITED FOR THE*40030000
366200*     SHARES & MONEY.  THE BATCH CODE AND THE ENTRY CODE ARE USED*40040000
366300*     ARE DEFINED IN B1434657(THESE ARE THE SAME BATCH & ENTRY   *40050000
366400*     CODES THAT ARE USED TO SET UP FAILS ON SETTLEMENT DATE,    *40060000
366500*     THE CREATION OF THIS ENTRY IS ALSO CONTROLLED BY B1 434610 *40070000
366600* PENDING ACCOUNT :                                              *40080000
366700*     IS CREDITED THE SHARES AND MONEY. IF B1434610 HAS A VALUE  *40090000
366800*     OF 1, NO ENTRY IS MADE TO THE PENDING ACCOUNT.             *40100000
366900*                                                                *40110000
367000******************************************************************40120000
367100     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   40130000
367200                                                                  40140000
LRM007     IF PARM-SHAD-RUN                                             40150000
LRM007        IF FMT-SETTL-DATE = WS-TRADE-PLUS-1                       40160000
LRM007           PERFORM O-BK-CUST-DB-QUANTITY                          40170000
LRM007        END-IF                                                    40180000
LRM007        GO TO O-RCVR-LONG-FUND-SERV-EXIT                          40190000
LRM007     END-IF                                                       40200000
                                                                        40210000
367300     IF  FMT-SETTL-DATE  =  ACAT-PROC-DATE                        40220000
367400         PERFORM O-BK-CUST-DB-QUANTITY                            40230000
367500         PERFORM O-BK-OFFSET-DB-VALUE                             40240000
367600       EVALUATE TRUE                                              40250000
367700         WHEN  FMT-ACCEPTED-BY-FUND                               40260000
367800           PERFORM O-BK-MEMO-DB-QUANTITY                          40270000
367900           IF  B1-MFRS-ACTIVE (B1-IND)  =  'A'  AND               40280000
368000               FMT-NTWRK-CNTL-CD = '0' AND FMT-FUND-BK-CD = 'BC'  40290000
368100               MOVE 'BNS' TO P2-BK-TRID                           40300000
368200               MOVE FMT-TI-ADP-CL-NO   TO P2-BK-BROKER-NBR        40310000
368300               MOVE P2-CREDIT-SIGN     TO P2-BK-BUY-SELL-CODE     40320000
368400               PERFORM O-CUST-ACT-MOVE-BR-ACT                     40330000
368500               MOVE 'SHARES HELD AT FUND' TO P2-BK-DESCRIPTION    40340000
368600               MOVE ZERO               TO P2-BK-AMOUNT            40350000
368700               MOVE  FMT-ASSET-QUAN    TO  WS-QTY                 40360000
368800               MOVE WS-QTY             TO P2-BK-QUANTITY          40370000
368900               MOVE WS-QTY             TO P2-BK-FRACTION          40380000
369000               ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CUST-CR-QTY   40390000
369100               PERFORM O-WRITE-P2-ENTRY-CODE                      40400000
369200               WRITE P2BKPG-RECORD FROM P2-BK-RECORD              40410000
369300               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    40420000
369400                                                                  40430000
369500               MOVE SPACES TO P2-BK-TRAILER-RECORD                40440000
369600               MOVE P2-BK-RECORD TO P2-BK-TRAILER-RECORD          40450000
369700               MOVE 'CUST# ' TO P2-BKT-DESCRIPTION                40460000
369800               MOVE FMT-FNBR                                      40470000
369900                             TO P2-BKT-DESCRIPTION (7:20)         40480000
370000               MOVE SPACES TO P2-BKT-QUANTITY-X                   40490000
370100                              P2-BKT-ENTRY-CODE                   40500000
370200                              P2-BKT-AMOUNT-X                     40510000
370300               MOVE '-' TO P2-BKT-HYPHEN                          40520000
370400               MOVE 0 TO P2-BKT-FRACTION                          40530000
370500               WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD      40540000
370600               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    40550000
370700* ACAT TRAILER PROCESSING                                         40560000
370800               IF (B1-ACAT-P2-TRAILER (B1-IND) =                  40570000
370900                                      '1' OR '2' OR '3') AND      40580000
371000                  (FMT-CLNT-IS-RECEIVER OR FMT-CLNT-IS-DELIVERER) 40590000
371100                 PERFORM O-WRITE-ACAT-P2-TRAILER                  40600000
371200               END-IF                                             40610000
371300                                                                  40620000
371400               MOVE 'BNS' TO P2-BK-TRID                           40630000
371500               MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR          40640000
371600               MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE         40650000
371700               MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C 40660000
371800               MOVE 'SHARES HELD AT FUND' TO P2-BK-DESCRIPTION    40670000
371900               MOVE ZERO               TO P2-BK-AMOUNT            40680000
372000               MOVE  FMT-ASSET-QUAN    TO  WS-QTY                 40690000
372100               MOVE WS-QTY             TO P2-BK-QUANTITY          40700000
372200               MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION     40710000
372300               ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CNS-DB-QTY    40720000
372400               PERFORM O-WRITE-P2-ENTRY-CODE                      40730000
372500               WRITE P2BKPG-RECORD FROM P2-BK-RECORD              40740000
372600               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    40750000
372700                                                                  40760000
372800               MOVE SPACES TO P2-BK-TRAILER-RECORD                40770000
372900               MOVE P2-BK-RECORD TO P2-BK-TRAILER-RECORD          40780000
373000               MOVE 'CUST# ' TO P2-BKT-DESCRIPTION                40790000
373100               MOVE FMT-FNBR                                      40800000
373200                             TO P2-BKT-DESCRIPTION (7:20)         40810000
373300               MOVE SPACES TO P2-BKT-QUANTITY-X                   40820000
373400                              P2-BKT-ENTRY-CODE                   40830000
373500                              P2-BKT-AMOUNT-X                     40840000
373600               MOVE '-' TO P2-BKT-HYPHEN                          40850000
373700               MOVE 0 TO P2-BKT-FRACTION                          40860000
373800               WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD      40870000
373900               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    40880000
374000                                                                  40890000
374100* ACAT TRAILER PROCESSING                                         40900000
374200               IF (B1-ACAT-P2-TRAILER (B1-IND) =                  40910000
374300                                      '1' OR '2' OR '3') AND      40920000
374400                  (FMT-CLNT-IS-RECEIVER OR FMT-CLNT-IS-DELIVERER) 40930000
374500                 PERFORM O-WRITE-ACAT-P2-TRAILER                  40940000
374600               END-IF                                             40950000
374700                                                                  40960000
374800             MOVE  'ACAT               BOS' TO P2-BK-DESCRIPTION  40970000
374900                                                                  40980000
375000           END-IF                                                 40990000
375100           PERFORM O-BK-PEND-CR-VALUE                             41000000
375200         WHEN  FMT-REJECTED-BY-FUND                               41010000
YH0001*******REMOVED  63 HARD CODE TO REPLACE WITH PSOT S/D B1          41020000
YH0001*******B1IS OFF AND REJECTED TODAY == TREATED AS PENDING          41030000
YH0001*******OR ASSUME TO AHVE CAGE FAIL SET UP SAME DAY                41040000
YH0001           IF B1-POST-STL-REJ-BKP       (B1-IND) = '0'            41050000
YH0001                 PERFORM O-RD-CL-CR-VALUE-CR-QUANTITY             41060000
YH0001           ELSE                                                   41070000
YH0001            IF  FMT-TI-ADP-CL-NO  =  63                           41080000
YH0001                PERFORM O-RD-CL-CR-VALUE-CR-QUANTITY              41090000
YH0001            ELSE                                                  41100000
YH0001             IF FMT-SETTL-DATE  =  FMT-UPDT-TMSTP                 41110000
YH0001                  PERFORM O-BK-PEND-CR-BOTH                       41120000
YH0001             ELSE                                                 41130000
YH0001                  PERFORM O-RD-CL-CR-VALUE-CR-QUANTITY            41140000
YH0001             END-IF                                               41150000
YH0001            END-IF                                                41160000
YH0001           END-IF                                                 41170000
                                                                        41180000
377500         WHEN  OTHER                                              41190000
377600           PERFORM O-BK-PEND-CR-BOTH                              41200000
377700       END-EVALUATE                                               41210000
377800     ELSE                                                         41220000
377900       EVALUATE TRUE                                              41230000
378000         WHEN  FMT-ACCEPTED-BY-FUND                               41240000
378100           PERFORM O-BK-MEMO-DB-QUANTITY                          41250000
378200           PERFORM O-BK-PEND-DB-QUANTITY                          41260000
378300           IF  B1-MFRS-ACTIVE (B1-IND)  =  'A'  AND               41270000
378400               FMT-NTWRK-CNTL-CD = '0' AND FMT-FUND-BK-CD = 'BC'  41280000
378500               MOVE 'BNS' TO P2-BK-TRID                           41290000
378600               MOVE FMT-TI-ADP-CL-NO   TO P2-BK-BROKER-NBR        41300000
378700               MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE        41310000
378800               PERFORM O-CUST-ACT-MOVE-BR-ACT                     41320000
378900               MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR          41330000
379000               MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR         41340000
379100               MOVE ZERO               TO P2-BK-AMOUNT            41350000
379200               MOVE  FMT-ASSET-QUAN    TO  WS-QTY                 41360000
379300               MOVE WS-QTY             TO P2-BK-QUANTITY          41370000
379400               MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION     41380000
379500               ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CUST-CR-QTY   41390000
379600               PERFORM O-WRITE-P2-ENTRY-CODE                      41400000
379700               WRITE P2BKPG-RECORD FROM P2-BK-RECORD              41410000
379800               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    41420000
379900                                                                  41430000
380000               MOVE SPACES TO P2-BK-TRAILER-RECORD                41440000
380100               MOVE P2-BK-RECORD TO P2-BK-TRAILER-RECORD          41450000
380200               MOVE 'SHARES HELD AT FUND' TO P2-BKT-RESDESC       41460000
380300               MOVE SPACES TO P2-BKT-QUANTITY-X                   41470000
380400                              P2-BKT-ENTRY-CODE                   41480000
380500                              P2-BKT-AMOUNT-X                     41490000
380600               MOVE '-' TO P2-BKT-HYPHEN                          41500000
380700               MOVE 0 TO P2-BKT-FRACTION                          41510000
380800               WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD      41520000
380900               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    41530000
381000                                                                  41540000
381100* ACAT TRAILER PROCESSING                                         41550000
381200               IF (B1-ACAT-P2-TRAILER (B1-IND) =                  41560000
381300                                      '1' OR '2' OR '3') AND      41570000
381400                  (FMT-CLNT-IS-RECEIVER OR FMT-CLNT-IS-DELIVERER) 41580000
381500                 PERFORM O-WRITE-ACAT-P2-TRAILER                  41590000
381600               END-IF                                             41600000
381700                                                                  41610000
381800               MOVE 'BNS' TO P2-BK-TRID                           41620000
381900               MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR          41630000
382000               MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE         41640000
382100               MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C 41650000
382200               MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR          41660000
382300               MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR         41670000
382400               MOVE ZERO               TO P2-BK-AMOUNT            41680000
382500               MOVE  FMT-ASSET-QUAN    TO  WS-QTY                 41690000
382600               MOVE WS-QTY             TO P2-BK-QUANTITY          41700000
382700               MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION     41710000
382800               ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CNS-DB-QTY    41720000
382900               PERFORM O-WRITE-P2-ENTRY-CODE                      41730000
383000               WRITE P2BKPG-RECORD FROM P2-BK-RECORD              41740000
383100               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    41750000
383200                                                                  41760000
383300               MOVE SPACES TO P2-BK-TRAILER-RECORD                41770000
383400               MOVE P2-BK-RECORD TO P2-BK-TRAILER-RECORD          41780000
383500               MOVE 'SHARES HELD AT FUND' TO P2-BKT-RESDESC       41790000
383600               MOVE SPACES TO P2-BKT-QUANTITY-X                   41800000
383700                              P2-BKT-ENTRY-CODE                   41810000
383800                              P2-BKT-AMOUNT-X                     41820000
383900               MOVE '-' TO P2-BKT-HYPHEN                          41830000
384000               MOVE 0 TO P2-BKT-FRACTION                          41840000
384100               WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD      41850000
384200               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    41860000
384300* ACAT TRAILER PROCESSING                                         41870000
384400               IF (B1-ACAT-P2-TRAILER (B1-IND) =                  41880000
384500                                      '1' OR '2' OR '3') AND      41890000
384600                  (FMT-CLNT-IS-RECEIVER OR FMT-CLNT-IS-DELIVERER) 41900000
384700                 PERFORM O-WRITE-ACAT-P2-TRAILER                  41910000
384800               END-IF                                             41920000
384900           END-IF                                                 41930000
385000         WHEN  FMT-REJECTED-BY-FUND                               41940000
385300*** B1 434610 ---                                                 41950000
YH0001           IF B1-POST-STL-REJ-BKP       (B1-IND) = '0'            41960000
YH0001              PERFORM O-BK-PEND-DB-BOTH                           41970000
YH0001*** THIS SEEMS TO BE MAKING OUT OF BALANCE IN SHARES              41980000
YH0001**         ELSE                                                   41990000
YH0001***           PERFORM O-RD-CL-CR-QUANTITY                         42000000
YH0001           END-IF                                                 42010000
387000         WHEN  OTHER                                              42020000
387100           CONTINUE                                               42030000
387200       END-EVALUATE                                               42040000
387300     END-IF.                                                      42050000
LRM041     IF B1-ACAT-FUNDSERV-PEND-MEMO (B1-IND) > SPACES              42060000
LRM041     AND FMT-SETTL-DATE  =  ACAT-PROC-DATE                        42070000
LRM041     AND (FMT-PENDING-FUND-APPROV OR FMT-REJECTED-BY-FUND)        42071000
LRM041       PERFORM O-CUST-ACT-MOVE-BR-ACT                             42071100
LRM041       IF FMT-MEMO-ORG-RVRSL-QTY > ZERO                           42071200
LRM041       AND FMT-MEMO-ORG-RVRSL-QTY NOT =  FMT-ASSET-QTY-DEC        42071300
LRM041          DISPLAY 'LONG-CNS USING ORIG DLVY QTY ON FUNDSERV MEMO '42071400
LRM041          DISPLAY '  ' FMT-ADP-SEC-NO ' ' FMT-TRNFR-TYPE          42071500
LRM041           ' ' FMT-MEMO-ORG-RVRSL-QTY ' BK= ' P2-BK-QUANTITY      42071600
LRM041          MOVE FMT-MEMO-ORG-RVRSL-QTY TO P2-BK-QUANTITY           42071700
LRM041                                         P2-BK-FRACTION           42071800
LRM041       ELSE                                                       42071900
LRM041          MOVE FMT-ASSET-QTY-DEC      TO P2-BK-QUANTITY           42072000
LRM041                                         P2-BK-FRACTION           42072100
LRM041          DISPLAY 'LONG-CNS FUNDSERV MEMO '                       42072200
LRM041          DISPLAY '  ' FMT-ADP-SEC-NO ' ' FMT-TRNFR-TYPE          42072300
LRM041             ' BK= ' P2-BK-QUANTITY                               42072400
LRM041       END-IF                                                     42072500
LRM041       MOVE 'S' TO P2-BK-TRID-X                                   42072600
LRM041       MOVE B1-ACAT-FUNDSERV-PEND-MEMO(B1-IND) TO P2-BK-BATCH-CODE42072700
LRM041       MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE                 42072800
LRM041       MOVE ZERO           TO P2-BK-AMOUNT                        42072900
LRM041       WRITE P2BKPG-RECORD FROM P2-BK-RECORD                      42073000
LRM041       ADD 1 TO TOT-CL-P2-RECS-WRITTEN                            42074000
LRM041     END-IF.                                                      42075000
LRM005 O-RCVR-LONG-FUND-SERV-EXIT. EXIT.                                42076000
387400/                                                                 42077000
387500******************************************************************42078000
387600*** PERFORMED BY:                                              ***42079000
387700***     O-SETUP-RECEIVER-P2                                    ***42080000
387800******************************************************************42080100
387900                                                                  42080200
388000 O-RCVR-LONG-NON-CNS.                                             42080300
388200                                                                  42080400
388300     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   42080500
           DISPLAY 'RCVR-LONG-NON ' FMT-ADP-SEC-NO                      42080600
              ' ' FMT-TRNFR-TYPE                                        42080700
              ' R-D=' FMT-STTLM-LCTN-CD                                 42080800
              ' MUTUAL-FUND=' FMT-PRC-CTGY-CD                           42080900
388400     PERFORM O-BK-CUST-DB-QUANTITY                                42081000
LRM005     IF NOT PARM-SHAD-RUN                                         42082000
388500        PERFORM O-BUILD-SAFEKEEPING-RECORD                        42083000
388600        PERFORM O-BK-OFFSET-DB-VALUE                              42084000
388700        PERFORM O-RD-CL-CR-VALUE-CR-QUANTITY.                     42085000
LRM041     IF B1-ACAT-FUNDSERV-PEND-MEMO (B1-IND) > SPACES              42086000
LRM041     AND ((FMT-TRNFR-TYPE = 'MFC'                                 42087000
LRM041       AND B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) NOT = '1')       42088000
LRM041     OR ((FMT-TRNFR-TYPE = 'FRV' OR 'FUL' OR 'PTR' OR 'PTD')      42089000
LRM041     AND FMT-R-D                                                  42090000
LRM041     AND NOT FMT-SAFE-KEEPING                                     42100000
LRM041     AND FMT-MUTUAL-FUND))                                        42110000
LRM041       PERFORM O-CUST-ACT-MOVE-BR-ACT                             42120000
LRM041       IF FMT-MEMO-ORG-RVRSL-QTY > ZERO                           42130000
LRM041       AND FMT-MEMO-ORG-RVRSL-QTY NOT =  FMT-ASSET-QTY-DEC        42140000
LRM041          MOVE FMT-MEMO-ORG-RVRSL-QTY TO P2-BK-QUANTITY           42150000
LRM041                                         P2-BK-FRACTION           42160000
LRM041          DISPLAY 'LONG-NON-CNS ORIG DLVY QTY ON FUNDSERV MEMO'   42170000
LRM041          DISPLAY '    RCVR-LONG-NON ' FMT-ADP-SEC-NO             42180000
LRM041           ' ' FMT-MEMO-ORG-RVRSL-QTY ' BK= ' P2-BK-QUANTITY      42190000
LRM041       ELSE                                                       42200000
LRM041          MOVE FMT-ASSET-QTY-DEC      TO P2-BK-QUANTITY           42210000
LRM041                                         P2-BK-FRACTION           42220000
LRM041          DISPLAY 'RCVR-LONG-NON ' FMT-ADP-SEC-NO                 42221000
LRM041          DISPLAY '    LONG-NON-CNS FUNDSERV MEMO2 '              42222015
LRM041            ' BK= ' P2-BK-QUANTITY                                42222100
LRM041       END-IF                                                     42222200
LRM041       MOVE 'S' TO P2-BK-TRID-X                                   42222300
LRM041       MOVE B1-ACAT-FUNDSERV-PEND-MEMO(B1-IND) TO P2-BK-BATCH-CODE42222400
LRM041       IF FMT-TRNFR-TYPE = 'FRV' OR 'MFC'                         42222500
LRM041          MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE             42222600
LRM041       ELSE                                                       42222700
LRM041          MOVE P2-DEBIT-SIGN   TO P2-BK-BUY-SELL-CODE             42222800
LRM041       END-IF                                                     42222900
LRM041       MOVE ZERO            TO P2-BK-AMOUNT                       42223000
LRM041       WRITE P2BKPG-RECORD FROM P2-BK-RECORD                      42223100
LRM041       ADD 1 TO TOT-CL-P2-RECS-WRITTEN                            42223200
LRM041     END-IF.                                                      42223300
388800/                                                                 42223400
388900******************************************************************42223500
389000*** PERFORMED BY:                                              ***42223600
389100***     O-SETUP-RECEIVER-P2                                    ***42223700
389200******************************************************************42223800
389300                                                                  42223900
389400 O-RCVR-SHORT-CNS.                                                42224000
389600                                                                  42225000
389700     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   42226000
389800     PERFORM O-BK-CUST-CR-QUANTITY                                42227000
LRM005     IF NOT PARM-SHAD-RUN                                         42228000
389900        PERFORM O-BK-CNS-DB-QUANTITY.                             42229000
390000/                                                                 42230000
390100******************************************************************42240000
390200*** PERFORMED BY:                                              ***42250000
390300***     O-SETUP-RECEIVER-P2                                    ***42260000
390400******************************************************************42270000
390500                                                                  42280000
390600 O-RCVR-SHORT-NON-CNS.                                            42290000
390700*    DISPLAY 'O-RCVR-SHORT-NON-CNS.'                              42300000
390800                                                                  42310000
390900     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   42320000
391000     PERFORM O-BK-CUST-CR-QUANTITY                                42330000
LRM005     IF NOT PARM-SHAD-RUN                                         42340000
391100        PERFORM O-BK-OFFSET-CR-VALUE                              42350000
391200        PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY.                     42360000
391300/                                                                 42370000
391400******************************************************************42380000
391500*** PERFORMED BY:                                              ***42390000
391600***     O-DLVR-DB-CASH-BAL                                     ***42400000
391700***     O-RCVR-CR-CASH-BAL                                     ***42410000
391800******************************************************************42420000
391900                                                                  42430000
392000 O-BK-CUST-CR-VALUE.                                              42440000
392100*    DISPLAY 'O-BK-CUST-CR-VALUE.'                                42450000
392200                                                                  42460000
392300     MOVE 'BNS' TO P2-BK-TRID                                     42470000
392400     MOVE FMT-TI-ADP-CL-NO   TO P2-BK-BROKER-NBR                  42480000
392500     MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE                  42490000
392600                                                                  42500000
392700     PERFORM O-CUST-ACT-MOVE-BR-ACT                               42510000
392800                                                                  42520000
392900     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    42530000
393000     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   42540000
393100     MOVE SPACES             TO P2-BK-QUANTITY-X                  42550000
393200     MOVE SPACES             TO P2-BK-FRACTION-X                  42560000
393300     MOVE FMT-ASSET-VALUE    TO AMOUNT-OVERFLOW                   42570000
393400     ADD  FMT-ASSET-VALUE    TO TOT-CL-BK-CUST-CR-VALUE           42580000
393500                                                                  42590000
393600     MOVE '1' TO OVERFLOW-SW                                      42600000
393700     PERFORM O-CASH-AMT-OVRFLOW-CHK-RTN                           42610000
393800         UNTIL NO-MORE-OVERFLOW.                                  42620000
393900/                                                                 42630000
394000******************************************************************42640000
394100*** PERFORMED BY:                                              ***42650000
394200***     O-DLVR-CR-CASH-BAL                                     ***42660000
394300***     O-RCVR-DB-CASH-BAL                                     ***42670000
394400******************************************************************42680000
394500                                                                  42690000
394600 O-BK-CUST-DB-VALUE.                                              42700000
394700**   DISPLAY 'O-BK-CUST-DB-VALUE.'                                42710000
394800                                                                  42720000
394900     MOVE 'BNS' TO P2-BK-TRID                                     42730000
395000     MOVE FMT-TI-ADP-CL-NO  TO P2-BK-BROKER-NBR                   42740000
395100     MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE                   42750000
395200                                                                  42760000
395300     PERFORM O-CUST-ACT-MOVE-BR-ACT                               42770000
395400                                                                  42780000
395500     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    42790000
395600     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   42800000
395700     MOVE SPACES             TO P2-BK-QUANTITY-X                  42810000
395800     MOVE SPACES             TO P2-BK-FRACTION-X                  42820000
395900     MOVE FMT-ASSET-VALUE    TO AMOUNT-OVERFLOW                   42830000
396000     ADD  FMT-ASSET-VALUE    TO TOT-CL-BK-CUST-DB-VALUE           42840000
396100                                                                  42850000
396200     MOVE '1' TO OVERFLOW-SW                                      42860000
396300     PERFORM O-CASH-AMT-OVRFLOW-CHK-RTN                           42870000
396400         UNTIL NO-MORE-OVERFLOW.                                  42880000
396500/                                                                 42890000
396600******************************************************************42900000
396700*** PERFORMED BY:                                              ***42910000
396800***     O-DLVR-LONG-CNS                                        ***42920000
396900***     O-DLVR-LONG-NON-CNS                                    ***42930000
397000***     O-RCVR-SHORT-CNS                                       ***42940000
397100***     O-RCVR-SHORT-NON-CNS                                   ***42950000
397200******************************************************************42960000
397300                                                                  42970000
397400 O-BK-CUST-CR-QUANTITY.                                           42980000
397500                                                                  42990000
397600     MOVE 'BNS' TO P2-BK-TRID                                     43000000
397700     MOVE FMT-TI-ADP-CL-NO   TO P2-BK-BROKER-NBR                  43010000
397800     MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE                  43020000
397900                                                                  43030000
398000     PERFORM O-CUST-ACT-MOVE-BR-ACT                               43040000
398100                                                                  43050000
398200     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    43060000
398300     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   43070000
398400     MOVE ZERO               TO P2-BK-AMOUNT                      43080000
398500     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           43090000
398600     MOVE WS-QTY             TO P2-BK-QUANTITY                    43100000
398700     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               43110000
398800     ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CUST-CR-QTY             43120000
LRM039     IF FMT-CURRENCY-CD > '000'                                   43130000
LRM039        MOVE FMT-CURRENCY-CD TO P2-BK-CURRENCY                    43140000
LRM039     END-IF.                                                      43150000
398900                                                                  43160000
399000     PERFORM O-WRITE-P2-REC.                                      43170000
LRM039     MOVE '000'              TO P2-BK-CURRENCY.                   43180000
399100/                                                                 43190000
399200******************************************************************43200000
399300*** PERFORMED BY:                                              ***43210000
399400***     O-DLVR-SHORT-CNS                                       ***43220000
399500***     O-DLVR-SHORT-NON-CNS                                   ***43230000
399600***     O-RCVR-LONG-CNS                                        ***43240000
399700***     O-RCVR-LONG-NON-CNS                                    ***43250000
399800******************************************************************43260000
399900                                                                  43270000
400000 O-BK-CUST-DB-QUANTITY.                                           43280000
400100                                                                  43290000
400200     MOVE 'BNS' TO P2-BK-TRID                                     43300000
400300     MOVE FMT-TI-ADP-CL-NO   TO P2-BK-BROKER-NBR                  43310000
400400     MOVE P2-DEBIT-SIGN   TO P2-BK-BUY-SELL-CODE                  43320000
400500                                                                  43330000
400600     PERFORM O-CUST-ACT-MOVE-BR-ACT                               43340000
400700                                                                  43350000
400800     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    43360000
400900     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   43370000
401000     MOVE ZERO               TO P2-BK-AMOUNT                      43380000
401100     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           43390000
401200     MOVE WS-QTY             TO P2-BK-QUANTITY                    43400000
401300     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               43410000
401400     ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CUST-DB-QTY             43420000
LRM039     IF FMT-CURRENCY-CD > '000'                                   43430000
LRM039        MOVE FMT-CURRENCY-CD TO P2-BK-CURRENCY                    43440000
LRM039     END-IF.                                                      43450000
401500                                                                  43460000
401600     PERFORM O-WRITE-P2-REC.                                      43470000
LRM039     MOVE '000'              TO P2-BK-CURRENCY.                   43480000
401700/                                                                 43490000
401800******************************************************************43500000
401900*** PERFORMED BY:                                              ***43510000
402000***     O-DLVR-LONG-OPTION                                     ***43520000
402100***     O-RCVR-LONG-OPTION                                     ***43530000
402200******************************************************************43540000
402300                                                                  43550000
402400 O-BK-OPTION-DB-QUANTITY.                                         43560000
402500                                                                  43570000
402600     MOVE 'BNS' TO P2-BK-TRID                                     43580000
402700     MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                    43590000
402800     MOVE P2-DEBIT-SIGN TO P2-BK-BUY-SELL-CODE                    43600000
402900                                                                  43610000
403000     PERFORM O-CUST-ACT-MOVE-BR-ACT                               43620000
403100                                                                  43630000
403200     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    43640000
403300     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   43650000
403400     MOVE ZERO               TO P2-BK-AMOUNT                      43660000
403500     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           43670000
403600     MOVE WS-QTY             TO P2-BK-QUANTITY                    43680000
403700     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               43690000
403800     ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-OPTION-DB-QTY           43700000
403900                                                                  43710000
404000     PERFORM O-WRITE-P2-REC.                                      43720000
404100/                                                                 43730000
404200******************************************************************43740000
404300*** PERFORMED BY:                                              ***43750000
404400***     O-DLVR-SHORT-OPTION                                    ***43760000
404500***     O-RCVR-SHORT-OPTION                                    ***43770000
404600******************************************************************43780000
404700                                                                  43790000
404800 O-BK-OPTION-CR-QUANTITY.                                         43800000
404900                                                                  43810000
405000     MOVE 'BNS' TO P2-BK-TRID                                     43820000
405100     MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                    43830000
405200     MOVE P2-CREDIT-SIGN TO P2-BK-BUY-SELL-CODE                   43840000
405300                                                                  43850000
405400     PERFORM O-CUST-ACT-MOVE-BR-ACT                               43860000
405500                                                                  43870000
405600     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    43880000
405700     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   43890000
405800     MOVE ZERO               TO P2-BK-AMOUNT                      43900000
405900     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           43910000
406000     MOVE WS-QTY             TO P2-BK-QUANTITY                    43920000
406100     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               43930000
406200     ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-OPTION-CR-QTY           43940000
406300                                                                  43950000
406400     PERFORM O-WRITE-P2-REC.                                      43960000
406500/                                                                 43970000
406600******************************************************************43980000
406700*** PERFORMED BY:                                              ***43990000
406800***     O-DLVR-SHORT-OPTION                                    ***44000000
406900***     O-RCVR-SHORT-OPTION                                    ***44010000
407000******************************************************************44020000
407100                                                                  44030000
407200 O-BK-OPTION-OFFSET-DB-QTY.                                       44040000
407300                                                                  44050000
407400     MOVE 'BNS' TO P2-BK-TRID                                     44060000
407500     MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                    44070000
407600     MOVE P2-DEBIT-SIGN TO P2-BK-BUY-SELL-CODE                    44080000
407700                                                                  44090000
407800     PERFORM O-GET-OPTION-OFFSET-ACT-DB                           44100000
407900                                                                  44110000
408000     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    44120000
408100     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   44130000
408200     MOVE ZERO               TO P2-BK-AMOUNT                      44140000
408300     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           44150000
408400     MOVE WS-QTY             TO P2-BK-QUANTITY                    44160000
408500     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               44170000
408600                                                                  44180000
408700     PERFORM O-WRITE-P2-REC.                                      44190000
408800/                                                                 44200000
408900******************************************************************44210000
409000*** PERFORMED BY:                                              ***44220000
409100***     O-DLVR-LONG-OPTION                                     ***44230000
409200***     O-RCVR-LONG-OPTION                                     ***44240000
409300******************************************************************44250000
409400                                                                  44260000
409500 O-BK-OPTION-OFFSET-CR-QTY.                                       44270000
409600                                                                  44280000
409700     MOVE 'BNS' TO P2-BK-TRID                                     44290000
409800     MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                    44300000
409900     MOVE P2-CREDIT-SIGN TO P2-BK-BUY-SELL-CODE                   44310000
410000                                                                  44320000
410100     PERFORM O-GET-OPTION-OFFSET-ACT-CR                           44330000
410200                                                                  44340000
410300     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    44350000
410400     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   44360000
410500     MOVE ZERO               TO P2-BK-AMOUNT                      44370000
410600     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           44380000
410700     MOVE WS-QTY             TO P2-BK-QUANTITY                    44390000
410800     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               44400000
410900                                                                  44410000
411000     PERFORM O-WRITE-P2-REC.                                      44420000
411100/                                                                 44430000
411200******************************************************************44440000
411300*** PERFORMED BY:                                              ***44450000
411400***     O-BK-OPTION-OFFSET-DB-QTY                              ***44460000
411500******************************************************************44470000
411600                                                                  44480000
411700 O-GET-OPTION-OFFSET-ACT-DB.                                      44490000
411800                                                                  44500000
LRM021     IF ALT-OPTION-OFFSET-ACCOUNT > SPACES                        44510000
LRM021         MOVE ALT-OPTION-OFFSET-ACCOUNT TO                        44520000
LRM021                              P2-BK-BR-ACCT-T-C                   44530000
LRM021         ADD FMT-ASSET-QUAN TO TOT-CL-OPT-CBOE-DB-QTY             44540000
LRM021     ELSE                                                         44550000
411900     IF B1-OPTION-OFFSET-IND (B1-IND) = '1'                       44560000
412000         MOVE '0982008013' TO P2-BK-BR-ACCT-T-C                   44570000
412100         ADD FMT-ASSET-QUAN TO TOT-CL-OPT-CBOE-DB-QTY             44580000
412200     ELSE                                                         44590000
412300         MOVE LOW-VALUES TO MSD-RECORD-AREA                       44600000
412400         MOVE FMT-ADP-SEC-NO TO GETMSD-INIT-SEARCH                44610000
412500         PERFORM O-CALL-MSD-FILE                                  44620000
412600                                                                  44630000
412700         PERFORM O-GET-EXCHANGE-CODE                              44640000
412800                                                                  44650000
412900         EVALUATE TRUE                                            44660000
413000             WHEN CBOE-OPTION                                     44670000
413100                 MOVE '0982008013' TO P2-BK-BR-ACCT-T-C           44680000
413200                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-CBOE-DB-QTY     44690000
413300             WHEN AMEX-OPTION OR NYSE-OPTION                      44700000
413400                 MOVE '0982009011' TO P2-BK-BR-ACCT-T-C           44710000
413500                 ADD FMT-ASSET-QUAN TO TOT-CL-AMEX-NYSE-DB-QTY    44720000
413600             WHEN PBW-OPTION                                      44730000
413700                 MOVE '0982001513' TO P2-BK-BR-ACCT-T-C           44740000
413800                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-PBW-DB-QTY      44750000
413900             WHEN PSE-OPTION                                      44760000
414000                 MOVE '0982001612' TO P2-BK-BR-ACCT-T-C           44770000
414100                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-PSE-DB-QTY      44780000
414200             WHEN OTHER                                           44790000
414300                 MOVE '0982006019' TO P2-BK-BR-ACCT-T-C           44800000
414400                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-DFLT-DB-QTY     44810000
414500         END-EVALUATE                                             44820000
414600     END-IF.                                                      44830000
414700/                                                                 44840000
414800******************************************************************44850000
414900*** PERFORMED BY:                                              ***44860000
415000***     O-BK-OPTION-OFFSET-CR-QTY                              ***44870000
415100******************************************************************44880000
415200                                                                  44890000
415300 O-GET-OPTION-OFFSET-ACT-CR.                                      44900000
415400                                                                  44910000
LRM021     IF ALT-OPTION-OFFSET-ACCOUNT > SPACES                        44920000
LRM021         MOVE ALT-OPTION-OFFSET-ACCOUNT TO                        44930000
LRM021                              P2-BK-BR-ACCT-T-C                   44940000
LRM021         ADD FMT-ASSET-QUAN TO TOT-CL-OPT-CBOE-CR-QTY             44950000
LRM021     ELSE                                                         44960000
415500     IF B1-OPTION-OFFSET-IND (B1-IND) = '1'                       44970000
415600         MOVE '0982008013' TO P2-BK-BR-ACCT-T-C                   44980000
415700         ADD FMT-ASSET-QUAN TO TOT-CL-OPT-CBOE-CR-QTY             44990000
415800     ELSE                                                         45000000
415900         MOVE LOW-VALUES TO MSD-RECORD-AREA                       45010000
416000         MOVE FMT-ADP-SEC-NO TO GETMSD-INIT-SEARCH                45020000
416100         PERFORM O-CALL-MSD-FILE                                  45030000
416200                                                                  45040000
416300         PERFORM O-GET-EXCHANGE-CODE                              45050000
416400                                                                  45060000
416500         EVALUATE TRUE                                            45070000
416600             WHEN CBOE-OPTION                                     45080000
416700                 MOVE '0982008013' TO P2-BK-BR-ACCT-T-C           45090000
416800                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-CBOE-CR-QTY     45100000
416900             WHEN AMEX-OPTION OR NYSE-OPTION                      45110000
417000                 MOVE '0982009011' TO P2-BK-BR-ACCT-T-C           45120000
417100                 ADD FMT-ASSET-QUAN TO TOT-CL-AMEX-NYSE-CR-QTY    45130000
417200             WHEN PBW-OPTION                                      45140000
417300                 MOVE '0982001513' TO P2-BK-BR-ACCT-T-C           45150000
417400                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-PBW-CR-QTY      45160000
417500             WHEN PSE-OPTION                                      45170000
417600                 MOVE '0982001612' TO P2-BK-BR-ACCT-T-C           45180000
417700                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-PSE-CR-QTY      45190000
417800             WHEN OTHER                                           45200000
417900                 MOVE '0982006019' TO P2-BK-BR-ACCT-T-C           45210000
418000                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-DFLT-CR-QTY     45220000
418100         END-EVALUATE                                             45230000
418200     END-IF.                                                      45240000
418300/                                                                 45250000
418400******************************************************************45260000
418500*** PERFORMED BY:                                              ***45270000
418600***     O-GET-OPTION-OFFSET-ACT-DB                             ***45280000
418700***     O-GET-OPTION-OFFSET-ACT-CR                             ***45290000
418800******************************************************************45300000
418900                                                                  45310000
419000 O-GET-EXCHANGE-CODE.                                             45320000
419100                                                                  45330000
419200     MOVE ZERO TO WS-SEC-TYPE-COMP3                               45340000
419300     MOVE MS-SECURITY-TYPE TO WS-SEC-TYPE-PICX                    45350000
419400     MOVE WS-SEC-TYPE-PICX-BYTE2 TO WS-SEC-TYPE-COMP3-BYTE1       45360000
419500     MOVE WS-SEC-TYPE-COMP3 TO WS-SEC-TYPE-PIC9                   45370000
419600     DISPLAY 'MS-SECURITY-TYPE=', MS-SECURITY-TYPE                45380000
419700     DISPLAY 'WS-SEC-TYPE-PIC9=', WS-SEC-TYPE-PIC9.               45390000
419800/                                                                 45400000
419900******************************************************************45410000
420000*** PERFORMED BY:                                              ***45420000
420100***     O-DLVR-CR-CASH-BAL                                     ***45430000
420200***     O-RCVR-DB-CASH-BAL                                     ***45440000
420300******************************************************************45450000
420400                                                                  45460000
420500 O-BK-OFFSET-CR-CASH-VALUE.                                       45470000
420600                                                                  45480000
420700     IF B1-OFFSET-AMT-BYPASS (B1-IND) = '1'                       45490000
420800        ADD FMT-ASSET-VALUE  TO TOT-CL-OFFSET-BYP-CR-VALUE        45500000
420900     ELSE                                                         45510000
421000        MOVE 'BNS' TO P2-BK-TRID                                  45520000
421100        MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                 45530000
421200        MOVE P2-CREDIT-SIGN TO P2-BK-BUY-SELL-CODE                45540000
421300                                                                  45550000
421400        MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C        45560000
421500                                                                  45570000
421600        MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                 45580000
421700        MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                45590000
421800        MOVE SPACES             TO P2-BK-QUANTITY-X               45600000
421900        MOVE SPACES             TO P2-BK-FRACTION-X               45610000
422000        MOVE FMT-ASSET-VALUE    TO AMOUNT-OVERFLOW                45620000
422100        ADD FMT-ASSET-VALUE     TO TOT-CL-OFFSET-CR-VALUE         45630000
422200                                                                  45640000
422300        MOVE '1' TO OVERFLOW-SW                                   45650000
422400        PERFORM O-CASH-AMT-OVRFLOW-CHK-RTN                        45660000
422500            UNTIL NO-MORE-OVERFLOW                                45670000
422600     END-IF.                                                      45680000
422700/                                                                 45690000
422800******************************************************************45700000
422900*** PERFORMED BY:                                              ***45710000
423000***     O-DLVR-DB-CASH-BAL                                     ***45720000
423100***     O-RCVR-CR-CASH-BAL                                     ***45730000
423200******************************************************************45740000
423300                                                                  45750000
423400 O-BK-OFFSET-DB-CASH-VALUE.                                       45760000
423500                                                                  45770000
423600     IF B1-OFFSET-AMT-BYPASS (B1-IND) = '1'                       45780000
423700        ADD FMT-ASSET-VALUE  TO TOT-CL-OFFSET-BYP-DB-VALUE        45790000
423800     ELSE                                                         45800000
423900        MOVE 'BNS' TO P2-BK-TRID                                  45810000
424000        MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                 45820000
424100        MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE                45830000
424200                                                                  45840000
424300        MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C        45850000
424400                                                                  45860000
424500        MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                 45870000
424600        MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                45880000
424700        MOVE SPACES             TO P2-BK-QUANTITY-X               45890000
424800        MOVE SPACES             TO P2-BK-FRACTION-X               45900000
424900        MOVE FMT-ASSET-VALUE    TO AMOUNT-OVERFLOW                45910000
425000        ADD FMT-ASSET-VALUE     TO TOT-CL-OFFSET-DB-VALUE         45920000
425100                                                                  45930000
425200        MOVE '1' TO OVERFLOW-SW                                   45940000
425300        PERFORM O-CASH-AMT-OVRFLOW-CHK-RTN                        45950000
425400         UNTIL NO-MORE-OVERFLOW                                   45960000
425500     END-IF.                                                      45970000
425600/                                                                 45980000
425700******************************************************************45990000
425800*** PERFORMED BY:                                              ***46000000
425900***     O-DLVR-LONG-NON-CNS                                   *** 46010000
426000***     O-RCVR-SHORT-NON-CNS                                   ***46020000
426100******************************************************************46030000
426200                                                                  46040000
426300 O-BK-OFFSET-CR-VALUE.                                            46050000
426400                                                                  46060000
426500     IF B1-OFFSET-AMT-BYPASS (B1-IND) = '1'                       46070000
426600        ADD  FMT-ASSET-VALUE TO TOT-CL-OFFSET-BYP-CR-VALUE        46080000
426700     ELSE                                                         46090000
426800        MOVE 'BNS' TO P2-BK-TRID                                  46100000
426900        MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                 46110000
427000        MOVE P2-CREDIT-SIGN TO P2-BK-BUY-SELL-CODE                46120000
427100                                                                  46130000
427200        MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C        46140000
427300                                                                  46150000
427400        MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                 46160000
427500        MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                46170000
427600        MOVE ZEROS              TO TST-P2-BK-QTY                  46180000
427700        MOVE ZEROS              TO P2-BK-FRACTION                 46190000
427800        MOVE FMT-ASSET-VALUE    TO AMOUNT-OVERFLOW                46200000
427900        ADD  FMT-ASSET-VALUE    TO TOT-CL-OFFSET-CR-VALUE         46210000
428000                                                                  46220000
428100        MOVE '1' TO OVERFLOW-SW                                   46230000
428200        PERFORM O-AMT-OVRFLOW-CHK-RTN                             46240000
428300         UNTIL NO-MORE-OVERFLOW                                   46250000
428400     END-IF.                                                      46260000
428500/                                                                 46270000
428600******************************************************************46280000
428700*** PERFORMED BY:                                              ***46290000
428800***     O-DLVR-SHORT-NON-CNS                                   ***46300000
428900***     O-RCVR-LONG-NON-CNS                                    ***46310000
429000******************************************************************46320000
429100                                                                  46330000
429200 O-BK-OFFSET-DB-VALUE.                                            46340000
429300                                                                  46350000
429400     IF B1-OFFSET-AMT-BYPASS (B1-IND) = '1'                       46360000
429500        ADD  FMT-ASSET-VALUE  TO TOT-CL-OFFSET-BYP-DB-VALUE       46370000
429600     ELSE                                                         46380000
429700        MOVE 'BNS' TO P2-BK-TRID                                  46390000
429800        MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                 46400000
429900        MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE                46410000
430000                                                                  46420000
430100        MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C        46430000
430200                                                                  46440000
430300        MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                 46450000
430400        MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                46460000
430500        MOVE ZEROS              TO TST-P2-BK-QTY                  46470000
430600        MOVE ZEROS              TO P2-BK-FRACTION                 46480000
430700        MOVE FMT-ASSET-VALUE    TO AMOUNT-OVERFLOW                46490000
430800        ADD  FMT-ASSET-VALUE    TO TOT-CL-OFFSET-DB-VALUE         46500000
430900                                                                  46510000
431000        MOVE '1' TO OVERFLOW-SW                                   46520000
431100        PERFORM O-AMT-OVRFLOW-CHK-RTN                             46530000
431200         UNTIL NO-MORE-OVERFLOW                                   46540000
431300     END-IF.                                                      46550000
431400/                                                                 46560000
431500******************************************************************46570000
431600*** PERFORMED BY:                                              ***46580000
431700***     O-DLVR-SHORT-CNS                                       ***46590000
431800***     O-RCVR-LONG-CNS                                        ***46600000
431900******************************************************************46610000
432000                                                                  46620000
432100 O-BK-CNS-CR-QUANTITY.                                            46630000
432200                                                                  46640000
432300     MOVE 'BNS' TO P2-BK-TRID                                     46650000
432400     MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                    46660000
432500     MOVE P2-CREDIT-SIGN TO P2-BK-BUY-SELL-CODE                   46670000
432600                                                                  46680000
LRM050     IF DST-DIRECT AND                                            46690000
LRM050        NTWIO-MATRIX-LEVEL = '6' AND                              46700000
LRM050        B1-MFRS-DST-MFE-OFFSET (B1-IND) > SPACES                  46710000
LRM050        MOVE  B1-MFRS-DST-MFE-OFFSET (B1-IND)                     46720000
LRM050                          TO P2-BK-BR-ACCT-T                      46721000
LRM050        MOVE 'X'          TO P2-BK-CHECK-DIGIT                    46721100
LRM050     ELSE                                                         46721200
432700        MOVE CNS-BR-ACCT-T-C TO P2-BK-BR-ACCT-T-C                 46721300
LRM052        IF B1-ACAT-CNS-LONG-R-ACCT (B1-IND) > SPACES              46721400
LRM052        AND FMT-CNS                                               46721500
LRM052        AND FMT-ADP-SEC-NO(1 : 3) NOT = '866'                     46721600
LRM052           MOVE B1-ACAT-CNS-LONG-R-ACCT (B1-IND)                  46721700
LRM052                             TO P2-BK-BR-ACCT-T                   46721800
LRM052           MOVE 'X'          TO P2-BK-CHECK-DIGIT                 46721900
LRM052        END-IF                                                    46722000
LRM050     END-IF.                                                      46722100
432800                                                                  46722200
432900     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    46722300
433000     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   46722400
433100     MOVE ZERO               TO P2-BK-AMOUNT                      46722500
433200     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           46722600
433300     MOVE WS-QTY             TO P2-BK-QUANTITY                    46722700
433400     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               46723000
433500     ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CNS-CR-QTY              46724000
433600                                                                  46725000
433700     PERFORM O-WRITE-P2-REC.                                      46726000
433800/                                                                 46727000
433900******************************************************************46728000
434000*** PERFORMED BY:                                              ***46729000
434100***     O-DLVR-LONG-CNS                                        ***46730000
434200***     O-RCVR-SHORT-CNS                                       ***46740000
434300******************************************************************46750000
434400                                                                  46760000
434500 O-BK-CNS-DB-QUANTITY.                                            46770000
434600                                                                  46780000
434700     MOVE 'BNS' TO P2-BK-TRID                                     46790000
434800     MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                    46800000
434900     MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE                   46810000
435000                                                                  46820000
LRM050     IF DST-DIRECT AND                                            46830000
LRM050        NTWIO-MATRIX-LEVEL = '6' AND                              46840000
LRM050        B1-MFRS-DST-MFE-OFFSET (B1-IND) > SPACES                  46850000
LRM050        MOVE  B1-MFRS-DST-MFE-OFFSET (B1-IND)                     46860000
LRM050                          TO P2-BK-BR-ACCT-T                      46870000
LRM050        MOVE 'X'          TO P2-BK-CHECK-DIGIT                    46880000
LRM050     ELSE                                                         46890000
435100        MOVE CNS-BR-ACCT-T-C TO P2-BK-BR-ACCT-T-C                 46900000
LRM052        IF B1-ACAT-CNS-SHORT-S-ACCT (B1-IND) > SPACES             46901000
LRM052        AND FMT-CNS                                               46902000
LRM052        AND FMT-ADP-SEC-NO(1 : 3) NOT = '866'                     46902100
LRM052           MOVE B1-ACAT-CNS-SHORT-S-ACCT (B1-IND)                 46903000
LRM052                             TO P2-BK-BR-ACCT-T                   46904000
LRM052           MOVE 'X'          TO P2-BK-CHECK-DIGIT                 46905000
LRM052        END-IF                                                    46906000
LRM050     END-IF.                                                      46910000
435200                                                                  46920000
435300     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    46930000
435400     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   46940000
435500     MOVE ZERO               TO P2-BK-AMOUNT                      46950000
435600     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           46960000
435700     MOVE WS-QTY             TO P2-BK-QUANTITY                    46970000
435800     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               46980000
435900     ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CNS-DB-QTY              46990000
436000                                                                  47000000
436100     PERFORM O-WRITE-P2-REC.                                      47010000
436200                                                                  47020000
436300/                                                                 47030000
436400* FUND/SERV                                                       47040000
436500 O-BK-MEMO-CR-QUANTITY.                                           47050000
436600                                                                  47060000
LRM001     IF (B1-MFRS-ACTIVE (B1-IND)  =  'A'  OR                      47070000
LRM001         FMT-TI-ADP-CL-NO = 63)   AND                             47080000
LRM001                OMNIBUS-PROCESS   AND                             47090000
LRM001                MF-NSCC-SOURCE    AND                             47100000
LRM001                B1-MFRS-NSCCSRC-OFFSET (B1-IND) > SPACES  AND     47110000
LRM001                FMT-ACCEPTED-BY-FUND                              47120000
LRM001           MOVE B1-MFRS-NSCCSRC-OFFSET (B1-IND)                   47130000
LRM001                      TO P2-BK-BR-ACCT-T                          47140000
LRM001           MOVE 'X' TO P2-BK-CHECK-DIGIT                          47150000
LRM001           MOVE  P2-DEBIT-SIGN      TO  P2-BK-BUY-SELL-CODE       47160000
LRM001           MOVE SPACES TO P2-BK-VALUE-DT-X                        47170000
LRM001           MOVE  'BNS'                   TO  P2-BK-TRID           47180000
LRM001     ELSE                                                         47190000
LRM050     IF DST-MFE-PROCESS   AND                                     47200000
LRM050        NTWIO-MATRIX-LEVEL = '6' AND                              47210000
LRM050        B1-MFRS-DST-MFE-OFFSET (B1-IND) > SPACES                  47220000
LRM050        MOVE  B1-MFRS-DST-MFE-OFFSET (B1-IND)                     47230000
LRM050                                       TO P2-BK-BR-ACCT-T         47240000
LRM050        MOVE 'X'                       TO P2-BK-CHECK-DIGIT       47250000
LRM050        MOVE  P2-DEBIT-SIGN            TO  P2-BK-BUY-SELL-CODE    47260000
LRM050        PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT           47270000
LRM050        IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND                    47280000
LRM050               WS-VALUE-DT-YYMMDD > ZEROES                        47290000
LRM050            MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT             47300000
LRM050        ELSE                                                      47310000
LRM050            MOVE SPACES TO P2-BK-VALUE-DT-X                       47320000
LRM050        END-IF                                                    47330000
LRM050     END-IF                                                       47340000
LRM029     IF PNC-OMNIBUS-PROCESS AND                                   47350000
LRM029        B1-PNC-SURPAS-OFFSET (B1-IND) > SPACES                    47360000
LRM029        MOVE  B1-PNC-SURPAS-OFFSET (B1-IND)                       47370000
LRM029                                       TO P2-BK-BR-ACCT-T         47380000
LRM029        MOVE 'X'                       TO P2-BK-CHECK-DIGIT       47390000
LRM029        MOVE  P2-DEBIT-SIGN            TO  P2-BK-BUY-SELL-CODE    47400000
LRM029        PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT           47410000
LRM029        IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND                    47420000
LRM029               WS-VALUE-DT-YYMMDD > ZEROES                        47430000
LRM029            MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT             47440000
LRM029        ELSE                                                      47450000
LRM029            MOVE SPACES TO P2-BK-VALUE-DT-X                       47460000
LRM029        END-IF                                                    47470000
LRM029     ELSE                                                         47480000
436700     IF  B1-MFRS-ACTIVE (B1-IND)  =  'A'  OR                      47490000
436800         FMT-TI-ADP-CL-NO = 63                                    47500000
436900                                                                  47510000
437000       EVALUATE TRUE                                              47520000
437100         WHEN  FMT-NTWRK-CNTL-CD = '1'                            47530000
437200               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    47540000
437210               MOVE  P2-CREDIT-SIGN       TO  P2-BK-BUY-SELL-CODE 47550000
437220               IF  FMT-TI-ADP-CL-NO = 63                          47560000
437230                   MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID     47570000
437240                   ADD  FMT-ASSET-QUAN     TO  TOT-N0-MEMO-DB-QTY 47580000
437250               ELSE                                               47590000
437260                   MOVE  MEMO-TWO-WAY-BATCH (1) TO P2-BK-TRID     47600000
437270                   ADD  FMT-ASSET-QUAN     TO  TOT-N1-MEMO-DB-QTY 47610000
437280               END-IF                                             47620000
LRM015               SET MEMO-TRID TO TRUE                              47630000
437290         WHEN  FMT-NTWRK-CNTL-CD = '2'                            47640000
437300               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    47650000
437400               MOVE  P2-CREDIT-SIGN       TO  P2-BK-BUY-SELL-CODE 47660000
437500               IF  FMT-TI-ADP-CL-NO = 63                          47670000
437600                   MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID     47671000
437700                   ADD  FMT-ASSET-QUAN     TO  TOT-N0-MEMO-DB-QTY 47672000
437800               ELSE                                               47673000
437900                   MOVE  MEMO-TWO-WAY-BATCH (2) TO P2-BK-TRID     47674000
438000                   ADD  FMT-ASSET-QUAN     TO  TOT-N2-MEMO-DB-QTY 47675000
438100               END-IF                                             47676000
LRM015               SET MEMO-TRID TO TRUE                              47677000
438200         WHEN  FMT-NTWRK-CNTL-CD = '3'                            47678000
438300               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    47679000
438400               MOVE  P2-CREDIT-SIGN       TO  P2-BK-BUY-SELL-CODE 47680000
438500               MOVE  MEMO-TWO-WAY-BATCH (3) TO P2-BK-TRID         47690000
LRM050               IF DST-DIRECT                                      47700000
LRM050               AND NTWIO-MATRIX-LEVEL = '6'                       47710000
LRM050               AND  MEMO-TWO-WAY-BATCH (6) > SPACES               47720000
LRM050                  MOVE  MEMO-TWO-WAY-BATCH (6) TO P2-BK-TRID      47730000
LRM050                  ADD  FMT-ASSET-QUAN     TO  TOT-N6-MEMO-DB-QTY  47740000
LRM050               ELSE                                               47741000
438500                  MOVE  MEMO-TWO-WAY-BATCH (3) TO P2-BK-TRID      47742000
438600                  ADD  FMT-ASSET-QUAN     TO  TOT-N3-MEMO-DB-QTY  47742100
LRM050               END-IF                                             47742200
LRM015               SET MEMO-TRID TO TRUE                              47742300
438700         WHEN  FMT-NTWRK-CNTL-CD = '4'                            47742400
438800               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    47742500
438900               MOVE  P2-CREDIT-SIGN       TO  P2-BK-BUY-SELL-CODE 47742600
439000               IF  FMT-TI-ADP-CL-NO = 63                          47742700
439100                   MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID     47742800
439200                   ADD  FMT-ASSET-QUAN     TO  TOT-N0-MEMO-DB-QTY 47742900
439300               ELSE                                               47743000
439400                   MOVE  MEMO-TWO-WAY-BATCH (4) TO P2-BK-TRID     47744000
439500                   ADD  FMT-ASSET-QUAN     TO  TOT-N4-MEMO-DB-QTY 47745000
439600               END-IF                                             47746000
LRM015               SET MEMO-TRID TO TRUE                              47747000
439700         WHEN  OTHER                                              47748000
YH0001*****ADD THIS HARD CODING FOR CLIET 63 TO MAKE IT = TO            47749000
YH0001*****MEMO-DB PROCESSING                                           47750000
YH0001           IF  FMT-TI-ADP-CL-NO = 63                              47760000
YH0001                PERFORM  O-CUST-ACT-MOVE-BR-ACT                   47770000
YH0001                MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID        47780000
YH0001                MOVE  P2-CREDIT-SIGN      TO  P2-BK-BUY-SELL-CODE 47790000
YH0001                ADD  FMT-ASSET-QUAN       TO  TOT-N0-MEMO-DB-QTY  47800000
YH0001           ELSE                                                   47810000
440810            IF OMNIBUS-PROCESS   AND                              47820000
440820              B1-MFRS-OMNIBUS-OFFSET (B1-IND) > SPACES            47830000
440830               MOVE  B1-MFRS-OMNIBUS-OFFSET (B1-IND)              47840000
440840                                              TO P2-BK-BR-ACCT-T  47850000
440850               MOVE 'X'                       TO P2-BK-CHECK-DIGIT47860000
440860               PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT    47870000
440870               IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND             47880000
440880                    WS-VALUE-DT-YYMMDD > ZEROES                   47890000
440890                    MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT     47900000
440891               ELSE                                               47910000
440892                    MOVE SPACES TO P2-BK-VALUE-DT-X               47920000
440893               END-IF                                             47930000
440900            ELSE                                                  47940000
LRM006******       IF FMT-CASH-MGN-IND = 'M'       AND                  47950000
LRM006             IF FMT-VMF-ACCT-TYPE-CD = '2'   AND                  47960000
441100               FMT-BK-PHSCL-SHR-CD =  '1' AND                     47970000
441200               B1-MFRS-BB-OFFSET (B1-IND) > SPACES                47980000
441400                PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT   47990000
441500                IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND            48000000
441600                    WS-VALUE-DT-YYMMDD > ZEROES                   48010000
441700                    MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT     48020000
441800                ELSE                                              48030000
441900                    MOVE SPACES             TO P2-BK-VALUE-DT-X   48040000
442000                END-IF                                            48050000
442100                MOVE B1-MFRS-BB-OFFSET (B1-IND) TO P2-BK-BR-ACCT-T48060000
442110                MOVE 'X'                      TO P2-BK-CHECK-DIGIT48070000
442200             ELSE                                                 48080000
442300              MOVE SPACES TO P2-BK-VALUE-DT-X                     48090000
442400              MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C  48100000
442500             END-IF                                               48110000
442600            END-IF                                                48120000
442700            MOVE  'BNS'                 TO  P2-BK-TRID            48130000
442800            MOVE  P2-DEBIT-SIGN         TO  P2-BK-BUY-SELL-CODE   48140000
442900            ADD  FMT-ASSET-QUAN         TO  TOT-N0-MEMO-DB-QTY    48150000
YH0001          END-IF                                                  48160000
443000       END-EVALUATE                                               48170000
443100     ELSE                                                         48180000
443200        MOVE  'BNS'                    TO  P2-BK-TRID             48190000
443300        MOVE  P2-DEBIT-SIGN            TO  P2-BK-BUY-SELL-CODE    48200000
443400        MOVE  ALTERNATE-OFFSET-ACCOUNT TO  P2-BK-BR-ACCT-T-C      48210000
443500        ADD  FMT-ASSET-QUAN            TO  TOT-N0-MEMO-DB-QTY     48220000
443600     END-IF.                                                      48230000
443700     MOVE  FMT-TI-ADP-CL-NO           TO  P2-BK-BROKER-NBR.       48240000
443800     MOVE  FMT-TI-CONTROL-NUM         TO  P2-BK-CNTL-NBR.         48250000
443900     MOVE  FMT-CONTRA-BRK-NUM         TO  P2-BK-CNTRA-BKR.        48260000
444000     MOVE  ZERO                       TO  P2-BK-AMOUNT.           48270000
444100     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           48280000
444200     MOVE WS-QTY             TO P2-BK-QUANTITY                    48290000
444300     MOVE  FMT-ASSET-QUAN-FRACTION    TO  P2-BK-FRACTION.         48300000
444400                                                                  48310000
444500     IF  P2-BK-TRID (2:2) NOT = SPACES                            48320000
444600         IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND             48330000
444700             FMT-ACT-TYPE  =  'DR')                               48340000
444800         OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND             48350000
ET0001            (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR             48360000
ET0001                              'SI' OR 'EI' OR 'RI'))              48370000
LRM027         OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND             48380000
LRM027            (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR             48390000
LRM027                              'SI' OR 'EI' OR 'RI' OR             48400000
LRM027                              'BI' OR 'BR' OR '4K' OR             48410000
LRM027                              '4B' OR '7B' OR '5P' OR 'HS'))      48420000
445000            IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                  48430000
445100               SET FUND-SERV-ROLLOVER TO TRUE                     48440000
445200            END-IF                                                48450000
445300         END-IF                                                   48460000
445400         PERFORM  O-WRITE-P2-REC                                  48470000
445500         MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW   48480000
445600     END-IF.                                                      48490000
445700                                                                  48500000
445800 GET-VALUE-DATE.                                                  48510000
445900                                                                  48520000
446000     IF FMT-STTLM-DT = '0001-01-01'  OR                           48530000
446100        FMT-STTLM-DT = '          '                               48540000
446200        GO TO GET-VALUE-DATE-EXIT                                 48550000
446300     END-IF.                                                      48560000
446400                                                                  48570000
446500     INITIALIZE BPDATES-PARAMETERS.                               48580000
446600                                                                  48590000
446700     MOVE 'CAT650'                    TO  BPDATES-CALLING-PGM.    48600000
446800     MOVE 'D'                         TO  BPDATES-REQ-TYPE.       48610000
446900     MOVE '  '                        TO  BPDATES-CALENDAR-TYPE.  48620000
447000     MOVE FMT-STTLM-DT                TO  WS-STTLM-DATE.          48630000
447100     MOVE WS-STTLM-DATE-CC            TO  WS-STTLM-DT-CC.         48640000
447200     MOVE WS-STTLM-DATE-YY            TO  WS-STTLM-DT-YY.         48650000
447300     MOVE WS-STTLM-DATE-MM            TO  WS-STTLM-DT-MM.         48660000
447400     MOVE WS-STTLM-DATE-DD            TO  WS-STTLM-DT-DD.         48670000
447500     MOVE WS-STTLM-DT-CCYYMMDD        TO  BPDATES-BASE-DATE.      48680000
447600     MOVE 'M'                         TO  BPDATES-DTSEARCH-IND.   48690000
447700     MOVE 'C'                         TO  BPDATES-DTSEARCH-TYPE.  48700000
447800     MOVE 2                           TO  BPDATES-DTSEARCH-DISP.  48710000
447900                                                                  48720000
448000     CALL   BPDATES                 USING  BPDATES-PARAMETERS.    48730000
448100                                                                  48740000
448200     IF NOT BPD-VALID-RETURN                                      48750000
448300        DISPLAY '************************************************'48760000
448400        DISPLAY '*DTSEARCH VIA BPDATES FAILES, RETURN CODE = '    48770000
448500                  BPDATES-RETURN-CODE ' *'                        48780000
448600        DISPLAY '************************************************'48790000
448700        MOVE '00010101'               TO WS-DTSEARCH-DATE-CCYYMMDD48800000
448800     ELSE                                                         48810000
448900        MOVE BPD-DT-CALDATE           TO WS-DTSEARCH-DATE-CCYYMMDD48820000
449000     END-IF.                                                      48830000
449100     MOVE WS-DTSEARCH-DATE-YY TO WS-VALUE-DT-YY                   48840000
449200     MOVE WS-DTSEARCH-DATE-MM TO WS-VALUE-DT-MM                   48850000
449300     MOVE WS-DTSEARCH-DATE-DD TO WS-VALUE-DT-DD.                  48860000
449400                                                                  48870000
449500                                                                  48880000
449600  GET-VALUE-DATE-EXIT.                                            48890000
449700     EXIT.                                                        48900000
449800/                                                                 48910000
449900* FUND/SERV                                                       48920000
450000 O-BK-PEND-DB-VALUE.                                              48930000
450100***  DISPLAY ' O-BK-PEND-DB-VALUE ------>'                        48940000
450200                                                                  48950000
450400     IF  B1-DEL-PEND-STL-ACCT (B1-IND)  >  SPACES                 48960000
450500       IF  B1-PEND-STL-BATCH-CODE (B1-IND)  >  SPACES             48970000
450600           MOVE  B1-PEND-STL-BATCH-CODE (B1-IND)                  48980000
450700                                      TO  P2-BK-TRID              48990000
450800       ELSE                                                       49000000
450900            MOVE  'BNS'               TO  P2-BK-TRID              49010000
451000       END-IF                                                     49020000
451100       MOVE  FMT-TI-ADP-CL-NO         TO  P2-BK-BROKER-NBR        49030000
451200       MOVE  P2-DEBIT-SIGN            TO  P2-BK-BUY-SELL-CODE     49040000
451300       MOVE  B1-DEL-PEND-STL-ACCT(B1-IND) TO  P2-BK-BR-ACCT-T     49050000
YH0001       IF FMT-TRNFR-TYPE = 'MFC'                                  49060000
YH0001            PERFORM O-WRITE-P2-MFC-ACCOUNT                        49070000
YH0001       END-IF                                                     49080000
YH0001                                                                  49090000
451400       MOVE  'X'                      TO  P2-BK-CHECK-DIGIT       49100000
451500       MOVE  FMT-TI-CONTROL-NUM       TO  P2-BK-CNTL-NBR          49110000
451600       MOVE  FMT-CONTRA-BRK-NUM       TO  P2-BK-CNTRA-BKR         49120000
451700       MOVE  ZEROS                    TO  TST-P2-BK-QTY           49130000
451800       MOVE  ZEROS                    TO  P2-BK-FRACTION          49140000
451900       MOVE  FMT-ASSET-VALUE          TO  AMOUNT-OVERFLOW         49150000
452000       MOVE  '1'                      TO  OVERFLOW-SW             49160000
452100       IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND               49170000
452200           FMT-ACT-TYPE  =  'DR')                                 49180000
452300       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND               49190000
ET0001          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               49200000
ET0001                            'SI' OR 'EI' OR 'RI'))                49210000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               49220000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               49230000
LRM027                            'SI' OR 'EI' OR 'RI' OR               49240000
LRM027                            'BI' OR 'BR' OR '4K' OR               49250000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        49260000
452500          IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                    49270000
453400             SET FUND-SERV-ROLLOVER TO TRUE                       49280000
453500          END-IF                                                  49290000
453600       END-IF                                                     49300000
453700       PERFORM  O-AMT-OVRFLOW-CHK-RTN                             49310000
453800          UNTIL NO-MORE-OVERFLOW                                  49320000
453900       MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW     49330000
455200     END-IF.                                                      49340000
455300     IF  FMT-CLNT-IS-RECEIVER                                     49350000
455400         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-REC-DB-VALUE49360000
455500     ELSE                                                         49370000
455600         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-DEL-DB-VALUE49380000
455700     END-IF.                                                      49390000
455800                                                                  49400000
456100* FUND/SERV                                                       49410000
456200 O-BK-PEND-DB-BOTH.                                               49420000
457200                                                                  49430000
457300***  IF RECEIVER AND B1(434637) IS ON ============>               49440000
457400     IF  FMT-CLNT-IS-RECEIVER    AND                              49450000
457500         B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES                 49460000
457600         MOVE B1-RCV-PEND-STL-ACCT (B1-IND) TO  P2-BK-BR-ACCT-T   49470000
457700     ELSE                                                         49480000
457800***  IF DELIVERER AND B1(434638) IS ON ============>              49490000
457900        IF FMT-CLNT-IS-DELIVERER AND                              49500000
458000            B1-DEL-PEND-STL-ACCT (B1-IND) > SPACES                49510000
458100            MOVE B1-DEL-PEND-STL-ACCT (B1-IND)                    49520000
458200                                            TO  P2-BK-BR-ACCT-T   49530000
458300        END-IF                                                    49540000
458400     END-IF.                                                      49550000
                                                                        49560000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    49570000
YH0001         PERFORM O-WRITE-P2-MFC-ACCOUNT                           49580000
YH0001     END-IF.                                                      49590000
458500                                                                  49600000
458600     IF (B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES)  OR            49610000
458700        (B1-DEL-PEND-STL-ACCT (B1-IND)  >  SPACES)                49620000
458800       IF  B1-PEND-STL-BATCH-CODE (B1-IND)  >  SPACES             49630000
458900           MOVE  B1-PEND-STL-BATCH-CODE (B1-IND)                  49640000
459000                                      TO  P2-BK-TRID              49650000
459400       ELSE                                                       49660000
459500            MOVE  'BNS'               TO  P2-BK-TRID              49670000
459600       END-IF                                                     49680000
459700       MOVE  FMT-TI-ADP-CL-NO         TO  P2-BK-BROKER-NBR        49690000
459800       MOVE  P2-DEBIT-SIGN            TO  P2-BK-BUY-SELL-CODE     49700000
459900       MOVE  'X'                      TO  P2-BK-CHECK-DIGIT       49710000
460000       MOVE  FMT-TI-CONTROL-NUM       TO  P2-BK-CNTL-NBR          49720000
460100       MOVE  FMT-CONTRA-BRK-NUM       TO  P2-BK-CNTRA-BKR         49730000
460200       MOVE  FMT-ASSET-QUAN           TO  WS-QTY                  49740000
460300       MOVE  WS-QTY                   TO  P2-BK-QUANTITY          49750000
460400       MOVE  FMT-ASSET-QUAN-FRACTION  TO  P2-BK-FRACTION          49760000
460500       MOVE  FMT-ASSET-VALUE          TO  P2-BK-AMOUNT            49770000
461800                                                                  49780000
461900       IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND               49790000
462000           FMT-ACT-TYPE  =  'DR')                                 49800000
462100       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND               49810000
ET0001          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               49820000
ET0001                            'SI' OR 'EI' OR 'RI'))                49830000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               49840000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               49850000
LRM027                            'SI' OR 'EI' OR 'RI' OR               49860000
LRM027                            'BI' OR 'BR' OR '4K' OR               49870000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        49880000
462300           IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                   49890000
463200              SET FUND-SERV-ROLLOVER TO TRUE                      49900000
463300           END-IF                                                 49910000
463400       END-IF                                                     49920000
463500       PERFORM  O-WRITE-P2-REC                                    49930000
463600       MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW     49940000
463700                                                                  49950000
463800     END-IF.                                                      49960000
463900                                                                  49961000
464000     IF  FMT-CLNT-IS-RECEIVER                                     49962000
464100         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-REC-DB-VALUE49963000
464200         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-REC-DB-QTY  49964000
464300     ELSE                                                         49965000
464400         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-DEL-DB-VALUE49966000
464500         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-DEL-DB-QTY  49967000
464600     END-IF.                                                      49968000
464700                                                                  49969000
464800/                                                                 49970000
464900* FUND/SERV                                                       49980000
465000 O-BK-PEND-CR-QUANTITY.                                           49990000
465200***  IF RECEIVER AND B1(434637) IS ON ============>               50000000
465300     IF  FMT-CLNT-IS-RECEIVER    AND                              50010000
465400         B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES                 50020000
465500         MOVE B1-RCV-PEND-STL-ACCT (B1-IND) TO  P2-BK-BR-ACCT-T   50030000
465600     ELSE                                                         50040000
465700***  IF DELIVERER AND B1(434638) IS ON ============>              50050000
465800        IF FMT-CLNT-IS-DELIVERER AND                              50060000
465900            B1-DEL-PEND-STL-ACCT (B1-IND) > SPACES                50061000
466000            MOVE B1-DEL-PEND-STL-ACCT (B1-IND)                    50062000
466100                                            TO  P2-BK-BR-ACCT-T   50063000
466200        END-IF                                                    50064000
466300     END-IF.                                                      50065000
466400                                                                  50066000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    50067000
               PERFORM O-WRITE-P2-MFC-ACCOUNT                           50068000
           END-IF.                                                      50069000
                                                                        50070000
466500     IF (B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES)  OR            50080000
466600        (B1-DEL-PEND-STL-ACCT (B1-IND)  >  SPACES)                50090000
466700       IF  B1-PEND-STL-BATCH-CODE (B1-IND)  >  SPACES             50100000
466800           MOVE  B1-PEND-STL-BATCH-CODE (B1-IND)                  50110000
466900                                      TO  P2-BK-TRID              50120000
467000*          DISPLAY '  '                                           50130000
467100*          DISPLAY ' O-BK-PEND-CR-QUANTITY  ---->'                50140000
467200*          DISPLAY '==========================='                  50150000
467300       ELSE                                                       50160000
467400            MOVE  'BNS'               TO  P2-BK-TRID              50170000
467500       END-IF                                                     50180000
467600       MOVE  FMT-TI-ADP-CL-NO         TO  P2-BK-BROKER-NBR        50190000
467700       MOVE  P2-CREDIT-SIGN           TO  P2-BK-BUY-SELL-CODE     50200000
467800       MOVE  'X'                      TO  P2-BK-CHECK-DIGIT       50210000
467900       MOVE  FMT-TI-CONTROL-NUM       TO  P2-BK-CNTL-NBR          50220000
468000       MOVE  FMT-CONTRA-BRK-NUM       TO  P2-BK-CNTRA-BKR         50230000
468100       MOVE  FMT-ASSET-QUAN           TO  WS-QTY                  50240000
468200       MOVE  WS-QTY                   TO  P2-BK-QUANTITY          50250000
468300       MOVE  FMT-ASSET-QUAN-FRACTION  TO  P2-BK-FRACTION          50260000
468400       MOVE  ZERO                     TO  P2-BK-AMOUNT            50270000
469700                                                                  50280000
469800       IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND               50290000
469900           FMT-ACT-TYPE  =  'DR')                                 50300000
470000       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND               50310000
ET0001          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               50320000
ET0001                            'SI' OR 'EI' OR 'RI'))                50330000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               50340000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               50350000
LRM027                            'SI' OR 'EI' OR 'RI' OR               50360000
LRM027                            'BI' OR 'BR' OR '4K' OR               50370000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        50380000
470200         IF  B1-MISC-IRA-CLIENT (B1-IND) = '1'                    50390000
471100             SET  FUND-SERV-ROLLOVER  TO  TRUE                    50400000
471200          END-IF                                                  50410000
471300       END-IF                                                     50420000
471400       PERFORM  O-WRITE-P2-REC                                    50430000
471500       MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW     50440000
471600                                                                  50450000
471700     END-IF.                                                      50460000
471800                                                                  50470000
471900     IF  FMT-CLNT-IS-RECEIVER                                     50480000
472000         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-REC-CR-QTY  50490000
472100     ELSE                                                         50500000
472200         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-DEL-CR-QTY  50510000
472300     END-IF.                                                      50520000
472400                                                                  50530000
472500/                                                                 50540000
472600* FUND/SERV                                                       50550000
472700 O-BK-MEMO-DB-QUANTITY.                                           50560000
472800                                                                  50570000
LRM001     IF (B1-MFRS-ACTIVE (B1-IND)  =  'A'  OR                      50580000
LRM001         FMT-TI-ADP-CL-NO = 63)   AND                             50590000
LRM001                OMNIBUS-PROCESS   AND                             50600000
LRM001                MF-NSCC-SOURCE    AND                             50610000
LRM001                B1-MFRS-NSCCSRC-OFFSET (B1-IND) > SPACES  AND     50620000
LRM001                FMT-ACCEPTED-BY-FUND                              50630000
LRM001            MOVE B1-MFRS-NSCCSRC-OFFSET (B1-IND)                  50640000
LRM001                     TO P2-BK-BR-ACCT-T                           50650000
LRM001            MOVE 'X' TO P2-BK-CHECK-DIGIT                         50660000
LRM001            MOVE  P2-CREDIT-SIGN     TO  P2-BK-BUY-SELL-CODE      50670000
LRM001            MOVE SPACES TO P2-BK-VALUE-DT-X                       50680000
LRM001            MOVE  'BNS'                   TO  P2-BK-TRID          50690000
LRM003     ELSE                                                         50700000
LRM003     IF (B1-MFRS-ACTIVE (B1-IND)  =  'A'  OR                      50710000
LRM003         FMT-TI-ADP-CL-NO = 63)   AND                             50720000
LRM050                DST-MFE-PROCESS   AND                             50730000
LRM051                NTWIO-MATRIX-LEVEL NOT = '6' AND                  50740000
LRM050                B1-MFRS-DST-MFE-OFFSET (B1-IND) > SPACES  AND     50750000
LRM003                FMT-ACCEPTED-BY-FUND                              50760000
LRM003            MOVE B1-MFRS-DST-MFE-OFFSET (B1-IND)                  50770000
LRM003                     TO P2-BK-BR-ACCT-T                           50780000
LRM003            MOVE 'X' TO P2-BK-CHECK-DIGIT                         50790000
LRM003            MOVE  P2-CREDIT-SIGN     TO  P2-BK-BUY-SELL-CODE      50800000
LRM003            MOVE SPACES TO P2-BK-VALUE-DT-X                       50810000
LRM003            MOVE  'BNS'                   TO  P2-BK-TRID          50820000
LRM003     ELSE                                                         50830000
LRM029     IF (B1-MFRS-ACTIVE (B1-IND)  =  'A'  OR                      50840000
LRM029         FMT-TI-ADP-CL-NO = 63)   AND                             50850000
LRM029                PNC-OMNIBUS-PROCESS AND                           50860000
LRM029                B1-PNC-SURPAS-OFFSET (B1-IND) > SPACES  AND       50870000
LRM029                FMT-ACCEPTED-BY-FUND                              50880000
LRM029            MOVE B1-PNC-SURPAS-OFFSET (B1-IND)                    50890000
LRM029                     TO P2-BK-BR-ACCT-T                           50900000
LRM029            MOVE 'X' TO P2-BK-CHECK-DIGIT                         50910000
LRM029            MOVE  P2-CREDIT-SIGN     TO  P2-BK-BUY-SELL-CODE      50920000
LRM029            MOVE SPACES TO P2-BK-VALUE-DT-X                       50930000
LRM029            MOVE  'BNS'                   TO  P2-BK-TRID          50940000
LRM029     ELSE                                                         50950000
472900     IF  B1-MFRS-ACTIVE (B1-IND)  =  'A'  OR                      50960000
473000         FMT-TI-ADP-CL-NO = 63                                    50970000
473100       EVALUATE TRUE                                              50980000
473200         WHEN  FMT-NTWRK-CNTL-CD = '1'                            50990000
473300               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    51000000
473400               MOVE  P2-DEBIT-SIGN        TO  P2-BK-BUY-SELL-CODE 51010000
473500               IF  FMT-TI-ADP-CL-NO = 63                          51020000
473600                   MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID     51030000
473700                   ADD  FMT-ASSET-QUAN     TO  TOT-N0-MEMO-CR-QTY 51040000
473800               ELSE                                               51050000
473900                   MOVE  MEMO-TWO-WAY-BATCH (1) TO P2-BK-TRID     51060000
474000                   ADD  FMT-ASSET-QUAN     TO  TOT-N1-MEMO-CR-QTY 51070000
474100               END-IF                                             51080000
                     SET MEMO-TRID TO TRUE                              51090000
474200         WHEN  FMT-NTWRK-CNTL-CD = '2'                            51100000
474300               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    51110000
474400               MOVE  P2-DEBIT-SIGN        TO  P2-BK-BUY-SELL-CODE 51111000
474500               IF  FMT-TI-ADP-CL-NO = 63                          51112000
474600                   MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID     51113000
474700                   ADD  FMT-ASSET-QUAN     TO  TOT-N0-MEMO-CR-QTY 51114000
474800               ELSE                                               51115000
474900                   MOVE  MEMO-TWO-WAY-BATCH (2) TO P2-BK-TRID     51116000
475000                   ADD  FMT-ASSET-QUAN     TO  TOT-N2-MEMO-CR-QTY 51117000
475100               END-IF                                             51118000
                     SET MEMO-TRID TO TRUE                              51119000
475200         WHEN  FMT-NTWRK-CNTL-CD = '3'                            51119100
475300               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    51119200
475400               MOVE  P2-DEBIT-SIGN        TO  P2-BK-BUY-SELL-CODE 51119300
LRM050               IF DST-DIRECT                                      51119400
LRM050               AND NTWIO-MATRIX-LEVEL = '6'                       51119500
LRM050               AND MEMO-TWO-WAY-BATCH (6) > SPACES                51119600
LRM050                  MOVE  MEMO-TWO-WAY-BATCH (6) TO P2-BK-TRID      51119700
LRM050                  ADD  FMT-ASSET-QUAN      TO  TOT-N6-MEMO-CR-QTY 51119800
LRM050               ELSE                                               51119900
475500                  MOVE  MEMO-TWO-WAY-BATCH (3) TO P2-BK-TRID      51120000
475600                  ADD  FMT-ASSET-QUAN      TO  TOT-N3-MEMO-CR-QTY 51120100
LRM050               END-IF                                             51120200
                     SET MEMO-TRID TO TRUE                              51120300
475700         WHEN  FMT-NTWRK-CNTL-CD = '4'                            51120400
475800               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    51120500
475900               MOVE  P2-DEBIT-SIGN        TO  P2-BK-BUY-SELL-CODE 51120600
476000               IF  FMT-TI-ADP-CL-NO = 63                          51120700
476100                   MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID     51120800
476200                   ADD  FMT-ASSET-QUAN     TO  TOT-N0-MEMO-CR-QTY 51120900
476300               ELSE                                               51121000
476400                   MOVE  MEMO-TWO-WAY-BATCH (4) TO P2-BK-TRID     51122000
476500                   ADD  FMT-ASSET-QUAN     TO  TOT-N4-MEMO-CR-QTY 51123000
476600               END-IF                                             51124000
                     SET MEMO-TRID TO TRUE                              51125000
476700         WHEN  OTHER                                              51126000
476800           IF  FMT-TI-ADP-CL-NO = 63                              51127000
476900               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    51128000
477000               MOVE  P2-DEBIT-SIGN        TO  P2-BK-BUY-SELL-CODE 51129000
477100               MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID         51130000
477200           ELSE                                                   51140000
477300            MOVE  'BNS'                   TO  P2-BK-TRID          51150000
477400            MOVE  P2-CREDIT-SIGN       TO  P2-BK-BUY-SELL-CODE    51160000
477410                                                                  51170000
478810             IF OMNIBUS-PROCESS   AND                             51180000
478820                B1-MFRS-OMNIBUS-OFFSET (B1-IND) > SPACES  AND     51190000
478830                FMT-ACCEPTED-BY-FUND                              51200000
478840                MOVE B1-MFRS-OMNIBUS-OFFSET (B1-IND)              51210000
478850                         TO P2-BK-BR-ACCT-T                       51220000
478860                MOVE 'X' TO P2-BK-CHECK-DIGIT                     51230000
478870                 PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT  51240000
478880                 IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND           51250000
478890                    WS-VALUE-DT-YYMMDD > ZEROES                   51260000
478891                    MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT     51270000
478892                 ELSE                                             51280000
478893                    MOVE SPACES TO P2-BK-VALUE-DT-X               51290000
478894                 END-IF                                           51300000
LRM003            ELSE                                                  51310000
LRM003            IF DST-MFE-PROCESS   AND                              51320000
LRM003              B1-MFRS-DST-MFE-OFFSET (B1-IND) > SPACES            51330000
LRM003               MOVE  B1-MFRS-DST-MFE-OFFSET (B1-IND)              51340000
LRM003                                              TO P2-BK-BR-ACCT-T  51350000
LRM003               MOVE 'X'                       TO P2-BK-CHECK-DIGIT51360000
LRM003               PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT    51370000
LRM003               IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND             51380000
LRM003                    WS-VALUE-DT-YYMMDD > ZEROES                   51390000
LRM003                    MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT     51400000
LRM003               ELSE                                               51410000
LRM003                    MOVE SPACES TO P2-BK-VALUE-DT-X               51420000
LRM003               END-IF                                             51430000
LRM029            ELSE                                                  51440000
LRM029            IF PNC-OMNIBUS-PROCESS AND                            51450000
LRM029               B1-PNC-SURPAS-OFFSET (B1-IND) > SPACES             51460000
LRM029               MOVE  B1-PNC-SURPAS-OFFSET (B1-IND)                51470000
LRM029                                              TO P2-BK-BR-ACCT-T  51480000
LRM029               MOVE 'X'                       TO P2-BK-CHECK-DIGIT51490000
LRM029               PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT    51500000
LRM029               IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND             51510000
LRM029                    WS-VALUE-DT-YYMMDD > ZEROES                   51520000
LRM029                    MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT     51530000
LRM029               ELSE                                               51540000
LRM029                    MOVE SPACES TO P2-BK-VALUE-DT-X               51550000
LRM029               END-IF                                             51560000
478895             ELSE                                                 51570000
478900              MOVE SPACES               TO P2-BK-VALUE-DT-X       51580000
479000              IF FMT-FUND-BK-CD = 'BB' AND                        51590000
479100                B1-MFRS-BB-OFFSET (B1-IND) > SPACES               51600000
479200                MOVE B1-MFRS-BB-OFFSET (B1-IND)                   51610000
479300                  TO P2-BK-BR-ACCT-T                              51620000
479400                MOVE 'X' TO P2-BK-CHECK-DIGIT                     51630000
479500              ELSE                                                51640000
479600               IF FMT-FUND-BK-CD = 'BN' AND                       51650000
479700                  B1-MFRS-BN-OFFSET (B1-IND) > SPACES             51660000
479800                  MOVE B1-MFRS-BN-OFFSET (B1-IND)                 51670000
479900                    TO P2-BK-BR-ACCT-T                            51680000
480000                  MOVE 'X' TO P2-BK-CHECK-DIGIT                   51690000
480100               ELSE                                               51700000
480200                  MOVE ALTERNATE-OFFSET-ACCOUNT                   51710000
480300                    TO P2-BK-BR-ACCT-T-C                          51720000
480400               END-IF                                             51730000
480500              END-IF                                              51740000
LRM003             END-IF                                               51750000
LRM029             END-IF                                               51760000
480600             END-IF                                               51770000
480700           END-IF                                                 51780000
480800           ADD  FMT-ASSET-QUAN        TO  TOT-N0-MEMO-CR-QTY      51790000
480900       END-EVALUATE                                               51800000
481000     ELSE                                                         51810000
481100        MOVE  'BNS'                   TO  P2-BK-TRID              51820000
481200           MOVE  P2-CREDIT-SIGN       TO  P2-BK-BUY-SELL-CODE     51830000
481300        MOVE  ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C       51840000
481400        ADD  FMT-ASSET-QUAN             TO  TOT-N0-MEMO-CR-QTY    51850000
481500        MOVE SPACES               TO P2-BK-VALUE-DT-X             51860000
481600     END-IF.                                                      51870000
481700     MOVE  FMT-TI-ADP-CL-NO           TO  P2-BK-BROKER-NBR.       51880000
481800     MOVE  FMT-TI-CONTROL-NUM         TO  P2-BK-CNTL-NBR.         51890000
481900     MOVE  FMT-CONTRA-BRK-NUM         TO  P2-BK-CNTRA-BKR.        51900000
482000     MOVE  ZERO                       TO  P2-BK-AMOUNT.           51910000
482100     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           51920000
482200     MOVE WS-QTY             TO P2-BK-QUANTITY                    51930000
482300     MOVE  FMT-ASSET-QUAN-FRACTION    TO  P2-BK-FRACTION.         51940000
482400                                                                  51950000
482500     IF  P2-BK-TRID (2:2) NOT = SPACES                            51960000
482600         IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND             51970000
482700             FMT-ACT-TYPE  =  'DR')                               51980000
482800         OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND             51990000
ET0001            (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR             52000000
ET0001                              'SI' OR 'EI' OR 'RI'))              52010000
LRM027         OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND             52020000
LRM027            (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR             52030000
LRM027                              'SI' OR 'EI' OR 'RI' OR             52040000
LRM027                              'BI' OR 'BR' OR '4K' OR             52050000
LRM027                              '4B' OR '7B' OR '5P' OR 'HS'))      52060000
483000            IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                  52070000
483100               SET FUND-SERV-ROLLOVER TO  TRUE                    52080000
483200            END-IF                                                52090000
483300         END-IF                                                   52100000
483400         PERFORM  O-WRITE-P2-REC                                  52110000
483500         MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW   52120000
483600     END-IF.                                                      52130000
483700                                                                  52140000
483800* FUND/SERV                                                       52150000
483900 O-BK-PEND-CR-VALUE.                                              52160000
484000***  IF RECEIVER AND B1(434637) IS ON ============>               52170000
484100                                                                  52180000
484200     IF  B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES                 52190000
484300       IF  B1-PEND-STL-BATCH-CODE (B1-IND)  >  SPACES             52200000
484400           MOVE  B1-PEND-STL-BATCH-CODE (B1-IND)                  52210000
484500                                      TO  P2-BK-TRID              52220000
484900       ELSE                                                       52230000
485000            MOVE  'BNS'               TO  P2-BK-TRID              52240000
485100       END-IF                                                     52250000
485200       MOVE  FMT-TI-ADP-CL-NO         TO  P2-BK-BROKER-NBR        52260000
485300       MOVE  P2-CREDIT-SIGN           TO  P2-BK-BUY-SELL-CODE     52270000
485400       MOVE  B1-RCV-PEND-STL-ACCT(B1-IND)                         52280000
485500                                      TO  P2-BK-BR-ACCT-T         52290000
YH0001       IF FMT-TRNFR-TYPE = 'MFC'                                  52300000
               PERFORM O-WRITE-P2-MFC-ACCOUNT                           52301000
             END-IF                                                     52302000
YH0001                                                                  52303000
485600       MOVE  'X'                      TO  P2-BK-CHECK-DIGIT       52304000
485700       MOVE  FMT-TI-CONTROL-NUM       TO  P2-BK-CNTL-NBR          52305000
485800       MOVE  FMT-CONTRA-BRK-NUM       TO  P2-BK-CNTRA-BKR         52306000
485900       MOVE  ZEROS                    TO  TST-P2-BK-QTY           52307000
486000       MOVE  ZEROS                    TO  P2-BK-FRACTION          52308000
486100       MOVE  FMT-ASSET-VALUE          TO  AMOUNT-OVERFLOW         52309000
487400                                                                  52310000
487500       MOVE  '1'                      TO  OVERFLOW-SW             52320000
487600       IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND               52330000
487700           FMT-ACT-TYPE  =  'DR')                                 52340000
487800       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND               52350000
ET0001          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               52360000
ET0001                            'SI' OR 'EI' OR 'RI'))                52370000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               52380000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               52390000
LRM027                            'SI' OR 'EI' OR 'RI' OR               52400000
LRM027                            'BI' OR 'BR' OR '4K' OR               52410000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        52420000
488000          IF  B1-MISC-IRA-CLIENT (B1-IND) = '1'                   52430000
488900             SET  FUND-SERV-ROLLOVER  TO  TRUE                    52440000
489000          END-IF                                                  52450000
489100       END-IF                                                     52460000
489200       PERFORM  O-AMT-OVRFLOW-CHK-RTN                             52470000
489300          UNTIL NO-MORE-OVERFLOW                                  52480000
489400       MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW     52490000
489500     END-IF.                                                      52500000
489600     IF  FMT-CLNT-IS-RECEIVER                                     52510000
489700         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-REC-CR-VALUE52520000
489800     ELSE                                                         52530000
489900         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-DEL-CR-VALUE52540000
490000     END-IF.                                                      52550000
490100                                                                  52560000
490200/                                                                 52570000
490300* FUND/SERV                                                       52580000
490400 O-BK-PEND-CR-BOTH.                                               52590000
491700***  IF RECEIVER AND B1(434637) IS ON ============>               52600000
491800     IF  FMT-CLNT-IS-RECEIVER   AND                               52610000
491900         B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES                 52620000
492000          MOVE B1-RCV-PEND-STL-ACCT(B1-IND)                       52630000
492100                                      TO  P2-BK-BR-ACCT-T         52631000
492200     ELSE                                                         52632000
492300***  IF DELIVERER AND B1(434638) IS ON ============>              52633000
492400        IF FMT-CLNT-IS-DELIVERER  AND                             52634000
492500            B1-DEL-PEND-STL-ACCT (B1-IND) > SPACES                52635000
492600            MOVE B1-DEL-PEND-STL-ACCT(B1-IND)                     52636000
492700                                      TO  P2-BK-BR-ACCT-T         52637000
492800        END-IF                                                    52638000
492900     END-IF.                                                      52639000
493000                                                                  52640000
493100     IF (B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES) OR             52650000
493200        (B1-DEL-PEND-STL-ACCT (B1-IND)  >  SPACES)                52660000
493300       IF  B1-PEND-STL-BATCH-CODE (B1-IND)  >  SPACES             52670000
493400           MOVE  B1-PEND-STL-BATCH-CODE (B1-IND)                  52680000
493500                                      TO  P2-BK-TRID              52690000
493900       ELSE                                                       52700000
494000            MOVE  'BNS'               TO  P2-BK-TRID              52710000
494100       END-IF                                                     52720000
494200       MOVE  FMT-TI-ADP-CL-NO         TO  P2-BK-BROKER-NBR        52730000
494300       MOVE  P2-CREDIT-SIGN           TO  P2-BK-BUY-SELL-CODE     52740000
494400       MOVE  'X'                      TO  P2-BK-CHECK-DIGIT       52750000
494500       MOVE  FMT-TI-CONTROL-NUM       TO  P2-BK-CNTL-NBR          52760000
494600       MOVE  FMT-CONTRA-BRK-NUM       TO  P2-BK-CNTRA-BKR         52770000
494700       MOVE  FMT-ASSET-QUAN           TO  WS-QTY                  52780000
494800       MOVE  WS-QTY                   TO  P2-BK-QUANTITY          52790000
494900       MOVE  FMT-ASSET-QUAN-FRACTION  TO  P2-BK-FRACTION          52800000
495000       MOVE  FMT-ASSET-VALUE          TO  P2-BK-AMOUNT            52810000
496300                                                                  52820000
496400       IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND               52830000
496500           FMT-ACT-TYPE  =  'DR')                                 52840000
496600       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND               52850000
ET0001          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               52860000
ET0001                            'SI' OR 'EI' OR 'RI'))                52870000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               52880000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               52890000
LRM027                            'SI' OR 'EI' OR 'RI' OR               52900000
LRM027                            'BI' OR 'BR' OR '4K' OR               52910000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        52920000
496800          IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                    52930000
497700              SET FUND-SERV-ROLLOVER TO  TRUE                     52940000
497800          END-IF                                                  52950000
497900       END-IF                                                     52960000
498000       PERFORM  O-WRITE-P2-REC                                    52970000
498100       MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW     52980000
498200                                                                  52990000
498300     END-IF.                                                      53000000
498400                                                                  53010000
498500     IF  FMT-CLNT-IS-RECEIVER                                     53020000
498600         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-REC-CR-VALUE53030000
498700         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-REC-CR-QTY  53040000
498800     ELSE                                                         53050000
498900         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-DEL-CR-VALUE53060000
499000         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-DEL-CR-QTY  53070000
499100     END-IF.                                                      53080000
499200                                                                  53090000
499300/                                                                 53100000
499400* FUND/SERV                                                       53110000
499500 O-BK-PEND-DB-QUANTITY.                                           53120000
499600***  IF RECEIVER AND B1(434637) IS ON ============>               53130000
499700     IF  FMT-CLNT-IS-RECEIVER    AND                              53140000
499800         B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES                 53150000
499900          MOVE B1-RCV-PEND-STL-ACCT(B1-IND)                       53151000
500000                                      TO  P2-BK-BR-ACCT-T         53152000
500100     ELSE                                                         53153000
500200***  IF DELIVERER AND B1(434638) IS ON ============>              53154000
500300        IF FMT-CLNT-IS-DELIVERER  AND                             53155000
500400            B1-DEL-PEND-STL-ACCT (B1-IND) > SPACES                53156000
500500            MOVE B1-DEL-PEND-STL-ACCT(B1-IND)                     53157000
500600                                      TO  P2-BK-BR-ACCT-T         53158000
500700        END-IF                                                    53159000
500800     END-IF.                                                      53160000
500900                                                                  53170000
501000     IF (B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES) OR             53180000
501100        (B1-DEL-PEND-STL-ACCT (B1-IND)  >  SPACES)                53190000
501200       IF  B1-PEND-STL-BATCH-CODE (B1-IND)  >  SPACES             53200000
501300           MOVE  B1-PEND-STL-BATCH-CODE (B1-IND)                  53210000
501400                                      TO  P2-BK-TRID              53220000
501800       ELSE                                                       53230000
501900            MOVE  'BNS'               TO  P2-BK-TRID              53240000
502000       END-IF                                                     53250000
502100       MOVE  FMT-TI-ADP-CL-NO         TO  P2-BK-BROKER-NBR        53260000
502200       MOVE  P2-DEBIT-SIGN            TO  P2-BK-BUY-SELL-CODE     53270000
502300       MOVE  'X'                      TO  P2-BK-CHECK-DIGIT       53280000
502400       MOVE  FMT-TI-CONTROL-NUM       TO  P2-BK-CNTL-NBR          53290000
502500       MOVE  FMT-CONTRA-BRK-NUM       TO  P2-BK-CNTRA-BKR         53300000
502600       MOVE  FMT-ASSET-QUAN           TO  WS-QTY                  53310000
502700       MOVE  WS-QTY                   TO  P2-BK-QUANTITY          53320000
502800       MOVE  FMT-ASSET-QUAN-FRACTION  TO  P2-BK-FRACTION          53330000
502900       MOVE  ZERO                     TO  P2-BK-AMOUNT            53340000
504200                                                                  53350000
504300       IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND               53360000
504400           FMT-ACT-TYPE  =  'DR')                                 53370000
504500       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND               53380000
ET0001          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               53390000
ET0001                            'SI' OR 'EI' OR 'RI'))                53400000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               53410000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               53420000
LRM027                            'SI' OR 'EI' OR 'RI' OR               53430000
LRM027                            'BI' OR 'BR' OR '4K' OR               53440000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        53450000
504700          IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                    53460000
505600             SET  FUND-SERV-ROLLOVER  TO  TRUE                    53470000
505700          END-IF                                                  53480000
505800       END-IF                                                     53490000
505900       PERFORM  O-WRITE-P2-REC                                    53500000
506000       MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW     53510000
506100                                                                  53520000
506200     END-IF.                                                      53530000
506300                                                                  53540000
506400     IF  FMT-CLNT-IS-RECEIVER                                     53550000
506500         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-REC-DB-QTY  53560000
506600     ELSE                                                         53570000
506700         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-DEL-DB-QTY  53580000
506800     END-IF.                                                      53590000
506900                                                                  53600000
507000/                                                                 53610000
519470******************************************************************53620000
519480*** PERFORMED BY:                                              ***53630000
519490***     O-DLVR-LONG-NON-CNS                                    ***53640000
519500***     O-RCVR-SHORT-NON-CNS                                   ***53650000
519600******************************************************************53660000
519700                                                                  53670000
519800 O-RD-CL-CR-VALUE-CR-QUANTITY.                                    53680000
519900                                                                  53690000
520000     ADD  FMT-ASSET-VALUE    TO TOT-CL-RD-CL-CR-VALUE             53700000
520100     ADD  FMT-ASSET-QUAN     TO TOT-CL-RD-CL-CR-QTY.              53710000
520200                                                                  53720000
520300 O-RD-CL-CR-QUANTITY.                                             53730000
520400                                                                  53740000
520500     ADD  FMT-ASSET-QUAN     TO TOT-CL-RD-CL-CR-QTY.              53750000
520600/                                                                 53760000
520700******************************************************************53770000
520800*** PERFORMED BY:                                              ***53780000
520900***     O-DLVR-LONG-NON-CNS                                    ***53790000
521000***     O-RCVR-SHORT-NON-CNS                                   ***53800000
521100******************************************************************53810000
521200                                                                  53820000
521300 O-RD-CL-DB-VALUE-DB-QUANTITY.                                    53830000
521400                                                                  53840000
521500     ADD  FMT-ASSET-VALUE    TO TOT-CL-RD-CL-DB-VALUE             53850000
521600     ADD  FMT-ASSET-QUAN     TO TOT-CL-RD-CL-DB-QTY.              53860000
521700                                                                  53870000
521800 O-RD-CL-DB-QUANTITY.                                             53880000
521900                                                                  53890000
522000     ADD  FMT-ASSET-QUAN     TO TOT-CL-RD-CL-DB-QTY.              53900000
522100/                                                                 53910000
522200******************************************************************53920000
522300*** PERFORMED BY:                                              ***53930000
522400***     O-BK-CUST-CR-VALUE                                     ***53940000
522500***     O-BK-CUST-DB-VALUE                                     ***53950000
522600***     O-BK-OFFSET-CR-CASH-VALUE                              ***53960000
522700***     O-BK-OFFSET-DB-CASH-VALUE                              ***53970000
522800***     O-BK-OPTION-DB-QUANTITY                                ***53980000
522900***     O-BK-OPTION-CR-QUANTITY                                ***53990000
523000******************************************************************54000000
523100                                                                  54010000
523200 O-CUST-ACT-MOVE-BR-ACT.                                          54020000
523300     MOVE FMT-TI-CUST-ACCOUNT (1:3) TO P2-BK-BRANCH               54030000
523400     MOVE FMT-TI-CUST-ACCOUNT (4:5) TO P2-BK-ACCOUNT              54040000
523500** FORCE SMA TO BOOK AS TYPE 2:                                   54050000
523600     IF FMT-SMA                                                   54060000
523700             MOVE '2' TO P2-BK-TYPE                               54070000
523800     ELSE                                                         54080000
523900       EVALUATE TRUE                                              54090000
524000         WHEN     FMT-CASH-ACT                                    54100000
524100             OR   FMT-OTHER-ACT                                   54110000
524200             MOVE '1' TO P2-BK-TYPE                               54120000
524300         WHEN     FMT-MARGIN-ACT                                  54130000
524400             MOVE '2' TO P2-BK-TYPE                               54140000
524500         WHEN     FMT-SHORT-ACT                                   54150000
524600             MOVE '5' TO P2-BK-TYPE                               54160000
524700         WHEN     OTHER                                           54170000
524800             MOVE '1' TO P2-BK-TYPE                               54180000
524900       END-EVALUATE                                               54190000
525000     END-IF.                                                      54200000
525100                                                                  54210000
525200     CALL  CKDIGIT  USING                                         54220000
525300                        P2-BK-BR-ACCT-T                           54230000
525400                        LENGTH-KEY                                54240000
525500                        P2-BK-CHECK-DIGIT                         54250000
525600     END-CALL.                                                    54260000
525700/                                                                 54270000
525800 O-CUST-ACT-MOVE-OMNIBUS.                                         54280000
525900     MOVE FMT-TI-CUST-ACCOUNT (1:3) TO WS-BRANCH                  54290000
526000     MOVE FMT-TI-CUST-ACCOUNT (4:5) TO WS-ACCT                    54300000
526100** FORCE SMA TO BOOK AS TYPE 2:                                   54310000
526200     IF FMT-SMA                                                   54320000
526300             MOVE '2' TO WS-TYPE                                  54330000
526400     ELSE                                                         54340000
526500       EVALUATE TRUE                                              54350000
526600         WHEN     FMT-CASH-ACT                                    54360000
526700             OR   FMT-OTHER-ACT                                   54370000
526800             MOVE '1' TO WS-TYPE                                  54380000
526900         WHEN     FMT-MARGIN-ACT                                  54390000
527000             MOVE '2' TO WS-TYPE                                  54400000
527100         WHEN     FMT-SHORT-ACT                                   54410000
527200             MOVE '5' TO WS-TYPE                                  54420000
527300         WHEN     OTHER                                           54430000
527400             MOVE '1' TO WS-TYPE                                  54440000
527500       END-EVALUATE                                               54450000
527600     END-IF.                                                      54460000
527700                                                                  54470000
527800     CALL  CKDIGIT  USING                                         54480000
527900                        WS-BR-ACCT-T                              54490000
528000                        LENGTH-KEY                                54500000
528100                        WS-CHECK-DIGIT                            54510000
528200     END-CALL.                                                    54520000
528300/                                                                 54530000
528400******************************************************************54540000
528500*** PERFORMED BY:                                              ***54550000
528600***     O-BK-OFFSET-CR-CASH-VALUE                              ***54560000
528700***     O-BK-OFFSET-DB-CASH-VALUE                              ***54570000
528800******************************************************************54580000
528900                                                                  54590000
529000 O-AMT-OVRFLOW-CHK-RTN.                                           54600000
529100                                                                  54610000
529200     IF  AMOUNT-OVERFLOW > AMOUNT-FULL                            54620000
529300         SUBTRACT AMOUNT-FULL FROM AMOUNT-OVERFLOW                54630000
529400                            GIVING AMOUNT-OVERFLOW                54640000
529500         END-SUBTRACT                                             54650000
529600         MOVE AMOUNT-FULL     TO P2-BK-AMOUNT                     54660000
529700         MOVE TST-P2-BK-QTY   TO P2-BK-QUANTITY                   54670000
529800         MOVE ZERO            TO TST-P2-BK-QTY                    54680000
529900         MOVE '1' TO OVERFLOW-SW                                  54690000
530000     ELSE                                                         54700000
530100         MOVE AMOUNT-OVERFLOW TO P2-BK-AMOUNT                     54710000
530200         MOVE TST-P2-BK-QTY   TO P2-BK-QUANTITY                   54720000
530300         MOVE '0' TO OVERFLOW-SW                                  54730000
530400     END-IF                                                       54740000
530500                                                                  54750000
530600     PERFORM O-WRITE-P2-REC.                                      54760000
530700/                                                                 54770000
530800******************************************************************54780000
530900*** PERFORMED BY:                                              ***54790000
531000***     O-BK-CUST-CR-VALUE                                     ***54800000
531100***     O-BK-CUST-DB-VALUE                                     ***54810000
531200***     O-BK-OFFSET-CR-CASH-VALUE                              ***54820000
531300***     O-BK-OFFSET-DB-CASH-VALUE                              ***54830000
531400******************************************************************54840000
531500                                                                  54850000
531600 O-CASH-AMT-OVRFLOW-CHK-RTN.                                      54860000
531700                                                                  54870000
531800     IF  AMOUNT-OVERFLOW > AMOUNT-FULL                            54880000
531900         SUBTRACT AMOUNT-FULL FROM AMOUNT-OVERFLOW                54890000
532000                            GIVING AMOUNT-OVERFLOW                54900000
532100         END-SUBTRACT                                             54910000
532200         MOVE AMOUNT-FULL     TO P2-BK-AMOUNT                     54920000
532300         MOVE '1' TO OVERFLOW-SW                                  54930000
532400     ELSE                                                         54940000
532500         MOVE AMOUNT-OVERFLOW TO P2-BK-AMOUNT                     54950000
532600         MOVE '0' TO OVERFLOW-SW                                  54960000
532700     END-IF                                                       54970000
532800                                                                  54980000
532900     PERFORM O-WRITE-P2-REC.                                      54990000
533000/                                                                 55000000
533100******************************************************************55010000
533200*** PERFORMED BY:                                              ***55020000
533300***     O-RCVR-LONG-NON-CNS                                    ***55030000
533400******************************************************************55040000
533500                                                                  55050000
533600 O-BUILD-SAFEKEEPING-RECORD.                                      55060000
533700                                                                  55070000
TEST       DISPLAY 'IN O-BUILD-SAFEK B1=' B1-SFK-RSEC-MEMO (B1-IND)     55080000
TEST          ' PEND-STTL-RSN=' FMT-STTLM-RSN-CD                        55090000
LRM032     IF  B1-SFK-RSEC-MEMO (B1-IND) > SPACES                       55100000
LRM032     AND (FMT-SAFE-KEEPING OR FMT-RESTRICTED-SECURITY)            55110000
LRM032         MOVE 'S' TO P2-BK-TRID-X                                 55120000
LRM032         MOVE B1-SFK-RSEC-MEMO (B1-IND) TO P2-BK-BATCH-CODE       55130000
TEST           DISPLAY 'ATTEMPT TO CRT MEMO ' B1-SFK-RSEC-MEMO (B1-IND) 55140000
LRM043         SET SFK-TRID TO TRUE                                     55150000
LRM043         MOVE  FMT-ASSET-QUAN    TO  WS-QTY                       55151000
LRM043         MOVE WS-QTY             TO P2-BK-QUANTITY                55152000
LRM043         MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION           55153000
LRM032         PERFORM O-WRITE-P2-REC                                   55154000
LRM032     ELSE                                                         55155000
533800     IF FMT-SAFE-KEEPING                                          55156000
LRM043         MOVE P2-BK-TRID       TO SFK-SAVE-TRID                   55157000
LRM043         MOVE P2-BK-BATCH-CODE TO SFK-SAVE-BATCH                  55158000
533900         MOVE 'SSB' TO P2-BK-TRID                                 55159000
TEST           DISPLAY 'SET TRID TO SSB'                                55160000
LRM043         SET SFK-TRID TO TRUE                                     55170000
LRM043         MOVE  FMT-ASSET-QUAN    TO  WS-QTY                       55180000
LRM043         MOVE WS-QTY             TO P2-BK-QUANTITY                55190000
LRM043         MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION           55200000
534000         PERFORM O-WRITE-P2-REC                                   55210000
LRM043         MOVE SFK-SAVE-TRID  TO P2-BK-TRID                        55211000
LRM043         MOVE SFK-SAVE-BATCH TO P2-BK-BATCH-CODE                  55212000
534100     END-IF.                                                      55213000
534200/                                                                 55214000
534300******************************************************************55215000
534400*** PERFORMED BY:                                              ***55216000
534500***     O-BK-CUST-CR-QUANTITY                                  ***55217000
534600***     O-BK-CUST-DB-QUANTITY                                  ***55218000
534700***     O-BK-OPTION-DB-QUANTITY                                ***55219000
534800***     O-BK-OPTION-CR-QUANTITY                                ***55220000
534900***     O-BK-OPTION-OFFSET-DB-QTY                              ***55230000
535000***     O-BK-OPTION-OFFSET-CR-QTY                              ***55240000
535100***     O-BK-CNS-CR-QUANTITY                                   ***55241000
535200***     O-BK-CNS-DB-QUANTITY                                   ***55242000
535300***     O-AMT-OVRFLOW-CHK-RTN                                  ***55243000
535400***     O-CASH-AMT-OVRFLOW-CHK-RTN                             ***55244000
535500***     O-BUILD-SAFEKEEPING-RECORD                             ***55245000
535600******************************************************************55246000
535700                                                                  55247000
535800 O-WRITE-P2-REC.                                                  55248000
535900*    DISPLAY '   '                                                55249000
536000*    DISPLAY ' ***** O-WRITE-P2-REC.******'                       55250000
LRM043     IF NOT SFK-TRID                                              55260000
536100        PERFORM O-WRITE-P2-ENTRY-CODE                             55270000
LRM043     END-IF.                                                      55280000
LRM043     MOVE 'N' TO SFK-TRID-SW.                                     55290000
536200     IF P2-BK-VALUE-DT-X  = LOW-VALUE                             55300000
536300        MOVE SPACES TO P2-BK-VALUE-DT-X                           55310000
536400     END-IF                                                       55320000
536500     WRITE P2BKPG-RECORD FROM P2-BK-RECORD                        55330000
536600     MOVE SPACES TO P2-BK-VALUE-DT-X                              55340000
536700     ADD 1 TO TOT-CL-P2-RECS-WRITTEN                              55350000
536800     IF FMT-TRNFR-TYPE-RSN-CD > '00' AND < '13'                   55360000
536900        IF  FMT-FUND-SERV    AND                                  55370000
537000            P2-BK-TRID  >  'S  '                                  55380000
537100            CONTINUE                                              55390000
537200        ELSE                                                      55400000
537300          IF  B1-RES-CREDIT-P2-TRLR (B1-IND)  =  '0'              55410000
537400            PERFORM O-WRITE-P2-TRAILER                            55420000
537500          END-IF                                                  55430000
537600        END-IF                                                    55440000
537700     END-IF                                                       55450000
537800* ACAT TRAILER PROCESSING                                         55460000
537900     IF (B1-ACAT-P2-TRAILER (B1-IND) = '1' OR '2' OR '3') AND     55470000
538000        (FMT-CLNT-IS-RECEIVER OR FMT-CLNT-IS-DELIVERER)           55480000
538100            PERFORM O-WRITE-ACAT-P2-TRAILER                       55490000
538200     END-IF                                                       55500000
LRM013     IF (FMT-TRNFR-TYPE = 'PTR'                                   55510000
LRM013     AND B1-ACAT-PTR-TRAILER (B1-IND) > SPACES)                   55520000
LRM013     OR (FMT-TRNFR-TYPE = 'PTD'                                   55530000
LRM013     AND B1-ACAT-PTD-TRAILER (B1-IND) > SPACES)                   55540000
LRM025     OR (FMT-TRNFR-TYPE = 'PTF'                                   55550000
LRM025     AND B1-ACAT-PTF-TRAILER (B1-IND) > SPACES)                   55560000
LRM013     OR (FMT-TRNFR-TYPE = 'FRV'                                   55570000
LRM013     AND B1-ACAT-FRV-TRAILER (B1-IND) > SPACES)                   55580000
LRM013     OR (FMT-TRNFR-TYPE = 'RCL'                                   55590000
LRM013     AND B1-ACAT-RCL-TRAILER (B1-IND) > SPACES)                   55600000
LRM013     OR (FMT-TRNFR-TYPE = 'MFC'                                   55610000
LRM013     AND B1-ACAT-MFC-TRAILER (B1-IND) > SPACES)                   55620000
LRM013        PERFORM O-WRITE-P2-NS-TRAILER                             55630000
LRM013     END-IF.                                                      55640000
538300     IF  FUND-SERV-ROLLOVER                                       55650000
538400         CONTINUE                                                 55660000
538500     ELSE                                                         55670000
538600       IF (B1-ROLLOVER-CLIENT (B1-IND) = '1'  AND                 55680000
538700           FMT-ACT-TYPE = 'DR'  AND  P2-BK-TRID  NOT > 'S  ')     55690000
538800       OR (B1-ROLLOVER-CLIENT (B1-IND) = '2'    AND               55700000
ET0001          (FMT-ACT-TYPE = 'DR' OR 'IR' OR 'QP'                    55710000
ET0001                       OR 'SI' OR 'EI' OR 'RI') AND               55720000
539000           P2-BK-TRID NOT > 'S  ')                                55730000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               55740000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               55750000
LRM027                            'SI' OR 'EI' OR 'RI' OR               55760000
LRM027                            'BI' OR 'BR' OR '4K' OR               55770000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS') AND     55780000
LRM027           P2-BK-TRID NOT > 'S  ')                                55790000
LRM027       OR ((B1-ROLLOVER-CLIENT (B1-IND) = '1' OR '2' OR '3')      55800000
LRM016       AND (FMT-TRNFR-TYPE = 'FRV' OR 'RCL')                      55810000
LRM016       AND FMT-SCRTY-866-NBR > SPACES)                            55820000
539100           IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                   55830000
539200              PERFORM O-WRITE-P2-ROLLOVER-TRAILER                 55840000
539300              MOVE WS-SAVE-SEC    TO P2-BK-SECURITY-NBR           55850000
539700           END-IF                                                 55860000
539800       END-IF                                                     55870000
539900     END-IF.                                                      55880000
YH0001                                                                  55890000
YH0001     IF FMT-TRNFR-TYPE = 'MFC' AND FMT-CAGE-TAG NOT > SPACES      55900000
YH0001       MOVE  P2-BK-RECORD     TO  P2-BK-TRAILER-RECORD            55910000
YH0001       MOVE 'NO TAG EXISTS FOR MFC' TO P2-BKT-DESCRIPTION         55920000
YH0001       MOVE SPACES                  TO P2-BKT-QUANTITY-X          55930000
YH0001                                       P2-BKT-ENTRY-CODE          55940000
YH0001                                       P2-BKT-AMOUNT-X            55950000
YH0001       MOVE '-'                     TO P2-BKT-HYPHEN              55960000
YH0001       MOVE  0                      TO P2-BKT-FRACTION            55970000
YH0001       WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD              55980000
YH0001       ADD 1 TO TOT-CL-P2-RECS-WRITTEN                            55990000
YH0001     END-IF.                                                      56000000
540000                                                                  56010000
540100     MOVE SPACE TO WS-BK-FAIL-SW.                                 56020000
540200                                                                  56021000
540400******************************************************************56022000
540500*** PERFORMED BY:                                              ***56023000
540600***     O-WRITE-P2-REC                                         ***56024000
540700******************************************************************56025000
540800                                                                  56026000
540900 O-WRITE-P2-ENTRY-CODE.                                           56027000
LRM013     MOVE B1-ENTRY-DEL-ROLL (B1-IND) TO WS-ENTRY-DEL-ROLL         56028000
LRM013     MOVE B1-ENTRY-REC-ROLL (B1-IND) TO WS-ENTRY-REC-ROLL         56029000
LRM013     IF FMT-TRNFR-TYPE = 'PTR'                                    56030000
LRM013        IF B1-ENTRY-PTR-DEL-ROLL (B1-IND) NOT = SPACES            56040000
LRM013           MOVE B1-ENTRY-PTR-DEL-ROLL (B1-IND) TO                 56050000
LRM013                       WS-ENTRY-DEL-ROLL                          56060000
LRM013        END-IF                                                    56070000
LRM013        IF B1-ENTRY-PTR-REC-ROLL (B1-IND) NOT = SPACES            56080000
LRM013           MOVE B1-ENTRY-PTR-REC-ROLL (B1-IND) TO                 56090000
LRM013                       WS-ENTRY-REC-ROLL                          56100000
LRM013        END-IF                                                    56110000
LRM013     END-IF.                                                      56120000
541000     IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1' OR '2' OR '3')  AND  56130000
541100         FMT-ACT-TYPE  =  'DR'                                    56140000
541200     AND FMT-CLNT-IS-DELIVERER                                    56150000
541300     AND WS-ENTRY-DEL-ROLL NOT = SPACES                           56160000
541400        MOVE WS-ENTRY-DEL-ROLL TO P2-BK-ENTRY-CODE                56170000
541500     ELSE                                                         56180000
541600     IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1' OR '2' OR '3')  AND  56190000
541700         FMT-ACT-TYPE  =  'DR'                                    56200000
541800     AND NOT FMT-CLNT-IS-DELIVERER                                56210000
541900     AND WS-ENTRY-REC-ROLL NOT = SPACES                           56220000
542000        MOVE WS-ENTRY-REC-ROLL TO P2-BK-ENTRY-CODE                56230000
542100     ELSE                                                         56240000
542200     IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1' OR '2' OR '3')  AND  56250000
542300         FMT-ACT-TYPE  =  'DR'                                    56260000
542400        AND B1-MISC-IRA-CLIENT (B1-IND) = '1'                     56270000
542500        IF  FMT-CLNT-IS-DELIVERER                                 56280000
542600           IF WS-ENTRY-DEL-ROLL NOT = SPACES                      56290000
542700              MOVE WS-ENTRY-DEL-ROLL TO P2-BK-ENTRY-CODE          56300000
542800           ELSE                                                   56310000
542900*** ADD FOR CAGE/FAILS                                            56320000
LRM019*****         IF BK-FAIL-DB                                       56330000
543100*****            MOVE 'B' TO P2-BK-TRID-X                         56340000
543200*****            MOVE B1-FAIL-DELIVR-BATCH-CODE (B1-IND) TO       56350000
543300*****                 P2-BK-BATCH-CODE                            56360000
543400*****            MOVE B1-FAIL-DELIVR-ENTRY-CODE (B1-IND) TO       56370000
543500*****                 P2-BK-ENTRY-CODE                            56380000
544000*****         ELSE                                                56390000
544100                 MOVE B1-ENTRY-CODE-DEL (B1-IND) TO               56400000
544200                                                  P2-BK-ENTRY-CODE56410000
544000*****         END-IF                                              56420000
544400           END-IF                                                 56430000
544500        ELSE                                                      56440000
544600           IF WS-ENTRY-REC-ROLL NOT = SPACES                      56450000
544700              MOVE WS-ENTRY-REC-ROLL TO P2-BK-ENTRY-CODE          56460000
544800           ELSE                                                   56470000
544900*****          IF BK-FAIL-CR                                      56480000
545000*****             MOVE 'B' TO P2-BK-TRID-X                        56490000
545100*****             MOVE B1-FAIL-RECEIV-BATCH-CODE (B1-IND) TO      56500000
545200*****                  P2-BK-BATCH-CODE                           56510000
545300*****             MOVE B1-FAIL-RECEIV-ENTRY-CODE (B1-IND) TO      56520000
545400*****                  P2-BK-ENTRY-CODE                           56530000
546000*****          ELSE                                               56540000
546100                  MOVE B1-ENTRY-CODE-REC (B1-IND) TO              56550000
546200                                                  P2-BK-ENTRY-CODE56560000
546300*****          END-IF                                             56570000
546400           END-IF                                                 56580000
546410        END-IF                                                    56590000
546420     ELSE                                                         56600000
546430        IF  FMT-CLNT-IS-DELIVERER                                 56610000
546440           MOVE B1-ENTRY-CODE-DEL (B1-IND) TO P2-BK-ENTRY-CODE    56620000
546450           IF B1-ENTRY-DEL-CASH (B1-IND) > SPACES AND             56630000
546460              FMT-CASH                                            56640000
546470              MOVE B1-ENTRY-DEL-CASH (B1-IND) TO P2-BK-ENTRY-CODE 56650000
546480*** ADD FOR CAGE/FAILS                                            56660000
546490*****      ELSE                                                   56670000
LRM019*****         IF BK-FAIL-DB                                       56680000
546600*****             MOVE 'B' TO P2-BK-TRID-X                        56690000
546700*****             MOVE B1-FAIL-DELIVR-BATCH-CODE (B1-IND) TO      56700000
546800*****                  P2-BK-BATCH-CODE                           56710000
546900*****             MOVE B1-FAIL-DELIVR-ENTRY-CODE (B1-IND) TO      56720000
547000*****                  P2-BK-ENTRY-CODE                           56730000
547600*****         END-IF                                              56740000
547700           END-IF                                                 56750000
547800        ELSE                                                      56760000
547900           MOVE B1-ENTRY-CODE-REC (B1-IND) TO P2-BK-ENTRY-CODE    56770000
548000           IF B1-ENTRY-REC-CASH (B1-IND) > SPACES AND             56780000
548100              FMT-CASH                                            56790000
548200              MOVE B1-ENTRY-REC-CASH (B1-IND) TO P2-BK-ENTRY-CODE 56800000
548300*** ADD FOR CAGE/FAILS                                            56810000
548400*****      ELSE                                                   56820000
548500*****          IF BK-FAIL-CR                                      56830000
548600*****             MOVE 'B' TO P2-BK-TRID-X                        56840000
548700*****             MOVE B1-FAIL-RECEIV-BATCH-CODE (B1-IND) TO      56850000
548800*****                  P2-BK-BATCH-CODE                           56860000
548900*****             MOVE B1-FAIL-RECEIV-ENTRY-CODE (B1-IND) TO      56870000
549000*****                  P2-BK-ENTRY-CODE                           56880000
549600*****          END-IF                                             56890000
549700           END-IF                                                 56900000
549800        END-IF                                                    56910000
549900     END-IF                                                       56920000
550000     IF  P2-BK-ENTRY-CODE = SPACES                                56930000
550200         MOVE 'TFR'  TO  P2-BK-ENTRY-CODE                         56940000
LRM013     END-IF                                                       56950000
LRM013     IF FMT-TRNFR-TYPE = 'RCL'                                    56960000
LRM013     AND B1-ACAT-RCL-BATCH-ENTRY (B1-IND) > SPACES                56970000
LRM015     AND NOT MEMO-TRID                                            56980000
LRM013         MOVE B1-ACAT-RCL-BATCH (B1-IND) TO P2-BK-BATCH-CODE      56990000
LRM013         MOVE B1-ACAT-RCL-ENTRY (B1-IND) TO P2-BK-ENTRY-CODE      57000000
LRM013     END-IF                                                       57010000
LRM013     IF FMT-TRNFR-TYPE = 'PTR'                                    57020000
LRM013     AND B1-ACAT-PTR-BATCH-ENTRY (B1-IND) > SPACES                57030000
LRM015     AND NOT MEMO-TRID                                            57040000
LRM013         MOVE B1-ACAT-PTR-BATCH (B1-IND) TO P2-BK-BATCH-CODE      57050000
LRM013         MOVE B1-ACAT-PTR-ENTRY (B1-IND) TO P2-BK-ENTRY-CODE      57060000
LRM031         IF FMT-CLNT-IS-RECEIVER                                  57070000
LRM031         AND B1-ACAT-PTR-BATCH-ENTRY-RECV (B1-IND) > SPACES       57080000
LRM031             MOVE B1-ACAT-PTR-BATCH-RECV (B1-IND)                 57090000
LRM031                                         TO P2-BK-BATCH-CODE      57100000
LRM031             MOVE B1-ACAT-PTR-ENTRY-RECV (B1-IND)                 57110000
LRM031                                         TO P2-BK-ENTRY-CODE      57120000
LRM031         ELSE                                                     57130000
LRM031         IF FMT-CLNT-IS-DELIVERER                                 57140000
LRM031         AND B1-ACAT-PTR-BATCH-ENTRY-DELIV (B1-IND) > SPACES      57150000
LRM031             MOVE B1-ACAT-PTR-BATCH-DELIV (B1-IND)                57160000
LRM031                                         TO P2-BK-BATCH-CODE      57170000
LRM031             MOVE B1-ACAT-PTR-ENTRY-DELIV (B1-IND)                57180000
LRM031                                         TO P2-BK-ENTRY-CODE      57190000
LRM031         END-IF END-IF                                            57200000
LRM013     END-IF                                                       57210000
LRM013     IF FMT-TRNFR-TYPE = 'PTD'                                    57220000
LRM013     AND B1-ACAT-PTD-BATCH-ENTRY (B1-IND) > SPACES                57230000
LRM015     AND NOT MEMO-TRID                                            57240000
LRM013         MOVE B1-ACAT-PTD-BATCH (B1-IND) TO P2-BK-BATCH-CODE      57250000
LRM013         MOVE B1-ACAT-PTD-ENTRY (B1-IND) TO P2-BK-ENTRY-CODE      57250100
LRM031         IF FMT-CLNT-IS-RECEIVER                                  57250200
LRM031         AND B1-ACAT-PTD-BATCH-ENTRY-RECV (B1-IND) > SPACES       57250300
LRM031             MOVE B1-ACAT-PTD-BATCH-RECV (B1-IND)                 57250400
LRM031                                         TO P2-BK-BATCH-CODE      57250500
LRM031             MOVE B1-ACAT-PTD-ENTRY-RECV (B1-IND)                 57250600
LRM031                                         TO P2-BK-ENTRY-CODE      57250700
LRM031         ELSE                                                     57250800
LRM031         IF FMT-CLNT-IS-DELIVERER                                 57250900
LRM031         AND B1-ACAT-PTD-BATCH-ENTRY-DELIV (B1-IND) > SPACES      57251000
LRM031             MOVE B1-ACAT-PTD-BATCH-DELIV (B1-IND)                57252000
LRM031                                         TO P2-BK-BATCH-CODE      57253000
LRM031             MOVE B1-ACAT-PTD-ENTRY-DELIV (B1-IND)                57254000
LRM031                                         TO P2-BK-ENTRY-CODE      57255000
LRM031         END-IF END-IF                                            57256000
LRM013     END-IF                                                       57257000
LRM025     IF FMT-TRNFR-TYPE = 'PTF'                                    57258000
LRM025     AND B1-ACAT-PTF-BATCH-ENTRY (B1-IND) > SPACES                57259000
LRM025     AND NOT MEMO-TRID                                            57260000
LRM025         MOVE B1-ACAT-PTF-BATCH (B1-IND) TO P2-BK-BATCH-CODE      57270000
LRM025         MOVE B1-ACAT-PTF-ENTRY (B1-IND) TO P2-BK-ENTRY-CODE      57280000
LRM025     END-IF                                                       57290000
LRM013     IF FMT-TRNFR-TYPE = 'FRV'                                    57300000
LRM013     AND B1-ACAT-FRV-BATCH-ENTRY (B1-IND) > SPACES                57310000
LRM015     AND NOT MEMO-TRID                                            57311000
LRM013         MOVE B1-ACAT-FRV-BATCH (B1-IND) TO P2-BK-BATCH-CODE      57312000
LRM013         MOVE B1-ACAT-FRV-ENTRY (B1-IND) TO P2-BK-ENTRY-CODE      57313000
550300     END-IF.                                                      57314000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    57315000
YH0001       IF    B1-ACAT-MFC-BOOKING-BATCH (B1-IND) > ' '             57316000
LRM015         AND NOT MEMO-TRID                                        57317000
YH0001           MOVE B1-ACAT-MFC-BOOKING-BATCH (B1-IND)                57318000
YH0001                                   TO  P2-BK-BATCH-CODE           57319000
YH0001       END-IF                                                     57319100
YH0001       MOVE  'MFC'                 TO  P2-BK-ENTRY-CODE           57319200
YH0001       IF  B1-ACAT-MFC-BOOKING-ENTRE (B1-IND) > ' '               57319300
YH0001           MOVE B1-ACAT-MFC-BOOKING-ENTRE (B1-IND)                57319400
YH0001                                   TO  P2-BK-ENTRY-CODE           57319500
YH0001       END-IF                                                     57319600
YH0001     END-IF.                                                      57319700
YH0001                                                                  57319800
LRM015     SET MEMO-TRID-NOT-USED TO TRUE.                              57319900
550600                                                                  57320000
YH0001 O-WRITE-P2-MFC-ACCOUNT.                                          57330000
                                                                        57340000
           IF  FMT-CLNT-IS-DELIVERER                                    57350000
               IF  B1-ACAT-MFC-DELIVERER-ACCOUNT (B1-IND) > ' '         57360000
                   MOVE B1-ACAT-MFC-DELIVERER-ACCOUNT (B1-IND)          57370000
                                           TO  P2-BK-BR-ACCT-T          57380000
                   MOVE  'X'               TO  P2-BK-CHECK-DIGIT        57390000
               END-IF                                                   57400000
           ELSE                                                         57410000
               IF  B1-ACAT-MFC-RECEIVER-ACCOUNT (B1-IND) > ' '          57420000
                   MOVE B1-ACAT-MFC-RECEIVER-ACCOUNT (B1-IND)           57430000
                                           TO  P2-BK-BR-ACCT-T          57440000
                   MOVE  'X'               TO  P2-BK-CHECK-DIGIT        57450000
               END-IF                                                   57460000
           END-IF.                                                      57470000
                                                                        57480000
550700******************************************************************57490000
550800*** PERFORMED BY:                                              ***57500000
550900***     O-WRITE-P2-REC                                         ***57501000
551000******************************************************************57502000
551100                                                                  57503000
551200 O-WRITE-P2-ROLLOVER-TRAILER.                                     57504000
551300*    DISPLAY ' '                                                  57505000
551400*    DISPLAY '****** O-WRITE-P2-ROLLOVER-TRAILER. '               57506000
551500     IF  P2-BK-BR-ACCT-T-C = (CNS-BR-ACCT-T-C   OR                57507000
551600                   '0982008013' OR '0982009011' OR                57508000
551700                   '0982001513' OR '0982001612' OR                57509000
551800         '0982006019' OR  ALTERNATE-OFFSET-ACCOUNT                57510000
LRM050                      OR B1-MFRS-DST-MFE-OFFSET (B1-IND)          57520000
LRM021                      OR  ALT-OPTION-OFFSET-ACCOUNT)              57530000
LRM052     OR P2-BK-BR-ACCT-T = B1-ACAT-CNS-LONG-R-ACCT (B1-IND)        57531000
LRM052     OR P2-BK-BR-ACCT-T = B1-ACAT-CNS-SHORT-S-ACCT (B1-IND)       57532000
551900         MOVE ROLLOVER-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C        57540000
552000         MOVE  P2-CREDIT-SIGN  TO  P2-BK-BUY-SELL-CODE            57550000
552100     ELSE                                                         57560000
552200         MOVE  P2-DEBIT-SIGN   TO  P2-BK-BUY-SELL-CODE            57570000
552300     END-IF.                                                      57580000
552400     MOVE P2-BK-SECURITY-NBR  TO WS-SAVE-SEC                      57590000
552500     IF FMT-CLNT-IS-DELIVERER                                     57600000
552600        MOVE '8660324'    TO P2-BK-SECURITY-NBR                   57610000
552700     ELSE                                                         57620000
552800        MOVE ROLL-SEC-NO  TO P2-BK-SECURITY-NBR                   57630000
552900     END-IF.                                                      57640000
553000     IF (B1-ROLLOVER-CLIENT (B1-IND) = '2' AND                    57650000
ET0001        (FMT-ACT-TYPE  =  'IR' OR 'QP' OR 'SI' OR 'EI' OR 'RI'))  57660000
553200         IF FMT-CLNT-IS-DELIVERER                                 57670000
553300            MOVE '8660301' TO P2-BK-SECURITY-NBR                  57680000
553400         ELSE                                                     57690000
553500            MOVE '8660314' TO P2-BK-SECURITY-NBR                  57700000
553600         END-IF                                                   57710000
553700     END-IF.                                                      57720000
LRM027     IF (B1-ROLLOVER-CLIENT (B1-IND) = '3' AND                    57730000
LRM027          (FMT-ACT-TYPE  =  'IR' OR 'QP' OR 'SI' OR 'EI' OR 'RI'  57740000
LRM027                         OR 'BI' OR 'BR' OR '4K' OR               57750000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        57760000
LRM027         IF FMT-CLNT-IS-DELIVERER                                 57770000
LRM027            MOVE '8660301' TO P2-BK-SECURITY-NBR                  57780000
LRM027         ELSE                                                     57790000
LRM027            MOVE '8660314' TO P2-BK-SECURITY-NBR                  57800000
LRM027         END-IF                                                   57810000
LRM027     END-IF.                                                      57820000
LRM010     IF (FMT-TRNFR-TYPE  = 'PTR' OR 'PTD')                        57830000
LRM010     AND FMT-CLNT-IS-DELIVERER                                    57840000
LRM010        MOVE '8661278'    TO P2-BK-SECURITY-NBR                   57850000
LRM010     END-IF.                                                      57860000
LRM016     IF (FMT-TRNFR-TYPE = 'FRV' OR 'RCL')                         57870000
LRM016     AND FMT-SCRTY-866-NBR > SPACES                               57880000
LRM016         MOVE FMT-SCRTY-866-NBR TO P2-BK-SECURITY-NBR             57890000
LRM016     END-IF.                                                      57900000
554300                                                                  57910000
554400     MOVE ZERO                TO P2-BK-AMOUNT                     57920000
554500     MOVE ZERO                TO P2-BK-FRACTION                   57930000
554600     MOVE ZERO                TO WS-BK-QUANTITY                   57940000
554700     MOVE P2-QUANTITY-PRESENT TO P2-BK-QUANTITY-SW                57950000
LRM016     IF (FMT-TRNFR-TYPE = 'FRV' OR 'RCL')                         57960000
LRM016     AND FMT-SCRTY-866-NBR > SPACES                               57970000
LRM016        MOVE FMT-ASSET-866-QTY TO WS-BK-QUANTITY                  57980000
LRM016     ELSE                                                         57990000
554800     IF  FMT-ASSET-QUAN NOT = ZERO                                58000000
554900         MOVE LOW-VALUES     TO MSD-RECORD-AREA                   58010000
555000         MOVE WS-SAVE-SEC    TO GETMSD-INIT-SEARCH                58020000
555100         PERFORM O-CALL-MSD-FILE                                  58030000
555200      IF  MS-CLOSING-PRICE  NUMERIC                               58040000
555300      AND MS-CLOSING-PRICE  NOT = ZERO                            58050000
LRM019         INITIALIZE  LINK-TO-MGR02MKV-AREA                        58060000
555500         MOVE   ZEROES                 TO LINK-FIG-MKT-VALUE      58070000
555600         MOVE   WS-SAVE-SEC            TO LINK-SECURITY           58080000
555700         MOVE   ZERO                   TO LINK-QUANTITY           58090000
555800         MOVE   FMT-ASSET-QUAN         TO LINK-QUANTITY           58100000
555900         MOVE   ZERO                   TO LINK-PRICE              58101000
556000         MOVE   MS-CLOSING-PRICE       TO LINK-PRICE              58102000
556100         SET    MSD-SETUP              TO TRUE                    58103000
556200         MOVE   '1'                    TO LINK-WI                 58104000
556300         MOVE   MS-FORMAT-IND          TO LINK-MS-FORMAT          58105000
556400         MOVE   MS-SECURITY-TYPE       TO LINK-MS-TYPE            58106000
556500         MOVE   MS-SECURITY-TYPE-2     TO LINK-MS-SECURITY-TYPE-2 58107000
556600         MOVE   MS-CMO                 TO LINK-MS-CMO             58108000
556700        MOVE   MS-BOND-CURRENT-FACTOR TO LINK-MS-BOND-CURR-FACTOR 58109000
556800         MOVE   MS-PRICE-MULTIPLIER    TO LINK-MS-PRICE-MULTIPLR  58110000
556900                                                                  58120000
LRM019         CALL    MGR02MKV          USING  LINK-TO-MGR02MKV-AREA   58130000
557100         IF  LINK-VALIDERR-CODE  NOT =  SPACES                    58140000
557200             MOVE    ZEROES  TO  LINK-FIG-MKT-VALUE               58150000
557300         END-IF                                                   58160000
557400         MOVE    LINK-FIG-MKT-VALUE  TO  WS-BK-QUANTITY           58170000
557500       ELSE                                                       58180000
557600         MOVE FMT-ASSET-VALUE  TO WS-BK-QUANTITY                  58190000
557700       END-IF                                                     58200000
557800     ELSE                                                         58210000
557900        MOVE FMT-ASSET-VALUE  TO WS-BK-QUANTITY                   58220000
558000     END-IF                                                       58230000
LRM016     END-IF.                                                      58240000
558100     MOVE ZERO                TO P2-BK-QUANTITY                   58250000
558200     MOVE WS-BK-QUAN-WHOLE    TO P2-BK-QUANTITY                   58260000
558300     MOVE WS-BK-QUAN-FRACTION TO P2-BK-FRACTION                   58270000
558400     WRITE P2BKPG-RECORD   FROM  P2-BK-RECORD                     58280000
558500     ADD 1 TO TOT-CL-P2-RECS-WRITTEN.                             58290000
LRM014     PERFORM O-WRITE-SECR-866-EXTR                                58300000
558600* ACAT TRAILER PROCESSING                                         58310000
558700     IF (B1-ACAT-P2-TRAILER (B1-IND) = '1' OR '2' OR '3') AND     58320000
558800        (FMT-CLNT-IS-RECEIVER OR FMT-CLNT-IS-DELIVERER)           58330000
558900         PERFORM O-WRITE-ACAT-P2-TRAILER                          58340000
559000     END-IF.                                                      58350000
LRM013     IF (FMT-TRNFR-TYPE = 'PTR'                                   58360000
LRM013     AND B1-ACAT-PTR-TRAILER (B1-IND) > SPACES)                   58370000
LRM013     OR (FMT-TRNFR-TYPE = 'PTD'                                   58380000
LRM013     AND B1-ACAT-PTD-TRAILER (B1-IND) > SPACES)                   58390000
LRM025     OR (FMT-TRNFR-TYPE = 'PTF'                                   58400000
LRM025     AND B1-ACAT-PTF-TRAILER (B1-IND) > SPACES)                   58410000
LRM013     OR (FMT-TRNFR-TYPE = 'FRV'                                   58420000
LRM013     AND B1-ACAT-FRV-TRAILER (B1-IND) > SPACES)                   58430000
LRM013     OR (FMT-TRNFR-TYPE = 'RCL'                                   58440000
LRM013     AND B1-ACAT-RCL-TRAILER (B1-IND) > SPACES)                   58450000
LRM013     OR (FMT-TRNFR-TYPE = 'MFC'                                   58460000
LRM013     AND B1-ACAT-MFC-TRAILER (B1-IND) > SPACES)                   58470000
LRM013        PERFORM O-WRITE-P2-NS-TRAILER                             58480000
LRM013     END-IF.                                                      58490000
559100/                                                                 58500000
559200******************************************************************58510000
559300*** PERFORMED BY:                                              ***58520000
559400***     O-WRITE-P2-REC                                         ***58530000
559500******************************************************************58540000
559600                                                                  58550000
559700 O-WRITE-P2-TRAILER.                                              58560000
559800**   DISPLAY ' O-WRITE-P2-TRAILER.'                               58570000
559900                                                                  58580000
560000     MOVE  SPACES           TO  P2-BK-TRAILER-RECORD              58590000
560100     MOVE SPACES            TO  P2-BK-VALUE-DT-X                  58600000
560200     MOVE  P2-BK-RECORD     TO  P2-BK-TRAILER-RECORD              58610000
560300     MOVE FMT-TRNFR-TYPE-RSN-CD TO P2-BKT-RESCODE                 58620000
560400     EVALUATE FMT-TRNFR-TYPE-RSN-CD                               58630000
560500         WHEN '01'                                                58640000
560600             MOVE  'CASH DIVIDEND'       TO P2-BKT-RESDESC        58650000
560700         WHEN '02'                                                58660000
560800             MOVE  ' INTEREST    '       TO P2-BKT-RESDESC        58670000
560900         WHEN '03'                                                58680000
561000             MOVE  'LIQUIDATION  '       TO P2-BKT-RESDESC        58690000
561100         WHEN '04'                                                58700000
561200             MOVE  'STOCK DIV. / DISTR.' TO P2-BKT-RESDESC        58710000
561300         WHEN '05'                                                58720000
561400             MOVE  'STOCK SPLIT  '       TO P2-BKT-RESDESC        58730000
561500         WHEN '06'                                                58740000
561600             MOVE  'REORGANIZATION'      TO P2-BKT-RESDESC        58750000
561700         WHEN '07'                                                58760000
561800             MOVE  'REDEMPTION    '      TO P2-BKT-RESDESC        58770000
561900         WHEN '08'                                                58780000
562000             MOVE  'UNDERLYING OPTION'   TO P2-BKT-RESDESC        58790000
562100         WHEN '09'                                                58800000
562200             MOVE  'UNDERLYING SECURITY' TO P2-BKT-RESDESC        58810000
562300         WHEN '10'                                                58820000
562400             MOVE  'MISCELLANEOUS'       TO P2-BKT-RESDESC        58830000
562500         WHEN '11'                                                58840000
562600             MOVE  'MFUND FRAC CASH IN LIEU' TO P2-BKT-RESDESC    58850000
562700         WHEN '12'                                                58860000
562800             MOVE  'MUTUAL FUND ACCURAL' TO P2-BKT-RESDESC        58870000
562900         WHEN '13'                                                58880000
563000             MOVE  'MUTUAL FUND RESIDUAL' TO P2-BKT-RESDESC       58890000
563100         WHEN OTHER                                               58900000
563200             CONTINUE                                             58910000
563300     END-EVALUATE                                                 58920000
563400     MOVE SPACES                    TO P2-BKT-QUANTITY-X          58930000
563500                                       P2-BKT-ENTRY-CODE          58940000
563600                                       P2-BKT-AMOUNT-X            58950000
563700     MOVE '-'                       TO P2-BKT-HYPHEN              58960000
563800     MOVE  0                        TO P2-BKT-FRACTION            58970000
563900     WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD.               58980000
564000     ADD 1 TO TOT-CL-P2-RECS-WRITTEN.                             58990000
564100*    DISPLAY ' P2-BK-TRAILER-RECORD = ' P2-BK-TRAILER-RECORD.     59000000
LRM013/                                                                 59010000
LRM013 O-WRITE-P2-NS-TRAILER.                                           59020000
LRM013**  DISPLAY ' O-WRITE-P2-NS-TRAILER.'                             59030000
LRM013                                                                  59040000
LRM013     MOVE  SPACES           TO  P2-BK-TRAILER-RECORD              59050000
LRM013     MOVE SPACES            TO  P2-BK-VALUE-DT-X                  59060000
LRM013     MOVE  P2-BK-RECORD     TO  P2-BK-TRAILER-RECORD              59070000
LRM013     EVALUATE FMT-TRNFR-TYPE                                      59080000
LRM013        WHEN 'FRV'                                                59090000
LRM013            MOVE  B1-ACAT-FRV-TRAILER (B1-IND) TO                 59100000
LRM013                                            P2-BKT-DESCRIPTION    59110000
LRM013        WHEN 'PTR'                                                59120000
LRM013            MOVE  B1-ACAT-PTR-TRAILER (B1-IND) TO                 59130000
LRM013                                            P2-BKT-DESCRIPTION    59140000
LRM013        WHEN 'PTD'                                                59150000
LRM013            MOVE  B1-ACAT-PTD-TRAILER (B1-IND) TO                 59160000
LRM013                                            P2-BKT-DESCRIPTION    59170000
LRM025        WHEN 'PTF'                                                59180000
LRM025            MOVE  B1-ACAT-PTF-TRAILER (B1-IND) TO                 59190000
LRM025                                            P2-BKT-DESCRIPTION    59200000
LRM013        WHEN 'RCL'                                                59210000
LRM013            MOVE  B1-ACAT-RCL-TRAILER (B1-IND) TO                 59220000
LRM013                                            P2-BKT-DESCRIPTION    59230000
LRM013        WHEN 'MFC'                                                59240000
LRM013            MOVE  B1-ACAT-MFC-TRAILER (B1-IND) TO                 59250000
LRM013                                            P2-BKT-DESCRIPTION    59260000
LRM013        WHEN OTHER                                                59270000
LRM013             CONTINUE                                             59280000
LRM013     END-EVALUATE                                                 59290000
LRM013     MOVE SPACES                    TO P2-BKT-QUANTITY-X          59300000
LRM013                                       P2-BKT-ENTRY-CODE          59310000
LRM013                                       P2-BKT-AMOUNT-X            59320000
LRM013     MOVE '-'                       TO P2-BKT-HYPHEN              59330000
LRM013     MOVE  0                        TO P2-BKT-FRACTION            59340000
LRM013     WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD.               59350000
LRM013     ADD 1 TO TOT-CL-P2-RECS-WRITTEN.                             59360000
LRM013*   DISPLAY ' P2-BK-TRAILER-RECORD = ' P2-BK-TRAILER-RECORD.      59370000
564200/                                                                 59380000
564300******************************************************************59390000
564400*** PERFORMED BY:                                              ***59400000
564500***     O-RCVR-LONG-FUND-SERV                                  ***59410000
564600***     O-WRITE-P2-REC                                         ***59420000
564700***     O-WRITE-P2-ROLLOVER-TRAILER                            ***59430000
564800******************************************************************59440000
564900                                                                  59450000
565000 O-WRITE-ACAT-P2-TRAILER.                                         59460000
565100                                                                  59470000
565200*    DISPLAY ' '                                                  59480000
565300*    DISPLAY '****** O-WRITE-ACAT-P2-TRAILER.'                    59490000
565400     MOVE  SPACES           TO  P2-BK-TRAILER-RECORD.             59500000
565500     MOVE SPACES            TO  P2-BK-VALUE-DT-X.                 59510000
565600     MOVE  P2-BK-RECORD     TO  P2-BK-TRAILER-RECORD.             59520000
565700                                                                  59530000
565800* READ BROKER FILE FOR BROKER NAME                                59540000
565900                                                                  59550000
566000     MOVE LOW-VALUES           TO  BROKER-KEY.                    59560000
566100     MOVE 'O'                  TO  BROKER-EXCHANGE.               59570000
566200     MOVE FMT-CONTRA-BRK-NUM   TO  BROKER-BADGE.                  59580000
566210                                                                  59590000
566220     START BROKER-FILE                                            59600000
566230          KEY IS NOT < BROKER-KEY.                                59610000
566240                                                                  59620000
566250     IF BROKER-FILE-OK OR                                         59630000
566260        BROKER-ENDFILE                                            59640000
566270       CONTINUE                                                   59650000
566280     ELSE                                                         59660000
566290       DISPLAY 'BROKER FILE START ERROR, STATUS = '               59670000
566300       DISPLAY BROKER-FILE-STATUS                                 59680000
566400       CALL    ABEND          USING ABEND-CODE-4000.              59690000
566500                                                                  59700000
566600     READ BROKER-FILE NEXT.                                       59710000
566700                                                                  59720000
566800     IF BROKER-FILE-OK OR                                         59730000
566900        BROKER-ENDFILE                                            59740000
567000       CONTINUE                                                   59750000
567100     ELSE                                                         59760000
567200       DISPLAY 'BROKER FILE READ NEXT ERROR, STATUS = '           59770000
567300       DISPLAY BROKER-FILE-STATUS                                 59780000
567400       CALL    ABEND          USING ABEND-CODE-4000.              59790000
567500                                                                  59800000
567600     IF BROKER-FILE-OK                                            59810000
567700     AND BROKER-EXCHANGE = 'O' AND                                59820000
567800        BROKER-BADGE    = FMT-CONTRA-BRK-NUM                      59830000
567900       MOVE BROKER-NAME    TO TRLR-BRKR                           59840000
568000     ELSE                                                         59850000
568100        MOVE 1 TO SUB                                             59860000
568200        PERFORM UNTIL SUB > WS-CATPPL-RECORD-COUNT                59870000
568300                  OR FMT-CONTRA-BRK-NUM = WS-CATPPL-BROKER(SUB)   59880000
568400           ADD 1 TO SUB                                           59890000
568500        END-PERFORM                                               59900000
568600        IF SUB NOT > WS-CATPPL-RECORD-COUNT                       59910000
568700           MOVE WS-CATPPL-BROKER-NAME(SUB) TO TRLR-BRKR           59920000
568800        ELSE                                                      59930000
568900           MOVE 'NOT ON FILE ' TO TRLR-BRKR                       59940000
569000     END-IF.                                                      59950000
569100                                                                  59960000
569200     IF (B1-ACAT-P2-TRAILER (B1-IND) = '1' OR '3') AND            59970000
569300        FMT-CLNT-IS-DELIVERER                                     59980000
569400       MOVE 'TOA TO '     TO TRLR-MSG.                            59990000
569500                                                                  60000000
569600     IF (B1-ACAT-P2-TRAILER (B1-IND) = '2' OR '3') AND            60010000
569700        FMT-CLNT-IS-RECEIVER                                      60020000
569800       MOVE 'TOA FROM '   TO TRLR-MSG.                            60030000
569900                                                                  60040000
570000     IF ((B1-ACAT-P2-TRAILER (B1-IND) = '1' OR '3') AND           60050000
570100        FMT-CLNT-IS-DELIVERER)                      OR            60060000
570200        ((B1-ACAT-P2-TRAILER (B1-IND) = '2' OR '3') AND           60070000
570300        FMT-CLNT-IS-RECEIVER)                                     60080000
570400       MOVE TRLR-MESSAGE TO P2-BKT-DESCRIPTION                    60090000
570500       MOVE SPACES       TO P2-BKT-QUANTITY-X                     60100000
570600                            P2-BKT-ENTRY-CODE                     60110000
570700                            P2-BKT-AMOUNT-X                       60120000
570800       MOVE '-'          TO P2-BKT-HYPHEN                         60130000
LRM034       IF FMT-TRNFR-TYPE = 'PTF'                                  60140000
LRM034       AND FMT-FND-SERV-CNTL-NBR > SPACES                         60150000
LRM034       AND FMT-AT-CUST-ACCOUNT(1 : 8) = P2-BKT-BR-ACCT-T(1 : 8)   60160000
LRM034       AND P2-BKT-SECURITY-NBR(1 : 3) NOT = '866'                 60170000
LRM035          MOVE SPACES TO P2-BKT-FILLER1                           60180000
LRM035                         P2-BKT-FILLER2                           60190000
LRM034          MOVE 'CATS'             TO P2-TRAILER-ORIG-SUFFIX       60200000
LRM034          MOVE  FMT-FND-SERV-CNTL-NBR                             60210000
LRM034                                  TO P2-TRAILER-ORIG-SUFFIX(5:)   60220000
LRM035          MOVE '2'          TO P2-BKT-TRAILER-CODE                60230000
LRM034       ELSE                                                       60240000
LRM038       IF FMT-TRNFR-TYPE NOT = 'PTF'                              60250000
LRM038       AND FMT-AT-CUST-ACCOUNT(1 : 8) = P2-BKT-BR-ACCT-T(1 : 8)   60260000
LRM038       AND P2-BKT-SECURITY-NBR(1 : 3) NOT = '866'                 60270000
LRM038       AND P2-BKT-SECURITY-NBR > SPACES                           60271000
LRM038          MOVE SPACES TO P2-BKT-FILLER1                           60272000
LRM038                         P2-BKT-FILLER2                           60273000
LRM038          MOVE 'SEQN00'           TO P2-TRAILER-ORIG-SUFFIX       60274000
LRM038          MOVE  FMT-ASSET-SEQ-NO                                  60275000
LRM038                                  TO P2-TRAILER-ORIG-SUFFIX(7:)   60276000
LRM038          MOVE '2'          TO P2-BKT-TRAILER-CODE                60277000
LRM038       ELSE                                                       60277100
570900          MOVE  0           TO P2-BKT-FRACTION                    60277200
LRM034       END-IF                                                     60277300
LRM038       END-IF.                                                    60277400
YH0001       PERFORM O-WRITE-ACAT-P2BKPG-TRL.                           60277500
LRM035       MOVE SPACES       TO P2-BKT-TRAILER-CODE.                  60277600
571200                                                                  60277700
571300     IF (OMNIBUS-PROCESS                                  AND     60277800
571400         B1-MFRS-OMNIBUS-OFFSET (B1-IND) > SPACES         AND     60277900
571500         P2-BK-BR-ACCT-T = B1-MFRS-OMNIBUS-OFFSET (B1-IND)   )    60278000
571510      OR                                                          60279000
571511        (OMNIBUS-PROCESS                                  AND     60280000
571512         MF-NSCC-SOURCE                                   AND     60281000
571520         B1-MFRS-NSCCSRC-OFFSET (B1-IND) > SPACES         AND     60282000
571530         P2-BK-BR-ACCT-T = B1-MFRS-NSCCSRC-OFFSET (B1-IND)   )    60283000
571510      OR                                                          60284000
571511        (PNC-OMNIBUS-PROCESS                              AND     60285000
571520         B1-PNC-SURPAS-OFFSET (B1-IND) > SPACES           AND     60286000
571530         P2-BK-BR-ACCT-T = B1-PNC-SURPAS-OFFSET (B1-IND)     )    60287000
571600       MOVE SPACES TO TRLR-MESSAGE                                60288000
571700       MOVE 'TO ACCT  '  TO TRLR-MSG                              60289000
571800       MOVE OB-BR-ACCT-TC     TO TRLR-BRKR                        60290000
571900       MOVE TRLR-MESSAGE TO P2-BKT-DESCRIPTION                    60300000
572000       MOVE SPACES       TO P2-BKT-QUANTITY-X                     60310000
572100                            P2-BKT-ENTRY-CODE                     60320000
572200                            P2-BKT-AMOUNT-X                       60330000
572300       MOVE '-'          TO P2-BKT-HYPHEN                         60340000
572400       MOVE  0           TO P2-BKT-FRACTION                       60350000
YH0001       PERFORM O-WRITE-ACAT-P2BKPG-TRL                            60360000
572700     END-IF.                                                      60370000
572800                                                                  60380000
LRM003     IF (DST-MFE-PROCESS                                  AND     60390000
LRM003         B1-MFRS-DST-MFE-OFFSET (B1-IND) > SPACES         AND     60400000
LRM003         P2-BK-BR-ACCT-T = B1-MFRS-DST-MFE-OFFSET (B1-IND)   )    60410000
LRM003       MOVE SPACES TO TRLR-MESSAGE                                60420000
LRM003       MOVE 'TO ACCT  '  TO TRLR-MSG                              60430000
LRM003       MOVE OB-BR-ACCT-TC     TO TRLR-BRKR                        60440000
LRM003       MOVE TRLR-MESSAGE TO P2-BKT-DESCRIPTION                    60450000
LRM003       MOVE SPACES       TO P2-BKT-QUANTITY-X                     60460000
LRM003                            P2-BKT-ENTRY-CODE                     60470000
LRM003                            P2-BKT-AMOUNT-X                       60480000
LRM003       MOVE '-'          TO P2-BKT-HYPHEN                         60490000
LRM003       MOVE  0           TO P2-BKT-FRACTION                       60500000
YH0001       PERFORM O-WRITE-ACAT-P2BKPG-TRL                            60510000
LRM003     END-IF.                                                      60520000
                                                                        60530000
572900*    DISPLAY ' P2-BK-TRAILER-RECORD = ' P2-BK-TRAILER-RECORD.     60540000
LRM014/                                                                 60550000
YH0001 O-WRITE-ACAT-P2BKPG-TRL.                                         60560000
                                                                        60570000
           WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD                60580000
           ADD 1 TO TOT-CL-P2-RECS-WRITTEN.                             60590000
                                                                        60591000
LRM014 O-WRITE-SECR-866-EXTR.                                           60592000
LRM014                                                                  60593000
LRM014     MOVE SPACES TO FMT-ROLL-DETAIL-RECORD.                       60594000
LRM014     MOVE P2-BK-BROKER-NBR         TO FMT-ROLL-ADP-CL-NO-X.       60595000
LRM014     MOVE P2-BK-SECURITY-NBR       TO FMT-ROLL-SECR-866-NBR       60596000
LRM014     MOVE WS-BK-QUAN-WHOLE         TO FMT-ROLL-SECR-866-QTY       60597000
LRM014     MOVE WS-BK-QUAN-FRACTION      TO FMT-ROLL-SECR-866-QTY-FRAC. 60598000
LRM014     MOVE FMT-TI-CONTROL-NUM       TO FMT-ROLL-CONTROL-NBR        60599000
LRM014     MOVE FMT-ASSET-SEQ-NO-9       TO FMT-ROLL-ASSET-SEQ-NBR      60600000
LRM014     WRITE ROLL866-RECORD FROM FMT-ROLL-DETAIL-RECORD.            60610000
573000/                                                                 60620000
573100******************************************************************60630000
573200*** PERFORMED BY:                                              ***60640000
573300***     O-PROCESS-ACAT-RECORD                                  ***60650000
573400******************************************************************60660000
573500                                                                  60670000
573600 O-EDIT-PEND-RECS.                                                60680000
573700                                                                  60690000
573800     MOVE 'N' TO THIS-RECORD-PRINTED-SWITCH                       60700000
573900     MOVE 'Y' TO FMT-REC-IS-VALID-SWITCH                          60710000
574000                                                                  60720000
574100     PERFORM O-EDIT-STL-IND                                       60730000
574200     PERFORM O-EDIT-WHEN-ISSUE                                    60740000
574300     PERFORM O-EDIT-FRACT-QUANT                                   60750000
574400*** OPTION TO CONVERT RECEIVE OF BEARER BOND TO REGISTERED **     60760000
574500     IF  B1-BEARER-BOND-OPT (B1-IND) = '1' AND                    60770000
574600         FMT-CLNT-IS-RECEIVER               AND                   60780000
574700         FMT-BEARER-BOND                                          60790000
574800         MOVE  ' '  TO  FMT-SEC-TYPE                              60800000
574900*        MOVE  '1'  TO  FMT-STCK-BND-IND                          60810000
575000     END-IF                                                       60820000
575100     IF FMT-UNDELIVERABLE                                         60830000
575200     OR FMT-MEMO                                                  60840000
575300        CONTINUE                                                  60850000
575400     ELSE                                                         60860000
575500        PERFORM O-EDIT-ADP-CUSIP-NO.                              60870000
YH0001                                                                  60880000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    60890000
YH0001        PERFORM O-EDIT-MFC-TRANSFER.                              60900000
575600/                                                                 60910000
575700******************************************************************60920000
575800*** PERFORMED BY:                                              ***60930000
575900***     O-EDIT-RETURN-SORT-FILE                                ***60940000
576000******************************************************************60950000
576100                                                                  60960000
576200 O-EDIT-STL-IND.                                                  60970000
576300                                                                  60980000
576400     IF FMT-EXPIRING-OPTION                                       60990000
576500         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      61000000
576600         MOVE FMT-STTLM-RSN-CD           TO ERROR-VALUE           61010000
576700         MOVE 'EXPIRING OPTION'          TO ERROR-MSG             61020000
576800****     PERFORM O-PRINT-ERROR-RECORD                             61030000
576900     END-IF                                                       61040000
577000                                                                  61050000
577100     IF FMT-UNDERLYING-SECURITY                                   61060000
577200         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      61070000
577300         MOVE FMT-STTLM-RSN-CD           TO ERROR-VALUE           61080000
577400         MOVE 'UNDERLYING-SECURITY'      TO ERROR-MSG             61090000
577500****     PERFORM O-PRINT-ERROR-RECORD                             61100000
577600     END-IF                                                       61110000
577700                                                                  61120000
577800     IF FMT-FUND-SERV AND FMT-SHORT                               61130000
577900         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      61140000
578000         MOVE FMT-STTLM-RSN-CD           TO ERROR-VALUE           61150000
578100         MOVE 'SHORT FUND/SERV POSN'     TO ERROR-MSG             61160000
578200         PERFORM O-PRINT-ERROR-RECORD                             61170000
578300     END-IF.                                                      61180000
578400                                                                  61190000
578500     IF FMT-UNDELIVERABLE                                         61200000
578600         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      61210000
578700         MOVE FMT-STTLM-RSN-CD           TO ERROR-VALUE           61220000
578800         MOVE 'UNDELIVERABLE SECURITY '  TO ERROR-MSG             61230000
578900*****    PERFORM O-PRINT-ERROR-RECORD                             61240000
579000     END-IF.                                                      61250000
579100                                                                  61260000
LRM033     IF PARM-SHAD-RUN                                             61270000
LRM033     AND FMT-TRNFR-TYPE = 'PTF'                                   61280000
LRM033     AND FMT-ASSET-QUAN = ZEROS                                   61290000
LRM033         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      61300000
LRM033         DISPLAY 'SKIP SHADOW PTF W/ZERO QTY '                    61310000
LRM033                FMT-TI-ADP-CL-NO-X ' ' FMT-TI-CONTROL-NUM         61320000
LRM033     END-IF.                                                      61330000
579200/                                                                 61340000
579300******************************************************************61350000
579400*** PERFORMED BY:                                              ***61360000
579500***     O-EDIT-RETURN-SORT-FILE                                ***61370000
579600******************************************************************61380000
579700                                                                  61390000
579800 O-EDIT-WHEN-ISSUE.                                               61400000
579900                                                                  61410000
580000     IF  FMT-SEC-TYPE-IS-WHEN-ISSUE                               61420000
580100         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      61430000
580200         ADD 1 TO NUM-SEC-TYPE-WRONG                              61440000
580300         MOVE FMT-SEC-TYPE               TO ERROR-VALUE           61450000
580400         MOVE 'SEC TYPE IS WHEN ISSUE '  TO ERROR-MSG             61460000
580500         PERFORM O-PRINT-ERROR-RECORD                             61461000
580600     END-IF.                                                      61462000
580700/                                                                 61463000
580800******************************************************************61464000
580900*** PERFORMED BY:                                              ***61465000
581000***     O-EDIT-RETURN-SORT-FILE                                ***61466000
581100******************************************************************61467000
581200                                                                  61468000
581300 O-EDIT-FRACT-QUANT.                                              61469000
581400                                                                  61470000
581500     EVALUATE TRUE                                                61480000
581600         WHEN  NOT FMT-ASSET-QUAN-IS-WHOLE-NUM                    61490000
581700               AND B1-FRAC-QTY-PROC (B1-IND) = '0'                61500000
581800             MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                  61510000
581900             ADD 1 TO NUM-FRACTION-QTY                            61520000
582000             MOVE FMT-ASSET-QUAN-FRACTION-X   TO ERROR-VALUE      61530000
582100             MOVE 'FRACTION QUANTITY ' TO ERROR-MSG               61540000
582200             PERFORM O-PRINT-ERROR-RECORD                         61550000
582300         WHEN  OTHER                                              61560000
582400             CONTINUE                                             61570000
582500     END-EVALUATE.                                                61580000
582600/                                                                 61590000
582700******************************************************************61600000
582800*** PERFORMED BY:                                              ***61610000
582900***     O-EDIT-RETURN-SORT-FILE                                ***61620000
583000******************************************************************61630000
583100                                                                  61640000
583200 O-EDIT-ADP-CUSIP-NO.                                             61650000
583300                                                                  61660000
583400     IF  FMT-CASH                                                 61670000
583500         MOVE FMT-CUSIP-NUM TO FMT-ADP-SEC-NO                     61680000
583600     ELSE                                                         61690000
583700       IF  FMT-MEMO                                               61700000
583800         CONTINUE                                                 61710000
583900       ELSE                                                       61720000
584000         IF FMT-ADP-SEC-NO = SPACES OR LOW-VALUES                 61730000
584100             MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                  61740000
584200             ADD 1 TO NUM-CUSIP-NOT-MATCHED                       61750000
584300             MOVE FMT-CUSIP-NUM              TO ERROR-VALUE       61760000
584400             MOVE 'CUSIP NUMBER NOT MATCHED' TO ERROR-MSG         61770000
584500             PERFORM O-PRINT-ERROR-RECORD                         61780000
584600         END-IF                                                   61790000
584700     END-IF.                                                      61800000
584800/                                                                 61810000
584900******************************************************************61820000
585000*** PERFORMED BY:                                              ***61830000
585100***     O-EDIT-ADP-CUSIP-NO                                    ***61840000
585200******************************************************************61850000
585300                                                                  61860000
585400 O-GET-ADP-CUSIP-NBR.                                             61870000
585500                                                                  61880000
585600     EVALUATE TRUE                                                61890000
585700         WHEN  FMT-BEARER-BOND                                    61900000
585800             PERFORM O-GET-ADP-BEARER-BOND                        61910000
585900         WHEN  FMT-OPTION                                         61920000
586000             PERFORM O-GET-ADP-OPTION                             61930000
586100         WHEN  FMT-BOND                                           61940000
586200             PERFORM O-GET-ADP-REGISTERED-BOND                    61950000
586300         WHEN  FMT-MUNI-BOND                                      61960000
586400             PERFORM O-GET-ADP-MUNI-BOND                          61970000
586500         WHEN OTHER                                               61980000
586600             PERFORM O-GET-ADP-STOCK                              61990000
586700     END-EVALUATE                                                 62000000
586800                                                                  62010000
586900     EVALUATE TRUE                                                62020000
587000         WHEN   FMT-OPTION                                        62030000
587100          AND (GETMSD-XREF-RETURN-NOT-FOUND                       62040000
587200           OR  GETMSD-XREF-RETURN-INV-CUSIP                       62050000
587300           OR  GETMSD-XREF-RETURN-KEY-IS-SEC                      62060000
587400           OR  SYMBOL-NOT-FOUND)                                  62070000
587500             MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                  62080000
587600             ADD 1 TO NUM-SYMBOL-NOT-MATCHED                      62090000
587700             MOVE FMT-OPTION-SYMBOL TO ERROR-VALUE                62100000
587800             MOVE 'SYMBOL NOT MATCHED' TO ERROR-MSG               62110000
587900             PERFORM O-PRINT-ERROR-RECORD                         62120000
588000         WHEN  GETMSD-XREF-RETURN-NOT-FOUND                       62130000
588100           OR  GETMSD-XREF-RETURN-INV-CUSIP                       62140000
588200           OR  GETMSD-XREF-RETURN-KEY-IS-SEC                      62150000
588300           OR (GETMSD-XREF-RETURN-VALID  AND                      62160000
588400               FMT-ADP-SEC-NO  NOT > ' ')                         62170000
588500             MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                  62180000
588600             ADD 1 TO NUM-CUSIP-NOT-MATCHED                       62190000
588700             MOVE FMT-CUSIP-NUM              TO ERROR-VALUE       62200000
588800             MOVE 'CUSIP NUMBER NOT MATCHED' TO ERROR-MSG         62210000
588900             PERFORM O-PRINT-ERROR-RECORD                         62220000
589000         WHEN  OTHER                                              62230000
589100             CONTINUE                                             62240000
589200     END-EVALUATE.                                                62250000
589300/                                                                 62260000
589400******************************************************************62270000
589500*** PERFORMED BY:                                              ***62280000
589600***     O-GET-ADP-CUSIP-NBR                                    ***62290000
589700******************************************************************62300000
589800                                                                  62310000
589900 O-GET-ADP-BEARER-BOND.                                           62320000
590000                                                                  62330000
590100     SET ENTER-BEARER-GET TO TRUE                                 62340000
590200     MOVE FMT-CUSIP-NUM TO CUSIP-1-9                              62350000
590300     MOVE '010' TO CUSIP-10-11-12                                 62360000
590400     MOVE  CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                    62370000
590500     PERFORM O-CALL-MSDXREF                                       62380000
590600     IF GETMSD-XREF-RETURN-VALID                                  62390000
590700         SET EXIT-BEARER-GET TO TRUE                              62400000
590800     END-IF                                                       62410000
590900                                                                  62420000
591000     IF EXIT-BEARER-GET                                           62430000
591100         CONTINUE                                                 62440000
591200     ELSE                                                         62450000
591300         MOVE '020' TO CUSIP-10-11-12                             62460000
591400         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 62470000
591500         PERFORM O-CALL-MSDXREF                                   62480000
591600         IF GETMSD-XREF-RETURN-VALID                              62490000
591700             SET EXIT-BEARER-GET TO TRUE                          62500000
591800         END-IF                                                   62510000
591900     END-IF                                                       62520000
592000                                                                  62530000
592100     IF EXIT-BEARER-GET                                           62540000
592200         CONTINUE                                                 62550000
592300     ELSE                                                         62560000
592400         MOVE '040' TO CUSIP-10-11-12                             62570000
592500         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 62580000
592600         PERFORM O-CALL-MSDXREF                                   62590000
592700         IF GETMSD-XREF-RETURN-VALID                              62600000
592800             SET EXIT-BEARER-GET TO TRUE                          62610000
592900         END-IF                                                   62620000
593000     END-IF                                                       62630000
593100                                                                  62640000
593200     IF EXIT-BEARER-GET                                           62650000
593300         CONTINUE                                                 62660000
593400     ELSE                                                         62670000
593500         MOVE '050' TO CUSIP-10-11-12                             62680000
593600         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 62690000
593700         PERFORM O-CALL-MSDXREF                                   62700000
593800         IF GETMSD-XREF-RETURN-VALID                              62710000
593900             SET EXIT-BEARER-GET TO TRUE                          62720000
594000         END-IF                                                   62730000
594100     END-IF                                                       62740000
594200                                                                  62750000
594300     IF EXIT-BEARER-GET                                           62760000
594400         CONTINUE                                                 62770000
594500     ELSE                                                         62780000
594600         MOVE '060' TO CUSIP-10-11-12                             62790000
594700         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 62800000
594800         PERFORM O-CALL-MSDXREF                                   62810000
594900         IF GETMSD-XREF-RETURN-VALID                              62820000
595000             SET EXIT-BEARER-GET TO TRUE                          62830000
595100         END-IF                                                   62840000
595200     END-IF                                                       62850000
595300                                                                  62860000
595400     IF EXIT-BEARER-GET                                           62870000
595500         CONTINUE                                                 62880000
595600     ELSE                                                         62890000
595700         MOVE '000' TO CUSIP-10-11-12                             62900000
595800         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 62910000
595900         PERFORM O-CALL-MSDXREF                                   62920000
596000         IF GETMSD-XREF-RETURN-VALID                              62930000
596100             SET EXIT-BEARER-GET TO TRUE                          62940000
596200         END-IF                                                   62950000
596300     END-IF                                                       62960000
596400                                                                  62970000
596500     IF EXIT-BEARER-GET                                           62980000
596600         CONTINUE                                                 62990000
596700     ELSE                                                         63000000
596800         MOVE '030' TO CUSIP-10-11-12                             63010000
596900         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63020000
597000         PERFORM O-CALL-MSDXREF                                   63030000
597100     END-IF.                                                      63040000
597200/                                                                 63050000
597300******************************************************************63060000
597400*** PERFORMED BY:                                              ***63070000
597500***     O-GET-ADP-CUSIP-NBR                                    ***63080000
597600***     O-BOND-TEST-RTN                                        ***63090000
597700******************************************************************63100000
597800                                                                  63110000
597900 O-GET-ADP-REGISTERED-BOND.                                       63120000
598000                                                                  63130000
598100     SET ENTER-REGISTERED-GET TO TRUE                             63140000
598200     MOVE FMT-CUSIP-NUM TO CUSIP-1-9                              63150000
598300                                                                  63160000
598400     MOVE '060' TO CUSIP-10-11-12                                 63170000
598500     MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                     63180000
598600     PERFORM O-CALL-MSDXREF                                       63190000
598700     IF  GETMSD-XREF-RETURN-VALID                                 63200000
598800         SET EXIT-REGISTERED-GET TO TRUE                          63210000
598900     END-IF                                                       63220000
599000                                                                  63230000
599100     IF EXIT-REGISTERED-GET                                       63240000
599200         CONTINUE                                                 63250000
599300     ELSE                                                         63260000
599400         MOVE '020' TO CUSIP-10-11-12                             63270000
599500         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63280000
599600         PERFORM O-CALL-MSDXREF                                   63290000
599700         IF  GETMSD-XREF-RETURN-VALID                             63300000
599800             SET EXIT-REGISTERED-GET TO TRUE                      63310000
599900         END-IF                                                   63320000
600000     END-IF                                                       63330000
600100                                                                  63340000
600200     IF EXIT-REGISTERED-GET                                       63350000
600300         CONTINUE                                                 63360000
600400     ELSE                                                         63370000
600500         MOVE '040' TO CUSIP-10-11-12                             63380000
600600         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63390000
600700         PERFORM O-CALL-MSDXREF                                   63400000
600800         IF  GETMSD-XREF-RETURN-VALID                             63410000
600900             SET EXIT-REGISTERED-GET TO TRUE                      63420000
601000         END-IF                                                   63430000
601100     END-IF                                                       63440000
601200                                                                  63450000
601300     IF EXIT-REGISTERED-GET                                       63460000
601400         CONTINUE                                                 63470000
601500     ELSE                                                         63480000
601600         MOVE '050' TO CUSIP-10-11-12                             63490000
601700         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63500000
601800         PERFORM O-CALL-MSDXREF                                   63510000
601900         IF GETMSD-XREF-RETURN-VALID                              63520000
602000             SET EXIT-REGISTERED-GET TO TRUE                      63530000
602100         END-IF                                                   63540000
602200     END-IF                                                       63550000
602300                                                                  63560000
602400     IF EXIT-REGISTERED-GET                                       63570000
602500         CONTINUE                                                 63580000
602600     ELSE                                                         63590000
602700         MOVE '010' TO CUSIP-10-11-12                             63600000
602800         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63610000
602900         PERFORM O-CALL-MSDXREF                                   63620000
603000         IF GETMSD-XREF-RETURN-VALID                              63630000
603100             SET EXIT-REGISTERED-GET TO TRUE                      63640000
603200         END-IF                                                   63650000
603300     END-IF                                                       63660000
603400                                                                  63670000
603500     IF EXIT-REGISTERED-GET                                       63680000
603600         CONTINUE                                                 63690000
603700     ELSE                                                         63700000
603800         MOVE '000' TO CUSIP-10-11-12                             63710000
603900         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63720000
604000         PERFORM O-CALL-MSDXREF                                   63730000
604100         IF GETMSD-XREF-RETURN-VALID                              63740000
604200             SET EXIT-REGISTERED-GET TO TRUE                      63750000
604300         END-IF                                                   63760000
604400     END-IF                                                       63770000
604500                                                                  63780000
604600     IF EXIT-REGISTERED-GET                                       63790000
604700         CONTINUE                                                 63800000
604800     ELSE                                                         63810000
604900         MOVE '030' TO CUSIP-10-11-12                             63820000
605000         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63830000
605100         PERFORM O-CALL-MSDXREF                                   63840000
605200     END-IF.                                                      63850000
605300/                                                                 63860000
605400******************************************************************63870000
605500*** PERFORMED BY:                                              ***63880000
605600***     O-GET-ADP-CUSIP-NBR                                    ***63890000
605700***     O-BOND-TEST-RTN                                        ***63900000
605800******************************************************************63910000
605900                                                                  63920000
606000 O-GET-ADP-MUNI-BOND.                                             63930000
606100                                                                  63940000
606200     SET ENTER-MUNI-GET TO TRUE                                   63950000
606300     MOVE FMT-CUSIP-NUM TO CUSIP-1-9                              63960000
606400                                                                  63970000
606500     MOVE '060' TO CUSIP-10-11-12                                 63980000
606600     MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                     63990000
606700     PERFORM O-CALL-MSDXREF                                       64000000
606800     IF  GETMSD-XREF-RETURN-VALID                                 64010000
606900         SET EXIT-MUNI-GET TO TRUE                                64020000
607000     END-IF                                                       64030000
607100                                                                  64040000
607200     IF EXIT-MUNI-GET                                             64050000
607300         CONTINUE                                                 64060000
607400     ELSE                                                         64070000
607500         MOVE '040' TO CUSIP-10-11-12                             64080000
607600         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64090000
607700         PERFORM O-CALL-MSDXREF                                   64100000
607800         IF  GETMSD-XREF-RETURN-VALID                             64110000
607900             SET EXIT-MUNI-GET TO TRUE                            64120000
608000         END-IF                                                   64130000
608100     END-IF                                                       64140000
608200                                                                  64150000
608300     IF EXIT-MUNI-GET                                             64160000
608400         CONTINUE                                                 64170000
608500     ELSE                                                         64180000
608600         MOVE '050' TO CUSIP-10-11-12                             64190000
608700         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64200000
608800         PERFORM O-CALL-MSDXREF                                   64210000
608900         IF GETMSD-XREF-RETURN-VALID                              64220000
609000             SET EXIT-MUNI-GET TO TRUE                            64230000
609100         END-IF                                                   64240000
609200     END-IF                                                       64250000
609300                                                                  64260000
609400     IF EXIT-MUNI-GET                                             64270000
609500         CONTINUE                                                 64280000
609600     ELSE                                                         64290000
609700         MOVE '010' TO CUSIP-10-11-12                             64300000
609800         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64310000
609900         PERFORM O-CALL-MSDXREF                                   64320000
610000         IF GETMSD-XREF-RETURN-VALID                              64330000
610100             SET EXIT-MUNI-GET TO TRUE                            64340000
610200         END-IF                                                   64350000
610300     END-IF                                                       64360000
610400                                                                  64370000
610500     IF EXIT-MUNI-GET                                             64380000
610600         CONTINUE                                                 64390000
610700     ELSE                                                         64400000
610800         MOVE '020' TO CUSIP-10-11-12                             64410000
610900         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64420000
611000         PERFORM O-CALL-MSDXREF                                   64430000
611100         IF GETMSD-XREF-RETURN-VALID                              64440000
611200             SET EXIT-MUNI-GET TO TRUE                            64450000
611300         END-IF                                                   64460000
611400     END-IF                                                       64470000
611500                                                                  64480000
611600     IF EXIT-MUNI-GET                                             64490000
611700         CONTINUE                                                 64500000
611800     ELSE                                                         64510000
611900         MOVE '030' TO CUSIP-10-11-12                             64520000
612000         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64530000
612100         PERFORM O-CALL-MSDXREF                                   64540000
612200         IF GETMSD-XREF-RETURN-VALID                              64550000
612300             SET EXIT-MUNI-GET TO TRUE                            64560000
612400         END-IF                                                   64570000
612500     END-IF                                                       64580000
612600                                                                  64590000
612700     IF EXIT-MUNI-GET                                             64600000
612800         CONTINUE                                                 64610000
612900     ELSE                                                         64620000
613000         MOVE '000' TO CUSIP-10-11-12                             64630000
613100         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64640000
613200         PERFORM O-CALL-MSDXREF                                   64650000
613300         IF GETMSD-XREF-RETURN-VALID                              64660000
613400             SET EXIT-MUNI-GET TO TRUE                            64670000
613500         END-IF                                                   64680000
613600     END-IF.                                                      64690000
613700/                                                                 64700000
613800******************************************************************64710000
613900*** PERFORMED BY:                                              ***64720000
614000***     O-GET-ADP-CUSIP-NBR                                    ***64730000
614100***     O-BOND-TEST-RTN                                        ***64740000
614200******************************************************************64750000
614300                                                                  64760000
614400 O-GET-ADP-STOCK.                                                 64770000
614500                                                                  64780000
614600     SET ENTER-STOCK-GET TO TRUE                                  64790000
614700     MOVE  FMT-CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                64800000
614800     PERFORM O-CALL-MSDXREF                                       64810000
614900     IF GETMSD-XREF-RETURN-VALID                                  64820000
615000         SET EXIT-STOCK-GET TO TRUE                               64830000
615100     END-IF                                                       64840000
615200                                                                  64850000
615300     IF EXIT-STOCK-GET                                            64860000
615400         CONTINUE                                                 64870000
615500     ELSE                                                         64880000
615600         IF  FMT-CUSIP-NUM1 ALPHABETIC                            64890000
615700         OR  FMT-CUSIP-NUM2 ALPHABETIC                            64900000
615800             CONTINUE                                             64910000
615900         ELSE                                                     64920000
616000             SET EXIT-STOCK-GET TO TRUE                           64930000
616100         END-IF                                                   64940000
616200     END-IF                                                       64950000
616300                                                                  64960000
616400     IF EXIT-STOCK-GET                                            64970000
616500         CONTINUE                                                 64980000
616600     ELSE                                                         64990000
616700         MOVE FMT-CUSIP-NUM TO CUSIP-1-9                          65000000
616800         MOVE '010' TO CUSIP-10-11-12                             65010000
616900         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 65020000
617000         PERFORM O-CALL-MSDXREF                                   65030000
617100         IF GETMSD-XREF-RETURN-VALID                              65040000
617200             SET EXIT-STOCK-GET TO TRUE                           65050000
617300         END-IF                                                   65060000
617400     END-IF                                                       65070000
617500                                                                  65080000
617600     IF EXIT-STOCK-GET                                            65090000
617700         CONTINUE                                                 65100000
617800     ELSE                                                         65110000
617900         MOVE '020' TO CUSIP-10-11-12                             65120000
618000         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 65130000
618100         PERFORM O-CALL-MSDXREF                                   65140000
618200         IF GETMSD-XREF-RETURN-VALID                              65150000
618300             SET EXIT-STOCK-GET TO TRUE                           65160000
618400         END-IF                                                   65170000
618500     END-IF                                                       65180000
618600                                                                  65190000
618700     IF EXIT-STOCK-GET                                            65200000
618800         CONTINUE                                                 65210000
618900     ELSE                                                         65220000
619000         MOVE '040' TO CUSIP-10-11-12                             65230000
619100         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 65240000
619200         PERFORM O-CALL-MSDXREF                                   65250000
619300         IF GETMSD-XREF-RETURN-VALID                              65260000
619400             SET EXIT-STOCK-GET TO TRUE                           65270000
619500         END-IF                                                   65280000
619600     END-IF                                                       65290000
619700                                                                  65300000
619800     IF EXIT-STOCK-GET                                            65310000
619900         CONTINUE                                                 65320000
620000     ELSE                                                         65330000
620100         MOVE '050' TO CUSIP-10-11-12                             65340000
620200         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 65350000
620300         PERFORM O-CALL-MSDXREF                                   65360000
620400         IF GETMSD-XREF-RETURN-VALID                              65370000
620500             SET EXIT-STOCK-GET TO TRUE                           65380000
620600         END-IF                                                   65390000
620700     END-IF                                                       65400000
620800                                                                  65410000
620900     IF EXIT-STOCK-GET                                            65420000
621000         CONTINUE                                                 65430000
621100     ELSE                                                         65440000
621200         MOVE '060' TO CUSIP-10-11-12                             65450000
621300         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 65460000
621400         PERFORM O-CALL-MSDXREF                                   65470000
621500         IF GETMSD-XREF-RETURN-VALID                              65480000
621600             SET EXIT-STOCK-GET TO TRUE                           65490000
621700         END-IF                                                   65500000
621800     END-IF                                                       65510000
621900                                                                  65520000
622000     IF EXIT-STOCK-GET                                            65530000
622100         CONTINUE                                                 65540000
622200     ELSE                                                         65550000
622300         MOVE '030' TO CUSIP-10-11-12                             65560000
622400         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 65570000
622500         PERFORM O-CALL-MSDXREF                                   65580000
622600         IF GETMSD-XREF-RETURN-VALID                              65590000
622700             SET EXIT-STOCK-GET TO TRUE                           65600000
622800         END-IF                                                   65610000
622900     END-IF.                                                      65620000
623000/                                                                 65630000
623100******************************************************************65640000
623200*** PERFORMED BY:                                              ***65650000
623300***     O-GET-ADP-CUSIP-NBR                                    ***65660000
623400******************************************************************65670000
623500                                                                  65680000
623600 O-BOND-TEST-RTN.                                                 65690000
623700     EVALUATE TRUE                                                65700000
623800         WHEN (FMT-CUSIP-NUM1 ALPHABETIC) OR                      65710000
623900              (FMT-CUSIP-NUM2 ALPHABETIC)                         65720000
624000             IF FMT-REGIST-BOND                                   65730000
624100                 IF FMT-CATEGORY = 'MB'                           65740000
624200                     PERFORM O-GET-ADP-MUNI-BOND                  65750000
624300                 ELSE                                             65760000
624400                     PERFORM O-GET-ADP-REGISTERED-BOND            65770000
624500                 END-IF                                           65780000
624600             END-IF                                               65790000
624700         WHEN OTHER                                               65800000
624800             PERFORM O-GET-ADP-STOCK                              65810000
624900     END-EVALUATE.                                                65820000
625000/                                                                 65830000
625100******************************************************************65840000
625200*** PERFORMED BY:                                              ***65850000
625300***     O-GET-ADP-CUSIP-NBR                                    ***65860000
625400******************************************************************65870000
625500                                                                  65880000
625600 O-GET-ADP-OPTION.                                                65890000
625700                                                                  65900000
625800     PERFORM O-GET-ADP-SYMBOL                                     65910000
625900                                                                  65920000
626000     DISPLAY 'WS-ADP-SYMBOL1 = ' WS-ADP-SYMBOL                    65930000
626100     IF SYMBOL-IS-FOUND                                           65940000
626200         MOVE WS-ADP-SYMBOL TO GETMSD-XREF-SEARCH-KEY             65950000
626300         PERFORM O-CALL-MSDXREF                                   65960000
626400         IF GETMSD-XREF-RETURN-VALID                              65970000
626500             CONTINUE                                             65980000
626600         ELSE                                                     65990000
626700             PERFORM O-GET-ADP-OPTION-AMEX                        66000000
626800         END-IF                                                   66010000
626900     ELSE                                                         66020000
627000         PERFORM O-GET-ADP-OPTION-AMEX                            66030000
627100     END-IF.                                                      66040000
627200/                                                                 66050000
627300******************************************************************66060000
627400*** PERFORMED BY:                                              ***66070000
627500***     O-GET-ADP-OPTION (2 PLACES)                            ***66080000
627600******************************************************************66090000
627700                                                                  66100000
627800 O-GET-ADP-OPTION-AMEX.                                           66110000
627900                                                                  66120000
628000     PERFORM O-GET-ADP-AMEX-SYMBOL                                66130000
628100     DISPLAY 'WS-ADP-SYMBOL2 = ' WS-ADP-SYMBOL                    66140000
628200                                                                  66150000
628300     IF SYMBOL-IS-FOUND                                           66160000
628400         MOVE WS-ADP-SYMBOL TO GETMSD-XREF-SEARCH-KEY             66170000
628500         PERFORM O-CALL-MSDXREF                                   66180000
628600     END-IF.                                                      66190000
628700/                                                                 66200000
628800******************************************************************66210000
628900*** PERFORMED BY:                                              ***66220000
629000***     O-GET-ADP-OPTION                                       ***66230000
629100******************************************************************66240000
629200                                                                  66250000
629300 O-GET-ADP-SYMBOL.                                                66260000
629400                                                                  66270000
629500     SET ENTER-SYMBOL-SEARCH TO TRUE                              66280000
629600     MOVE 'Y' TO SYMBOL-SW                                        66290000
629700     MOVE SPACES TO WS-ADP-SYMBOL                                 66300000
629800     MOVE +1 TO FMT-SYMBOL-SUB                                    66310000
629900     MOVE +2 TO ADP-SYMBOL-SUB                                    66320000
630000                                                                  66330000
630100     EVALUATE TRUE                                                66340000
630200         WHEN (FMT-BUY AND FMT-OPEN) OR (FMT-SELL AND FMT-CLOSE)  66350000
630300             MOVE 'Q' TO WS-ADP-SYMBOL-CHAR (1)                   66360000
630400             PERFORM O-GET-ADP-SYMBOL-SEARCH                      66370000
630500         WHEN (FMT-SELL AND FMT-OPEN) OR (FMT-BUY AND FMT-CLOSE)  66380000
630600             MOVE 'X' TO WS-ADP-SYMBOL-CHAR (1)                   66390000
630700             PERFORM O-GET-ADP-SYMBOL-SEARCH                      66400000
630800         WHEN OTHER                                               66410000
630900             MOVE 'N' TO SYMBOL-SW                                66420000
631000             SET EXIT-SYMBOL-SEARCH TO TRUE                       66430000
631100     END-EVALUATE.                                                66440000
631200/                                                                 66450000
631300******************************************************************66460000
631400*** PERFORMED BY:                                              ***66470000
631500***     O-GET-ADP-SYMBOL (2 PLACES)                            ***66480000
631600******************************************************************66490000
631700                                                                  66500000
631800 O-GET-ADP-SYMBOL-SEARCH.                                         66510000
631900     MOVE FMT-OPTION-SYMBOL TO WS-FMT-SYMBOL                      66520000
632000     PERFORM O-MOVE-SYMBOL-TO-ADP-SYMBOL                          66530000
632100         UNTIL WS-FMT-SYMBOL-CHAR (FMT-SYMBOL-SUB) = SPACES       66540000
632200         OR    FMT-SYMBOL-SUB > 6                                 66550000
632300     IF WS-ADP-SYMBOL-CHAR (2) = SPACES                           66560000
632400         MOVE 'N' TO SYMBOL-SW                                    66570000
632500         SET EXIT-SYMBOL-SEARCH TO TRUE                           66580000
632600     ELSE                                                         66590000
632700         SEARCH ALL EXP-MONTH-ENTRY                               66600000
632800             AT END                                               66610000
632900                 MOVE 'N' TO SYMBOL-SW                            66620000
633000                 SET EXIT-SYMBOL-SEARCH TO TRUE                   66630000
633100             WHEN EXP-MONTH (EXP-MONTH-IND) = FMT-OPT-EXP-MM      66640000
633200                 PERFORM O-MOVE-EXP-MONTH-TO-ADP-SYMBOL           66650000
633300         END-SEARCH                                               66660000
633400     END-IF                                                       66670000
633500                                                                  66680000
633600     IF EXIT-SYMBOL-SEARCH                                        66690000
633700         CONTINUE                                                 66700000
633800     ELSE                                                         66710000
633900         SEARCH ALL STR-PRICE-ENTRY                               66720000
634000             AT END                                               66730000
634100                 MOVE 'N' TO SYMBOL-SW                            66740000
634200                 SET EXIT-SYMBOL-SEARCH TO TRUE                   66750000
634300             WHEN STR-PRICE (STR-PRICE-IND) =                     66760000
634400                 FMT-OPT-PRICE-POS2-3                             66770000
634500                 MOVE STR-PRICE-A (STR-PRICE-IND) TO              66780000
634600                     WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)          66790000
634700         END-SEARCH                                               66800000
634800     END-IF.                                                      66810000
634900/                                                                 66820000
635000******************************************************************66830000
635100*** PERFORMED BY:                                              ***66840000
635200***     O-GET-ADP-SYMBOL-SEARCH                                ***66850000
635300******************************************************************66860000
635400                                                                  66870000
635500 O-MOVE-SYMBOL-TO-ADP-SYMBOL.                                     66880000
635600                                                                  66890000
635700     MOVE WS-FMT-SYMBOL-CHAR (FMT-SYMBOL-SUB)                     66900000
635800         TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)                   66910000
635900                                                                  66920000
636000     ADD +1 TO FMT-SYMBOL-SUB                                     66930000
636100     ADD +1 TO ADP-SYMBOL-SUB.                                    66940000
636200/                                                                 66950000
636300******************************************************************66960000
636400*** PERFORMED BY:                                              ***66970000
636500***     O-GET-ADP-SYMBOL-SEARCH                                ***66980000
636600******************************************************************66990000
636700                                                                  67000000
636800 O-MOVE-EXP-MONTH-TO-ADP-SYMBOL.                                  67010000
636900                                                                  67020000
637000     IF FMT-PUT                                                   67030000
637100         MOVE EXP-MONTH-PUT (EXP-MONTH-IND)                       67040000
637200             TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)               67050000
637300     ELSE                                                         67060000
637400         MOVE EXP-MONTH-CALL (EXP-MONTH-IND)                      67070000
637500             TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)               67080000
637600     END-IF                                                       67090000
637700                                                                  67100000
637800     ADD +1 TO ADP-SYMBOL-SUB.                                    67110000
637900/                                                                 67120000
638000******************************************************************67130000
638100*** PERFORMED BY:                                              ***67140000
638200***     O-GET-ADP-OPTION-AMEX                                  ***67150000
638300******************************************************************67160000
638400                                                                  67170000
638500 O-GET-ADP-AMEX-SYMBOL.                                           67180000
638600                                                                  67190000
638700     MOVE 'Y' TO SYMBOL-SW                                        67200000
638800     IF FMT-OPT-PRICE IS NOT NUMERIC                              67210000
638900         MOVE 'N' TO SYMBOL-SW                                    67220000
639000     ELSE                                                         67230000
639100         IF FMT-OPT-PRICE-POS1 NOT = '0'                          67240000
639200             MOVE FMT-OPT-PRICE-POS1                              67250000
639300                 TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)           67260000
639400             ADD +1 TO ADP-SYMBOL-SUB                             67270000
639500         END-IF                                                   67280000
639600         MOVE FMT-OPT-PRICE-POS2                                  67290000
639700             TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)               67300000
639800         ADD +1 TO ADP-SYMBOL-SUB                                 67310000
639900         MOVE FMT-OPT-PRICE-POS3                                  67320000
640000             TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)               67330000
640100     END-IF.                                                      67340000
640200/                                                                 67350000
640300******************************************************************67360000
640400*** PERFORMED BY:                                              ***67370000
640500***     O-GET-ADP-BEARER-BOND (7 PLACES)                       ***67380000
640600***     O-GET-ADP-REGISTERED-BOND (7 PLACES)                   ***67390000
640700***     O-GET-ADP-MUNI-BOND (7 PLACES)                         ***67400000
640800***     O-GET-ADP-STOCK (7 PLACES)                             ***67410000
640900***     O-GET-ADP-OPTION                                       ***67420000
641000***     O-GET-ADP-OPTION-AMEX                                  ***67430000
641100******************************************************************67440000
641200                                                                  67450000
641300 O-CALL-MSDXREF.                                                  67460000
641400                                                                  67470000
641500     CALL  GETXREF  USING MSD-SYM-CUSIP-XREF-RECORD.              67480000
641600                                                                  67490000
641700     EVALUATE TRUE                                                67500000
641800         WHEN  GETMSD-XREF-RETURN-VALID                           67510000
641900             MOVE MSXREF-ADP-NO TO FMT-ADP-SEC-NO                 67520000
642000                                                                  67530000
642100         WHEN  GETMSD-XREF-RETURN-NOT-FOUND                       67540000
642200           OR  GETMSD-XREF-RETURN-INV-CUSIP                       67550000
642300           OR  GETMSD-XREF-RETURN-KEY-IS-SEC                      67560000
642400             CONTINUE                                             67570000
642500                                                                  67580000
642600         WHEN  NOT GETMSD-XREF-RETURN-EOF                         67590000
642700             DISPLAY 'ZGETXREF CALL ROUTINE FAILED, RC = '        67600000
642800                      GETMSD-XREF-RETURN-CODE                     67610000
642900             CALL ABEND        USING ABEND-CODE-4000              67620000
643000         WHEN  OTHER                                              67630000
643100             CONTINUE                                             67640000
643200     END-EVALUATE.                                                67650000
643300/                                                                 67660000
643400******************************************************************67670000
643500*** PERFORMED BY:                                              ***67680000
643600***     O-GET-OPTION-OFFSET-ACT-DB                             ***67690000
643700***     O-GET-OPTION-OFFSET-ACT-CR                             ***67700000
643800******************************************************************67710000
643900                                                                  67720000
644000 O-CALL-MSD-FILE.                                                 67730000
644100                                                                  67740000
LRM020     MOVE FMT-TI-ADP-CL-NO TO GETMSD-INIT-CLIENT-PL2              67750000
644200     CALL  GETMSDC  USING GETMSD-INIT-CALLING-INFO                67760000
644300                                                                  67770000
644400     IF  GETMSD-INIT-RETURN  =  'X'                               67780000
644500         DISPLAY 'ZGETMSDC CALL ROUTINE FAILED, RC = '            67790000
644600                      GETMSD-INIT-RETURN                          67800000
644700         CALL ABEND        USING ABEND-CODE-4000                  67810000
644800     END-IF.                                                      67820000
644900/                                                                 67830000
645000******************************************************************67840000
645100*** PERFORMED BY:                                              ***67850000
645200***     O-EDIT-RETURN-SORT-FILE                                ***67860000
645300******************************************************************67870000
645400                                                                  67880000
645500 O-EDIT-CONTRA-BKR-NBR.                                           67890000
645600                                                                  67900000
645700     IF  FMT-CONTRA-BRK-NUM NOT NUMERIC                           67910000
645800         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      67920000
645900         ADD 1 TO NUM-CONTRA-BKR-NON-NUMERIC                      67930000
646000         MOVE FMT-CONTRA-BRK-NUM          TO ERROR-VALUE          67940000
646100         MOVE 'CONTRA BROKER NONNUMERIC'  TO ERROR-MSG            67950000
646200         PERFORM O-PRINT-ERROR-RECORD                             67960000
646300     END-IF.                                                      67970000
646400/                                                                 67980000
646500******************************************************************67990000
646600*** PERFORMED BY:                                              ***68000000
646700***     O-EDIT-RETURN-SORT-FILE                                ***68010000
646800******************************************************************68020000
646900                                                                  68030000
647000 O-EDIT-PRIVATE-RANGE.                                            68040000
647100                                                                  68050000
647200     PERFORM O-PRIVATE-RANGE-RTN                                  68060000
647300     IF  PRNG-FILE-SWITCH = 'Y'                                   68070000
647400         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      68080000
647500         ADD 1 TO NUM-INVALID-PRIVATE-RANGE                       68090000
647600         MOVE FMT-ADP-SEC-NO              TO ERROR-VALUE          68100000
647700         MOVE 'INVALID PRIVATE RANGE   '  TO ERROR-MSG            68110000
647800         PERFORM O-PRINT-ERROR-RECORD                             68120000
647900     END-IF.                                                      68130000
648000/                                                                 68140000
648100******************************************************************68150000
648200*** PERFORMED BY:                                              ***68160000
648300***     O-EDIT-RETURN-SORT-FILE                                ***68170000
648400******************************************************************68180000
648500                                                                  68190000
YH0001 O-EDIT-MFC-TRANSFER.                                             68200000
YH0001                                                                  68210000
YH0001     IF FMT-CAGE-TAG NOT > SPACES                                 68220000
YH0001        MOVE FMT-TRNFR-TYPE             TO ERROR-VALUE            68230000
YH0001        MOVE 'NO TAG EXISTS FOR MFC   ' TO ERROR-MSG              68240000
YH0001        PERFORM O-PRINT-ERROR-RECORD                              68250000
YH0001     END-IF.                                                      68260000
648000/                                                                 68270000
648100******************************************************************68280000
648600 O-EDIT-NON-CASH-TYPE.                                            68290000
648700*    PERFORM O-PROC-GETNA-FILE                                    68300000
648800*       THRU O-PROC-GETNA-FILE-EXIT.                              68310000
648900*    IF  GETNA-RETURN-FOUND  AND                                  68320000
649000*        NOT  NAPPA-SEGMENT-MISSING                               68330000
649100*      IF ((FMT-CASH-ACT OR FMT-OTHER-ACT) AND                    68340000
649200*                           NAPPA-ACCT-TYPE (1)  =  ' ') OR       68350000
649300*         (FMT-MARGIN-ACT AND NAPPA-ACCT-TYPE (2) = ' ') OR       68360000
649400*         (FMT-SHORT-ACT AND NAPPA-ACCT-TYPE (5) = ' ')           68370000
649500*        IF  B1-RECV-NON-CASH-TYP (B1-IND)  =  '1'                68380000
649600*            MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                  68390000
649700*            ADD 1 TO NUM-CASH-TYPE-INVALID                       68400000
649800*            IF FMT-MARGIN-ACT                                    68410000
649900*               MOVE 'MARGIN ASSET'           TO ERROR-VALUE      68420000
650000*            ELSE                                                 68430000
650100*              IF FMT-SHORT-ACT                                   68440000
650200*                 MOVE 'SHORT ASSET'          TO ERROR-VALUE      68450000
650300*              ELSE                                               68460000
650400*                 MOVE 'CASH ASSET'           TO ERROR-VALUE      68470000
650500*              END-IF                                             68480000
650600*            END-IF                                               68490000
650700*            MOVE 'ACCOUNT TYPE NOT ON N&A  ' TO ERROR-MSG        68500000
650800*            PERFORM O-PRINT-ERROR-RECORD                         68510000
650900*        ELSE                                                     68520000
651000*          IF  B1-RECV-NON-CASH-TYP (B1-IND)  =  '2'              68530000
651100*            IF  FMT-SHORT-ACT                                    68540000
651200*                SHORT ASSETS ALWAYS BOOK AS SHORT, NO CONV       68550000
651300*                CONTINUE                                         68560000
651400*            ELSE                                                 68570000
651500*              IF  FMT-MARGIN-ACT                                 68580000
651600*                  MRGN ASSETS CONV TO CASH IF NO MRGN ON N&A     68590000
651700*                  SET  FMT-CASH-ACT          TO TRUE             68600000
651800*              ELSE                                               68610000
651900*                  CASH CONV TO MRGN IF ON N&A, ELSE NO CONV      68620000
652000*                IF  NAPPA-ACCT-TYPE (2)  NOT =  ' '              68630000
652100*                    SET FMT-MARGIN-ACT       TO TRUE             68640000
652200*                END-IF                                           68650000
652300*              END-IF                                             68660000
652400*            END-IF                                               68670000
652500*          END-IF                                                 68680000
652600*        END-IF                                                   68690000
652700*      END-IF                                                     68700000
652800*    END-IF.                                                      68710000
652900/                                                                 68720000
653000*                                                                 68730000
653100 O-PROC-GETNA-FILE.                                               68740000
653200     IF  FMT-TI-CUST-ACCOUNT (1:3) = GETNA-KEY-BRANCH3-5 AND      68750000
653300         FMT-TI-CUST-ACCOUNT (4:5) = GETNA-KEY-ACCOUNT6-10        68760000
653400       GO  TO  O-PROC-GETNA-FILE-EXIT.                            68770000
653500     INITIALIZE  GETNA-PARAMETERS.                                68780000
653600     MOVE  'R'                        TO  GETNA-REQ-FUNC.         68790000
653700     MOVE  'R'                        TO  GETNA-REQ-FILE.         68800000
653800     MOVE  'R'                        TO  GETNA-REQ-FUNC2.        68810000
653900     MOVE  'N'                        TO  GETNA-REQ-YEAREND.      68820000
654000     MOVE  PGM-NAME                   TO  GETNA-PGM-NAME.         68830000
654100     MOVE  FMT-TI-ADP-CL-NO           TO  GETNA-KEY-CLIENT.       68840000
654200     MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2.    68850000
654300     MOVE  FMT-TI-CUST-ACCOUNT (1:3)  TO  GETNA-KEY-BRANCH3-5.    68860000
654400     MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5.   68870000
654500     MOVE  FMT-TI-CUST-ACCOUNT (4:5)  TO  GETNA-KEY-ACCOUNT6-10.  68880000
654600     CALL    GETNA               USING GETNA-PARAMETERS           68890000
654700                                       GETNA-SEGMENT-INCLUDES     68900000
654800     END-CALL.                                                    68910000
654900 O-PROC-GETNA-FILE-EXIT.  EXIT.                                   68920000
655000/                                                                 68930000
655100 O-EDIT-RESTRICTED.                                               68940000
655200     MOVE 'N' TO FMT-REC-IS-VALID-SWITCH.                         68950000
655300     MOVE FMT-CUSIP-NUM          TO ERROR-VALUE.                  68960000
655400     MOVE 'RESTRICTED SECURITY      ' TO ERROR-MSG.               68970000
655500     PERFORM O-PRINT-ERROR-RECORD.                                68980000
655600/                                                                 68990000
655700/                                                                 69000000
655800******************************************************************69010000
655900*** PERFORMED BY:                                              ***69020000
656000***     INIT-CHECK-PEND-DATE-HEADER                            ***69030000
656100***     INIT-CHECK-PEND-IS-EMPTY                               ***69040000
656200***     PROCESS-PEND-FILE                                      ***69050000
656300******************************************************************69060000
656400                                                                  69070000
656500 O-READ-PEND-FILE.                                                69080000
656600                                                                  69090000
656700     READ PEND-FILE                                               69100000
656800         AT END                                                   69110000
656900             MOVE 'Y' TO END-OF-PEND-FILE-SWITCH                  69120000
657000             MOVE ALL '9' TO PEND-TI-ADP-CL-NO-X                  69130000
657100         NOT AT END                                               69140000
657200             IF PEND-HEADER-ID                                    69150000
657300                CONTINUE                                          69160000
657400             ELSE                                                 69170000
657500                ADD 1 TO NUM-PEND-RECS-IN                         69180000
657600             END-IF                                               69190000
657700     END-READ.                                                    69200000
657800                                                                  69210000
657900     IF NOT END-OF-PEND-FILE                                      69220000
658000     AND  NOT PEND-HEADER-ID                                      69230000
658100       IF  B1-SERVICE-STATUS(PEND-TI-ADP-CL-NO) NOT > '0'         69240000
658300          GO TO O-READ-PEND-FILE                                  69250000
658400     END-IF.                                                      69260000
658500/                                                                 69270000
658600 O-READ-MPND-FILE.                                                69280000
658700                                                                  69290000
658800     READ MFPEND-FILE                                             69300000
658900         AT END                                                   69310000
659000             MOVE 'Y' TO END-OF-MPND-FILE-SWITCH                  69320000
659100             MOVE ALL '9' TO MPND-TI-ADP-CL-NO-X                  69330000
659200         NOT AT END                                               69340000
659300           IF  MPND-HEADER-ID                                     69350000
659400             GO TO  O-READ-MPND-FILE                              69360000
659500           END-IF                                                 69370000
659600     END-READ.                                                    69380000
659700                                                                  69390000
659800     IF NOT END-OF-MPND-FILE                                      69400000
659900     AND  NOT MPND-HEADER-ID                                      69410000
660000       IF  B1-SERVICE-STATUS(MPND-TI-ADP-CL-NO) NOT > '0'         69420000
660100         DISPLAY 'BYPASS CLIENT MPND DATA ' MPND-TI-ADP-CL-NO-X   69430000
660200         GO TO O-READ-MPND-FILE                                   69440000
660300     END-IF.                                                      69450000
660400/                                                                 69460000
660500******************************************************************69470000
660600*** PERFORMED BY:                                              ***69480000
660700***     O-EDIT-PRIVATE-RANGE-RTN                               ***69490000
660800******************************************************************69500000
660900                                                                  69510000
661000 O-PRIVATE-RANGE-RTN.                                             69520000
661100                                                                  69530000
661200     MOVE  'N'                        TO  PRNG-FILE-SWITCH.       69540000
661300     MOVE  FMT-ADP-SEC-NO             TO  PRNGKEY.                69550000
661400     START  PRNG-FILE  KEY IS NOT < PRNGKEY.                      69560000
661500     IF  PRNG-NOTFOUND                                            69570000
661600         CONTINUE                                                 69580000
661700     ELSE                                                         69590000
661800       IF  NOT PRNG-FILE-OK                                       69600000
661900           DISPLAY 'PRNGFL START KEY ERROR, STATUS = '            69610000
662000                    PRNG-FILE-STATUS                              69620000
662100       ELSE                                                       69630000
662200         READ  PRNG-FILE  NEXT RECORD  END-READ                   69640000
662300           IF  PRNG-ENDFILE  OR  PRNG-NOTFOUND                    69650000
662400               CONTINUE                                           69660000
662500           ELSE                                                   69670000
662600             IF  NOT PRNG-FILE-OK                                 69680000
662700                 DISPLAY 'PRNGFL READ KEY ERROR, STATUS = '       69690000
662800                          PRNG-FILE-STATUS                        69700000
662900             ELSE                                                 69710000
663000               EVALUATE TRUE                                      69720000
663100                   WHEN ((FMT-ADP-SEC-NO  <  PRSECLO)             69730000
663200                              OR                                  69740000
663300                        (PRCLNT  =  '000' OR '096'))              69750000
663400                      CONTINUE                                    69760000
663500                   WHEN (FMT-TI-ADP-CL-NO = (PRCLNT OR            69770000
663600                                           PRACLNT1 OR            69780000
663700                                           PRACLNT2 OR            69790000
663800                                           PRACLNT3 OR            69800000
663900                                           PRACLNT4 OR            69810000
664000                                           PRACLNT5 OR            69820000
664100                                           PRACLNT6 OR            69830000
664200                                           PRACLNT7 ))            69840000
664300                      CONTINUE                                    69850000
664400                   WHEN OTHER                                     69860000
664500                      MOVE 'Y'  TO PRNG-FILE-SWITCH               69870000
664600               END-EVALUATE                                       69880000
664700             END-IF                                               69890000
664800           END-IF                                                 69900000
664900       END-IF                                                     69910000
665000     END-IF.                                                      69920000
665100/                                                                 69930000
665200 READ-NTWREGOP.                                                   69940000
665300***************                                                   69950000
665400                                                                  69960000
665500     MOVE SPACES                      TO  REG-OPT-RECORD-WS.      69970000
LRM050     MOVE SPACES                     TO   NTWIO-MATRIX-LEVEL      69980000
665600     MOVE ' '               TO MF-PROCESS-OPTION                  69990000
665610     MOVE ' '               TO MF-TABLE-MAINTENANCE               70000000
665700     MOVE SPACES                      TO  NTWREG-KEY-IN.          70010000
665800     MOVE FMT-TI-ADP-CL-NO-X          TO  NTWREG-KEY-IN (1:3).    70020000
665900     MOVE FMT-CUSIP-NUM               TO  NTWREG-KEY-IN (6:9).    70030000
TEST       DISPLAY 'ABOUT TO READ NTWREGOP ' FMT-TI-ADP-CL-NO-X         70040000
TEST              ' '  FMT-CUSIP-NUM                                    70050000
666000                                                                  70060000
666100     READ NTWREG-FILE               INTO  REG-OPT-RECORD-WS.      70070000
666200                                                                  70071000
666300     IF NTWREG-FILE-STATUS = '00'                                 70072000
666400      IF FMT-TI-ADP-CL-NO   = CLIENT-NO       AND                 70073000
666500        FMT-CUSIP-NUM      = CUSIP-9                              70074000
LRM050        IF DST-DIRECT                                             70075000
LRM050           DISPLAY                                                70076000
LRM050                     NTWREG-KEY-IN '   FOUND DST'                 70077000
LRM050        END-IF                                                    70078000
LRM050        IF TBL-MNT-SOURCE-SHWB                                    70079000
LRM050           SET MF-DST-SCHWABB  TO TRUE                            70080000
LRM050           DISPLAY                                                70090000
LRM050                     NTWREG-KEY-IN '   FOUND TBL SCHWABB '        70100000
LRM050        END-IF                                                    70110000
LRM003        IF ((OMNIBUS-PROCESSING                                   70120000
LRM029                               OR PNC-SURPAS-PROCESSING)          70130000
LRM002        AND B1-MFN-OMNIBUS-MULTI-PLAT-OPT (B1-IND) = '1')         70131000
LRM050        OR DST-DIRECT                                             70132000
LRM002           MOVE 'R'                 TO NTWIO-FUNCTION-CODE        70133000
LRM002           MOVE FMT-TI-ADP-CL-NO    TO NTWIO-CLIENT               70134000
LRM004           MOVE FMT-CUSIP-NUM       TO NTWIO-CUSIP-9              70135000
LRM002***        IF MS-SYMBOL > SPACES                                  70136000
LRM002***           MOVE MS-SYMBOL        TO NTWIO-SYMBOL               70137000
LRM002***        ELSE                                                   70138000
LRM002***           MOVE MS-CUSIP-NO      TO NTWIO-SYMBOL               70139000
LRM002***        END-IF                                                 70140000
LRM004           MOVE SPACES              TO NTWIO-SYMBOL               70150000
LRM002           PERFORM O-CUST-ACT-MOVE-BR-ACT                         70160000
LRM002           MOVE P2-BK-BR-ACCT-T-C   TO NTWIO-ACCT-ID              70170000
LRM004          IF NTWIO-CUSIP-9 NOT = SPACES                           70180000
LRM002           DISPLAY 'CALLING NTWIO WITH ' NTWIO-REQUEST-PARAMETERS 70190000
LRM002           CALL  BNWNTWIO  USING NTWIO-PARAMETERS                 70200000
LRM002           IF NTWIO-RETURN-OK                                     70210000
LRM004              IF NTWIO-PROCESSING-CODE NOT =                      70220000
LRM004                   PROCESSING-CODE OF REG-OPT-RECORD-WS           70230000
LRM002                 DISPLAY 'BNWNTWIO OVERRIDE PROCESS CODE FROM '   70240000
LRM004                     PROCESSING-CODE OF REG-OPT-RECORD-WS         70250000
LRM002                     ' TO ' NTWIO-PROCESSING-CODE                 70260000
LRM002                 MOVE NTWIO-PROCESSING-CODE                       70270000
LRM002                   TO PROCESSING-CODE OF REG-OPT-RECORD-WS        70280000
LRM004              END-IF                                              70290000
LRM050              IF  NTWIO-MATRIX-LEVEL = '6'                        70300000
LRM050                 DISPLAY 'NTWIO MATRIX LEVEL 6 FOUND'             70310000
LRM050              ELSE                                                70320000
LRM050                 DISPLAY 'NTWIO MATRIX LEVEL FOUND '              70330000
LRM050                      NTWIO-MATRIX-LEVEL                          70340000
LRM050              END-IF                                              70350000
LRM002           ELSE                                                   70360000
LRM002              DISPLAY 'NTWIO FAILED ' NTWIO-RETURN-CODE           70370000
LRM002           END-IF                                                 70380000
LRM004          ELSE                                                    70390000
LRM004            DISPLAY 'SKIP NTWIO CALL NO CUSIP FOR PARMS '         70400000
LRM004                        NTWIO-REQUEST-PARAMETERS                  70410000
LRM004          END-IF                                                  70420000
LRM002        END-IF                                                    70430000
LRM003        IF (OMNIBUS-PROCESSING OR DST-DIRECT                      70440000
LRM029              OR PNC-SURPAS-PROCESSING)                           70450000
LRM003           IF OMNIBUS-PROCESSING                                  70460000
666700             SET OMNIBUS-PROCESS        TO  TRUE                  70470000
666800             DISPLAY FMT-ADP-SEC-NO  ' *** OMNIBUS SECURITY **** '70480000
LRM029           ELSE                                                   70490000
LRM029           IF PNC-SURPAS-PROCESSING                               70500000
LRM029             SET PNC-OMNIBUS-PROCESS    TO  TRUE                  70510000
LRM029             DISPLAY FMT-ADP-SEC-NO  ' *** PNC/OMNI SECURITY *** '70520000
LRM029                ' NTLEV '  NTWK-LVL-3-REG-OPTION                  70530000
LRM003           ELSE                                                   70540000
LRM003             SET DST-MFE-PROCESS        TO  TRUE                  70550000
LRM003             DISPLAY FMT-ADP-SEC-NO  ' *** DST/MFE SECURITY **** '70560000
LRM003           END-IF                                                 70570000
LRM029           END-IF                                                 70580000
666900           PERFORM O-CUST-ACT-MOVE-OMNIBUS                        70590000
667000           MOVE WS-BRANCH      TO  OB-BRANCH                      70600000
667100           MOVE WS-ACCT        TO  OB-ACCT                        70610000
667200           MOVE WS-TYPE        TO  OB-TYPE                        70620000
667300           MOVE WS-CHECK-DIGIT TO  OB-CHECK                       70630000
667400           IF TBL-MNT-SOURCE-NSCC                                 70640000
667500             SET MF-NSCC-SOURCE TO TRUE                           70650000
667510             DISPLAY                                              70660000
667520                     NTWREG-KEY-IN '   FOUND NSCC SOURCE '        70670000
667600           END-IF                                                 70680000
668700        END-IF                                                    70690000
668800      END-IF                                                      70700000
668900     END-IF.                                                      70710000
669000                                                                  70720000
      /                                                                 70730000
DJ0001*********************                                             70740000
DJ0001 O-MFC-P2-CREATE.                                                 70750000
DJ0001*********************                                             70760000
DJ0001                                                                  70770000
DJ0001***--GET OTHER-BROKER NAME FOR DESCRIPTION FIELD TRLR-BRKR        70780000
DJ0001     MOVE  LOW-VALUES            TO  BROKER-KEY                   70790000
DJ0001     MOVE 'O'                    TO  BROKER-EXCHANGE              70800000
DJ0001     MOVE  FMT-CONTRA-BRK-NUM    TO  BROKER-BADGE                 70810000
DJ0001     START BROKER-FILE                                            70820000
DJ0001           KEY IS NOT < BROKER-KEY                                70830000
DJ0001     IF  BROKER-FILE-OK OR                                        70840000
DJ0001         BROKER-ENDFILE                                           70850000
DJ0001         CONTINUE                                                 70860000
DJ0001     ELSE                                                         70870000
DJ0001         DISPLAY 'BRKRFL FILE START ERROR, STATUS = '             70880000
DJ0001                  BROKER-FILE-STATUS                              70890000
DJ0001         DISPLAY 'TRYING TO READ BROKER NUMBER '                  70900000
DJ0001                  FMT-CONTRA-BRK-NUM ' FOR MFC PROCESSING'        70910000
DJ0001         CALL ABEND USING ABEND-CODE-4000                         70920000
DJ0001     END-IF                                                       70930000
DJ0001     READ BROKER-FILE NEXT                                        70940000
DJ0001     IF  BROKER-FILE-OK OR                                        70950000
DJ0001         BROKER-ENDFILE                                           70960000
DJ0001         CONTINUE                                                 70970000
DJ0001     ELSE                                                         70980000
DJ0001         DISPLAY 'BRKRFL FILE READ NEXT ERROR, STATUS = '         70990000
DJ0001                  BROKER-FILE-STATUS                              71000000
DJ0001         DISPLAY 'TRYING TO READ BROKER NUMBER '                  71010000
DJ0001                  FMT-CONTRA-BRK-NUM ' FOR MFC PROCESSING'        71020000
DJ0001         CALL ABEND USING ABEND-CODE-4000                         71030000
DJ0001     END-IF                                                       71040000
DJ0001     IF  BROKER-FILE-OK                                           71050000
DJ0001     AND BROKER-EXCHANGE = 'O'                                    71060000
DJ0001     AND BROKER-BADGE    = FMT-CONTRA-BRK-NUM                     71070000
DJ0001         MOVE BROKER-NAME        TO TRLR-BRKR                     71080000
DJ0001     ELSE                                                         71090000
DJ0001         MOVE 1 TO SUB                                            71100000
DJ0001         PERFORM UNTIL SUB > WS-CATPPL-RECORD-COUNT               71110000
DJ0001              OR FMT-CONTRA-BRK-NUM = WS-CATPPL-BROKER(SUB)       71120000
DJ0001                 ADD 1 TO SUB                                     71121000
DJ0001         END-PERFORM                                              71122000
DJ0001         IF  SUB NOT > WS-CATPPL-RECORD-COUNT                     71123000
DJ0001             MOVE WS-CATPPL-BROKER-NAME(SUB) TO TRLR-BRKR         71124000
DJ0001         ELSE                                                     71125000
DJ0001             MOVE 'NOT ON FILE ' TO TRLR-BRKR                     71126000
DJ0001         END-IF                                                   71127000
DJ0001     END-IF                                                       71128000
DJ0001                                                                  71129000
DJ0001***--COMMON FIELDS                                                71129100
DJ0001     MOVE  ' '                   TO  P2-BK-RECORD                 71129200
DJ0001     MOVE  ' '                   TO  P2-BK-TRAILER-RECORD         71129300
DJ0001     MOVE  'B'                   TO  P2-BK-TRID-X                 71129400
DJ0001     IF  B1-ACAT-MFC-BOOKING-BATCH (B1-IND) > ' '                 71129500
DJ0001         MOVE B1-ACAT-MFC-BOOKING-BATCH (B1-IND)                  71129600
DJ0001                                 TO  P2-BK-BATCH-CODE             71129700
DJ0001     ELSE                                                         71129800
DJ0001         MOVE  'NS'              TO  P2-BK-BATCH-CODE             71129900
DJ0001     END-IF.                                                      71130000
DJ0001     MOVE  FMT-TI-ADP-CL-NO      TO  P2-BK-BROKER-NBR             71130100
DJ0001     IF  B1-ACAT-MFC-BOOKING-ENTRE (B1-IND) > ' '                 71130200
DJ0001         MOVE B1-ACAT-MFC-BOOKING-ENTRE (B1-IND)                  71130300
DJ0001                                 TO  P2-BK-ENTRY-CODE             71130400
DJ0001     ELSE                                                         71130500
DJ0001         MOVE 'MFC'              TO  P2-BK-ENTRY-CODE             71130600
DJ0001     END-IF.                                                      71130700
DJ0001     MOVE  FMT-ASSET-VALUE       TO  P2-BK-AMOUNT                 71130800
DJ0001     MOVE  '000'                 TO  P2-BK-CURRENCY               71130900
DJ0001     MOVE  '00000'               TO  P2-BK-FRACTION-X             71131000
DJ0001     MOVE  P2-BK-TRID-X          TO  P2-BKT-TRID-X                71131100
DJ0001     MOVE  P2-BK-BATCH-CODE      TO  P2-BKT-BATCH-CODE            71131200
DJ0001     MOVE  P2-BK-BROKER-NBR      TO  P2-BKT-BROKER-NBR            71131300
DJ0001     MOVE  '-'                   TO  P2-BKT-HYPHEN                71131400
DJ0001                                                                  71131500
DJ0001     IF  FMT-CLNT-IS-DELIVERER                                    71131600
DJ0001***----                                                           71131700
DJ0001***----FORMAT DELIVERER CREDIT FAIL ACCOUNT                       71131800
DJ0001***----                                                           71131900
DJ0001         MOVE  P2-CREDIT-SIGN        TO  P2-BK-BUY-SELL-CODE      71132000
DJ0001         IF  B1-ACAT-MFC-DELIVERER-ACCOUNT (B1-IND) > ' '         71132100
DJ0001             MOVE B1-ACAT-MFC-DELIVERER-ACCOUNT (B1-IND)          71132200
DJ0001                                     TO  P2-BK-BR-ACCT-T          71132300
DJ0001             MOVE  'X'               TO  P2-BK-CHECK-DIGIT        71132400
DJ0001         ELSE                                                     71132500
DJ0001             MOVE  '0000000406'      TO  P2-BK-BR-ACCT-T-C        71132600
DJ0001         END-IF                                                   71132700
DJ0001         MOVE  'MFC TO   '           TO  TRLR-MSG                 71132800
DJ0001         MOVE  TRLR-MESSAGE          TO  P2-BK-DESCRIPTION        71132900
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-RECORD             71133000
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71133100
DJ0001         MOVE  P2-BK-BUY-SELL-CODE   TO  P2-BKT-BUY-SELL-CODE     71133200
DJ0001         MOVE  P2-BK-BR-ACCT-T-C     TO  P2-BKT-BR-ACCT-T-C       71133300
DJ0001         MOVE  FMT-TI-CONTROL-NUM    TO  TRLT-CNTL-NBR            71133400
DJ0001         MOVE  FMT-CONTRA-BRK-NUM    TO  TRLT-CNTRA-BKR           71133500
DJ0001         MOVE  TRLT-MESSAGE          TO  P2-BKT-DESCRIPTION       71133600
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-TRAILER-RECORD     71133700
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71133800
LRM013         IF B1-ACAT-MFC-TRAILER (B1-IND) > SPACES                 71133900
LRM013            PERFORM O-WRITE-P2-NS-TRAILER                         71134000
LRM013         END-IF                                                   71134100
DJ0001***----                                                           71134200
DJ0001***----FORMAT DELIVERER DEBIT CNS ACCOUNT                         71134300
DJ0001***----                                                           71134400
DJ0001         MOVE  P2-DEBIT-SIGN         TO  P2-BK-BUY-SELL-CODE      71134500
DJ0001         IF  B1-OFFSET-ACC-NUM (B1-IND) > ' '                     71134600
DJ0001             MOVE B1-OFFSET-ACC-NUM (B1-IND)                      71134700
DJ0001                                     TO  P2-BK-BR-ACCT-T          71134800
DJ0001             MOVE  'X'               TO  P2-BK-CHECK-DIGIT        71134900
DJ0001         ELSE                                                     71135000
DJ0001             MOVE CNS-BR-ACCT-T-C    TO  P2-BK-BR-ACCT-T-C        71135100
DJ0001         END-IF                                                   71135200
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-RECORD             71135300
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71135400
DJ0001         MOVE  P2-BK-BUY-SELL-CODE   TO  P2-BKT-BUY-SELL-CODE     71135500
DJ0001         MOVE  P2-BK-BR-ACCT-T-C     TO  P2-BKT-BR-ACCT-T-C       71135600
LRM013         MOVE  TRLT-MESSAGE          TO  P2-BKT-DESCRIPTION       71135700
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-TRAILER-RECORD     71135800
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71135900
LRM013         IF B1-ACAT-MFC-TRAILER (B1-IND) > SPACES                 71136000
LRM013            PERFORM O-WRITE-P2-NS-TRAILER                         71136100
LRM013         END-IF                                                   71136200
DJ0001     END-IF.                                                      71136300
DJ0001                                                                  71136400
DJ0001     IF  FMT-CLNT-IS-RECEIVER                                     71136500
DJ0001***----                                                           71136600
DJ0001***----FORMAT RECEIVER DEBIT  FAIL ACCOUNT                        71136700
DJ0001***----                                                           71136800
DJ0001         MOVE  P2-DEBIT-SIGN         TO  P2-BK-BUY-SELL-CODE      71136900
DJ0001         IF  B1-ACAT-MFC-RECEIVER-ACCOUNT (B1-IND) > ' '          71137000
DJ0001             MOVE B1-ACAT-MFC-RECEIVER-ACCOUNT (B1-IND)           71137100
DJ0001                                     TO  P2-BK-BR-ACCT-T          71137200
DJ0001             MOVE  'X'               TO  P2-BK-CHECK-DIGIT        71137300
DJ0001         ELSE                                                     71137400
DJ0001             MOVE  '0000000307'      TO  P2-BK-BR-ACCT-T-C        71137500
DJ0001         END-IF                                                   71137600
DJ0001         MOVE  'MFC FROM '           TO  TRLR-MSG                 71137700
DJ0001         MOVE  TRLR-MESSAGE          TO  P2-BK-DESCRIPTION        71137800
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-RECORD             71137900
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71138000
DJ0001         MOVE  P2-BK-BUY-SELL-CODE   TO  P2-BKT-BUY-SELL-CODE     71138100
DJ0001         MOVE  P2-BK-BR-ACCT-T-C     TO  P2-BKT-BR-ACCT-T-C       71138200
DJ0001         MOVE  FMT-TI-CONTROL-NUM    TO  TRLT-CNTL-NBR            71138300
DJ0001         MOVE  FMT-CONTRA-BRK-NUM    TO  TRLT-CNTRA-BKR           71138400
DJ0001         MOVE  TRLT-MESSAGE          TO  P2-BKT-DESCRIPTION       71138500
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-TRAILER-RECORD     71138600
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71138700
LRM013         IF B1-ACAT-MFC-TRAILER (B1-IND) > SPACES                 71138800
LRM013            PERFORM O-WRITE-P2-NS-TRAILER                         71138900
LRM013         END-IF                                                   71139000
DJ0001***----                                                           71139100
DJ0001***----FORMAT RECEIVER CREDIT CNS ACCOUNT                         71139200
DJ0001***----                                                           71139300
DJ0001         MOVE  P2-CREDIT-SIGN        TO  P2-BK-BUY-SELL-CODE      71139400
DJ0001         IF  B1-OFFSET-ACC-NUM (B1-IND) > ' '                     71139500
DJ0001             MOVE B1-OFFSET-ACC-NUM (B1-IND)                      71139600
DJ0001                                     TO  P2-BK-BR-ACCT-T          71139700
DJ0001             MOVE  'X'               TO  P2-BK-CHECK-DIGIT        71139800
DJ0001         ELSE                                                     71139900
DJ0001             MOVE CNS-BR-ACCT-T-C    TO  P2-BK-BR-ACCT-T-C        71140000
DJ0001         END-IF                                                   71140100
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-RECORD             71140200
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71140300
DJ0001         MOVE  P2-BK-BUY-SELL-CODE   TO  P2-BKT-BUY-SELL-CODE     71140400
DJ0001         MOVE  P2-BK-BR-ACCT-T-C     TO  P2-BKT-BR-ACCT-T-C       71140500
LRM013         MOVE  TRLT-MESSAGE          TO  P2-BKT-DESCRIPTION       71140600
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-TRAILER-RECORD     71140700
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71140800
LRM013         IF B1-ACAT-MFC-TRAILER (B1-IND) > SPACES                 71140900
LRM013            PERFORM O-WRITE-P2-NS-TRAILER                         71141000
LRM013         END-IF                                                   71141100
DJ0001     END-IF.                                                      71141200
                                                                        71141300
LRM053     IF B1-ACAT-FUNDSERV-PEND-MEMO (B1-IND) > SPACES              71141400
LRM053     AND FMT-TRNFR-TYPE = 'MFC'                                   71141500
LRM053     AND B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) NOT = '1'          71141600
LRM053     AND FMT-CLNT-IS-RECEIVER                                     71141700
LRM053       PERFORM O-CUST-ACT-MOVE-BR-ACT                             71142000
LRM053     MOVE FMT-ADP-SEC-NO TO P2-BK-SECURITY-NBR                    71142100
LRM053       IF FMT-MEMO-ORG-RVRSL-QTY > ZERO                           71142200
LRM053       AND FMT-MEMO-ORG-RVRSL-QTY NOT =  FMT-ASSET-QTY-DEC        71142300
LRM053          MOVE FMT-MEMO-ORG-RVRSL-QTY TO P2-BK-QUANTITY           71142400
LRM053                                         P2-BK-FRACTION           71142500
LRM053          DISPLAY 'MFC PM MEMO ORIG DLVY QTY ON FUNDSERV MEMO'    71142600
LRM053          DISPLAY '    RCVR-LONG-NON ' FMT-ADP-SEC-NO             71142700
LRM053           ' ' FMT-MEMO-ORG-RVRSL-QTY ' BK= ' P2-BK-QUANTITY      71142800
LRM053       ELSE                                                       71142900
LRM053          MOVE FMT-ASSET-QTY-DEC      TO P2-BK-QUANTITY           71143000
LRM053                                         P2-BK-FRACTION           71143100
LRM053          DISPLAY 'MFC PM MEMO ' FMT-ADP-SEC-NO                   71143200
LRM053          DISPLAY '    LONG-NON-CNS FUNDSERV MEMO3 '              71143315
LRM053            ' BK= ' P2-BK-QUANTITY                                71143400
LRM053       END-IF                                                     71143500
LRM053       MOVE 'S' TO P2-BK-TRID-X                                   71143600
LRM053       MOVE B1-ACAT-FUNDSERV-PEND-MEMO(B1-IND) TO P2-BK-BATCH-CODE71143700
LRM053       MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE                71143800
LRM053       MOVE ZERO            TO P2-BK-AMOUNT                       71143900
LRM053       WRITE P2BKPG-RECORD FROM P2-BK-RECORD                      71144000
LRM053       ADD 1 TO TOT-CL-P2-RECS-WRITTEN                            71144100
LRM053     END-IF.                                                      71144217
                                                                        71144317
LRM054     IF B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) = '0'               71144417
LRM054     AND FMT-TRNFR-TYPE = 'MFC'                                   71144517
LRM054     AND DST-DIRECT                                               71144817
LRM054     AND NTWIO-MATRIX-LEVEL = '6'                                 71144917
LRM054     AND MEMO-TWO-WAY-BATCH (6) > SPACES                          71145017
LRM054       DISPLAY 'MFC N6 MEMO CREATION W/ 434669=0 '                71145117
LRM054              FMT-TI-CONTROL-NUM ' ' FMT-ADP-SEC-NO               71145217
LRM054       PERFORM O-CUST-ACT-MOVE-BR-ACT                             71145317
LRM054       MOVE FMT-ADP-SEC-NO TO P2-BK-SECURITY-NBR                  71145417
LRM054       IF FMT-MEMO-ORG-RVRSL-QTY > ZERO                           71145517
LRM054       AND FMT-MEMO-ORG-RVRSL-QTY NOT =  FMT-ASSET-QTY-DEC        71145617
LRM054          MOVE FMT-MEMO-ORG-RVRSL-QTY TO P2-BK-QUANTITY           71145717
LRM054                                         P2-BK-FRACTION           71145817
LRM054          DISPLAY 'MFC N6 MEMO ORIG QTY ON FUNDSERV MEMO'         71145917
LRM054          DISPLAY '    RCVR-LONG-NON ' FMT-ADP-SEC-NO             71146017
LRM054           ' ' FMT-MEMO-ORG-RVRSL-QTY ' BK= ' P2-BK-QUANTITY      71146117
LRM054       ELSE                                                       71146217
LRM054          MOVE FMT-ASSET-QTY-DEC      TO P2-BK-QUANTITY           71146317
LRM054                                         P2-BK-FRACTION           71146417
LRM054          DISPLAY 'MFC N6 MEMO ' FMT-ADP-SEC-NO                   71146517
LRM054          DISPLAY '    LONG-NON-CNS FUNDSERV MEMO3 '              71146617
LRM054            ' BK= ' P2-BK-QUANTITY                                71146717
LRM054            ' MEMO6='  MEMO-TWO-WAY-BATCH (6)                     71146819
LRM054       END-IF                                                     71146917
LRM054       MOVE MEMO-TWO-WAY-BATCH (6) TO P2-BK-TRID                  71147119
LRM054       MOVE ZERO            TO P2-BK-AMOUNT                       71147221
LRM054       IF FMT-CLNT-IS-RECEIVER                                    71147319
LRM054          MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE              71147419
LRM054          PERFORM O-BK-MEMO-DB-QUANTITY                           71147523
LRM054       ELSE                                                       71147619
LRM054          MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE             71147719
LRM054          PERFORM O-BK-MEMO-CR-QUANTITY                           71147823
LRM054       END-IF                                                     71147919
LRM054*******WRITE P2BKPG-RECORD FROM P2-BK-RECORD                      71148021
LRM054*******ADD 1 TO TOT-CL-P2-RECS-WRITTEN                            71148121
LRM054     END-IF.                                                      71148219
DJ0001                                                                  71148319
DJ0001 O-MFC-P2-CREATE-EXIT. EXIT.                                      71148419
669100     EJECT                                                        71148519
      /                                                                 71148619
YH0001*********************                                             71148719
YH0001 O-MFC-P2-CREATE-NEW.                                             71148819
YH0001*********************                                             71148919
YH0001                                                                  71149019
YH0001     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR.                  71149119
YH0001                                                                  71149219
YH0001     IF  FMT-NTWRK-CNTL-CD = ' '                                  71149319
YH0001         PERFORM MFC-NTWRK-CODE                                   71149419
YH0001         DISPLAY '***NETWROK NEW  = ' FMT-NTWRK-CNTL-CD           71149519
YH0001     END-IF                                                       71149619
YH0001                                                                  71149719
YH0001     IF  FMT-CLNT-IS-DELIVERER                                    71149819
YH0001        PERFORM O-BK-MEMO-CR-QUANTITY                             71149919
YH0001        IF FMT-CAGE-TAG > SPACES                                  71150019
YH0001          PERFORM O-BK-PEND-DB-VALUE                              71150119
YH0001          PERFORM O-RD-CL-CR-VALUE-CR-QUANTITY                    71150219
YH0001        ELSE                                                      71150319
YH0001          PERFORM O-BK-OFFSET-DB-VALUE                            71150419
YH0001          PERFORM O-BK-PEND-CR-BOTH                               71150519
YH0001        END-IF                                                    71150619
YH0001     ELSE                                                         71150719
YH0001       PERFORM O-BK-MEMO-DB-QUANTITY                              71150819
YH0001       IF FMT-CAGE-TAG > SPACES                                   71150919
YH0001          PERFORM O-BK-PEND-CR-VALUE                              71151019
YH0001          PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY                    71151119
YH0001       ELSE                                                       71151219
YH0001          PERFORM O-BK-OFFSET-CR-VALUE                            71151319
YH0001          PERFORM O-BK-PEND-DB-BOTH                               71151419
YH0001       END-IF                                                     71151519
YH0001     END-IF.                                                      71151619
YH0001                                                                  71151719
LRM053     IF B1-ACAT-FUNDSERV-PEND-MEMO (B1-IND) > SPACES              71151819
LRM053     AND FMT-TRNFR-TYPE = 'MFC'                                   71151919
LRM053     AND FMT-CLNT-IS-RECEIVER                                     71152019
LRM053       PERFORM O-CUST-ACT-MOVE-BR-ACT                             71152119
LRM053       MOVE FMT-ADP-SEC-NO TO P2-BK-SECURITY-NBR                  71152219
LRM053       IF FMT-MEMO-ORG-RVRSL-QTY > ZERO                           71152319
LRM053       AND FMT-MEMO-ORG-RVRSL-QTY NOT =  FMT-ASSET-QTY-DEC        71152419
LRM053          MOVE FMT-MEMO-ORG-RVRSL-QTY TO P2-BK-QUANTITY           71152519
LRM053                                         P2-BK-FRACTION           71152619
LRM053          DISPLAY 'MFC PM MEMO ORIG DLVY QTY ON FUNDSERV MEMO'    71152719
LRM053          DISPLAY '    RCVR-LONG-NON ' FMT-ADP-SEC-NO             71152819
LRM053           ' ' FMT-MEMO-ORG-RVRSL-QTY ' BK= ' P2-BK-QUANTITY      71152919
LRM053       ELSE                                                       71153019
LRM053          MOVE FMT-ASSET-QTY-DEC      TO P2-BK-QUANTITY           71153119
LRM053                                         P2-BK-FRACTION           71153219
LRM053          DISPLAY 'MFC PM MEMO ' FMT-ADP-SEC-NO                   71153319
LRM053          DISPLAY '    LONG-NON-CNS FUNDSERV MEMO4 '              71153419
LRM053            ' BK= ' P2-BK-QUANTITY                                71153519
LRM053       END-IF                                                     71153619
LRM053       MOVE 'S' TO P2-BK-TRID-X                                   71153719
LRM053       MOVE B1-ACAT-FUNDSERV-PEND-MEMO(B1-IND) TO P2-BK-BATCH-CODE71153819
LRM053       MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE                71153919
LRM053       MOVE ZERO            TO P2-BK-AMOUNT                       71154019
LRM053       WRITE P2BKPG-RECORD FROM P2-BK-RECORD                      71154119
LRM053       ADD 1 TO TOT-CL-P2-RECS-WRITTEN                            71154219
LRM053     END-IF.                                                      71154319
YH0001 MFC-NTWRK-CODE.                                                  71154419
                                                                        71154519
           MOVE B1-NTWRK-CNTL-CD (B1-IND)  TO FMT-NTWRK-CNTL-CD         71154619
                                                                        71154719
           IF NTWREG-FILE-STATUS = '00'                                 71154819
             IF REG-OP-HOUSE-ACCT  > SPACES                             71154919
                MOVE '0'                      TO FMT-NTWRK-CNTL-CD      71155019
             END-IF                                                     71155119
                                                                        71155219
             IF (OMNIBUS-PROCESS    OR DST-MFE-PROCESS                  71155319
LRM029                  OR PNC-OMNIBUS-PROCESS)                         71155419
               MOVE '0'                      TO FMT-NTWRK-CNTL-CD       71155519
                                                                        71155619
               IF DST-MFE-PROCESS                                       71155719
                AND  B1-DST-OFFSET (B1-IND)    = 'Y'                    71155819
                 MOVE '3'                   TO  FMT-NTWRK-CNTL-CD       71155919
               ELSE                                                     71156000
                 IF MF-NSCC-SOURCE                                      71160000
                  AND  B1-NS-BRCH-OFFSET (B1-IND)    = 'Y'              71170000
                  MOVE '3'                   TO  FMT-NTWRK-CNTL-CD      71180000
LRM029           ELSE                                                   71190000
LRM029             IF PNC-OMNIBUS-PROCESS                               71200000
LRM029              AND B1-PNC-SURPAS-OFFSET (B1-IND) > SPACES          71210000
LRM029              MOVE '3'                 TO  FMT-NTWRK-CNTL-CD      71220000
LRM029             END-IF                                               71230000
               END-IF                                                   71240000
             END-IF                                                     71250000
YH0001     END-IF.                                                      71260000
                                                                        71270000
669100     EJECT                                                        71280000
LRM019 PROCESS-POST-SETTLE-FUNDSERV.                                    71290000
LRM019     READ POST-SETTLE-FILE                                        71300000
LRM019        AT END SET POST-SETTLE-EOF TO TRUE                        71310000
LRM019     END-READ.                                                    71320000
LRM019     IF NOT POST-SETTLE-EOF                                       71330000
LRM019        IF POST-HEADER-ID                                         71340000
LRM019           DISPLAY 'FOUND POST SETTLE HEADER ' POST-BOOK-DATE     71350000
LRM019        ELSE                                                      71360000
LRM019        IF POST-TI-RECORD-ID                                      71370000
LRM019           MOVE POST-TI-RECORD TO FMT-TI-RECORD                   71380000
LRM019        ELSE                                                      71390000
LRM019        IF POST-AT-RECORD-ID                                      71400000
LRM019           IF POST-AT-CUST-ACCOUNT = FMT-TI-CUST-ACCOUNT          71410000
LRM019              SET B1-IND TO FMT-TI-ADP-CL-NO                      71420000
LRM019              MOVE POST-AT-RECORD TO FMT-AT-RECORD                71430000
LRM019              PERFORM O-FORMAT-T3RDFL-RECORD                      71431000
LRM019              ADD +1  TO TOT-CAGE-FAIL-REC                        71432000
LRM019           ELSE                                                   71433000
LRM019              DISPLAY 'PROBLEM READING POST SETTLE FILE'          71434000
LRM019                      ' EXPECTED TI AND AT MISMATCHED'            71435000
LRM019              DISPLAY ' TI ' FMT-TI-ADP-CL-NO                     71436000
LRM019                         ' ' FMT-TI-CUST-ACCOUNT                  71437000
LRM019                      ' AT ' POST-TI-ADP-CL-NO                    71438000
LRM019                         ' ' POST-TI-CUST-ACCOUNT                 71439000
LRM019           END-IF                                                 71440000
LRM019     END-IF.                                                      71450000
                                                                        71460000
669200******************************************************************71470000
669300*** PERFORMED BY:                                              ***71480000
669400***     O-EDIT-BR-ACCT                                         ***71490000
669500***     O-EDIT-SETTLE-DATE                                     ***71500000
669600***     O-EDIT-STL-IND (3 TIMES)                               ***71510000
669700***     O-EDIT-WHEN-ISSUE                                      ***71520000
669800***     O-EDIT-FRACT-QUANT (2 TIMES)                           ***71530000
669900***     O-GET-ADP-CUSIP-NBR (2 TIMES)                          ***71540000
670000***     O-EDIT-CONTRA-BKR-NBR                                  ***71550000
670100******************************************************************71560000
670200                                                                  71570000
670300 O-PRINT-ERROR-RECORD.                                            71580000
670400                                                                  71590000
670500     IF PARM-CAGE-RUN                                             71600000
670600     AND THIS-RECORD-WAS-NOT-PRINTED                              71610000
670700     AND (FMT-SETTL-DATE  =  WS-TRADE-PLUS-2                      71620000
670800      OR FMT-TRNFR-TYPE  NOT = 'FUL')                             71630000
670900         PERFORM O-PRINT-DETAIL-LINE-1                            71640000
671000         MOVE ZERO  TO DL-2-CTL                                   71650000
671100         MOVE FMT-TI-RECORD TO ERROR-WORK-LINE                    71660000
671200         MOVE ERROR-WORK1  TO DETAIL1-1-100                       71670000
671300         MOVE ERROR-WORK2  TO DETAIL1-101-133                     71680000
671400                                                                  71690000
671500         MOVE FMT-AT-RECORD TO ERROR-WORK-LINE                    71700000
671600         MOVE ERROR-WORK1  TO DETAIL2-1-100                       71710000
671700         MOVE ERROR-WORK2  TO DETAIL2-101-133                     71720000
671800                                                                  71730000
671900*****    MOVE THIRD-RECORD TO ERROR-WORK-LINE                     71740000
672000         MOVE SPACES       TO ERROR-WORK-LINE                     71750000
672100         MOVE ERROR-WORK1  TO DETAIL3-1-100                       71760000
672200         MOVE ERROR-WORK2  TO DETAIL3-101-133                     71770000
672300                                                                  71780000
672400         DISPLAY DET-ERR-1A                                       71790000
672500         DISPLAY DET-DATA-1A                                      71800000
672600         DISPLAY DET-ERR-1B                                       71810000
672700         DISPLAY DET-DATA-1B                                      71820000
672800                                                                  71830000
672900         DISPLAY DET-ERR-2A                                       71840000
673000         DISPLAY DET-DATA-2A                                      71850000
673100         DISPLAY DET-ERR-2B                                       71860000
673200         DISPLAY DET-DATA-2B                                      71870000
673300                                                                  71880000
673400*        DISPLAY DET-ERR-3A                                       71890000
673500*        DISPLAY DET-DATA-3A                                      71900000
673600*        DISPLAY DET-ERR-3B                                       71910000
673700*        DISPLAY DET-DATA-3B                                      71920000
673800                                                                  71930000
673900                                                                  71940000
674000     ELSE                                                         71950000
674100         MOVE SPACE TO DL-2-CTL                                   71960000
674200     END-IF.                                                      71970000
674300                                                                  71980000
674400     IF PARM-CAGE-RUN                                             71990000
674500     AND (FMT-SETTL-DATE  =  WS-TRADE-PLUS-2                      72000000
674600      OR FMT-TRNFR-TYPE  NOT = 'FUL')                             72010000
YH0001         PERFORM O-PRINT-DETAIL-LINE-2                            72020000
674200     END-IF.                                                      72030000
674800/                                                                 72040000
674900******************************************************************72050000
675000*** PERFORMED BY:                                              ***72060000
675100***     O-PRINT-ERROR-RECORD                                   ***72070000
675200******************************************************************72080000
675300                                                                  72090000
675400 O-PRINT-DETAIL-LINE-1.                                           72100000
675500                                                                  72110000
675600     MOVE 'Y' TO THIS-RECORD-PRINTED-SWITCH                       72120000
675700     MOVE FMT-TI-ADP-CL-NO TO DL-CLIENT-NO                        72130000
675800     MOVE FMT-TI-CUST-ACCOUNT (1:3) TO DL-BRANCH                  72140000
LRM024                                       CUST-BRANCH                72150000
675900     MOVE FMT-TI-CUST-ACCOUNT (4:5) TO DL-ACCOUNT                 72160000
LRM024                                       CUST-ACCT                  72170000
LRM024     IF FMT-CASH-MGN-IND = 'C'                                    72180000
LRM024        MOVE '1' TO DL-ACCOUNT-TYPE                               72190000
LRM024     ELSE                                                         72200000
LRM024     IF FMT-CASH-MGN-IND = 'M'                                    72210000
LRM024        MOVE '2' TO DL-ACCOUNT-TYPE                               72220000
LRM024     ELSE                                                         72230000
LRM024     IF FMT-CASH-MGN-IND = 'S'                                    72240000
LRM024        MOVE '5' TO DL-ACCOUNT-TYPE                               72250000
LRM024     ELSE                                                         72260000
LRM024        MOVE ' ' TO DL-ACCOUNT-TYPE                               72270000
LRM024                    DL-ACCOUNT-CKDGT                              72280000
LRM024     END-IF.                                                      72290000
LRM024     IF DL-ACCOUNT-TYPE > ' '                                     72300000
LRM024        MOVE DL-ACCOUNT-TYPE TO CUST-TYPE                         72310000
LRM024         CALL  CKDIGIT  USING                                     72320000
LRM024                        CUST-BR-ACCT-TYPE                         72330000
LRM024                        LENGTH-KEY                                72340000
LRM024                        CUST-CHECK-DIGIT                          72350000
LRM024         END-CALL                                                 72360000
LRM024         MOVE CUST-CHECK-DIGIT TO  DL-ACCOUNT-CKDGT               72370000
LRM024     END-IF.                                                      72380000
676000     MOVE FMT-CUSIP-NUM TO DL-CUSIP                               72390000
676100     MOVE FMT-TI-CONTROL-NUM(5 : 3) TO DL-CONTROL-NBR             72400000
676200     MOVE '-'                TO DL-CONTROL-NBR(4 : 1)             72410000
676300     MOVE FMT-TI-CONTROL-NUM(8 : 7) TO DL-CONTROL-NBR (5 : 7)     72420000
676500     MOVE ' '              TO DL-STK-BND                          72430000
676600                                                                  72440000
676800     MOVE FMT-SEC-D-1     TO DL-DESCRIPTION                       72450000
676900     MOVE FMT-SEC-D-2     TO DL-DESCRIPTION-2                     72460000
677300     MOVE FMT-SETTL-DATE  TO DL-SETTLE-DATE.                      72470000
677400                                                                  72480000
677500     MOVE DETAIL-LINE-1 TO PW-LINE                                72490000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    72500000
YH0001       ADD    1            TO MFC-MAX                             72510000
YH0001                                                                  72520000
YH0001       PERFORM O-MFC-TABLE-OVERFLOW                               72530000
YH0001       MOVE DETAIL-LINE-1  TO MFC-ERR-LINE1 (MFC-MAX)             72540000
677800       MOVE SPACE          TO MFC-ERR-LINE1A (MFC-MAX)            72550000
677700       IF FMT-SEC-D-2 NOT EQUAL SPACES                            72560000
677800         MOVE DETAIL-LINE-1A TO MFC-ERR-LINE1A (MFC-MAX)          72570000
             END-IF                                                     72580000
YH0001     ELSE                                                         72590000
677600       PERFORM O-PRINT-LINE                                       72600000
677700       IF FMT-SEC-D-2 NOT EQUAL SPACES                            72610000
677800         MOVE DETAIL-LINE-1A TO PW-LINE                           72620000
677900         PERFORM O-PRINT-LINE                                     72630000
             END-IF                                                     72640000
678000     END-IF.                                                      72650000
                                                                        72660000
LRM024     MOVE FMT-AT-CONTRA-BRK-NUM TO  DL-3-CONTRA                   72670000
LRM024     MOVE FMT-STTLM-LCTN-CD     TO  DL-3-SLOC                     72680000
LRM024     MOVE FMT-STTLM-RSN-CD      TO  DL-3-SLOC-RSN                 72690000
LRM024     MOVE FMT-ISO-CRNCY-CD      TO  DL-3-ISO-CRNCY-CD             72700000
LRM024     MOVE FMT-ASSET-QTY-DEC     TO  DL-3-QTY                      72710000
LRM024     MOVE FMT-ASSET-AMT-DEC     TO  DL-3-AMT                      72720000
                                                                        72730000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    72740000
             MOVE DETAIL-LINE-3  TO MFC-ERR-LINE3 (MFC-MAX)             72750000
YH0001       MOVE SPACES         TO MFC-ERR-LINE4 (MFC-MAX)             72760000
YH0001                              MFC-ERR-LINE5 (MFC-MAX)             72770000
           ELSE                                                         72780000
             MOVE DETAIL-LINE-3  TO PW-LINE                             72790000
             PERFORM O-PRINT-LINE                                       72800000
           END-IF.                                                      72810000
LRM024                                                                  72820000
                                                                        72830000
LRM024     IF FMT-TI-COMMENT NOT = SPACES                               72840000
LRM024        MOVE 'TI'               TO  DL-4-RECORD-TYPE              72850000
LRM024        MOVE FMT-TI-COMMENT     TO  DL-4-COMMENT                  72860000
YH0001        IF FMT-TRNFR-TYPE = 'MFC'                                 72870000
                MOVE DETAIL-LINE-4  TO MFC-ERR-LINE4 (MFC-MAX)          72880000
              ELSE                                                      72890000
                MOVE DETAIL-LINE-4  TO PW-LINE                          72900000
                PERFORM O-PRINT-LINE                                    72910000
              END-IF                                                    72920000
           END-IF.                                                      72930000
                                                                        72940000
LRM024     IF FMT-ASSET-COMMENT NOT = SPACES                            72950000
LRM024        MOVE 'AT'               TO  DL-4-RECORD-TYPE              72960000
LRM024        MOVE FMT-ASSET-COMMENT  TO  DL-4-COMMENT                  72970000
YH0001        IF FMT-TRNFR-TYPE = 'MFC'                                 72980000
                MOVE DETAIL-LINE-4  TO MFC-ERR-LINE5 (MFC-MAX)          72990000
              ELSE                                                      73000000
                MOVE DETAIL-LINE-4  TO PW-LINE                          73010000
                PERFORM O-PRINT-LINE                                    73020000
              END-IF                                                    73030000
           END-IF.                                                      73040000
679400/                                                                 73050000
678100/                                                                 73060000
YH0001 O-MFC-TABLE-OVERFLOW.                                            73070000
           IF MFC-MAX > 450  AND                                        73080000
              (INFSND-MSG-SEND-SW = SPACE )                             73090000
              MOVE 'MFC ERROR TBL'      TO PASS-TABLE-NAME              73100000
              MOVE 450                 TO PASS-COUNTER                  73110000
              MOVE PASS-MSG           TO PASS-MESSAGE                   73120000
              CALL INFSND  USING PASS-DATA                              73130000
              SET INFSND-MSG-SEND-YES TO TRUE                           73140000
           END-IF                                                       73150000
                                                                        73160000
           IF  MFC-MAX > 500                                            73170000
               DISPLAY '  CAT650 - MFC ERROR TABLE DROP OVER 500 **'    73180000
               MOVE 500    TO MFC-MAX                                   73190000
               DISPLAY  MFC-ERR-LINE1 (MFC-MAX)                         73200000
               DISPLAY  MFC-ERR-LINE2 (MFC-MAX)                         73210000
                                                                        73220000
           END-IF.                                                      73230000
678200******************************************************************73240000
678300*** PERFORMED BY:                                              ***73250000
678400***     O-PRINT-ERROR-RECORD                                   ***73260000
678500******************************************************************73270000
678600                                                                  73280000
678700 O-PRINT-DETAIL-LINE-2.                                           73290000
678800                                                                  73300000
678900     MOVE ERROR-VALUE   TO DL-ERROR-VALUE                         73310000
679000     MOVE ERROR-MSG     TO DL-ERROR-MSG                           73320000
679100                                                                  73330000
679200     MOVE DETAIL-LINE-2  TO PW-LINE                               73340000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    73350000
             MOVE DETAIL-LINE-2  TO MFC-ERR-LINE2 (MFC-MAX)             73360000
           ELSE                                                         73370000
             MOVE DETAIL-LINE-2  TO PW-LINE                             73380000
             PERFORM O-PRINT-LINE                                       73390000
           END-IF.                                                      73400000
679500******************************************************************73410000
679600*** PERFORMED BY:                                              ***73420000
679700***     O-CLIENT-BREAK                                         ***73430000
679800******************************************************************73440000
679900                                                                  73450000
680000 O-PRINT-CLIENT-TOTALS.                                           73460000
680100                                                                  73470000
680200     ADD 1 TO PC-PAGE-CNT                                         73480000
680300     MOVE PC-PAGE-CNT TO TTL-PAGE                                 73490000
680400     MOVE TOTALS-TITLE-LINE TO PW-LINE                            73500000
680500     PERFORM O-P-WRITE-LINE                                       73510000
680600                                                                  73520000
680700     MOVE CLIENT-P2-COL-HEADER  TO PW-LINE                        73530000
680800     PERFORM O-PRINT-LINE                                         73540000
680900     MOVE CLIENT-P2-TOTAL-LINE-LINE TO PW-LINE                    73550000
681000     PERFORM O-PRINT-LINE                                         73560000
681100     MOVE SPACES TO PW-LINE                                       73570000
681200     PERFORM O-PRINT-LINE                                         73580000
681300                                                                  73590000
681400     MOVE 'CUSTOMER'              TO  CTL-P2-DEST-LIT             73600000
681500     MOVE TOT-CL-BK-CUST-DB-VALUE TO  CTL-P2-DB-VALUE             73610000
681600     MOVE TOT-CL-BK-CUST-CR-VALUE TO  CTL-P2-CR-VALUE             73620000
681700     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        73630000
681800        MOVE  TOT-CL-BK-CUST-DB-QTY  TO  CTL-P2-DB-QTY-FS         73640000
681900        MOVE  TOT-CL-BK-CUST-CR-QTY  TO  CTL-P2-CR-QTY-FS         73650000
682000     ELSE                                                         73660000
682100        MOVE  TOT-CL-BK-CUST-DB-QTY  TO  CTL-P2-DB-QTY            73670000
682200        MOVE  TOT-CL-BK-CUST-CR-QTY  TO  CTL-P2-CR-QTY            73680000
682300     END-IF                                                       73690000
682400     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         73700000
682500     PERFORM O-PRINT-LINE                                         73710000
682600                                                                  73720000
682700     MOVE '  CNS   '              TO  CTL-P2-DEST-LIT             73730000
682800                                                                  73740000
682900     MOVE CNS-BRANCH              TO  WORK-P2-BRANCH              73750000
683000     MOVE CNS-ACCOUNT             TO  WORK-P2-ACCOUNT             73760000
683100     MOVE CNS-TYPE                TO  WORK-P2-TYPE                73770000
683200     MOVE CNS-CHECK-DIGIT         TO  WORK-P2-CHECK-DIGIT         73780000
683300     MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT             73790000
683400                                                                  73800000
683500     MOVE ZEROS                   TO  CTL-P2-DB-VALUE             73810000
683600     MOVE ZEROS                   TO  CTL-P2-CR-VALUE             73820000
683700     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        73830000
683800        MOVE  TOT-CL-BK-CNS-DB-QTY  TO  CTL-P2-DB-QTY-FS          73840000
683900        MOVE  TOT-CL-BK-CNS-CR-QTY  TO  CTL-P2-CR-QTY-FS          73850000
684000     ELSE                                                         73860000
684100        MOVE  TOT-CL-BK-CNS-DB-QTY  TO  CTL-P2-DB-QTY             73870000
684200        MOVE  TOT-CL-BK-CNS-CR-QTY  TO  CTL-P2-CR-QTY             73880000
684300     END-IF                                                       73890000
684400     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         73900000
684500     PERFORM O-PRINT-LINE                                         73910000
684600                                                                  73920000
684700     MOVE 'OFFSET  '              TO  CTL-P2-DEST-LIT             73930000
684800                                                                  73940000
684900     MOVE ALT-OFFSET-BRANCH       TO  WORK-P2-BRANCH              73950000
685000     MOVE ALT-OFFSET-ACCOUNT      TO  WORK-P2-ACCOUNT             73960000
685100     MOVE ALT-OFFSET-TYPE         TO  WORK-P2-TYPE                73970000
685200     MOVE ALT-OFFSET-CHECK-DIGIT  TO  WORK-P2-CHECK-DIGIT         73980000
685300     MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT             73990000
685400                                                                  74000000
685500     MOVE TOT-CL-OFFSET-DB-VALUE  TO  CTL-P2-DB-VALUE             74010000
685600     MOVE TOT-CL-OFFSET-CR-VALUE  TO  CTL-P2-CR-VALUE             74020000
685700     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74030000
685800        MOVE  ZEROS                 TO  CTL-P2-DB-QTY-FS          74040000
685900        MOVE  ZEROS                 TO  CTL-P2-CR-QTY-FS          74050000
686000     ELSE                                                         74060000
686100        MOVE  ZEROS                 TO  CTL-P2-DB-QTY             74070000
686200        MOVE  ZEROS                 TO  CTL-P2-CR-QTY             74080000
686300     END-IF                                                       74090000
686400     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         74100000
686500     PERFORM O-PRINT-LINE                                         74110000
686600                                                                  74120000
686700     IF B1-OFFSET-AMT-BYPASS (B1-IND) = '1'                       74130000
686800       MOVE '(BYPASSED)'              TO  CTL-P2-CNS-ACCT         74140000
686900       MOVE TOT-CL-OFFSET-BYP-DB-VALUE  TO  CTL-P2-DB-VALUE       74150000
687000       MOVE TOT-CL-OFFSET-BYP-CR-VALUE  TO  CTL-P2-CR-VALUE       74160000
687100       MOVE ZEROS                   TO  CTL-P2-DB-QTY             74170000
687200       MOVE ZEROS                   TO  CTL-P2-CR-QTY             74180000
687300       MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                       74190000
687400       PERFORM O-PRINT-LINE                                       74200000
687500     END-IF                                                       74210000
687600                                                                  74220000
687700     MOVE SPACES                  TO  CTL-P2-CNS-ACCT             74230000
687800     MOVE 'OPTIONS '             TO CTL-P2-DEST-LIT               74240000
687900     MOVE ZERO                   TO CTL-P2-DB-VALUE               74250000
688000     MOVE ZERO                   TO CTL-P2-CR-VALUE               74260000
688100     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74270000
688200        MOVE  TOT-CL-BK-OPTION-DB-QTY  TO  CTL-P2-DB-QTY-FS       74280000
688300        MOVE  TOT-CL-BK-OPTION-CR-QTY  TO  CTL-P2-CR-QTY-FS       74290000
688400     ELSE                                                         74300000
688500        MOVE  TOT-CL-BK-OPTION-DB-QTY  TO  CTL-P2-DB-QTY          74310000
688600        MOVE  TOT-CL-BK-OPTION-CR-QTY  TO  CTL-P2-CR-QTY          74320000
688700     END-IF                                                       74330000
688800     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         74340000
688900     PERFORM O-PRINT-LINE                                         74350000
689000                                                                  74360000
689100     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               74370000
689200     MOVE WS-CBOE-OFFSET-ACCOUNT TO CTL-P2-CNS-ACCT               74380000
689300     MOVE ZERO                   TO CTL-P2-DB-VALUE               74390000
689400     MOVE ZERO                   TO CTL-P2-CR-VALUE               74400000
689500     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74410000
689600        MOVE  TOT-CL-OPT-CBOE-DB-QTY  TO  CTL-P2-DB-QTY-FS        74420000
689700        MOVE  TOT-CL-OPT-CBOE-CR-QTY  TO  CTL-P2-CR-QTY-FS        74430000
689800     ELSE                                                         74440000
689900        MOVE  TOT-CL-OPT-CBOE-DB-QTY  TO  CTL-P2-DB-QTY           74450000
690000        MOVE  TOT-CL-OPT-CBOE-CR-QTY  TO  CTL-P2-CR-QTY           74460000
690100     END-IF                                                       74470000
690200     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         74480000
690300     PERFORM O-PRINT-LINE                                         74490000
690400                                                                  74500000
690500     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               74510000
690600     MOVE WS-AMEX-NYSE-OFFSET-ACCOUNT TO CTL-P2-CNS-ACCT          74520000
690700     MOVE ZERO                   TO CTL-P2-DB-VALUE               74530000
690800     MOVE ZERO                   TO CTL-P2-CR-VALUE               74540000
690900     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74550000
691000        MOVE  TOT-CL-AMEX-NYSE-DB-QTY  TO  CTL-P2-DB-QTY-FS       74560000
691100        MOVE  TOT-CL-AMEX-NYSE-CR-QTY  TO  CTL-P2-CR-QTY-FS       74570000
691200     ELSE                                                         74580000
691300        MOVE  TOT-CL-AMEX-NYSE-DB-QTY  TO  CTL-P2-DB-QTY          74590000
691400        MOVE  TOT-CL-AMEX-NYSE-CR-QTY  TO  CTL-P2-CR-QTY          74600000
691500     END-IF                                                       74610000
691600     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         74620000
691700     PERFORM O-PRINT-LINE                                         74630000
691800                                                                  74640000
691900     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               74650000
692000     MOVE WS-PBW-OFFSET-ACCOUNT  TO CTL-P2-CNS-ACCT               74660000
692100     MOVE ZERO                   TO CTL-P2-DB-VALUE               74670000
692200     MOVE ZERO                   TO CTL-P2-CR-VALUE               74680000
692300     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74690000
692400        MOVE  TOT-CL-OPT-PBW-DB-QTY  TO  CTL-P2-DB-QTY-FS         74700000
692500        MOVE  TOT-CL-OPT-PBW-CR-QTY  TO  CTL-P2-CR-QTY-FS         74710000
692600     ELSE                                                         74720000
692700        MOVE  TOT-CL-OPT-PBW-DB-QTY  TO  CTL-P2-DB-QTY            74730000
692800        MOVE  TOT-CL-OPT-PBW-CR-QTY  TO  CTL-P2-CR-QTY            74740000
692900     END-IF                                                       74750000
693000     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         74760000
693100     PERFORM O-PRINT-LINE                                         74770000
693200                                                                  74780000
693300     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               74790000
693400     MOVE WS-PSE-OFFSET-ACCOUNT  TO CTL-P2-CNS-ACCT               74800000
693500     MOVE ZERO                   TO CTL-P2-DB-VALUE               74810000
693600     MOVE ZERO                   TO CTL-P2-CR-VALUE               74820000
693700     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74830000
693800        MOVE  TOT-CL-OPT-PSE-DB-QTY  TO  CTL-P2-DB-QTY-FS         74840000
693900        MOVE  TOT-CL-OPT-PSE-CR-QTY  TO  CTL-P2-CR-QTY-FS         74850000
694000     ELSE                                                         74860000
694100        MOVE  TOT-CL-OPT-PSE-DB-QTY  TO  CTL-P2-DB-QTY            74870000
694200        MOVE  TOT-CL-OPT-PSE-CR-QTY  TO  CTL-P2-CR-QTY            74880000
694300     END-IF                                                       74890000
694400     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         74900000
694500     PERFORM O-PRINT-LINE                                         74910000
694600                                                                  74920000
694700     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               74930000
694800     MOVE WS-DFLT-OFFSET-ACCOUNT TO CTL-P2-CNS-ACCT               74940000
694900     MOVE ZERO                   TO CTL-P2-DB-VALUE               74950000
695000     MOVE ZERO                   TO CTL-P2-CR-VALUE               74960000
695100     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74970000
695200        MOVE  TOT-CL-OPT-DFLT-DB-QTY  TO  CTL-P2-DB-QTY-FS        74980000
695300        MOVE  TOT-CL-OPT-DFLT-CR-QTY  TO  CTL-P2-CR-QTY-FS        74990000
695400     ELSE                                                         75000000
695500        MOVE  TOT-CL-OPT-DFLT-DB-QTY  TO  CTL-P2-DB-QTY           75010000
695600        MOVE  TOT-CL-OPT-DFLT-CR-QTY  TO  CTL-P2-CR-QTY           75020000
695700     END-IF                                                       75030000
695800     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         75040000
695900     PERFORM O-PRINT-LINE                                         75050000
696000                                                                  75060000
696100     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        75070000
696200      MOVE ' FUNDSERV'             TO  PW-LINE                    75080000
696300      PERFORM O-PRINT-LINE                                        75090000
696400                                                                  75100000
696500      MOVE 'N1 MEMO'               TO  CTL-P2-DEST-LIT            75110000
696600      MOVE MEMO-ACCOUNT (1) (1:3)  TO  WORK-P2-BRANCH             75120000
696700      MOVE MEMO-ACCOUNT (1) (4:5)  TO  WORK-P2-ACCOUNT            75130000
696800      MOVE MEMO-ACCOUNT (1) (9:1)  TO  WORK-P2-TYPE               75140000
696900      MOVE MEMO-ACCOUNT (1) (10:1) TO  WORK-P2-CHECK-DIGIT        75150000
697000      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75160000
697100      MOVE ZEROS                   TO  CTL-P2-DB-VALUE            75170000
697200      MOVE ZEROS                   TO  CTL-P2-CR-VALUE            75180000
697300      MOVE TOT-N1-MEMO-DB-QTY      TO  CTL-P2-DB-QTY-FS           75190000
697400      MOVE TOT-N1-MEMO-CR-QTY      TO  CTL-P2-CR-QTY-FS           75200000
697500      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75210000
697600      PERFORM O-PRINT-LINE                                        75220000
697700                                                                  75230000
697800      MOVE 'N2 MEMO'               TO  CTL-P2-DEST-LIT            75240000
697900      MOVE MEMO-ACCOUNT (2) (1:3)  TO  WORK-P2-BRANCH             75250000
698000      MOVE MEMO-ACCOUNT (2) (4:5)  TO  WORK-P2-ACCOUNT            75260000
698100      MOVE MEMO-ACCOUNT (2) (9:1)  TO  WORK-P2-TYPE               75270000
698200      MOVE MEMO-ACCOUNT (2) (10:1) TO  WORK-P2-CHECK-DIGIT        75280000
698300      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75290000
698400      MOVE ZEROS                   TO  CTL-P2-DB-VALUE            75300000
698500      MOVE ZEROS                   TO  CTL-P2-CR-VALUE            75310000
698600      MOVE TOT-N2-MEMO-DB-QTY      TO  CTL-P2-DB-QTY-FS           75320000
698700      MOVE TOT-N2-MEMO-CR-QTY      TO  CTL-P2-CR-QTY-FS           75330000
698800      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75340000
698900      PERFORM O-PRINT-LINE                                        75350000
699000                                                                  75360000
699100      MOVE 'N3 MEMO'               TO  CTL-P2-DEST-LIT            75370000
699200      MOVE MEMO-ACCOUNT (3) (1:3)  TO  WORK-P2-BRANCH             75380000
699300      MOVE MEMO-ACCOUNT (3) (4:5)  TO  WORK-P2-ACCOUNT            75390000
699400      MOVE MEMO-ACCOUNT (3) (9:1)  TO  WORK-P2-TYPE               75400000
699500      MOVE MEMO-ACCOUNT (3) (10:1) TO  WORK-P2-CHECK-DIGIT        75410000
699600      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75420000
699700      MOVE ZEROS                   TO  CTL-P2-DB-VALUE            75430000
699800      MOVE ZEROS                   TO  CTL-P2-CR-VALUE            75440000
699900      MOVE TOT-N3-MEMO-DB-QTY      TO  CTL-P2-DB-QTY-FS           75450000
700000      MOVE TOT-N3-MEMO-CR-QTY      TO  CTL-P2-CR-QTY-FS           75460000
700100      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75470000
700200      PERFORM O-PRINT-LINE                                        75480000
700300                                                                  75490000
700400      MOVE 'N4 MEMO'               TO  CTL-P2-DEST-LIT            75500000
700500      MOVE MEMO-ACCOUNT (4) (1:3)  TO  WORK-P2-BRANCH             75510000
700600      MOVE MEMO-ACCOUNT (4) (4:5)  TO  WORK-P2-ACCOUNT            75520000
700700      MOVE MEMO-ACCOUNT (4) (9:1)  TO  WORK-P2-TYPE               75530000
700800      MOVE MEMO-ACCOUNT (4) (10:1) TO  WORK-P2-CHECK-DIGIT        75540000
700900      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75550000
701000      MOVE ZEROS                   TO  CTL-P2-DB-VALUE            75560000
701100      MOVE ZEROS                   TO  CTL-P2-CR-VALUE            75570000
701200      MOVE TOT-N4-MEMO-DB-QTY      TO  CTL-P2-DB-QTY-FS           75580000
701300      MOVE TOT-N4-MEMO-CR-QTY      TO  CTL-P2-CR-QTY-FS           75590000
701400      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75600000
701500      PERFORM O-PRINT-LINE                                        75610000
701600                                                                  75620000
LRM050      MOVE 'N6 MEMO'               TO  CTL-P2-DEST-LIT            75630000
LRM050      MOVE MEMO-ACCOUNT (6) (1:3)  TO  WORK-P2-BRANCH             75640000
LRM050      MOVE MEMO-ACCOUNT (6) (4:5)  TO  WORK-P2-ACCOUNT            75650000
LRM050      MOVE MEMO-ACCOUNT (6) (9:1)  TO  WORK-P2-TYPE               75660000
LRM050      MOVE MEMO-ACCOUNT (6) (10:1) TO  WORK-P2-CHECK-DIGIT        75661000
LRM050      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75662000
LRM050      MOVE ZEROS                   TO  CTL-P2-DB-VALUE            75663000
LRM050      MOVE ZEROS                   TO  CTL-P2-CR-VALUE            75664000
LRM050      MOVE TOT-N6-MEMO-DB-QTY      TO  CTL-P2-DB-QTY-FS           75665000
LRM050      MOVE TOT-N6-MEMO-CR-QTY      TO  CTL-P2-CR-QTY-FS           75666000
LRM050      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75667000
LRM050      PERFORM O-PRINT-LINE                                        75668000
LRM050                                                                  75669000
701700      MOVE 'LEVEL 0'               TO  CTL-P2-DEST-LIT            75669100
701800      MOVE SPACES                  TO  CTL-P2-CNS-ACCT            75669200
701900      MOVE ZEROS                   TO  CTL-P2-DB-VALUE            75669300
702000      MOVE ZEROS                   TO  CTL-P2-CR-VALUE            75669400
702100      MOVE TOT-N0-MEMO-DB-QTY      TO  CTL-P2-DB-QTY-FS           75669500
702200      MOVE TOT-N0-MEMO-CR-QTY      TO  CTL-P2-CR-QTY-FS           75669600
702300      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75669700
702400      PERFORM O-PRINT-LINE                                        75669800
702500                                                                  75669900
702600      MOVE 'PND/REC'               TO  CTL-P2-DEST-LIT            75670000
702700      MOVE B1-RCV-PEND-STL-ACCT(B1-IND) (1:3) TO  WORK-P2-BRANCH  75680000
702800      MOVE B1-RCV-PEND-STL-ACCT(B1-IND) (4:5) TO  WORK-P2-ACCOUNT 75690000
702900      MOVE '1'                            TO  WORK-P2-TYPE        75700000
703000      MOVE 'X' TO WORK-P2-ACCOUNT-AREA(14:1)                      75710000
703100      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75720000
703200      MOVE TOT-CL-PEND-REC-DB-VALUE TO  CTL-P2-DB-VALUE           75730000
703300      MOVE TOT-CL-PEND-REC-CR-VALUE TO  CTL-P2-CR-VALUE           75740000
703400      MOVE TOT-CL-PEND-REC-DB-QTY   TO  CTL-P2-DB-QTY-FS          75750000
703500      MOVE TOT-CL-PEND-REC-CR-QTY   TO  CTL-P2-CR-QTY-FS          75760000
703600      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75770000
703700      PERFORM O-PRINT-LINE                                        75780000
703800                                                                  75790000
703900      MOVE 'PND/DEL'               TO  CTL-P2-DEST-LIT            75800000
704000      MOVE B1-DEL-PEND-STL-ACCT(B1-IND) (1:3) TO  WORK-P2-BRANCH  75810000
704100      MOVE B1-DEL-PEND-STL-ACCT(B1-IND) (4:5) TO  WORK-P2-ACCOUNT 75820000
704200      MOVE '2'                            TO  WORK-P2-TYPE        75830000
704300      MOVE 'X' TO WORK-P2-ACCOUNT-AREA(14:1)                      75840000
704400      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75850000
704500      MOVE TOT-CL-PEND-DEL-DB-VALUE TO  CTL-P2-DB-VALUE           75860000
704600      MOVE TOT-CL-PEND-DEL-CR-VALUE TO  CTL-P2-CR-VALUE           75870000
704700      MOVE TOT-CL-PEND-DEL-DB-QTY   TO  CTL-P2-DB-QTY-FS          75880000
704800      MOVE TOT-CL-PEND-DEL-CR-QTY   TO  CTL-P2-CR-QTY-FS          75890000
704900      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75900000
705000      PERFORM O-PRINT-LINE                                        75910000
705100                                                                  75920000
705200     END-IF                                                       75930000
705300                                                                  75940000
705400     MOVE SPACES TO CTL-P2-CNS-ACCT                               75950000
705500     MOVE CLIENT-P2-TOTAL-LINE-LINE TO PW-LINE                    75960000
705600     PERFORM O-PRINT-LINE                                         75970000
705700                                                                  75980000
705800     MOVE '  BK    '              TO  CTL-P2-DEST-LIT             75990000
705900     MOVE TOT-CL-BK-DB-VALUE      TO  CTL-P2-DB-VALUE             76000000
706000     MOVE TOT-CL-BK-CR-VALUE      TO  CTL-P2-CR-VALUE             76010000
706100     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        76020000
706200        MOVE  TOT-CL-BK-DB-QTY  TO  CTL-P2-DB-QTY-FS              76030000
706300        MOVE  TOT-CL-BK-CR-QTY  TO  CTL-P2-CR-QTY-FS              76040000
706400     ELSE                                                         76050000
706500        MOVE  TOT-CL-BK-DB-QTY  TO  CTL-P2-DB-QTY                 76060000
706600        MOVE  TOT-CL-BK-CR-QTY  TO  CTL-P2-CR-QTY                 76070000
706700     END-IF                                                       76080000
706800     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         76090000
706900     PERFORM O-PRINT-LINE                                         76100000
707000                                                                  76110000
707100     MOVE ' FAILS  '              TO  CTL-P2-DEST-LIT             76120000
707200     MOVE TOT-CL-RD-CL-DB-VALUE   TO  CTL-P2-DB-VALUE             76130000
707300     MOVE TOT-CL-RD-CL-CR-VALUE   TO  CTL-P2-CR-VALUE             76140000
707400     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        76150000
707500        MOVE  TOT-CL-RD-CL-DB-QTY  TO  CTL-P2-DB-QTY-FS           76160000
707600        MOVE  TOT-CL-RD-CL-CR-QTY  TO  CTL-P2-CR-QTY-FS           76170000
707700     ELSE                                                         76180000
707800        MOVE  TOT-CL-RD-CL-DB-QTY  TO  CTL-P2-DB-QTY              76190000
707900        MOVE  TOT-CL-RD-CL-CR-QTY  TO  CTL-P2-CR-QTY              76200000
708000     END-IF                                                       76210000
708100     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         76220000
708200     PERFORM O-PRINT-LINE                                         76230000
708300                                                                  76240000
708400     MOVE CLIENT-P2-TOTAL-LINE-LINE TO PW-LINE                    76250000
708500     PERFORM O-PRINT-LINE                                         76260000
708600                                                                  76270000
708700     MOVE ' TOTAL  '              TO  CTL-P2-DEST-LIT             76280000
708800     MOVE TOT-CL-DB-VALUE         TO  CTL-P2-DB-VALUE             76290000
708900     MOVE TOT-CL-CR-VALUE         TO  CTL-P2-CR-VALUE             76300000
709000     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        76310000
709100        MOVE  TOT-CL-DB-QTY  TO  CTL-P2-DB-QTY-FS                 76320000
709200        MOVE  TOT-CL-CR-QTY  TO  CTL-P2-CR-QTY-FS                 76330000
709300     ELSE                                                         76340000
709400        MOVE  TOT-CL-DB-QTY  TO  CTL-P2-DB-QTY                    76350000
709500        MOVE  TOT-CL-CR-QTY  TO  CTL-P2-CR-QTY                    76360000
709600     END-IF                                                       76370000
709700     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         76380000
709800     PERFORM O-PRINT-LINE                                         76390000
709900                                                                  76400000
710000     MOVE CLIENT-REC-COL-HEADER TO PW-LINE                        76410000
710100     PERFORM O-PRINT-LINE                                         76420000
710200     PERFORM O-COMPUTE-CLIENT-TOTALS.                             76430000
710300/                                                                 76440000
710400******************************************************************76450000
710500*** PERFORMED BY:                                              ***76460000
710600***     O-PRINT-CLIENT-TOTALS                                  ***76470000
710700******************************************************************76480000
710800                                                                  76490000
710900 O-COMPUTE-CLIENT-TOTALS.                                         76500000
711000                                                                  76510000
711100     MOVE 'VALID RECS IN'  TO CTL-REC-LITERAL                     76520000
711200     MOVE TOT-CL-VALID-SORT-RECS TO CTL-REC-TOT-ACAT              76530000
711300     MOVE TOT-CL-PEND-READ       TO CTL-REC-TOT-PEND              76540000
711400                                                                  76550000
711500     COMPUTE TEMP-TOTAL = TOT-CL-VALID-SORT-RECS                  76560000
711600                        + TOT-CL-PEND-READ                        76570000
711700     END-COMPUTE                                                  76580000
711800     MOVE TEMP-TOTAL       TO CTL-REC-TOT-TOT                     76590000
711900                                                                  76600000
712000     MOVE CLIENT-REC-TOTAL-LINE TO PW-LINE                        76610000
712100     PERFORM O-PRINT-LINE                                         76620000
712200                                                                  76630000
712300     MOVE 'NEW PEND WRITTEN'  TO CTL-REC-LITERAL                  76640000
712400     MOVE CLIENT-REC-TOTAL-LINE TO PW-LINE                        76650000
712500     PERFORM O-PRINT-LINE                                         76660000
712600                                                                  76670000
712700     MOVE 'SELECTED FOR P2'      TO CTL-REC-LITERAL               76680000
712800     MOVE TOT-CL-ACAT-SELECTED-FOR-P2 TO CTL-REC-TOT-ACAT         76690000
712900     MOVE TOT-CL-PEND-SELECTED-FOR-P2 TO CTL-REC-TOT-PEND         76700000
713000     MOVE TOT-CL-SELECTED-FOR-P2 TO CTL-REC-TOT-TOT               76710000
713100     MOVE CLIENT-REC-TOTAL-LINE  TO PW-LINE                       76720000
713200     PERFORM O-PRINT-LINE                                         76730000
713300                                                                  76740000
713400     MOVE ' TOTAL OUT     '      TO CTL-REC-LITERAL               76750000
713500     COMPUTE TEMP-TOTAL =                                         76760000
713600                          TOT-CL-ACAT-SELECTED-FOR-P2             76770000
713700     END-COMPUTE                                                  76780000
713800     MOVE TEMP-TOTAL       TO CTL-REC-TOT-ACAT                    76790000
713900     COMPUTE TEMP-TOTAL =                                         76800000
714000                          TOT-CL-PEND-SELECTED-FOR-P2             76810000
714100     END-COMPUTE                                                  76820000
714200     MOVE TEMP-TOTAL       TO CTL-REC-TOT-PEND                    76830000
714300     COMPUTE TEMP-TOTAL =                                         76840000
714400                          TOT-CL-SELECTED-FOR-P2                  76850000
714500     END-COMPUTE                                                  76860000
714600     MOVE TEMP-TOTAL       TO CTL-REC-TOT-TOT                     76870000
714700     MOVE CLIENT-REC-TOTAL-LINE TO PW-LINE                        76880000
714800     PERFORM O-PRINT-LINE                                         76890000
714900                                                                  76900000
715000     MOVE '0' TO PW-CTL                                           76910000
715100     MOVE TOT-CL-ACCOUNTS       TO CTL-ACCOUNTS                   76920000
715200     MOVE TOT-CL-ASSETS         TO CTL-ASSETS                     76930000
715300     MOVE CLIENT-TOTAL-LINE     TO PW-LINE                        76940000
715400     PERFORM O-PRINT-LINE                                         76950000
715500                                                                  76960000
715600     IF  B1-FUND-SERV-CLIENT (B1-IND)  =  '1'                     76970000
715700       MOVE '0' TO PW-CTL                                         76980000
715800       MOVE TOT-CL-FS-DELV        TO CTL-FS-DELV                  76990000
715900       MOVE TOT-CL-FS-RECV        TO CTL-FS-RECV                  77000000
716000       MOVE FUND-SERV-TOTAL-LINE  TO PW-LINE                      77010000
716100       PERFORM O-PRINT-LINE                                       77020000
716200     END-IF                                                       77030000
716300                                                                  77040000
716400     MOVE 999 TO PC-LINE-CNT                                      77050000
716500     MOVE ZEROS TO PC-PAGE-CNT.                                   77060000
716600/                                                                 77070000
716700******************************************************************77080000
716800*** PERFORMED BY:                                              ***77090000
716900***     O-PRINT-DETAIL-LINE-1 (2 TIMES)                        ***77100000
717000***     O-PRINT-DETAIL-LINE-2                                  ***77110000
717100***     O-PRINT-CLIENT-TOTALS (18 TIMES)                       ***77120000
717200***     O-COMPUTE-CLIENT-TOTALS (5 TIMES)                      ***77130000
717300***     E-PRINT-FINAL-TOTALS (16 TIMES)                        ***77140000
717400***     E-COMPUTE-FINAL-TOTALS (4 TIMES)                       ***77150000
717500******************************************************************77160000
717600                                                                  77170000
717700 O-PRINT-LINE.                                                    77180000
717800                                                                  77190000
717900     IF  PC-LINE-CNT > PC-MAX-LINES                               77200000
718000         PERFORM O-PRINT-HEADERS                                  77210000
718100     END-IF                                                       77220000
718200                                                                  77230000
718300     PERFORM O-P-WRITE-LINE.                                      77240000
718400/                                                                 77250000
718500******************************************************************77260000
718600*** PERFORMED BY:                                              ***77270000
718700***     O-PRINT-LINE                                           ***77280000
718800******************************************************************77290000
718900                                                                  77300000
719000 O-PRINT-HEADERS.                                                 77310000
719100                                                                  77320000
719200     MOVE PW-LINE TO HOLD-PW-LINE                                 77330000
719300     ADD 1 TO PC-PAGE-CNT                                         77340000
719400     MOVE PC-PAGE-CNT TO T-PAGE                                   77350000
719500     MOVE TITLE-LINE1 TO PW-LINE                                  77360000
719600     PERFORM O-P-WRITE-LINE                                       77370000
719700     MOVE SPACE       TO PW-LINE                                  77380000
719800     PERFORM O-P-WRITE-LINE                                       77390000
719900     MOVE HDG1        TO PW-LINE                                  77400000
720000     PERFORM O-P-WRITE-LINE                                       77410000
720100     MOVE HDG2        TO PW-LINE                                  77420000
720200     PERFORM O-P-WRITE-LINE                                       77430000
720300     MOVE SPACE       TO PW-LINE                                  77440000
720400     PERFORM O-P-WRITE-LINE                                       77450000
720500     MOVE HOLD-PW-LINE TO PW-LINE                                 77460000
720600     MOVE '0' TO PW-CTL.                                          77470000
720700/                                                                 77480000
720800******************************************************************77490000
720900*** PERFORMED BY:                                              ***77500000
721000***     O-PRINT-CLIENT-TOTALS                                  ***77510000
721100***     O-PRINT-LINE                                           ***77520000
721200***     O-PRINT-HEADERS (5 TIMES)                              ***77530000
721300***     E-PRINT-FINAL-TOTALS                                   ***77540000
721400***     E-COMPUTE-FINAL-TOTALS                                 ***77550000
721500******************************************************************77560000
721600                                                                  77570000
721700 O-P-WRITE-LINE.                                                  77580000
721800                                                                  77590000
721900****ALTERNATE CODE TO CPRTRTN.  REFORMATS CODE WITHOUT LABELS.*** 77600000
722000****ALTERNATE COBOL PRINT ROUTINE                             *** 77610000
722100****CPRTALT                                                   *** 77620000
722200     EVALUATE PW-CTL                                              77630000
722300         WHEN ' '                                                 77640000
722400             ADD 1 TO PC-LINE-CNT                                 77650000
722500         WHEN '0'                                                 77660000
722600             ADD 2 TO PC-LINE-CNT                                 77670000
722700         WHEN '-'                                                 77680000
722800             ADD 3 TO PC-LINE-CNT                                 77690000
722900         WHEN '1'                                                 77700000
723000             MOVE 1 TO PC-LINE-CNT                                77710000
723100         WHEN OTHER                                               77720000
723200             DISPLAY '***INVALID PRINT CONTROL CHARACTER '        77730000
723300                 QUOTE PW-CTL QUOTE ' - SKIP 1 LINE ASSUMED ***'  77740000
723400             MOVE SPACE TO PW-CTL                                 77750000
723500             ADD 1 TO PC-LINE-CNT                                 77760000
723600     END-EVALUATE                                                 77770000
723700     WRITE XSTLPI-RECORD  FROM PRINT-WORK                         77780000
723800     MOVE SPACES TO PW-LINE.                                      77790000
723900                                                                  77800000
724000/                                                                 77810000
724100****************                                                  77820000
724200 ENDJOB-ROUTINE  SECTION.                                         77830000
724300****************                                                  77840000
724400                                                                  77850000
724500     DISPLAY ' '.                                                 77860000
724600     DISPLAY '*** ' PGM-NAME ' BEGINNING END-JOB ROUTINE ***'.    77870000
724700                                                                  77880000
724800     PERFORM  E-PRINT-FINAL-TOTALS.                               77890000
724900                                                                  77900000
725000     PERFORM  E-COMPUTE-FINAL-TOTALS.                             77910000
725100                                                                  77920000
725200     PERFORM  E-DISPLAY-COUNTERS                                  77930000
725300              VARYING CNTR-X                                      77940000
725400              FROM 1 BY 1                                         77950000
725500       UNTIL  CNTR-X IS GREATER THAN NUM-CNTRS.                   77960000
725600                                                                  77970000
725700     PERFORM  E-WRITE-OUTPUT-TRLS.                                77980000
725800                                                                  77990000
725900     PERFORM  E-CLOSE-FILES.                                      78000000
726000                                                                  78010000
726100     MOVE  +0                         TO  RETURN-CODE.            78020000
726200     DISPLAY '*** ' PGM-NAME ' COMPLETED END-JOB ROUTINE ***'.    78030000
726300                                                                  78040000
726400**********************                                            78050000
726500 ENDJOB-ROUTINE-EXIT.  EXIT.                                      78060000
726600**********************                                            78070000
726700                                                                  78080000
726800 E-PRINT-FINAL-TOTALS.                                            78090000
726900                                                                  78100000
727000** ALWAYS PRINT OUT TOTALS FOR ALL CLIENTS **                     78110000
727100     MOVE  0 TO PW-CL                                             78120000
727200     MOVE 'ALL' TO TL-CLIENT-NUMBER                               78130000
727300     MOVE 'ALL' TO TTL-CLIENT-NUMBER                              78140000
727400     ADD 1 TO PC-PAGE-CNT                                         78150000
727500     MOVE PC-PAGE-CNT TO TTL-PAGE                                 78160000
727600     MOVE TOTALS-TITLE-LINE TO PW-LINE                            78170000
727700     PERFORM O-P-WRITE-LINE                                       78180000
727800                                                                  78190000
727900     MOVE CLIENT-P2-COL-HEADER  TO PW-LINE                        78200000
728000     PERFORM O-PRINT-LINE                                         78210000
728100                                                                  78220000
728200     MOVE 'CUSTOMER'           TO  CTL-P2-DEST-LIT                78230000
728300     MOVE TOT-BK-CUST-DB-VALUE TO  CTL-P2-DB-VALUE                78240000
728400     MOVE TOT-BK-CUST-CR-VALUE TO  CTL-P2-CR-VALUE                78250000
728500     MOVE TOT-BK-CUST-DB-QTY   TO  CTL-P2-DB-QTY                  78260000
728600     MOVE TOT-BK-CUST-CR-QTY   TO  CTL-P2-CR-QTY                  78270000
728700     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78280000
728800     PERFORM O-PRINT-LINE                                         78290000
728900                                                                  78300000
729000     MOVE '  CNS   '           TO  CTL-P2-DEST-LIT                78310000
729100     MOVE ZEROS                TO  CTL-P2-DB-VALUE                78320000
729200     MOVE ZEROS                TO  CTL-P2-CR-VALUE                78330000
729300     MOVE TOT-BK-CNS-DB-QTY    TO  CTL-P2-DB-QTY                  78340000
729400     MOVE TOT-BK-CNS-CR-QTY    TO  CTL-P2-CR-QTY                  78350000
729500     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78360000
729600     PERFORM O-PRINT-LINE                                         78370000
729700                                                                  78380000
729800     MOVE 'OFFSET  '           TO  CTL-P2-DEST-LIT                78390000
729900     MOVE TOT-OFFSET-DB-VALUE  TO  CTL-P2-DB-VALUE                78400000
730000     MOVE TOT-OFFSET-CR-VALUE  TO  CTL-P2-CR-VALUE                78410000
730100     MOVE ZEROS                TO  CTL-P2-DB-QTY                  78420000
730200     MOVE ZEROS                TO  CTL-P2-CR-QTY                  78430000
730300     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78440000
730400     PERFORM O-PRINT-LINE                                         78450000
730500                                                                  78460000
730600     MOVE '(BYPASSED)'             TO CTL-P2-CNS-ACCT             78470000
730700     MOVE TOT-OFFSET-BYP-DB-VALUE  TO  CTL-P2-DB-VALUE            78480000
730800     MOVE TOT-OFFSET-BYP-CR-VALUE  TO  CTL-P2-CR-VALUE            78490000
730900     MOVE ZEROS                TO  CTL-P2-DB-QTY                  78500000
731000     MOVE ZEROS                TO  CTL-P2-CR-QTY                  78510000
731100     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78520000
731200     PERFORM O-PRINT-LINE                                         78530000
731300                                                                  78540000
731400     MOVE SPACES                   TO CTL-P2-CNS-ACCT             78550000
731500     MOVE 'OPTIONS '             TO CTL-P2-DEST-LIT               78560000
731600     MOVE ZERO                   TO CTL-P2-DB-VALUE               78570000
731700     MOVE ZERO                   TO CTL-P2-CR-VALUE               78580000
731800     MOVE TOT-BK-OPTION-DB-QTY   TO CTL-P2-DB-QTY                 78590000
731900     MOVE TOT-BK-OPTION-CR-QTY   TO CTL-P2-CR-QTY                 78600000
732000     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78610000
732100     PERFORM O-PRINT-LINE                                         78620000
732200                                                                  78630000
732300     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               78640000
732400     MOVE WS-CBOE-OFFSET-ACCOUNT TO CTL-P2-CNS-ACCT               78650000
732500     MOVE ZERO                   TO CTL-P2-DB-VALUE               78660000
732600     MOVE ZERO                   TO CTL-P2-CR-VALUE               78670000
732700     MOVE TOT-OPT-CBOE-DB-QTY    TO CTL-P2-DB-QTY                 78680000
732800     MOVE TOT-OPT-CBOE-CR-QTY    TO CTL-P2-CR-QTY                 78690000
732900     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78700000
733000     PERFORM O-PRINT-LINE                                         78710000
733100                                                                  78720000
733200     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               78730000
733300     MOVE WS-AMEX-NYSE-OFFSET-ACCOUNT TO CTL-P2-CNS-ACCT          78740000
733400     MOVE ZERO                   TO CTL-P2-DB-VALUE               78750000
733500     MOVE ZERO                   TO CTL-P2-CR-VALUE               78760000
733600     MOVE TOT-AMEX-NYSE-DB-QTY   TO CTL-P2-DB-QTY                 78770000
733700     MOVE TOT-AMEX-NYSE-CR-QTY   TO CTL-P2-CR-QTY                 78780000
733800     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78790000
733900     PERFORM O-PRINT-LINE                                         78800000
734000                                                                  78810000
734100     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               78820000
734200     MOVE WS-PBW-OFFSET-ACCOUNT  TO CTL-P2-CNS-ACCT               78830000
734300     MOVE ZERO                   TO CTL-P2-DB-VALUE               78840000
734400     MOVE ZERO                   TO CTL-P2-CR-VALUE               78850000
734500     MOVE TOT-OPT-PBW-DB-QTY     TO CTL-P2-DB-QTY                 78860000
734600     MOVE TOT-OPT-PBW-CR-QTY     TO CTL-P2-CR-QTY                 78870000
734700     MOVE CLIENT-P2-TOTAL-LINE   TO PW-LINE                       78880000
734800     PERFORM O-PRINT-LINE                                         78890000
734900                                                                  78900000
735000     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               78910000
735100     MOVE WS-PSE-OFFSET-ACCOUNT  TO CTL-P2-CNS-ACCT               78920000
735200     MOVE ZERO                   TO CTL-P2-DB-VALUE               78930000
735300     MOVE ZERO                   TO CTL-P2-CR-VALUE               78940000
735400     MOVE TOT-OPT-PSE-DB-QTY     TO CTL-P2-DB-QTY                 78950000
735500     MOVE TOT-OPT-PSE-CR-QTY     TO CTL-P2-CR-QTY                 78960000
735600     MOVE CLIENT-P2-TOTAL-LINE   TO PW-LINE                       78970000
735700     PERFORM O-PRINT-LINE                                         78980000
735800                                                                  78990000
735900     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               79000000
736000     MOVE WS-DFLT-OFFSET-ACCOUNT TO CTL-P2-CNS-ACCT               79010000
736100     MOVE ZERO                   TO CTL-P2-DB-VALUE               79020000
736200     MOVE ZERO                   TO CTL-P2-CR-VALUE               79030000
736300     MOVE TOT-OPT-DFLT-DB-QTY    TO CTL-P2-DB-QTY                 79040000
736400     MOVE TOT-OPT-DFLT-CR-QTY    TO CTL-P2-CR-QTY                 79050000
736500     MOVE CLIENT-P2-TOTAL-LINE   TO PW-LINE                       79060000
736600     PERFORM O-PRINT-LINE                                         79070000
736700     MOVE SPACES                 TO CTL-P2-CNS-ACCT               79080000
736800                                                                  79090000
736900     MOVE CLIENT-P2-TOTAL-LINE-LINE TO PW-LINE                    79100000
737000     PERFORM O-PRINT-LINE                                         79110000
737100                                                                  79120000
737200     MOVE '  BK    '             TO  CTL-P2-DEST-LIT              79130000
737300     MOVE TOT-BK-DB-VALUE        TO  CTL-P2-DB-VALUE              79140000
737400     MOVE TOT-BK-CR-VALUE        TO  CTL-P2-CR-VALUE              79150000
737500     MOVE TOT-BK-DB-QTY          TO  CTL-P2-DB-QTY                79160000
737600     MOVE TOT-BK-CR-QTY          TO  CTL-P2-CR-QTY                79170000
737700     MOVE CLIENT-P2-TOTAL-LINE   TO PW-LINE                       79180000
737800     PERFORM O-PRINT-LINE                                         79190000
737900                                                                  79200000
738000     MOVE ' FAILS  '           TO  CTL-P2-DEST-LIT                79210000
738100     MOVE TOT-RD-CL-DB-VALUE   TO  CTL-P2-DB-VALUE                79220000
738200     MOVE TOT-RD-CL-CR-VALUE   TO  CTL-P2-CR-VALUE                79230000
738300     MOVE TOT-RD-CL-DB-QTY     TO  CTL-P2-DB-QTY                  79240000
738400     MOVE TOT-RD-CL-CR-QTY     TO  CTL-P2-CR-QTY                  79250000
738500     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         79260000
738600     PERFORM O-PRINT-LINE                                         79270000
738700                                                                  79280000
738800     MOVE CLIENT-P2-TOTAL-LINE-LINE TO PW-LINE                    79290000
738900     PERFORM O-PRINT-LINE                                         79300000
739000                                                                  79310000
739100     MOVE ' TOTAL  '           TO  CTL-P2-DEST-LIT                79320000
739200     MOVE TOT-DB-VALUE         TO  CTL-P2-DB-VALUE                79330000
739300     MOVE TOT-CR-VALUE         TO  CTL-P2-CR-VALUE                79340000
739400     MOVE TOT-DB-QTY           TO  CTL-P2-DB-QTY                  79350000
739500     MOVE TOT-CR-QTY           TO  CTL-P2-CR-QTY                  79360000
739600     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         79370000
739700     PERFORM O-PRINT-LINE                                         79380000
739800                                                                  79390000
739900     MOVE CLIENT-REC-COL-HEADER TO PW-LINE                        79400000
740000     PERFORM O-PRINT-LINE.                                        79410000
740100                                                                  79420000
740200/                                                                 79430000
740300 E-COMPUTE-FINAL-TOTALS.                                          79440000
740400                                                                  79450000
740500     MOVE 'VALID RECS IN'     TO CTL-REC-LITERAL                  79460000
740600     MOVE TOT-VALID-SORT-RECS TO CTL-REC-TOT-ACAT                 79470000
740700     MOVE TOT-PEND-READ       TO CTL-REC-TOT-PEND                 79480000
740800                                                                  79490000
740900     COMPUTE TEMP-TOTAL = TOT-VALID-SORT-RECS                     79500000
741000                        + TOT-PEND-READ                           79510000
741100     END-COMPUTE                                                  79520000
741200     MOVE TEMP-TOTAL                TO CTL-REC-TOT-TOT            79530000
741300                                                                  79540000
741400     MOVE CLIENT-REC-TOTAL-LINE     TO PW-LINE                    79550000
741500     PERFORM O-PRINT-LINE                                         79560000
741600                                                                  79570000
741700     MOVE 'NEW PEND WRITTEN'        TO CTL-REC-LITERAL            79580000
741800     MOVE ZERO                      TO CTL-REC-TOT-ACAT           79590000
741900     MOVE ZERO                      TO CTL-REC-TOT-PEND           79600000
742000     MOVE ZERO                      TO CTL-REC-TOT-TOT            79610000
742100     MOVE CLIENT-REC-TOTAL-LINE     TO PW-LINE                    79620000
742200     PERFORM O-PRINT-LINE                                         79630000
742300                                                                  79640000
742400     MOVE 'SELECTED FOR P2'         TO CTL-REC-LITERAL            79650000
742500     MOVE TOT-ACAT-SELECTED-FOR-P2  TO CTL-REC-TOT-ACAT           79660000
742600     MOVE TOT-PEND-SELECTED-FOR-P2  TO CTL-REC-TOT-PEND           79670000
742700     MOVE TOT-SELECTED-FOR-P2       TO CTL-REC-TOT-TOT            79680000
742800     MOVE CLIENT-REC-TOTAL-LINE     TO PW-LINE                    79690000
742900     PERFORM O-PRINT-LINE                                         79700000
743000                                                                  79710000
743100     MOVE ' TOTAL OUT     '         TO CTL-REC-LITERAL            79720000
743200     COMPUTE TEMP-TOTAL =                                         79730000
743300                          TOT-ACAT-SELECTED-FOR-P2                79740000
743400     END-COMPUTE                                                  79750000
743500     MOVE TEMP-TOTAL       TO CTL-REC-TOT-ACAT                    79760000
743600                                                                  79770000
743700     COMPUTE TEMP-TOTAL =                                         79780000
743800                          TOT-PEND-SELECTED-FOR-P2                79790000
743900     END-COMPUTE                                                  79800000
744000     MOVE TEMP-TOTAL       TO CTL-REC-TOT-PEND                    79810000
744100                                                                  79820000
744200     COMPUTE TEMP-TOTAL =                                         79830000
744300                          TOT-SELECTED-FOR-P2                     79840000
744400     END-COMPUTE                                                  79850000
744500     MOVE TEMP-TOTAL       TO CTL-REC-TOT-TOT                     79860000
744600                                                                  79870000
744700     MOVE CLIENT-REC-TOTAL-LINE TO PW-LINE                        79880000
744800     PERFORM O-PRINT-LINE                                         79890000
744900                                                                  79900000
745000     MOVE NUM-OF-CLIENTS   TO TOT-CLIENTS                         79910000
745100     MOVE FDL-TOT-ACTS     TO TOT-ACTS                            79920000
745200     MOVE FDL-TOT-ASSETS   TO TOT-ASSETS                          79930000
745300     MOVE '-' TO PW-CTL                                           79940000
745400     MOVE FINAL-TOTAL-LINE TO PW-LINE                             79950000
745500     PERFORM O-P-WRITE-LINE.                                      79960000
745600                                                                  79970000
745700     IF  TOT-DB-VALUE  NOT =  TOT-CR-VALUE                        79980000
745800         DISPLAY  'TOTAL FILE DR/CR AMOUNTS DO NOT AGREE'         79990000
745900*        CALL  ABEND                USING ABEND-CODE-2000         80000000
746000     END-IF.                                                      80010000
746100                                                                  80020000
746200     IF  TOT-DB-QTY    NOT =  TOT-CR-QTY                          80030000
746300         DISPLAY  'TOTAL FILE DR/CR QUANTITIES DO NOT AGREE'      80040000
746400*        CALL  ABEND                USING ABEND-CODE-2000         80050000
746500     END-IF.                                                      80060000
746600/                                                                 80070000
746700 E-DISPLAY-COUNTERS.                                              80080000
746800                                                                  80090000
746900     EVALUATE CNTR-TYPE (CNTR-X)                                  80100000
747000         WHEN 'N'                                                 80110000
747100             MOVE CNTR-RECS (CNTR-X) TO CNTR-MASK-RECS            80120000
747200         WHEN 'M'                                                 80130000
747300             MOVE CNTR-RECS-MONEY (CNTR-X) TO CNTR-MASK-MONEY     80140000
747400         WHEN 'S'                                                 80150000
747500             MOVE CNTR-RECS-SHARE (CNTR-X) TO CNTR-MASK-SHARE     80160000
747600         WHEN OTHER                                               80170000
747700             MOVE SPACES TO CNTR-MASK                             80180000
747800     END-EVALUATE                                                 80190000
747900                                                                  80200000
748000     DISPLAY CNTR-DESC (CNTR-X) CNTR-MASK.                        80210000
748100/                                                                 80220000
748200**********************                                            80230000
748300 E-WRITE-OUTPUT-TRLS.                                             80240000
748400**********************                                            80250000
748500                                                                  80260000
748600** ALWAYS WRITE OUT P2BKPG TRAILER RECORD **                      80270000
748700                                                                  80280000
748800     MOVE  SPACES                     TO  P2BKPG-RECORD.          80290000
748900     MOVE  'REC-CNT='                 TO  P2BKPG-RECORD (1:8).    80300000
749000     MOVE  TOT-P2-RECS-WRITTEN        TO  P2BKPG-RECS.            80310000
749100     MOVE  P2BKPG-RECS                TO  P2BKPG-RECORD (9:11).   80320000
749200     WRITE  P2BKPG-RECORD.                                        80330000
749300     IF  NOT  P2BKPG-FILE-OK                                      80340000
749400         DISPLAY  'P2BKPG FILE WRITE TRAILER ERROR, STATUS = '    80350000
749500                   P2BKPG-FILE-STATUS                             80360000
749600         CALL  ABEND                USING ABEND-CODE-4000         80370000
749700     END-IF.                                                      80380000
749800                                                                  80390000
749900/                                                                 80400000
750000****************                                                  80410000
750100 E-CLOSE-FILES.                                                   80420000
750200****************                                                  80430000
750300                                                                  80440000
750400                                                                  80450000
750500** CLOSE OUT THE XBILL FILE **                                    80460000
750600                                                                  80470000
750700     IF PARM-BOOK-RUN                                             80480000
750800        MOVE  'END'                      TO  XBILL-END            80490000
750900        CALL   ZXBILL                  USING XBILL-LIST           80500000
751000        IF  XBILL-RC  NOT =  ' '                                  80510000
751100          DISPLAY 'ZXBILL CLOSE ROUTINE FAILED, RC = ' XBILL-RC   80520000
751200     END-IF.                                                      80530000
751300                                                                  80540000
751400** CLOSE ALL INPUT AND OUTPUT FILES **                            80550000
751500                                                                  80560000
751600     CLOSE  NTWREG-FILE.                                          80570000
751700     CLOSE  PEND-FILE.                                            80580000
751800     IF  NOT  PEND-FILE-OK                                        80590000
751900         DISPLAY  'OLDPEND FILE CLOSE ERROR, STATUS = '           80600000
752000                   PEND-FILE-STATUS                               80610000
752100     END-IF.                                                      80620000
752200                                                                  80630000
752300     CLOSE  MEMO-FILE.                                            80640000
752400     IF  NOT  MEMO-FILE-OK                                        80650000
752500         DISPLAY  'MEMO FILE CLOSE ERROR, STATUS = '              80660000
752600                   MEMO-FILE-STATUS                               80670000
752700     END-IF.                                                      80680000
752800                                                                  80690000
752900     CLOSE  PRNG-FILE.                                            80700000
753000     IF  NOT  PRNG-FILE-OK                                        80710000
753100         DISPLAY  'PRNG FILE CLOSE ERROR, STATUS = '              80720000
753200                   PRNG-FILE-STATUS                               80730000
753300     END-IF.                                                      80740000
753400                                                                  80750000
753500     CLOSE  BROKER-FILE.                                          80760000
753600     IF  NOT  PRNG-FILE-OK                                        80770000
753700         DISPLAY  'BROKER FILE CLOSE ERROR, STATUS = '            80780000
753800                   BROKER-FILE-STATUS                             80790000
753900     END-IF.                                                      80800000
754000     CLOSE  ACATS-PARTICIPANT-FILE.                               80810000
LRM012     CLOSE  POST-SETTLE-FILE.                                     80820000
754100                                                                  80830000
754200     CLOSE  P2BKPG-FILE.                                          80840000
754300     IF  NOT  P2BKPG-FILE-OK                                      80850000
754400         DISPLAY  'P2BKPG FILE CLOSE ERROR, STATUS = '            80860000
754500                   P2BKPG-FILE-STATUS                             80870000
754600     END-IF.                                                      80880000
754700                                                                  80890000
754800     CLOSE  T3RDFL-FILE.                                          80900000
754900     IF  NOT  T3RDFL-FILE-OK                                      80910000
755000         DISPLAY  'T3RDFL FILE CLOSE ERROR, STATUS = '            80920000
755100                   T3RDFL-FILE-STATUS                             80930000
755200     END-IF.                                                      80940000
755300                                                                  80950000
755400     CLOSE  CAG2FL-FILE.                                          80960000
755500     IF  NOT  CAG2FL-FILE-OK                                      80970000
755600         DISPLAY  'CAG2FL FILE CLOSE ERROR, STATUS = '            80980000
755700                   CAG2FL-FILE-STATUS                             80990000
755800     END-IF.                                                      81000000
755900                                                                  81010000
756000     CLOSE CAGE-CAT13-FILE.                                       81020000
756100                                                                  81030000
756200     CLOSE  XSTLPI-FILE.                                          81040000
756300     IF  NOT  XSTLPI-FILE-OK                                      81050000
756400         DISPLAY  'XSTLPI FILE CLOSE ERROR, STATUS = '            81060000
756500                   XSTLPI-FILE-STATUS                             81070000
756600     END-IF.                                                      81080000
756700                                                                  81090000
756800     IF  PEND-FILE-OK AND                                         81100000
756900         MEMO-FILE-OK     AND                                     81110000
757000         PRNG-FILE-OK     AND                                     81120000
757100         P2BKPG-FILE-OK   AND                                     81130000
757200         T3RDFL-FILE-OK   AND                                     81140000
757300         CAG2FL-FILE-OK   AND                                     81150000
757400         XSTLPI-FILE-OK   CONTINUE                                81160000
757500     ELSE                                                         81170000
757600         CALL ABEND                 USING ABEND-CODE-4000         81180000
757700     END-IF.                                                      81190000
LRM009     CLOSE FUNDSERV-EXTR-FILE.                                    81200000
LRM014     CLOSE ROLLOVER-866-EXTR.                                     81210000
LRM022     CLOSE TYPE2-CASH-EXTR.                                       81220000
