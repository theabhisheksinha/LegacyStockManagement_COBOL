000001* PDX    - CAT650CN C0354810 05/22/14 14:05:59 TBLAMUR            00001013
LRM052* SSR 91504 DTCC CNS SETTLEMENT, ONE-TIME RUN 5/30 TO BYPASS      00001105
LRM052*  USING THE NEW CNS OFFSET ACCOUNTS WHEN THE TRANSFER WAS IN STP 00001200
LRM052*  ON 5/28.  THESE WERE CAPTURED ON A FILE AND LOADED INTO A TBL. 00001300
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
000700 PROGRAM-ID. CAT650CN.                                            00015400
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
003000* THAT ARE REJECTED ON OR AFTER SETTLEMENT DATE.  FAILS WILL BE   00017700
003100* PASSED TO THE CAGE AGAIN ONLY WHEN CLIENTS ACTIVATE B1 434617   00017800
003200* WITH A VALUE OF 1.  THE CLIENTS SHOULD SET B1 434610 TO A VALUE 00017900
003300* OF 0 ON THE SAME DAY SO THAT POST SETTLEMENT DATE BOOKKEEPING   00018000
003400* IS AGAIN ACTIVATED.                                             00018100
003500*                                                                 00018200
003600*---------------------------------------------------------------  00018300
003700* 06/22/99 - PDX#0129778   (TCK002)                               00018400
003800* ADD LOGIC TO HANDLE FUND/SERVS SURPAS(B1 537435) POST THE VALUE 00019000
003900* DATE ON THE BOOKKEEPING ENTRY (STTLMT DT). ADD A TRAILER RECORD 00020000
004000* TO INCLUDE THE CUSTOMER ACCOUNT NUMBER IN THE DISCRIPTION.      00030000
004100* (ON OR BEFORE SETTLEMENT DATE)                                  00040000
004200*---------------------------------------------------------------  00050000
004300* 07/16/99 - PDX#0129778   (TCK003)                               00060000
004400*            ALPHA-BRANCH                                         00070000
004500*---------------------------------------------------------------  00080000
004600* 08/04/99 - PDX#0129778, ACAT RESOLUTION LOG #470 (TCK004)       00090000
004700*   PENDING SETTLEMENT ACCOUNT B1- 434637 (RCV), 434638(DEL)      00100000
004800*---------------------------------------------------------------  00110000
004900* 08/27/99 - PDX#0130138,  ACAT RESOLUTION LOG  #471 (TCK005)     00120000
005000*   CORRECT THE ENTRY CODE LOGIC FOR DIRECT ROLLOVERS,            00130000
005100*   READ THE IRA B1(001202) IF THE VALUE IS '1', PROCESS AS IT    00140000
005200*   IS, IF THE VALUE IS '0', THEN SUPPRESS THE BOOKKEEPING        00150000
005300*   ENTRIES THAT CREATE THE MARKET VALUE ENTRIES WITH THE '866'   00160000
005301*   SECURITY NUMBERS.                                             00170000
005302*---------------------------------------------------------------  00180000
LRM001* CHANGE TO USE O-NSCC OFFSET ACCOUNT REGUARDLESS OF NETWORK LVL. 00190000
LRM001*---------------------------------------------------------------  00200000
005303/                                                                 00210000
005304***************************************************************** 00220000
005305 ENVIRONMENT DIVISION.                                            00230000
005306***************************************************************** 00240000
005307 INPUT-OUTPUT SECTION.                                            00250000
005308                                                                  00260000
005309 FILE-CONTROL.                                                    00270000
005310***********************  INPUT FILES  *************************** 00280000
005320                                                                  00290000
005330     SELECT  PEND-FILE           ASSIGN  TO  UT-S-IPEND           00300000
005340                            FILE STATUS  IS  PEND-FILE-STATUS.    00310000
005350                                                                  00320000
005360     SELECT  MFPEND-FILE         ASSIGN  TO  UT-S-IMFPEND.        00330000
005370                                                                  00340000
005380     SELECT NTWREG-FILE       ASSIGN  TO  NTWREGOP                00350000
005390        ORGANIZATION  IS  INDEXED                                 00360000
005400        ACCESS        IS  DYNAMIC                                 00370000
005500        RECORD KEY    IS  NTWREG-KEY-IN                           00380000
005600        FILE STATUS   IS  NTWREG-FILE-STATUS.                     00390000
005700                                                                  00400000
005800     SELECT  MEMO-FILE           ASSIGN  TO  FIDMSS               00410000
005900                           ORGANIZATION  IS  INDEXED              00420000
006000                                 ACCESS  IS  DYNAMIC              00430000
006100                             RECORD KEY  IS  MEMO-KEY             00440000
006200                            FILE STATUS  IS  MEMO-FILE-STATUS.    00450000
006300                                                                  00460000
006400     SELECT  PRNG-FILE           ASSIGN  TO  PRNGFL               00470000
006500                           ORGANIZATION  IS  INDEXED              00480000
006600                                 ACCESS  IS  DYNAMIC              00490000
006700                             RECORD KEY  IS  PRNGKEY              00500000
006800                            FILE STATUS  IS  PRNG-FILE-STATUS.    00510000
006900                                                                  00520000
007000     SELECT  BROKER-FILE         ASSIGN  TO  BRKRFL               00530000
007100                           ORGANIZATION  IS  INDEXED              00540000
007200                                 ACCESS  IS  DYNAMIC              00550000
007300                             RECORD KEY  IS  BROKER-KEY           00560000
007400                            FILE STATUS  IS  BROKER-FILE-STATUS.  00570000
007500                                                                  00580000
007600     SELECT ACATS-PARTICIPANT-FILE ASSIGN TO UT-S-ACATBRKR.       00590000
                                                                        00590100
LRM052     SELECT ACATS-STP-FILE         ASSIGN TO UT-S-ACATSTP.        00591000
LRM012                                                                  00600000
LRM012     SELECT POST-SETTLE-FILE ASSIGN       TO UT-S-PSSETTLE.       00610000
007700/                                                                 00620000
007800***********************  OUTPUT FILES  ************************** 00630000
007900                                                                  00640000
008000     SELECT  P2BKPG-FILE         ASSIGN  TO  UT-S-P2BKPG          00650000
008100                            FILE STATUS  IS  P2BKPG-FILE-STATUS.  00660000
008200                                                                  00670000
008300     SELECT  T3RDFL-FILE         ASSIGN  TO  UT-S-T3RDFL          00680000
008400                            FILE STATUS  IS  T3RDFL-FILE-STATUS.  00690000
008500                                                                  00700000
008600     SELECT  CAG2FL-FILE         ASSIGN  TO  UT-S-CAG2FL          00710000
008700                            FILE STATUS  IS  CAG2FL-FILE-STATUS.  00720000
008800                                                                  00730000
008900     SELECT  CAGE-CAT13-FILE     ASSIGN  TO  UT-S-CAGE13.         00740000
009000                                                                  00750000
009100     SELECT  XSTLPI-FILE         ASSIGN  TO  UT-S-XSTLPI          00760000
009200                            FILE STATUS  IS  XSTLPI-FILE-STATUS.  00770000
LRM009                                                                  00780000
LRM009     SELECT  FUNDSERV-EXTR-FILE  ASSIGN  TO  UT-S-OFUND.          00790000
009300                                                                  00800000
LRM014     SELECT  ROLLOVER-866-EXTR   ASSIGN  TO  UT-S-ROLL866.        00810000
009350                                                                  00820000
LRM022     SELECT  TYPE2-CASH-EXTR     ASSIGN  TO  UT-S-TYP2CSH.        00830000
009400/                                                                 00840000
009500***************************************************************** 00850000
009600 DATA DIVISION.                                                   00860000
009700***************************************************************** 00870000
009800 FILE SECTION.                                                    00880000
009900                                                                  00890000
010000 FD  PEND-FILE                                                    00900000
010100     RECORDING MODE V                                             00910000
010200     BLOCK CONTAINS 0 RECORDS.                                    00920000
010300                                                                  00930000
010400     COPY ACATPEND  REPLACING ==:FMT:== BY ==PEND==.              00940000
010500                                                                  00950000
010600 FD  MFPEND-FILE                                                  00960000
010700     RECORDING MODE V                                             00970000
010800     BLOCK CONTAINS 0 RECORDS.                                    00980000
010900                                                                  00990000
011000     COPY ACATPEND  REPLACING ==:FMT:== BY ==MPND==.              01000000
011100                                                                  01010000
011200                                                                  01020000
011300 FD  MEMO-FILE                                                    01030000
011400     RECORD CONTAINS 250 CHARACTERS.                              01040000
011500                                                                  01050000
011600 01  MEMO-RECORD.                                                 01060000
011700     05  MEMO-KEY.                                                01070000
011800         10  MEMO-CLIENT         PIC X(03).                       01080000
011900         10  MEMO-CODE           PIC X(02).                       01090000
012000     05  FILLER                  PIC X(245).                      01100000
012100                                                                  01110000
012200 FD  NTWREG-FILE.                                                 01120000
012300 01  NTWREG-RECORD.                                               01130000
012400     05  NTWREG-KEY-IN                PIC  X(18).                 01140000
012500     05  FILLER                       PIC  X(262).                01150000
012600                                                                  01160000
012700                                                                  01170000
012800 FD  PRNG-FILE                                                    01180000
012900     RECORD CONTAINS 80 CHARACTERS.                               01190000
013000                                                                  01200000
013100     COPY PRNGRECC.                                               01210000
013200                                                                  01220000
013300 FD  BROKER-FILE.                                                 01230000
013400                                                                  01240000
013500 01  BROKER-REC.                                                  01250000
013600     05  BROKER-KEY.                                              01260000
013700         10  BROKER-EXCHANGE      PIC X.                          01270000
013800         10  BROKER-BADGE         PIC X(4).                       01280000
013900         10  FILLER               PIC X(6).                       01290000
014000     05  FILLER                   PIC X(12).                      01300000
014100     05  BROKER-NAME              PIC X(33).                      01310000
014200     05  FILLER                   PIC X(24).                      01320000
014300                                                                  01330000
014400 FD  ACATS-PARTICIPANT-FILE                                       01340000
014500     RECORDING MODE F                                             01350000
014600     BLOCK CONTAINS 0 RECORDS                                     01360000
014610     LABEL RECORDS ARE STANDARD                                   01370000
014620     RECORD CONTAINS 150 CHARACTERS.                              01380000
014630                                                                  01390000
014640 01  BANK-RECORD                 PIC X(150).                      01400000
014650                                                                  01410000
LRM052 FD  ACATS-STP-FILE                                               01411000
LRM052     RECORDING MODE IS V                                          01412000
LRM052     BLOCK CONTAINS 0 RECORDS.                                    01413000
LRM052                                                                  01414000
LRM052     COPY ACATPEND  REPLACING ==:FMT:== BY ==STP==.               01415000
LRM012 FD  POST-SETTLE-FILE                                             01420000
LRM012     RECORDING MODE IS V                                          01430000
LRM012     BLOCK CONTAINS 0 RECORDS.                                    01440000
LRM012                                                                  01450000
010400     COPY ACATPEND  REPLACING ==:FMT:== BY ==POST==.              01460000
LRM012                                                                  01470000
014660 FD  P2BKPG-FILE                                                  01480000
014670     RECORDING MODE F                                             01490000
014680     BLOCK CONTAINS 0 RECORDS                                     01500000
014690     LABEL RECORDS ARE STANDARD                                   01510000
014700     RECORD CONTAINS 120 CHARACTERS.                              01520000
014800                                                                  01530000
014900 01  P2BKPG-RECORD               PIC X(120).                      01540000
015000                                                                  01550000
015100                                                                  01560000
015200 FD  T3RDFL-FILE                                                  01570000
015300     RECORDING MODE F                                             01580000
015400     BLOCK CONTAINS 0 RECORDS                                     01590000
015500     LABEL RECORDS ARE STANDARD                                   01600000
015600     RECORD CONTAINS 200 CHARACTERS.                              01610000
015700                                                                  01620000
015800 01  T3RDFL-RECORD               PIC X(200).                      01630000
015900                                                                  01640000
016000                                                                  01650000
016100 FD  CAG2FL-FILE                                                  01660000
016200     RECORDING MODE F                                             01670000
016300     BLOCK CONTAINS 0 RECORDS                                     01680000
016400     LABEL RECORDS ARE STANDARD                                   01690000
016500     RECORD CONTAINS 30 CHARACTERS.                               01700000
016600                                                                  01710000
016700 01  CAG2FL-RECORD               PIC X(30).                       01720000
016800                                                                  01730000
016900                                                                  01740000
017000 FD  CAGE-CAT13-FILE                                              01750000
017100     RECORDING MODE F                                             01760000
017200     BLOCK CONTAINS 0 RECORDS                                     01770000
017300     LABEL RECORDS ARE STANDARD                                   01780000
017400     RECORD CONTAINS 60 CHARACTERS.                               01790000
017500                                                                  01800000
017600*** NEW COPYBOOK FOR CAT13 CURRENT DAY CAGE FILE.                 01810000
017700     COPY ACATCG02 REPLACING ==:CAGE-02:== BY ==CAT13==.          01820000
017800                                                                  01830000
017900                                                                  01840000
018000 FD  XSTLPI-FILE                                                  01850000
018100     RECORDING MODE F                                             01860000
018200     BLOCK CONTAINS 0 RECORDS                                     01870000
018300     LABEL RECORDS ARE STANDARD                                   01880000
018400     RECORD CONTAINS 143 CHARACTERS.                              01890000
018500                                                                  01900000
018600 01  XSTLPI-RECORD               PIC X(143).                      01910000
018700                                                                  01920000
LRM009 FD  FUNDSERV-EXTR-FILE                                           01930000
LRM009     RECORDING MODE V                                             01940000
LRM009     BLOCK CONTAINS 0 RECORDS.                                    01950000
LRM009                                                                  01960000
LRM009     COPY ACATPEND  REPLACING ==:FMT:== BY ==OFUND==.             01970000
LRM009                                                                  01980000
LRM014 FD  ROLLOVER-866-EXTR                                            01990000
LRM014     RECORDING MODE F                                             02000000
LRM014     BLOCK CONTAINS 0 RECORDS                                     02010000
LRM014     LABEL RECORDS ARE STANDARD                                   02020000
LRM014     RECORD CONTAINS 80 CHARACTERS.                               02030000
LRM014                                                                  02040000
LRM014 01  ROLL866-RECORD              PIC X(80).                       02050000
018800                                                                  02060000
LRM022 FD  TYPE2-CASH-EXTR                                              02070000
LRM022     RECORDING MODE F                                             02080000
LRM022     BLOCK CONTAINS 0 RECORDS                                     02090000
LRM022     LABEL RECORDS ARE STANDARD                                   02100000
LRM023     RECORD CONTAINS 250 CHARACTERS.                              02110000
LRM022                                                                  02120000
LRM022 01  TYPE2-CASH-RECORD           PIC X(250).                      02130000
018800                                                                  02140000
018900***************************************************************** 02150000
019000 WORKING-STORAGE  SECTION.                                        02160000
019100***************************************************************** 02170000
019200 77  PGM-NAME                         PIC X(06)  VALUE 'CAT650'.  02180000
019300 77  NTWREG-FILE-STATUS               PIC  X(02)  VALUE '00'.     02190000
019400 77  MF-PROCESS-OPTION                PIC  X      VALUE ' '.      02200000
LRM003     88 DST-MFE-PROCESS        VALUE 'D'.                         02210000
019500     88 OMNIBUS-PROCESS        VALUE 'O'.                         02220000
LRM029     88 PNC-OMNIBUS-PROCESS    VALUE 'P'.                         02230000
019510 77  MF-TABLE-MAINTENANCE             PIC  X      VALUE ' '.      02240000
019520     88 MF-NSCC-SOURCE         VALUE 'Y'.                         02250000
LRM050     88 MF-DST-SCHWABB         VALUE 'S'.                         02260000
019600                                                                  02270000
019700***                                                               02280000
019800 77  WS-STLDT-MINUS-2                 PIC X(08)  VALUE ' '.       02290000
019900***                                                               02300000
020000                                                                  02310000
020100 77  ACAT-PROC-DATE                   PIC X(08)  VALUE ' '.       02320000
020200                                                                  02330000
020300 77  WS-TRADE-PLUS-1                  PIC X(08)  VALUE ' '.       02340000
020400                                                                  02350000
020500 77  WS-TRADE-PLUS-2                  PIC X(08)  VALUE ' '.       02360000
020600                                                                  02370000
020700 77  WS-DATE                          PIC 9(08)  VALUE 0.         02380000
020800                                                                  02390000
020900 77  ABEND-CODE-2000      COMP        PIC S9(4)  VALUE +2000.     02400000
021000                                                                  02410000
021100 77  ABEND-CODE-3000      COMP        PIC S9(4)  VALUE +3000.     02420000
021200                                                                  02430000
021300 77  ABEND-CODE-4000      COMP        PIC S9(4)  VALUE +4000.     02440000
021400                                                                  02450000
021500 77  ACAT-RECS-CLIENT      COMP       PIC S9(9)  VALUE +0.        02460000
021600 77  ACAT-RECS-TOTAL       COMP       PIC S9(9)  VALUE +0.        02470000
021700                                                                  02480000
021800 77  ACAT-FILE-LAST-RUN               PIC X(01)  VALUE '0'.       02490000
021900     88  NO-ACAT-FILE-LAST-RUN                   VALUE '1'.       02500000
022000                                                                  02510000
022100 77  PEND-FILE-STATUS                 PIC X(02).                  02520000
022200     88  PEND-FILE-OK                            VALUE '00'.      02530000
022300     88  PEND-OPEN-OK                            VALUE '00' '97'. 02540000
022400     88  PEND-ENDFILE                            VALUE '10'.      02550000
022500                                                                  02560000
022600                                                                  02570000
022700 77  MEMO-FILE-STATUS                 PIC X(02).                  02580000
022800     88  MEMO-FILE-OK                            VALUE '00'.      02590000
022900     88  MEMO-OPEN-OK                            VALUE '00' '97'. 02600000
023000     88  MEMO-ENDFILE                            VALUE '10'.      02610000
023100     88  MEMO-NOTFOUND                           VALUE '23'.      02620000
023200 77  MEMO-SUB              COMP       PIC S9(4)  VALUE +0.        02630000
023300                                                                  02640000
023400 77  PRNG-FILE-STATUS                 PIC X(02).                  02650000
023500     88  PRNG-FILE-OK                            VALUE '00'.      02660000
023600     88  PRNG-OPEN-OK                            VALUE '00' '97'. 02670000
023700     88  PRNG-ENDFILE                            VALUE '10'.      02680000
023800     88  PRNG-NOTFOUND                           VALUE '23'.      02690000
023900 77  PRNG-FILE-SWITCH                 PIC X(01)  VALUE 'N'.       02700000
024000                                                                  02710000
024100 77  BROKER-FILE-STATUS               PIC X(02).                  02720000
024200     88  BROKER-FILE-OK                          VALUE '00'.      02730000
024300     88  BROKER-OPEN-OK                          VALUE '00' '97'. 02740000
024400     88  BROKER-ENDFILE                          VALUE '10'.      02750000
024500     88  BROKER-NOTFOUND                         VALUE '23'.      02760000
024600 77  BROKER-FILE-SWITCH               PIC X(01)  VALUE 'N'.       02770000
024700                                                                  02780000
024800 77  CATPPL-BROKER-EOF-SW             PIC X(01)  VALUE 'N'.       02790000
024900     88  CATPPL-BROKER-EOF                       VALUE 'Y'.       02791000
025000                                                                  02792000
LRM052 77  STP-EOF-SW                       PIC X(01)  VALUE 'N'.       02792102
LRM052     88  STP-EOF                                 VALUE 'Y'.       02792202
LRM052 77  STP-FOUND-SW                     PIC X(01)  VALUE 'N'.       02792304
LRM052     88  STP-FOUND                               VALUE 'Y'.       02792404
LRM052     88  STP-NOTFND                              VALUE 'N'.       02792504
025000                                                                  02792604
LRM012 77  POST-SETTLE-EOF-SW               PIC X(01)  VALUE 'N'.       02793000
LRM012     88  POST-SETTLE-EOF                         VALUE 'Y'.       02794000
LRM012                                                                  02795000
LRM013 77  WS-ENTRY-DEL-ROLL                PIC X(3) VALUE SPACES.      02796000
LRM013 77  WS-ENTRY-REC-ROLL                PIC X(3) VALUE SPACES.      02797000
025100 77  WS-NEW-TI-SW                     PIC X(1) VALUE SPACE.       02798000
025200     88  NEW-TI                                VALUE 'Y'.         02799000
025300     88  NOT-NEW-TI                            VALUE 'N'.         02800000
025400 77  WS-NEW-AT-SW                     PIC X(1) VALUE SPACE.       02810000
025500     88  NEW-AT                                VALUE 'Y'.         02820000
025600     88  NOT-NEW-AT                            VALUE 'N'.         02830000
025700*****                                                             02840000
025800 77  WS-BK-FAIL-SW                    PIC X(1) VALUE SPACE.       02850000
025900     88  BK-FAIL-CR         VALUE 'C'.                            02860000
026000     88  BK-FAIL-DB         VALUE 'D'.                            02870000
026100*****                                                             02880000
026200 77  P2BKPG-FILE-STATUS               PIC X(02).                  02890000
026300     88  P2BKPG-FILE-OK                          VALUE '00'.      02900000
026400     88  P2BKPG-OPEN-OK                          VALUE '00' '97'. 02910000
026500 77  P2BKPG-RECS                      PIC 9(11)  VALUE 0.         02920000
026600                                                                  02930000
026700 77  T3RDFL-FILE-STATUS               PIC X(02).                  02940000
026800     88  T3RDFL-FILE-OK                          VALUE '00'.      02950000
026900     88  T3RDFL-OPEN-OK                          VALUE '00' '97'. 02960000
027000 77  T3RDFL-RECS           COMP       PIC S9(9)  VALUE +0.        02970000
027100                                                                  02980000
027200 77  CAG2FL-FILE-STATUS               PIC X(02).                  02990000
027300     88  CAG2FL-FILE-OK                          VALUE '00'.      03000000
027400     88  CAG2FL-OPEN-OK                          VALUE '00' '97'. 03010000
027500 77  CAG2FL-RECS           COMP       PIC S9(9)  VALUE +0.        03020000
027600                                                                  03030000
027700 77  XSTLPI-FILE-STATUS               PIC X(02).                  03040000
027800     88  XSTLPI-FILE-OK                          VALUE '00'.      03050000
027900     88  XSTLPI-OPEN-OK                          VALUE '00' '97'. 03060000
028000 77  XSTLPI-RECS           COMP       PIC S9(9)  VALUE +0.        03070000
028100                                                                  03080000
028200 77  XBILL-SEC-ACAT-ACCTS             PIC 9(07)  VALUE  8093036.  03090000
028300                                                                  03100000
028400 77  XBILL-SEC-ACAT-ASSETS            PIC 9(07)  VALUE  8093037.  03110000
028500                                                                  03120000
028600 77  XBILL-SEC-FUND-SERV-RECV         PIC 9(07)  VALUE  8093043.  03130000
028700                                                                  03140000
028800 77  XBILL-SEC-FUND-SERV-DELV         PIC 9(07)  VALUE  8093039.  03150000
028900                                                                  03160000
029000 77  ROLL-SEC-NO                      PIC X(07)  VALUE '86678  '. 03170000
029100                                                                  03180000
029200 77  ACAT-CL-IS-ADP-CL-SWITCH         PIC X.                      03190000
029300     88  ACAT-CL-IS-ADP-CL                       VALUE 'Y'.       03200000
029400     88  ACAT-CL-IS-NOT-ADP-CL                   VALUE 'N'.       03210000
029500                                                                  03220000
029600 77  WS-ROLL-OFFSET-ACC       PIC X(10) VALUE '0000001909'.       03230000
029700                                                                  03240000
029800 77  WS-CBOE-OFFSET-ACCOUNT   PIC X(15) VALUE '(098-20080-1-3)'.  03250000
029900                                                                  03260000
030000 77  WS-AMEX-NYSE-OFFSET-ACCOUNT                                  03270000
030100                              PIC X(15) VALUE '(098-20090-1-1)'.  03280000
030200                                                                  03290000
030300 77  WS-PBW-OFFSET-ACCOUNT    PIC X(15) VALUE '(098-20015-1-3)'.  03300000
030400                                                                  03310000
030500 77  WS-PSE-OFFSET-ACCOUNT    PIC X(15) VALUE '(098-20016-1-2)'.  03320000
030600                                                                  03330000
030700 77  WS-DFLT-OFFSET-ACCOUNT   PIC X(15) VALUE '(098-20060-1-9)'.  03340000
030800                                                                  03350000
030900 77  END-OF-PEND-FILE-SWITCH          PIC X(01)  VALUE 'N'.       03360000
031000     88  END-OF-PEND-FILE                        VALUE 'Y'.       03370000
031100                                                                  03380000
031200 77  END-OF-MPND-FILE-SWITCH          PIC X(01)  VALUE 'N'.       03390000
031300     88  END-OF-MPND-FILE                        VALUE 'Y'.       03400000
031400                                                                  03410000
031500 77  CONTROL-REC-SWITCH               PIC X(01)  VALUE ' '.       03420000
031600     88  SET-IS-CONTROL-REC                      VALUE 'Y'.       03430000
031700                                                                  03440000
031800 77  ACAT-1ST-RECORD-SWITCH           PIC X(01)  VALUE ' '.       03450000
031900     88  ACAT-1ST-RECORD-FOUND                   VALUE 'Y'.       03460000
032000     88  ACAT-1ST-RECORD-NOT-FOUND               VALUE 'N'.       03470000
032100                                                                  03480000
032200 77  ACAT-2ND-RECORD-SWITCH           PIC X(01)  VALUE ' '.       03490000
032300     88  ACAT-2ND-RECORD-FOUND                   VALUE 'Y'.       03500000
032400     88  ACAT-2ND-RECORD-NOT-FOUND               VALUE 'N'.       03510000
032500                                                                  03520000
032600 77  ACAT-3RD-RECORD-SWITCH           PIC X(01)  VALUE ' '.       03530000
032700     88  ACAT-3RD-RECORD-FOUND                   VALUE 'Y'.       03540000
032800     88  ACAT-3RD-RECORD-NOT-FOUND               VALUE 'N'.       03550000
032900                                                                  03560000
033000 77  FMT-REC-IS-VALID-SWITCH          PIC X(01)  VALUE ' '.       03570000
033100     88  FMT-REC-IS-VALID                        VALUE 'Y'.       03580000
033200                                                                  03590000
033300 77  THIS-RECORD-PRINTED-SWITCH       PIC X(01)  VALUE 'N'.       03600000
033400     88  THIS-RECORD-WAS-PRINTED                 VALUE 'Y'.       03610000
033500     88  THIS-RECORD-WAS-NOT-PRINTED             VALUE 'N'.       03620000
033600                                                                  03630000
033700 77  RECORD-FROM-SWITCH               PIC X(01)  VALUE ' '.       03640000
033800     88  RECORD-IS-FROM-ACAT-FILE                VALUE 'A'.       03650000
033900     88  RECORD-IS-FROM-PEND-FILE                VALUE 'P'.       03660000
034000     88  RECORD-IS-FROM-MPND-FILE                VALUE 'M'.       03670000
034100                                                                  03680000
LRM015 77  MEMO-TRID-USED-SWITCH            PIC X(01)  VALUE 'N'.       03690000
LRM015     88  MEMO-TRID                               VALUE 'Y'.       03700000
LRM015     88  MEMO-TRID-NOT-USED                      VALUE 'N'.       03710000
LRM043 77  SFK-TRID-SW                      PIC X(01)  VALUE 'N'.       03720000
LRM043     88  SFK-TRID                                VALUE 'Y'.       03730000
LRM043 77  SFK-SAVE-TRID                    PIC X(3).                   03740000
LRM043 77  SFK-SAVE-BATCH                   PIC X(3).                   03750000
034200 77  WS-SAVE-SEC                      PIC X(7).                   03760000
034300 77  WS-QTY                   PIC S9(12)V9(5) COMP-3 VALUE 0.     03770000
034400                                                                  03780000
034500 77  TEMP-TOTAL       COMP-3          PIC S9(15) VALUE +0.        03790000
034600                                                                  03800000
034700 77  AMOUNT-OVERFLOW        PIC 9(16)V99 VALUE ZERO.              03810000
034800 77  TST-P2-BK-QTY          PIC 9(18)   VALUE ZERO.               03820000
034900 77  AMOUNT-FULL           PIC 9(16)V99 VALUE 9999999999999999.99.03830000
035000 77  OVERFLOW-SW                      PIC X(01)  VALUE ZERO.      03840000
035100     88  NO-MORE-OVERFLOW                        VALUE ZERO.      03850000
035200 77  FDL-TOT-CLIENTS        PIC 9999    VALUE ZERO.               03860000
035300 77  FDL-TOT-ACTS           PIC S9(15)  VALUE ZERO.               03870000
035400 77  FDL-TOT-ASSETS         PIC S9(15)  VALUE ZERO.               03880000
035500 77  FL-PHY-REC-WRITTEN     PIC S9(15)  COMP-3 VALUE ZERO.        03890000
035600 77  ERROR-MSG              PIC X(25)   VALUE SPACES.             03900000
035700 77  ERROR-VALUE            PIC X(15)   VALUE SPACES.             03910000
035800 77  LENGTH-KEY                  PIC 99   VALUE 9.                03920000
035900 77  FUND-SERV-ROLLOVER-SW       PIC X    VALUE 'N'.              03930000
036000     88  FUND-SERV-ROLLOVER               VALUE 'Y'.              03940000
036100 77  CNS-IND                     PIC X    VALUE 'N'.              03950000
036200     88  NON-CNS                          VALUE 'N'.              03960000
036300     88  CNS                              VALUE 'Y'.              03970000
036400 77  WK-DIV-CODE                 PIC XXX  VALUE ' '.              03980000
036500                                                                  03990000
036600 77  WS-PEND-TI-ADP-CL-NO-X      PIC XXX  VALUE SPACES.           04000000
036700 01  PREV-ADP-KEY.                                                04010000
036800     05  PREV-ADP-CLIENT    PIC 999     VALUE ZERO.               04020000
036900     05  PREV-ADP-BR-ACT    PIC X(8)    VALUE SPACES.             04030000
037000 01  INFSND-DATA.                                                 04040000
037010     05 FILLER PIC X(8) VALUE 'CAT650 '.                          04050000
037020     05 INFSND-MSG PIC X(45) VALUE SPACES.                        04060000
037030                                                                  04070000
037040****************************************************************  04080000
037050** THE FOLLOWING FLAGS WERE CREATED DURING RESTRUCTURING OF   **  04090000
037060** OF THIS PROGRAM.  THEY ENABLE A TEST TO BYPASS INSTRUCTIONS**  04100000
037070** INSTEAD OF USING A "GOTO" TO THE EXIT OF CERTAIN PARAGRAPHS**  04110000
037080** THE PARAGRAPH NAMES USING THESE FLAGS ARE:                 **  04120000
037090**      S-GET-ADP-BEARER-BOND                                 **  04130000
037100**      S-GET-ADP-REGISTERED-BOND                             **  04140000
037200**      S-GET-ADP-MUNI-BOND                                   **  04150000
037300**      S-GET-ADP-STOCK                                       **  04160000
037400****************************************************************  04170000
037500                                                                  04180000
037600 77  BEARER-BOND-FLAG       PIC X(01).                            04190000
037700     88  ENTER-BEARER-GET   VALUE 'E'.                            04200000
037800     88  EXIT-BEARER-GET    VALUE 'X'.                            04210000
037900 77  REGISTERED-BOND-FLAG   PIC X(01).                            04220000
038000     88  ENTER-REGISTERED-GET  VALUE 'E'.                         04230000
038100     88  EXIT-REGISTERED-GET   VALUE 'X'.                         04240000
038200 77  MUNI-BOND-FLAG         PIC X(01).                            04250000
038300     88  ENTER-MUNI-GET     VALUE 'E'.                            04260000
038400     88  EXIT-MUNI-GET      VALUE 'X'.                            04270000
038500 77  STOCK-FLAG             PIC X(01).                            04280000
038600     88  ENTER-STOCK-GET    VALUE 'E'.                            04290000
038700     88  EXIT-STOCK-GET     VALUE 'X'.                            04300000
038800 77  SEARCH-SYMBOL-FLAG      PIC X(01).                           04310000
038900     88  ENTER-SYMBOL-SEARCH VALUE 'E'.                           04320000
039000     88  EXIT-SYMBOL-SEARCH  VALUE 'X'.                           04330000
039100     COPY STUBCPY.                                                04340000
039200     03  GETXREF                  PIC X(08)  VALUE 'ZGETXREF'.    04350000
039210     03  CKDIGIT                  PIC X(08)  VALUE 'CKDIGIT'.     04360000
039220     03  ZXBILL                   PIC X(08)  VALUE 'ZXBILL'.      04370000
LRM019     03  MGR02MKV                 PIC X(08)  VALUE 'MGR02MKV'.    04380000
LRM002     03  BNWNTWIO                 PIC X(08)  VALUE 'BNWNTWIO'.    04390000
039300                                                                  04400000
039400 01  ALTERNATE-OFFSET-ACCOUNT.                                    04410000
039500     05  ALT-OFFSET-BR-ACCT-TYPE.                                 04420000
039600         10  ALT-OFFSET-BRANCH    PIC X(3).                       04430000
039700         10  ALT-OFFSET-ACCOUNT   PIC X(5).                       04440000
039800         10  ALT-OFFSET-TYPE      PIC 9.                          04450000
039900     05  ALT-OFFSET-CHECK-DIGIT   PIC X.                          04460000
040000                                                                  04470000
LRM021 01  ALT-OPTION-OFFSET-ACCOUNT.                                   04480000
LRM021     05  ALT-OPTION-OFFSET-BR-ACCT-TYPE.                          04490000
LRM021         10  ALT-OPTION-OFFSET-BRANCH PIC X(3).                   04500000
LRM021         10  ALT-OPTION-OFFSET-ACCT    PIC X(5).                  04510000
LRM021         10  ALT-OPTION-OFFSET-TYPE PIC 9.                        04520000
LRM021     05  ALT-OPTION-OFFSET-CHECK-DIGIT PIC X.                     04530000
LRM021                                                                  04540000
LRM024 01  CUST-ACCOUNT.                                                04550000
LRM024     05  CUST-BR-ACCT-TYPE.                                       04560000
LRM024         10  CUST-BRANCH          PIC X(3).                       04570000
LRM024         10  CUST-ACCT            PIC X(5).                       04580000
LRM024         10  CUST-TYPE            PIC X.                          04590000
LRM024     05  CUST-CHECK-DIGIT         PIC X.                          04600000
LRM024                                                                  04610000
040100 01  ROLLOVER-OFFSET-ACCOUNT.                                     04620000
040200     05  ROL-OFFSET-BR-ACCT-TYPE.                                 04630000
040300         10  ROL-OFFSET-BRANCH    PIC X(3).                       04640000
040400         10  ROL-OFFSET-ACCOUNT   PIC X(5).                       04650000
040500         10  ROL-OFFSET-TYPE      PIC 9.                          04660000
040600     05  ROL-OFFSET-CHECK-DIGIT   PIC X.                          04670000
040700                                                                  04680000
040800 01  CNS-BR-ACCT-T-C.                                             04690000
040900     05  CNS-BRANCH              PIC X(3)   VALUE '098'.          04700000
041000     05  CNS-ACCOUNT             PIC X(5)   VALUE '20100'.        04710000
041100     05  CNS-TYPE                PIC 9      VALUE 1.              04720000
041200     05  CNS-CHECK-DIGIT         PIC X      VALUE '9'.            04730000
LRM017 01  WM-CNS-BR-ACCT-T-C          PIC X(10) VALUE '0982100018'.    04740000
041300 01  CURRENT-ACTIVITY-CLIENT     PIC 9(3) COMP-3 VALUE ZERO.      04750000
041400***** 04/19/99 *****                                              04760000
041500**** ADD TWO NEW FAIL ACCOUNTS :                                  04770000
041600****     '00000406' =  THE FAIL TO DELIVER ACCOUNT,               04780000
041700****     '00000307' =  THE FAIL TO RECEIVE ACCOUNT.               04790000
041800****(THE FAIL TO DELIVER ACCOUNT WILL BE DEBITED FOR THE SHARES   04800000
041900**** AND MONEY; THE FAIL TO RECEIVE ACCOUNT WILL BE CREDITIED     04810000
042000**** FOR THE SHARES AND MONEY)                                    04820000
042100                                                                  04830000
042200 01  FAIL-DEL-ACCT.                                               04840000
042300     05  FAILD-BRANCH            PIC X(3)   VALUE '000'.          04850000
042400     05  FAILD-ACCOUNT           PIC X(5)   VALUE '00406'.        04860000
042500     05  FAILD-TYPE              PIC 9      VALUE 1.              04870000
042600                                                                  04880000
042700 01  FAIL-RCV-ACCT.                                               04890000
042800     05  FAILR-BRANCH            PIC X(3)   VALUE '000'.          04900000
042900     05  FAILR-ACCOUNT           PIC X(5)   VALUE '00307'.        04910000
043000     05  FAILR-TYPE              PIC 9      VALUE 1.              04920000
043100***** 04/19/99 *****                                              04930000
043200                                                                  04940000
LRM019 01  WS-BK-QUANTITY              PIC 9(12)V9999.                  04950000
043400 01  WS-BK-QUAN-SPL  REDEFINES   WS-BK-QUANTITY.                  04960000
LRM019     05  WS-BK-QUAN-WHOLE        PIC 9(12).                       04970000
043600     05  WS-BK-QUAN-FRACTION     PIC V9(4).                       04980000
043700 01  CUSIP-NUM.                                                   04990000
043800     03  CUSIP-1-9          PIC X(9).                             05000000
043900     03  CUSIP-10-11-12     PIC XXX.                              05010000
044000     03  FILLER             PIC X      VALUE SPACES.              05020000
                                                                        05030000
LRM012 01  WEALTH-MANAGEMENT-WORK-AREA.                                 05040000
LRM012     05  WM-SUB                    PIC 9(3) COMP-3 VALUE 0.       05050000
LRM012     05  WM-PENDING-ACCOUNT        PIC X(08) VALUE SPACES.        05060000
LRM012     05  WM-INTER-COMPANY-ACCOUNT  PIC X(08) VALUE SPACES.        05070000
044100                                                                  05080000
044200 77  WS-FMT-ACCOUNT              PIC X(15) VALUE ' '.             05090000
044300 77  WS-BAT                      PIC S999  VALUE +0  COMP-3.      05100000
044400 77  WS-BAT2                     PIC S999  VALUE +0  COMP-3.      05101000
044500                                                                  05102000
044600 01  TRLR-MESSAGE.                                                05103000
044700     05  TRLR-MSG                PIC X(09) VALUE ' '.             05104000
044800     05  TRLR-BRKR               PIC X(16) VALUE ' '.             05105000
DJ0001 01  TRLT-MESSAGE.                                                05106000
DJ0001     05  FILLER                  PIC X(04) VALUE 'ACAT'.          05107000
DJ0001     05  TRLT-CNTL-NBR           PIC X(14) VALUE ' '.             05108000
DJ0001     05  FILLER                  PIC X(05) VALUE ' BOS '.         05109000
DJ0001     05  TRLT-CNTRA-BKR          PIC X(04) VALUE ' '.             05109100
044900/                                                                 05109200
045000 01  FILLER                   PIC X(16) VALUE 'ACAT FORMAT AREA'. 05109300
045100***  FORMAT-IN-FILE-AREA REPLACED BY COPY:                        05109400
045200     COPY ACATPEND  REPLACING ==:FMT:== BY ==FMT==.               05109500
045300/                                                                 05109600
045400 01  WORK-P2-ACCOUNT-AREA.                                        05109700
045500     05  FILLER                  PIC X    VALUE '('.              05109800
045600     05  WORK-P2-BRANCH          PIC X(3).                        05109900
045700     05  FILLER                  PIC X    VALUE '-'.              05110000
045800     05  WORK-P2-ACCOUNT         PIC X(5).                        05120000
045900     05  FILLER                  PIC X    VALUE '-'.              05130000
046000     05  WORK-P2-TYPE            PIC 9.                           05140000
046100     05  FILLER                  PIC X    VALUE '-'.              05150000
046200     05  WORK-P2-CHECK-DIGIT     PIC 9.                           05160000
046300     05  FILLER                  PIC X    VALUE ')'.              05170000
046400/                                                                 05180000
046500 01  REQUEST-DATA.                                                05190000
046600     05  REQ-DATE             PIC X(6).                           05200000
046700     05  REQ-AREA             PIC X(2).                           05210000
046800     05  REQ-RC               PIC X(2).                           05220000
046900                                                                  05230000
047000     COPY RECDATZC.                                               05240000
047100/                                                                 05250000
047200     COPY BPDATESC.                                               05260000
047300/                                                                 05270000
047400     COPY BHINFO.                                                 05280000
047500/                                                                 05290000
047600     COPY BHACAT.                                                 05300000
047700/                                                                 05310000
047800     COPY BHICS.                                                  05320000
047900/                                                                 05330000
048000     COPY BHP1.                                                   05340000
048100/                                                                 05350000
048200     COPY BHMISC.                                                 05360000
048300/                                                                 05370000
048400     COPY BHMF.                                                   05380000
048500/                                                                 05390000
048600     COPY BHMF3.                                                  05400000
048700/                                                                 05410000
048800     COPY BHBTS2.                                                 05420000
048900/                                                                 05430000
049000     COPY GETNACOB.                                               05440000
049100 01  GETNA-SEGMENT-INCLUDES.                                      05450000
049200     COPY NASEGHDR.                                               05460000
049300     COPY NASEGPPA.                                               05470000
049400     COPY NASEGEND.                                               05480000
049500/                                                                 05490000
049600 01  CNTR-MASK.                                                   05500000
049700     05  CNTR-MASK-RECS          PIC ZZZZ,ZZZ,ZZZ,ZZZ,ZZ9.        05510000
049800     05  CNTR-MASK-MONEY REDEFINES CNTR-MASK-RECS                 05520000
049900                                 PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99.        05530000
050000     05  CNTR-MASK-SHARE REDEFINES CNTR-MASK-MONEY                05540000
050100                                 PIC ZZ,ZZZ,ZZZ,ZZZ.99999.        05550000
050200 01  CNTR-NINE-FIELD   PIC 9(9).                                  05560000
050300                                                                  05570000
050400 01  CL-COUNTER-AREA.                                             05580000
050500     02  FILLER        PIC X(19) VALUE 'CLIENT COUNTER AREA'.     05590000
050600     02  NUM-CL-IN-CNTRS   PIC S9(5) COMP SYNC  VALUE +12.        05600000
050700     02  CL-CNTR-MASK.                                            05610000
050800         03  CL-CNTR-MASK-RECS   PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.         05620000
050900                                                                  05630000
051000     02  CL-CNTR-DATA.                                            05640000
051100         03  FILLER  PIC X(31)                                    05650000
051200                          VALUE '******************************'. 05660000
051300         03  FILLER  PIC S9(15) COMP-3.                           05670000
051400                                                                  05680000
051500         03  FILLER  PIC X(31)                                    05690000
051600                          VALUE 'N****   TOTALS FOR CLIENT  ***'. 05700000
051700         03  NUM-CLIENT-NUMBER            PIC S9(15) COMP-3.      05710000
051800                                                                  05720000
051900         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT RECS READ'.     05730000
052000         03  NUM-CL-ACAT-RECS-READ        PIC S9(15) COMP-3.      05740000
052100                                                                  05750000
052200         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT 1ST RECS IN'.   05760000
052300         03  NUM-CL-ACAT-1ST-RECS-IN      PIC S9(15) COMP-3.      05770000
052400                                                                  05780000
052500         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT 2ND RECS IN'.   05790000
052600         03  NUM-CL-ACAT-2ND-RECS-IN      PIC S9(15) COMP-3.      05800000
052700                                                                  05810000
052800         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT 3RD RECS IN'.   05820000
052900         03  NUM-CL-ACAT-3RD-RECS-IN      PIC S9(15) COMP-3.      05830000
053000                                                                  05840000
053100         03  FILLER  PIC X(31) VALUE 'NTOTAL HEADERS READ'.       05850000
053200         03  NUM-CL-HEADERS-READ          PIC S9(15) COMP-3.      05860000
053300                                                                  05870000
053400         03  FILLER  PIC X(31) VALUE 'NTOTAL TRAILERS READ'.      05880000
053500         03  NUM-CL-TRAILERS-READ         PIC S9(15) COMP-3.      05890000
053600                                                                  05900000
053700         03  FILLER  PIC X(31)                                    05910000
053800                          VALUE '------------------------------'. 05920000
053900         03  FILLER  PIC S9(15) COMP-3.                           05930000
054000                                                                  05940000
054100         03  FILLER PIC X(31) VALUE 'NTOTAL FORMAT RECS SELECTED'.05950000
054200         03  NUM-CL-FMT-RECS-SELECTED      PIC S9(15) COMP-3.     05960000
054300                                                                  05970000
054400         03  FILLER PIC X(31)                                     05980000
054500                          VALUE 'NTOTAL FMT RECS NOT STL DROPPED'.05990000
054600         03  NUM-CL-FMT-RECS-NOT-STL       PIC S9(15) COMP-3.     06000000
054700                                                                  06010000
054800         03  FILLER  PIC X(31) VALUE 'NTOTAL FMT RECS INCOMPLETE'.06020000
054900         03  NUM-CL-FMT-RECS-INCOMPLETE    PIC S9(15) COMP-3.     06030000
055000                                                                  06040000
055100     02  CL-CNTR-TABLE REDEFINES CL-CNTR-DATA.                    06050000
055200         03  CL-CNTR-ENTRIES OCCURS 12 TIMES INDEXED BY CL-CNTR-X.06060000
055300             05  CL-CNTR-TYPE            PIC X.                   06070000
055400             05  CL-CNTR-DESC            PIC X(30).               06080000
055500             05  CL-CNTR-RECS            PIC S9(15) COMP-3.       06090000
055600/                                                                 06100000
055700 01  CL-OUT-COUNTER-AREA.                                         06110000
055800     02  FILLER        PIC X(23) VALUE 'CLIENT OUT COUNTER AREA'. 06120000
055900                                                                  06130000
056000     02  CL-OUT-CNTR-DATA.                                        06140000
056100         03  FILLER  PIC X(31)                                    06150000
056200                          VALUE '******************************'. 06160000
056300         03  FILLER  PIC S9(17) COMP-3.                           06170000
056400                                                                  06180000
056500         03  FILLER  PIC X(31)                                    06190000
056600                          VALUE 'N****   TOTALS FOR CLIENT  ***'. 06200000
056700         03  NUM-OUT-CLIENT-NUMBER         PIC S9(17) COMP-3.     06210000
056800                                                                  06220000
056900         03  FILLER  PIC X(31) VALUE 'NTOTAL BR ACCT NOT NUMERIC'.06230000
057000         03  NUM-CL-BR-ACT-NOT-NUMERIC     PIC S9(17) COMP-3.     06240000
057100                                                                  06250000
057200         03  FILLER  PIC X(31)                                    06260000
057300                          VALUE '******************************'. 06270000
057400         03  FILLER  PIC S9(17) COMP-3.                           06280000
057500                                                                  06290000
057600         03  FILLER  PIC X(31)                                    06300000
057700                          VALUE 'NTOT ASSETS BILLED'.             06310000
057800         03  TOT-CL-ASSETS   PIC S9(17)  COMP-3.                  06320000
057900                                                                  06330000
058000         03  FILLER  PIC X(31)                                    06340000
058100                          VALUE 'NTOT ACCOUNTS BILLED'.           06350000
058200         03  TOT-CL-ACCOUNTS    PIC S9(17)  COMP-3.               06360000
058300                                                                  06370000
058400         03  FILLER  PIC X(31)                                    06380000
058500                          VALUE 'NTOT FUNDSERV DELV BILLED'.      06390000
058600         03  TOT-CL-FS-DELV     PIC S9(17)  COMP-3.               06400000
058700                                                                  06410000
058800         03  FILLER  PIC X(31)                                    06420000
058900                          VALUE 'NTOT FUNDSERV RECV BILLED'.      06430000
059000         03  TOT-CL-FS-RECV     PIC S9(17)  COMP-3.               06440000
059100                                                                  06450000
059200         03  FILLER  PIC X(31)                                    06460000
059300                          VALUE '******************************'. 06470000
059400         03  FILLER  PIC S9(17) COMP-3.                           06480000
059500                                                                  06490000
059600         03  FILLER  PIC X(31) VALUE 'NTOTAL SORT RECORDS'.       06500000
059700         03  TOT-CL-SORT-RECS      PIC S9(17) COMP-3.             06510000
059800                                                                  06520000
059900         03  FILLER  PIC X(31) VALUE 'NTOTAL VALID SORT RECORDS'. 06530000
060000         03  TOT-CL-VALID-SORT-RECS PIC S9(17) COMP-3.            06540000
060100                                                                  06550000
060200         03  FILLER PIC X(31) VALUE 'NTOTAL INVALID SORT RECORDS'.06560000
060300         03  TOT-CL-INVALID-SORT-RECS  PIC S9(17) COMP-3.         06570000
060400                                                                  06580000
060500         03  FILLER  PIC X(31)                                    06590000
060600                          VALUE '******************************'. 06600000
060700         03  FILLER  PIC S9(17) COMP-3.                           06610000
060800                                                                  06620000
060900         03  FILLER  PIC X(31)                                    06630000
061000                          VALUE 'NTOT CL OLD PEND READ'.          06640000
061100         03  TOT-CL-PEND-READ          PIC S9(17)  COMP-3.        06650000
061200                                                                  06660000
061300         03  FILLER  PIC X(31)                                    06670000
061400                          VALUE 'NTOT CL NEW PEND WRITTEN'.       06680000
061500         03  TOT-CL-NEW-PEND-WRITTEN   PIC S9(17)  COMP-3.        06690000
061600                                                                  06700000
061700         03  FILLER  PIC X(31)                                    06710000
061800                          VALUE 'NTOT CL ACAT NEW PEND WRITTEN'.  06720000
061900         03  TOT-CL-ACAT-NEW-PEND-WRITTEN   PIC S9(17)  COMP-3.   06730000
062000                                                                  06740000
062100         03  FILLER  PIC X(31)                                    06750000
062200                          VALUE 'NTOT CL PEND NEW PEND WRITTEN'.  06760000
062300         03  TOT-CL-PEND-NEW-PEND-WRITTEN   PIC S9(17)  COMP-3.   06770000
062400                                                                  06780000
062500         03  FILLER  PIC X(31)                                    06790000
062600                          VALUE '******************************'. 06800000
062700         03  FILLER  PIC S9(17) COMP-3.                           06810000
062800                                                                  06820000
062900         03  FILLER  PIC X(31)                                    06830000
063000                          VALUE 'NTOTAL ACAT SELECTED FOR P2'.    06840000
063100         03  TOT-CL-ACAT-SELECTED-FOR-P2  PIC S9(17) COMP-3.      06850000
063200                                                                  06860000
063300         03  FILLER  PIC X(31)                                    06870000
063400                          VALUE 'NTOTAL PEND SELECTED FOR P2'.    06880000
063500         03  TOT-CL-PEND-SELECTED-FOR-P2  PIC S9(17) COMP-3.      06890000
063600                                                                  06900000
063700         03  FILLER  PIC X(31) VALUE 'NTOTAL SELECTED FOR P2'.    06910000
063800         03  TOT-CL-SELECTED-FOR-P2       PIC S9(17) COMP-3.      06920000
063900                                                                  06930000
064000         03  FILLER  PIC X(31) VALUE 'NTOTAL P2 RECORDS OUT'.     06940000
064100         03  TOT-CL-P2-RECS-WRITTEN           PIC S9(17) COMP-3.  06950000
064200                                                                  06960000
064300         03  FILLER  PIC X(31) VALUE 'NTOTAL CREDITED REJ FAILS'. 06970000
064400         03  TOT-REJ-FAIL-CR-REC           PIC S9(17) COMP-3.     06980000
064500                                                                  06990000
064600         03  FILLER  PIC X(31) VALUE 'NTOTAL DEBITED REJ FAILS'.  07000000
064700         03  TOT-REJ-FAIL-DB-REC           PIC S9(17) COMP-3.     07010000
064800                                                                  07020000
064900         03  FILLER  PIC X(31) VALUE 'NTOTAL CAGE FAILS'.         07030000
065000         03  TOT-CAGE-FAIL-REC             PIC S9(17) COMP-3.     07040000
065100                                                                  07050000
065200         03  FILLER  PIC X(31)                                    07060000
065300                          VALUE '******************************'. 07070000
065400         03  FILLER  PIC S9(17) COMP-3.                           07080000
065500                                                                  07090000
065600         03  FILLER  PIC X(31)                                    07100000
065700                          VALUE 'MTOT BK CUST DEBIT VALUE'.       07110000
065800         03  TOT-CL-BK-CUST-DB-VALUE    PIC S9(15)V99 COMP-3.     07120000
065900                                                                  07130000
066000         03  FILLER  PIC X(31)                                    07140000
066100                          VALUE 'MTOT BK CUST CREDIT VALUE'.      07150000
066200         03  TOT-CL-BK-CUST-CR-VALUE    PIC S9(15)V99 COMP-3.     07160000
066300                                                                  07170000
066400         03  FILLER  PIC X(31)                                    07180000
066500                          VALUE 'STOT BK CUST DEBIT QUANTITY'.    07190000
066600         03  TOT-CL-BK-CUST-DB-QTY      PIC S9(12)V9(5) COMP-3.   07200000
066700                                                                  07210000
066800         03  FILLER  PIC X(31)                                    07220000
066900                          VALUE 'STOT BK CUST CREDIT QUANTITY'.   07230000
067000         03  TOT-CL-BK-CUST-CR-QTY      PIC S9(12)V9(5) COMP-3.   07240000
067100                                                                  07250000
067200         03  FILLER  PIC X(31)                                    07260000
067300                          VALUE '******************************'. 07270000
067400         03  FILLER  PIC S9(17) COMP-3.                           07280000
067500                                                                  07290000
067600         03  FILLER  PIC X(31) VALUE 'MTOT BK OFFSET DEBIT VALUE'.07300000
067700         03  TOT-CL-OFFSET-DB-VALUE    PIC S9(15)V99 COMP-3.      07310000
067800                                                                  07320000
067900         03  FILLER PIC X(31) VALUE 'MTOT BK OFFSET CREDIT VALUE'.07330000
068000         03  TOT-CL-OFFSET-CR-VALUE    PIC S9(15)V99 COMP-3.      07340000
068100                                                                  07350000
068200         03  FILLER PIC X(31) VALUE 'MTOT BK OFFSET BYP DB VALUE'.07360000
068300         03  TOT-CL-OFFSET-BYP-DB-VALUE    PIC S9(15)V99 COMP-3.  07370000
068400                                                                  07380000
068500         03  FILLER PIC X(31) VALUE 'MTOT BK OFFSET BYP CR VALUE'.07390000
068600         03  TOT-CL-OFFSET-BYP-CR-VALUE    PIC S9(15)V99 COMP-3.  07400000
068700                                                                  07410000
068800         03  FILLER  PIC X(31)                                    07420000
068900                          VALUE '*****************************'.  07430000
069000         03  FILLER  PIC S9(17) COMP-3.                           07440000
069100                                                                  07450000
069200                                                                  07460000
069300         03  FILLER  PIC X(31) VALUE 'STOT BK CNS DEBIT QUANTITY'.07470000
069400         03  TOT-CL-BK-CNS-DB-QTY      PIC S9(12)V9(5) COMP-3.    07480000
069500                                                                  07490000
069600         03  FILLER PIC X(31) VALUE 'STOT BK CNS CREDIT QUANTITY'.07500000
069700         03  TOT-CL-BK-CNS-CR-QTY      PIC S9(12)V9(5) COMP-3.    07510000
069800                                                                  07520000
069900         03  FILLER  PIC X(31)                                    07530000
070000                          VALUE '******************************'. 07540000
070100         03  FILLER  PIC S9(17) COMP-3.                           07550000
070200                                                                  07560000
070300         03  FILLER  PIC X(31) VALUE 'MTOT CL BK DEBIT VALUE'.    07570000
070400         03  TOT-CL-BK-DB-VALUE    PIC S9(15)V99 COMP-3.          07580000
070500                                                                  07590000
070600         03  FILLER  PIC X(31) VALUE 'MTOT CL BK CREDIT VALUE'.   07600000
070700         03  TOT-CL-BK-CR-VALUE    PIC S9(15)V99 COMP-3.          07610000
070800                                                                  07620000
070900         03  FILLER  PIC X(31) VALUE 'STOT CL BK DEBIT QUANTITY'. 07630000
071000         03  TOT-CL-BK-DB-QTY      PIC S9(12)V9(5) COMP-3.        07640000
071100                                                                  07650000
071200         03  FILLER PIC X(31) VALUE 'STOT CL BK CREDIT QUANTITY'. 07660000
071300         03  TOT-CL-BK-CR-QTY      PIC S9(12)V9(5) COMP-3.        07670000
071400                                                                  07680000
071500         03  FILLER  PIC X(31)                                    07690000
071600                          VALUE '******************************'. 07700000
071700         03  FILLER  PIC S9(17) COMP-3.                           07710000
071800                                                                  07720000
071900         03  FILLER PIC X(31) VALUE 'MTOT RD CL DEBIT VALUE'.     07730000
072000         03  TOT-CL-RD-CL-DB-VALUE    PIC S9(15)V99 COMP-3.       07740000
072100                                                                  07750000
072200         03  FILLER  PIC X(31) VALUE 'MTOT RD CL CREDIT VALUE'.   07760000
072300         03  TOT-CL-RD-CL-CR-VALUE    PIC S9(15)V99 COMP-3.       07770000
072400                                                                  07780000
072500         03  FILLER  PIC X(31) VALUE 'STOT RD CL DEBIT QUANTITY'. 07790000
072600         03  TOT-CL-RD-CL-DB-QTY      PIC S9(12)V9(5) COMP-3.     07800000
072700                                                                  07810000
072800         03  FILLER  PIC X(31) VALUE 'STOT RD CL CREDIT QUANTITY'.07820000
072900         03  TOT-CL-RD-CL-CR-QTY      PIC S9(12)V9(5) COMP-3.     07830000
073000                                                                  07840000
073100         03  FILLER  PIC X(31)                                    07850000
073200                          VALUE '******************************'. 07860000
073300         03  FILLER  PIC S9(17) COMP-3.                           07870000
073400                                                                  07880000
073500         03  FILLER  PIC X(31)                                    07890000
073600                          VALUE 'STOT N1 MEMO DEBIT QUANTITY'.    07900000
073700         03  TOT-N1-MEMO-DB-QTY  PIC S9(12)V9(5) COMP-3.          07910000
073800                                                                  07920000
073900         03  FILLER  PIC X(31)                                    07930000
074000                          VALUE 'STOT N1 MEMO CREDIT QUANTITY'.   07940000
074100         03  TOT-N1-MEMO-CR-QTY  PIC S9(12)V9(5) COMP-3.          07950000
074200                                                                  07960000
074300         03  FILLER  PIC X(31)                                    07970000
074400                          VALUE 'STOT N2 MEMO DEBIT QUANTITY'.    07980000
074500         03  TOT-N2-MEMO-DB-QTY  PIC S9(12)V9(5) COMP-3.          07990000
074600                                                                  08000000
074700         03  FILLER  PIC X(31)                                    08010000
074800                          VALUE 'STOT N2 MEMO CREDIT QUANTITY'.   08020000
074900         03  TOT-N2-MEMO-CR-QTY  PIC S9(12)V9(5) COMP-3.          08030000
075000                                                                  08040000
075100         03  FILLER  PIC X(31)                                    08050000
075200                          VALUE 'STOT N3 MEMO DEBIT QUANTITY'.    08060000
075300         03  TOT-N3-MEMO-DB-QTY  PIC S9(12)V9(5) COMP-3.          08070000
075400                                                                  08080000
075500         03  FILLER  PIC X(31)                                    08090000
075600                          VALUE 'STOT N3 MEMO CREDIT QUANTITY'.   08100000
075700         03  TOT-N3-MEMO-CR-QTY  PIC S9(12)V9(5) COMP-3.          08110000
075800                                                                  08120000
075900         03  FILLER  PIC X(31)                                    08130000
076000                          VALUE 'STOT N4 MEMO DEBIT QUANTITY'.    08140000
076100         03  TOT-N4-MEMO-DB-QTY  PIC S9(12)V9(5) COMP-3.          08150000
076200                                                                  08160000
076300         03  FILLER  PIC X(31)                                    08170000
076400                          VALUE 'STOT N4 MEMO CREDIT QUANTITY'.   08180000
076500         03  TOT-N4-MEMO-CR-QTY  PIC S9(12)V9(5) COMP-3.          08190000
076600                                                                  08200000
LRM050         03  FILLER  PIC X(31)                                    08210000
LRM050                          VALUE 'STOT N6 MEMO DEBIT QUANTITY'.    08220000
LRM050         03  TOT-N6-MEMO-DB-QTY  PIC S9(12)V9(5) COMP-3.          08230000
LRM050                                                                  08240000
LRM050         03  FILLER  PIC X(31)                                    08250000
LRM050                          VALUE 'STOT N6 MEMO CREDIT QUANTITY'.   08260000
LRM050         03  TOT-N6-MEMO-CR-QTY  PIC S9(12)V9(5) COMP-3.          08270000
LRM050                                                                  08280000
076700         03  FILLER  PIC X(31)                                    08281000
076800                          VALUE 'STOT LEVEL-0 DEBIT QUANTITY'.    08282000
076900         03  TOT-N0-MEMO-DB-QTY  PIC S9(12)V9(5) COMP-3.          08283000
077000                                                                  08284000
077100         03  FILLER  PIC X(31)                                    08285000
077200                          VALUE 'STOT LEVEL-0 CREDIT QUANTITY'.   08286000
077300         03  TOT-N0-MEMO-CR-QTY  PIC S9(12)V9(5) COMP-3.          08287000
077400                                                                  08288000
077500         03  FILLER  PIC X(31)                                    08289000
077600                          VALUE 'STOT CL PEND REC DB QUANTITY'.   08290000
077700         03  TOT-CL-PEND-REC-DB-QTY  PIC S9(12)V9(5) COMP-3.      08300000
077800                                                                  08310000
077900         03  FILLER  PIC X(31)                                    08320000
078000                          VALUE 'STOT CL PEND REC CR QUANTITY'.   08330000
078100         03  TOT-CL-PEND-REC-CR-QTY  PIC S9(12)V9(5) COMP-3.      08340000
078200                                                                  08350000
078300         03  FILLER  PIC X(31)                                    08360000
078400                          VALUE 'STOT CL PEND DEL DB QUANTITY'.   08370000
078500         03  TOT-CL-PEND-DEL-DB-QTY  PIC S9(12)V9(5) COMP-3.      08380000
078600                                                                  08390000
078700         03  FILLER  PIC X(31)                                    08400000
078800                          VALUE 'STOT CL PEND DEL CR QUANTITY'.   08410000
078900         03  TOT-CL-PEND-DEL-CR-QTY  PIC S9(12)V9(5) COMP-3.      08420000
079000                                                                  08430000
079100         03  FILLER  PIC X(31)                                    08440000
079200                          VALUE 'MTOT CL PEND DEL DB VALUE'.      08450000
079300         03  TOT-CL-PEND-DEL-DB-VALUE  PIC S9(15)V99 COMP-3.      08460000
079400                                                                  08470000
079500         03  FILLER  PIC X(31)                                    08480000
079600                          VALUE 'MTOT CL PEND DEL CR VALUE'.      08490000
079700         03  TOT-CL-PEND-DEL-CR-VALUE  PIC S9(15)V99 COMP-3.      08500000
079800                                                                  08510000
079900         03  FILLER  PIC X(31)                                    08520000
080000                          VALUE 'MTOT CL PEND REC DB VALUE'.      08530000
080100         03  TOT-CL-PEND-REC-DB-VALUE  PIC S9(15)V99 COMP-3.      08540000
080200                                                                  08550000
080300         03  FILLER  PIC X(31)                                    08560000
080400                          VALUE 'MTOT CL PEND REC CR VALUE'.      08570000
080500         03  TOT-CL-PEND-REC-CR-VALUE  PIC S9(15)V99 COMP-3.      08580000
080600                                                                  08590000
080700         03  FILLER  PIC X(31)                                    08600000
080800                          VALUE '******************************'. 08610000
080900         03  FILLER  PIC S9(17) COMP-3.                           08620000
081000                                                                  08630000
081100         03  FILLER  PIC X(31) VALUE 'MTOT DEBIT VALUE'.          08640000
081200         03  TOT-CL-DB-VALUE          PIC S9(15)V99 COMP-3.       08650000
081300                                                                  08660000
081400         03  FILLER  PIC X(31) VALUE 'MTOT CREDIT VALUE'.         08670000
081500         03  TOT-CL-CR-VALUE          PIC S9(15)V99 COMP-3.       08680000
081600                                                                  08690000
081700         03  FILLER  PIC X(31) VALUE 'STOT DEBIT QUANTITY'.       08700000
081800         03  TOT-CL-DB-QTY            PIC S9(12)V9(5) COMP-3.     08710000
081900                                                                  08720000
082000         03  FILLER  PIC X(31) VALUE 'STOT CREDIT QUANTITY'.      08730000
082100         03  TOT-CL-CR-QTY            PIC S9(12)V9(5) COMP-3.     08740000
082200         03  FILLER  PIC X(31)                                    08750000
082300                          VALUE '******************************'. 08760000
082400         03  FILLER  PIC S9(17) COMP-3.                           08770000
082500                                                                  08780000
082600         03  FILLER  PIC X(31) VALUE 'NTOTAL EARLY RECORDS OUT'.  08790000
082700         03  TOT-CL-EARLY-WRITTEN    PIC S9(17) COMP-3.           08800000
082800                                                                  08810000
082900         03  FILLER PIC X(31) VALUE 'MTOT EARLY CL DEBIT VALUE'.  08820000
083000         03  TOT-CL-EARLY-DB-VALUE    PIC S9(15)V99 COMP-3.       08830000
083100                                                                  08840000
083200         03  FILLER  PIC X(31) VALUE 'MTOT EARLY CL CREDIT VALUE'.08850000
083300         03  TOT-CL-EARLY-CR-VALUE    PIC S9(15)V99 COMP-3.       08860000
083400                                                                  08870000
083500         03  FILLER  PIC X(31) VALUE 'STOT EARLY CL DEBIT QUANT'. 08880000
083600         03  TOT-CL-EARLY-DB-QTY      PIC S9(12)V9(5) COMP-3.     08890000
083700                                                                  08900000
083800         03  FILLER  PIC X(31) VALUE 'STOT EARLY CL CREDIT QUANT'.08910000
083900         03  TOT-CL-EARLY-CR-QTY      PIC S9(12)V9(5) COMP-3.     08920000
084000                                                                  08930000
084100         03  FILLER PIC X(31)                                     08940000
084200                         VALUE '******************************'.  08950000
084300         03  FILLER PIC S9(17) COMP-3.                            08960000
084400                                                                  08970000
084500         03  FILLER PIC X(31) VALUE 'STOT CL OPTION DB QUANT'.    08980000
084600         03  TOT-CL-BK-OPTION-DB-QTY  PIC S9(12)V9(5) COMP-3.     08990000
084700                                                                  09000000
084800         03  FILLER PIC X(31) VALUE 'STOT CL OPTION CR QUANT'.    09010000
084900         03  TOT-CL-BK-OPTION-CR-QTY  PIC S9(12)V9(5) COMP-3.     09020000
085000                                                                  09030000
085100         03  FILLER PIC X(31) VALUE 'STOT CL CBOE OFFSET DB QTY'. 09040000
085200         03  TOT-CL-OPT-CBOE-DB-QTY   PIC S9(12)V9(5) COMP-3.     09050000
085300                                                                  09060000
085400         03  FILLER PIC X(31) VALUE 'STOT CL CBOE OFFSET CR QTY'. 09070000
085500         03  TOT-CL-OPT-CBOE-CR-QTY   PIC S9(12)V9(5) COMP-3.     09080000
085600                                                                  09090000
085700         03  FILLER PIC X(31)                                     09100000
085800                         VALUE 'STOT CL AMEX NYSE OFFSET DB QTY'. 09110000
085900         03  TOT-CL-AMEX-NYSE-DB-QTY   PIC S9(12)V9(5) COMP-3.    09120000
086000                                                                  09130000
086100         03  FILLER PIC X(31)                                     09140000
086200                         VALUE 'STOT CL AMEX NYSE OFFSET CR QTY'. 09150000
086300         03  TOT-CL-AMEX-NYSE-CR-QTY   PIC S9(12)V9(5) COMP-3.    09160000
086400                                                                  09170000
086500         03  FILLER PIC X(31) VALUE 'STOT CL PBW OFFSET DB QTY'.  09180000
086600         03  TOT-CL-OPT-PBW-DB-QTY    PIC S9(12)V9(5) COMP-3.     09190000
086700                                                                  09200000
086800         03  FILLER PIC X(31) VALUE 'STOT CL PBW OFFSET CR QTY'.  09210000
086900         03  TOT-CL-OPT-PBW-CR-QTY    PIC S9(12)V9(5) COMP-3.     09220000
087000                                                                  09230000
087100         03  FILLER PIC X(31) VALUE 'STOT CL PSE OFFSET DB QTY'.  09240000
087200         03  TOT-CL-OPT-PSE-DB-QTY    PIC S9(12)V9(5) COMP-3.     09250000
087300                                                                  09260000
087400         03  FILLER PIC X(31) VALUE 'STOT CL PSE OFFSET CR QTY'.  09270000
087500         03  TOT-CL-OPT-PSE-CR-QTY    PIC S9(12)V9(5) COMP-3.     09280000
087600                                                                  09290000
087700         03  FILLER PIC X(31) VALUE 'STOT CL DFLT OFFSET DB QTY'. 09300000
087800         03  TOT-CL-OPT-DFLT-DB-QTY   PIC S9(12)V9(5) COMP-3.     09310000
087900                                                                  09320000
088000         03  FILLER PIC X(31) VALUE 'STOT CL DFLT OFFSET CR QTY'. 09330000
088100         03  TOT-CL-OPT-DFLT-CR-QTY   PIC S9(12)V9(5) COMP-3.     09340000
088200                                                                  09350000
088300         03  FILLER PIC X(31)                                     09360000
088400                         VALUE '******************************'.  09370000
088500         03  FILLER PIC S9(17) COMP-3.                            09380000
088600                                                                  09390000
088700     02  CL-OUT-CNTR-TABLE REDEFINES CL-OUT-CNTR-DATA.            09400000
088800***      03  CL-OUT-CNTR-ENTRIES OCCURS 89 TIMES                  09410000
LRM050         03  CL-OUT-CNTR-ENTRIES OCCURS 94 TIMES                  09420000
089000                                 INDEXED BY CL-O-CNTR-X.          09430000
089100             05  CL-OUT-CNTR-TYPE         PIC X.                  09440000
089200             05  CL-OUT-CNTR-DESC         PIC X(30).              09450000
089300             05  CL-OUT-CNTR-RECS         PIC S9(17) COMP-3.      09460000
089400             05  CL-OUT-CNTR-MONEY                                09470000
089500                 REDEFINES CL-OUT-CNTR-RECS                       09480000
089600                                          PIC S9(15)V99 COMP-3.   09490000
089700             05  CL-OUT-CNTR-SHARE                                09500000
089800                 REDEFINES CL-OUT-CNTR-MONEY                      09510000
089900                                          PIC S9(12)V9(5) COMP-3. 09520000
090000***  02  NUM-CL-OUT-CNTRS   PIC S9(5) COMP SYNC VALUE +89.        09530000
LRM050     02  NUM-CL-OUT-CNTRS   PIC S9(5) COMP SYNC VALUE +94.        09540000
090200/                                                                 09550000
090300 01  COUNTER-AREA.                                                09560000
090400     02  FILLER        PIC X(12) VALUE 'COUNTER-AREA'.            09570000
090500     02  CNTR-DATA.                                               09580000
090600         03  FILLER  PIC X(31)                                    09590000
090700                          VALUE '******************************'. 09600000
090800         03  FILLER  PIC S9(17) COMP-3.                           09610000
090900                                                                  09620000
091000         03  FILLER  PIC X(31)                                    09630000
091100                          VALUE '*****   CAT650  TOTALS   *****'. 09640000
091200         03  FILLER  PIC S9(17) COMP-3.                           09650000
091300                                                                  09660000
091400         03  FILLER  PIC X(31) VALUE 'NTOTAL B1 ACTIVE BROKERS'.  09670000
091500         03  NUM-B1-ACTV-BROKER-CL     PIC S9(17) COMP-3.         09680000
091600                                                                  09690000
091700         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT SYSTEM CLIENTS'.09700000
091800         03  NUM-ACAT-SYS-CLIENT       PIC S9(17) COMP-3.         09710000
091900                                                                  09720000
092000         03  FILLER PIC X(31) VALUE 'NNOT ACAT SYSTEM CL DROPPED'.09730000
092100         03  NUM-NOT-ACAT-SYS-DROP     PIC S9(17) COMP-3.         09740000
092200                                                                  09750000
092300         03  FILLER  PIC X(31)                                    09760000
092400                          VALUE '******************************'. 09770000
092500         03  FILLER  PIC S9(17) COMP-3.                           09780000
092600                                                                  09790000
092700         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT PHYS RECS IN'.  09800000
092800         03  NUM-ACAT-RECS-IN          PIC S9(17) COMP-3 VALUE 0. 09810000
092900                                                                  09820000
093000         03  FILLER  PIC X(31)                                    09830000
093100                          VALUE 'NTOTAL NOT ADP CL RECS BYPASSED'.09840000
093200         03  NUM-NOT-ADP-CL-RECS       PIC S9(17) COMP-3.         09850000
093300                                                                  09860000
093400         03  FILLER  PIC X(31) VALUE 'NTOTAL ADP CL RECORDS'.     09870000
093500         03  NUM-ACAT-RECS-READ        PIC S9(17) COMP-3.         09880000
093600                                                                  09890000
093700         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT 1ST RECS IN'.   09900000
093800         03  NUM-ACAT-1ST-RECS-IN      PIC S9(17) COMP-3.         09910000
093900                                                                  09920000
094000         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT 2ND RECS IN'.   09930000
094100         03  NUM-ACAT-2ND-RECS-IN      PIC S9(17) COMP-3.         09940000
094200                                                                  09950000
094300         03  FILLER  PIC X(31) VALUE 'NTOTAL ACAT 3RD RECS IN'.   09960000
094400         03  NUM-ACAT-3RD-RECS-IN      PIC S9(17) COMP-3.         09970000
094500                                                                  09980000
094600         03  FILLER  PIC X(31) VALUE 'NTOTAL HEADERS READ'.       09990000
094700         03  NUM-HEADERS-READ          PIC S9(17) COMP-3.         10000000
094800                                                                  10010000
094900         03  FILLER  PIC X(31) VALUE 'NTOTAL TRAILERS READ'.      10020000
095000         03  NUM-TRAILERS-READ         PIC S9(17) COMP-3.         10030000
095100                                                                  10040000
095200         03  FILLER  PIC X(31)                                    10050000
095300                          VALUE '******************************'. 10060000
095400         03  FILLER  PIC S9(17) COMP-3.                           10070000
095500                                                                  10080000
095600         03  FILLER PIC X(31) VALUE 'NTOTAL FORMAT RECS SELECTED'.10090000
095700         03  NUM-FMT-RECS-SELECTED      PIC S9(17) COMP-3.        10100000
095800                                                                  10110000
095900         03  FILLER  PIC X(31)                                    10120000
096000                          VALUE 'NTOTAL FMT RECS NOT STL DROPPED'.10130000
096100         03  NUM-FMT-RECS-NOT-STL       PIC S9(17) COMP-3.        10140000
096200                                                                  10150000
096300         03  FILLER  PIC X(31) VALUE 'NTOTAL FMT RECS INCOMPLETE'.10160000
096400         03  NUM-FMT-RECS-INCOMPLETE    PIC S9(17) COMP-3.        10170000
096500                                                                  10180000
096600         03  FILLER  PIC X(31)                                    10190000
096700                          VALUE '******************************'. 10200000
096800         03  FILLER  PIC S9(17) COMP-3.                           10210000
096900                                                                  10220000
097000         03  FILLER  PIC X(31) VALUE 'NTOTAL SORT RECORDS'.       10230000
097100         03  TOT-SORT-RECS      PIC S9(17) COMP-3.                10240000
097200                                                                  10250000
097300         03  FILLER  PIC X(31) VALUE 'NTOTAL VALID SORT RECORDS'. 10260000
097400         03  TOT-VALID-SORT-RECS PIC S9(17) COMP-3.               10270000
097500                                                                  10280000
097600         03  FILLER PIC X(31) VALUE 'NTOTAL INVALID SORT RECORDS'.10290000
097700         03  TOT-INVALID-SORT-RECS  PIC S9(17) COMP-3.            10300000
097800                                                                  10310000
097900         03  FILLER  PIC X(31)                                    10320000
098000                          VALUE '******************************'. 10330000
098100         03  FILLER  PIC S9(17) COMP-3.                           10340000
098200                                                                  10350000
098300         03  FILLER  PIC X(31) VALUE 'NTOTAL BR ACCT NOT NUMERIC'.10360000
098400         03  NUM-BR-ACT-NOT-NUMERIC    PIC S9(17) COMP-3.         10370000
098500                                                                  10380000
098600         03  FILLER  PIC X(31) VALUE 'NTOTAL PAST SETTLE DATES'.  10390000
098700         03  NUM-PAST-STL-DATES        PIC S9(17) COMP-3.         10400000
098800                                                                  10410000
098900         03  F  PIC X(31) VALUE 'NCASHBAL & CUSIP WRONG BYPASSED'.10420000
099000         03  NUM-CASHBAL-QSIP-WRONG    PIC S9(17) COMP-3.         10430000
099100                                                                  10440000
099200         03  FILLER PIC X(31) VALUE 'NTOTAL SYMBOL NOT MATCHED'.  10450000
099300         03  NUM-SYMBOL-NOT-MATCHED    PIC S9(17) COMP-3.         10460000
099400                                                                  10470000
099500         03  F  PIC X(31) VALUE 'NSETTLMNT IND INVALID BYPASSED'. 10480000
099600         03  NUM-SETTL-IND-INVALID     PIC S9(17) COMP-3.         10490000
099700                                                                  10500000
099800         03  FILLER  PIC X(31) VALUE 'NTOTAL ASSET TYPE NOT 0'.   10510000
099900         03  NUM-ASSET-TYPE-WRONG      PIC S9(17) COMP-3.         10520000
100000                                                                  10530000
100100         03  FILLER  PIC X(31) VALUE 'NSECURITY TYPE WHEN ISSUE'. 10540000
100200         03  NUM-SEC-TYPE-WRONG        PIC S9(17) COMP-3.         10550000
100300                                                                  10560000
100400         03  F  PIC X(31) VALUE 'NRECS WITH FRACTN QTY BYPASSED'. 10570000
100500         03  NUM-FRACTION-QTY          PIC S9(17) COMP-3.         10580000
100600                                                                  10590000
100700         03  FILLER  PIC X(31) VALUE 'NTOTAL CUSIP NOT MATCHED'.  10600000
100800         03  NUM-CUSIP-NOT-MATCHED     PIC S9(17) COMP-3.         10610000
100900                                                                  10620000
101000         03  FILLER  PIC X(31) VALUE 'NTOTAL CONTRA BROKER BAD'.  10630000
101100         03  NUM-CONTRA-BKR-NON-NUMERIC PIC S9(17) COMP-3.        10640000
101200                                                                  10650000
101300         03  FILLER  PIC X(31) VALUE 'NTOTAL PRIVATE RANGE BAD'.  10660000
101400         03  NUM-INVALID-PRIVATE-RANGE  PIC S9(17) COMP-3.        10670000
101500                                                                  10680000
101600         03  FILLER  PIC X(31) VALUE 'NTOTAL NON CASH BYPASSED'.  10690000
101700         03  NUM-CASH-TYPE-INVALID      PIC S9(17) COMP-3.        10700000
101800                                                                  10710000
101900         03  F  PIC X(31) VALUE '******************************'. 10720000
102000         03  FILLER  PIC S9(17) COMP-3.                           10730000
102100                                                                  10740000
102200         03  FILLER  PIC X(31) VALUE 'NTOTAL OF CLIENTS'.         10750000
102300         03  NUM-OF-CLIENTS            PIC S9(17) COMP-3.         10760000
102400                                                                  10770000
102500         03  FILLER  PIC X(31) VALUE 'NTOTAL OLD PEND RECS READ'. 10780000
102600         03  NUM-PEND-RECS-IN          PIC S9(17) COMP-3.         10790000
102700                                                                  10800000
102800         03  FILLER  PIC X(31)                                    10810000
102900                          VALUE 'NTOT OLD DATA PEND READ'.        10820000
103000         03  TOT-PEND-READ          PIC S9(17)  COMP-3.           10830000
103100                                                                  10840000
103200         03  FILLER  PIC X(31) VALUE 'NTOTAL NEW PEND WRITTEN'.   10850000
103300         03  NUM-NEW-PEND-WRITTEN      PIC S9(17) COMP-3.         10860000
103400                                                                  10870000
103500         03  FILLER  PIC X(31)                                    10880000
103600                          VALUE 'NTOT ACAT NEW PEND WRITTEN'.     10890000
103700         03  TOT-ACAT-NEW-PEND-WRITTEN   PIC S9(17)  COMP-3.      10900000
103800                                                                  10910000
103900         03  FILLER  PIC X(31)                                    10920000
104000                          VALUE 'NTOT PEND NEW PEND WRITTEN'.     10930000
104100         03  TOT-PEND-NEW-PEND-WRITTEN   PIC S9(17)  COMP-3.      10940000
104200                                                                  10950000
104300         03  FILLER  PIC X(31)                                    10960000
104400                          VALUE 'NTOT NEW DATA PEND WRITTEN'.     10970000
104500         03  TOT-NEW-PEND-WRITTEN   PIC S9(17)  COMP-3.           10980000
104600                                                                  10990000
104700         03  FILLER  PIC X(31)                                    11000000
104800                          VALUE '******************************'. 11010000
104900         03  FILLER  PIC S9(17) COMP-3.                           11020000
105000                                                                  11030000
105100         03  FILLER  PIC X(31) VALUE 'NTOTAL SELECTED FOR P2'.    11040000
105200         03  TOT-SELECTED-FOR-P2       PIC S9(17) COMP-3.         11050000
105300                                                                  11060000
105400         03  FILLER  PIC X(31)                                    11070000
105500                          VALUE 'NTOTAL ACAT SELECTED FOR P2'.    11080000
105600         03  TOT-ACAT-SELECTED-FOR-P2  PIC S9(17) COMP-3.         11090000
105700                                                                  11100000
105800         03  FILLER  PIC X(31)                                    11110000
105900                          VALUE 'NTOTAL PEND SELECTED FOR P2'.    11120000
106000         03  TOT-PEND-SELECTED-FOR-P2  PIC S9(17) COMP-3.         11130000
106100                                                                  11140000
106200         03  FILLER  PIC X(31) VALUE 'NTOTAL P2 RECORDS OUT'.     11150000
106300         03  TOT-P2-RECS-WRITTEN           PIC S9(17) COMP-3.     11160000
106400                                                                  11170000
106500                                                                  11180000
106600         03  FILLER  PIC X(31)                                    11190000
106700                          VALUE '******************************'. 11200000
106800         03  FILLER  PIC S9(17) COMP-3.                           11210000
106900                                                                  11220000
107000         03  FILLER  PIC X(31)                                    11230000
107100                          VALUE 'MTOT BK CUST DEBIT VALUE'.       11240000
107200         03  TOT-BK-CUST-DB-VALUE    PIC S9(15)V99 COMP-3.        11250000
107300                                                                  11260000
107400         03  FILLER  PIC X(31)                                    11270000
107500                          VALUE 'MTOT BK CUST CREDIT VALUE'.      11280000
107600         03  TOT-BK-CUST-CR-VALUE    PIC S9(15)V99 COMP-3.        11290000
107700                                                                  11300000
107800         03  FILLER  PIC X(31)                                    11310000
107900                          VALUE 'STOT BK CUST DEBIT QUANTITY'.    11320000
108000         03  TOT-BK-CUST-DB-QTY      PIC S9(12)V9(5) COMP-3.      11330000
108100                                                                  11340000
108200         03  FILLER  PIC X(31)                                    11350000
108300                          VALUE 'STOT BK CUST CREDIT QUANTITY'.   11360000
108400         03  TOT-BK-CUST-CR-QTY      PIC S9(12)V9(5) COMP-3.      11370000
108500                                                                  11380000
108600         03  FILLER  PIC X(31)                                    11390000
108700                          VALUE '******************************'. 11400000
108800         03  FILLER  PIC S9(17) COMP-3.                           11410000
108900                                                                  11420000
109000         03  FILLER  PIC X(31) VALUE 'MTOT BK OFFSET DEBIT VALUE'.11430000
109100         03  TOT-OFFSET-DB-VALUE       PIC S9(15)V99 COMP-3.      11440000
109200                                                                  11450000
109300         03  FILLER PIC X(31) VALUE 'MTOT BK OFFSET CREDIT VALUE'.11460000
109400         03  TOT-OFFSET-CR-VALUE       PIC S9(15)V99 COMP-3.      11470000
109500                                                                  11480000
109600         03  FILLER PIC X(31) VALUE 'MTOT BK OFFSET BYP DB VALUE'.11490000
109700         03  TOT-OFFSET-BYP-DB-VALUE       PIC S9(15)V99 COMP-3.  11500000
109800                                                                  11510000
109900         03  FILLER PIC X(31) VALUE 'MTOT BK OFFSET BYP CR VALUE'.11520000
110000         03  TOT-OFFSET-BYP-CR-VALUE       PIC S9(15)V99 COMP-3.  11530000
110100                                                                  11540000
110200         03  FILLER  PIC X(31)                                    11550000
110300                          VALUE '*****************************'.  11560000
110400         03  FILLER  PIC S9(17) COMP-3.                           11570000
110500                                                                  11580000
110600                                                                  11590000
110700         03  FILLER  PIC X(31) VALUE 'STOT BK CNS DEBIT QUANTITY'.11600000
110800         03  TOT-BK-CNS-DB-QTY      PIC S9(12)V9(5) COMP-3.       11610000
110900                                                                  11620000
111000         03  FILLER PIC X(31) VALUE 'STOT BK CNS CREDIT QUANTITY'.11630000
111100         03  TOT-BK-CNS-CR-QTY      PIC S9(12)V9(5) COMP-3.       11640000
111200                                                                  11650000
111300         03  FILLER  PIC X(31)                                    11660000
111400                          VALUE '******************************'. 11670000
111500         03  FILLER  PIC S9(17) COMP-3.                           11680000
111600                                                                  11690000
111700         03  FILLER  PIC X(31) VALUE 'MTOT BK DEBIT VALUE'.       11700000
111800         03  TOT-BK-DB-VALUE    PIC S9(15)V99 COMP-3.             11710000
111900                                                                  11720000
112000         03  FILLER  PIC X(31) VALUE 'MTOT BK CREDIT VALUE'.      11730000
112100         03  TOT-BK-CR-VALUE    PIC S9(15)V99 COMP-3.             11740000
112200                                                                  11750000
112300         03  FILLER  PIC X(31) VALUE 'STOT BK DEBIT QUANTITY'.    11760000
112400         03  TOT-BK-DB-QTY      PIC S9(12)V9(5) COMP-3.           11770000
112500                                                                  11780000
112600         03  FILLER PIC X(31) VALUE 'STOT BK CREDIT QUANTITY'.    11790000
112700         03  TOT-BK-CR-QTY      PIC S9(12)V9(5) COMP-3.           11800000
112800                                                                  11810000
112900         03  FILLER  PIC X(31)                                    11820000
113000                          VALUE '******************************'. 11830000
113100         03  FILLER  PIC S9(17) COMP-3.                           11840000
113200                                                                  11850000
113300         03  FILLER PIC X(31) VALUE 'MTOT RD CL DEBIT VALUE'.     11860000
113400         03  TOT-RD-CL-DB-VALUE    PIC S9(15)V99 COMP-3.          11870000
113500                                                                  11880000
113600         03  FILLER  PIC X(31) VALUE 'MTOT RD CL CREDIT VALUE'.   11890000
113700         03  TOT-RD-CL-CR-VALUE    PIC S9(15)V99 COMP-3.          11900000
113800                                                                  11910000
113900         03  FILLER  PIC X(31) VALUE 'STOT RD CL DEBIT QUANTITY'. 11920000
114000         03  TOT-RD-CL-DB-QTY      PIC S9(12)V9(5) COMP-3.        11930000
114100                                                                  11940000
114200         03  FILLER  PIC X(31) VALUE 'STOT RD CL CREDIT QUANTITY'.11950000
114300         03  TOT-RD-CL-CR-QTY      PIC S9(12)V9(5) COMP-3.        11960000
114400                                                                  11970000
114500         03  FILLER  PIC X(31)                                    11980000
114600                          VALUE '******************************'. 11990000
114700         03  FILLER  PIC S9(17) COMP-3.                           12000000
114800                                                                  12010000
114900         03  FILLER  PIC X(31) VALUE 'MTOT DEBIT VALUE'.          12020000
115000         03  TOT-DB-VALUE          PIC S9(15)V99 COMP-3.          12030000
115100                                                                  12040000
115200         03  FILLER  PIC X(31) VALUE 'MTOT CREDIT VALUE'.         12050000
115300         03  TOT-CR-VALUE          PIC S9(15)V99 COMP-3.          12060000
115400                                                                  12070000
115500         03  FILLER  PIC X(31) VALUE 'STOT DEBIT QUANTITY'.       12080000
115600         03  TOT-DB-QTY            PIC S9(12)V9(5) COMP-3.        12090000
115700                                                                  12100000
115800         03  FILLER  PIC X(31) VALUE 'STOT CREDIT QUANTITY'.      12110000
115900         03  TOT-CR-QTY            PIC S9(12)V9(5) COMP-3.        12120000
116000         03  FILLER  PIC X(31)                                    12130000
116100                          VALUE '******************************'. 12140000
116200         03  FILLER  PIC S9(17) COMP-3.                           12150000
116300                                                                  12160000
116400         03  FILLER  PIC X(31) VALUE 'NTOTAL EARLY RECORDS OUT'.  12170000
116500         03  TOT-EARLY-WRITTEN             PIC S9(17) COMP-3.     12180000
116600                                                                  12190000
116700         03  FILLER PIC X(31) VALUE 'MTOT EARLY DEBIT VALUE'.     12200000
116800         03  TOT-EARLY-DB-VALUE    PIC S9(15)V99 COMP-3.          12210000
116900                                                                  12220000
117000         03  FILLER  PIC X(31) VALUE 'MTOT EARLY CREDIT VALUE'.   12230000
117100         03  TOT-EARLY-CR-VALUE    PIC S9(15)V99 COMP-3.          12240000
117200                                                                  12250000
117300         03  FILLER  PIC X(31) VALUE 'STOT EARLY DEBIT QUANTITY'. 12260000
117400         03  TOT-EARLY-DB-QTY      PIC S9(12)V9(5) COMP-3.        12270000
117500                                                                  12280000
117600         03  FILLER  PIC X(31) VALUE 'STOT EARLY CREDIT QUANTITY'.12290000
117700         03  TOT-EARLY-CR-QTY      PIC S9(12)V9(5) COMP-3.        12300000
117800                                                                  12310000
117900         03  FILLER PIC X(31)                                     12320000
118000                         VALUE '******************************'.  12330000
118100         03  FILLER PIC S9(17) COMP-3.                            12340000
118200                                                                  12350000
118300         03  FILLER PIC X(31) VALUE 'STOT OPTION DB QUANT'.       12360000
118400         03  TOT-BK-OPTION-DB-QTY     PIC S9(12)V9(5) COMP-3.     12370000
118500                                                                  12380000
118600         03  FILLER PIC X(31) VALUE 'STOT OPTION CR QUANT'.       12390000
118700         03  TOT-BK-OPTION-CR-QTY     PIC S9(12)V9(5) COMP-3.     12400000
118800                                                                  12410000
118900         03  FILLER PIC X(31) VALUE 'STOT CBOE OFFSET DB QTY'.    12420000
119000         03  TOT-OPT-CBOE-DB-QTY      PIC S9(12)V9(5) COMP-3.     12430000
119100                                                                  12440000
119200         03  FILLER PIC X(31) VALUE 'STOT CBOE OFFSET CR QTY'.    12450000
119300         03  TOT-OPT-CBOE-CR-QTY      PIC S9(12)V9(5) COMP-3.     12460000
119400                                                                  12470000
119500         03  FILLER PIC X(31)                                     12480000
119600                         VALUE 'STOT AMEX NYSE OFFSET DB QTY'.    12490000
119700         03  TOT-AMEX-NYSE-DB-QTY     PIC S9(12)V9(5) COMP-3.     12500000
119800                                                                  12510000
119900         03  FILLER PIC X(31)                                     12520000
120000                         VALUE 'STOT AMEX NYSE OFFSET CR QTY'.    12530000
120100         03  TOT-AMEX-NYSE-CR-QTY     PIC S9(12)V9(5) COMP-3.     12540000
120200                                                                  12550000
120300         03  FILLER PIC X(31) VALUE 'STOT PBW OFFSET DB QTY'.     12560000
120400         03  TOT-OPT-PBW-DB-QTY       PIC S9(12)V9(5) COMP-3.     12570000
120500                                                                  12580000
120600         03  FILLER PIC X(31) VALUE 'STOT PBW OFFSET CR QTY'.     12590000
120700         03  TOT-OPT-PBW-CR-QTY       PIC S9(12)V9(5) COMP-3.     12600000
120800                                                                  12610000
120900         03  FILLER PIC X(31) VALUE 'STOT PSE OFFSET DB QTY'.     12620000
121000         03  TOT-OPT-PSE-DB-QTY       PIC S9(12)V9(5) COMP-3.     12630000
121100                                                                  12640000
121200         03  FILLER PIC X(31) VALUE 'STOT PSE OFFSET CR QTY'.     12650000
121300         03  TOT-OPT-PSE-CR-QTY       PIC S9(12)V9(5) COMP-3.     12660000
121400                                                                  12670000
121500         03  FILLER PIC X(31) VALUE 'STOT DFLT OFFSET DB QTY'.    12680000
121600         03  TOT-OPT-DFLT-DB-QTY      PIC S9(12)V9(5) COMP-3.     12690000
121700                                                                  12700000
121800         03  FILLER PIC X(31) VALUE 'STOT DFLT OFFSET CR QTY'.    12710000
121900         03  TOT-OPT-DFLT-CR-QTY      PIC S9(12)V9(5) COMP-3.     12720000
122000                                                                  12730000
122100         03  FILLER PIC X(31)                                     12740000
122200                         VALUE '******************************'.  12750000
122300         03  FILLER PIC S9(17) COMP-3.                            12760000
122400                                                                  12770000
122500     02  CNTR-TABLE REDEFINES CNTR-DATA.                          12780000
122600         03  CNTR-ENTRIES OCCURS 96 TIMES INDEXED BY CNTR-X.      12790000
122700             05  CNTR-TYPE            PIC X.                      12800000
122800             05  CNTR-DESC            PIC X(30).                  12810000
122900             05  CNTR-RECS            PIC S9(17) COMP-3.          12820000
123000             05  CNTR-RECS-MONEY REDEFINES CNTR-RECS              12830000
123100                                      PIC S9(15)V99 COMP-3.       12840000
123200             05  CNTR-RECS-SHARE REDEFINES CNTR-RECS-MONEY        12850000
123300                                      PIC S9(12)V9(5) COMP-3.     12860000
123400                                                                  12870000
123500     02  NUM-CNTRS           PIC S9(5) COMP SYNC VALUE +96.       12880000
123600                                                                  12890000
123700/                                                                 12900000
LRM019 01  FILLER                      PIC X(13) VALUE 'MGR02MVC AREA'. 12910000
LRM019     COPY MGR02MVC.                                               12920000
124000/                                                                 12930000
124100 01  FILLER                       PIC X(12) VALUE 'GETXREF AREA'. 12940000
124200                                                                  12950000
124300 01  MSD-SYM-CUSIP-XREF-RECORD.                                   12960000
124400*                                                                 12970000
124500*   C A L L I N G    P A R A M E T E R S                          12980000
124600*                                                                 12990000
124700     02  GETMSD-XREF-CALLING-INFO.                                13000000
124800         05  GETMSD-XREF-DEVICE           PIC X(01) VALUE 'D'.    13010000
124900         05  GETMSD-XREF-ACCESS           PIC X(01) VALUE 'R'.    13020000
125000         05  GETMSD-XREF-RETURN-CODE      PIC X(01).              13030000
125100             88 GETMSD-XREF-RETURN-VALID            VALUE SPACE.  13040000
125200             88 GETMSD-XREF-RETURN-EOF              VALUE 'E'.    13050000
125300             88 GETMSD-XREF-RETURN-INV-CUSIP        VALUE 'I'.    13060000
125400             88 GETMSD-XREF-RETURN-NOT-FOUND        VALUE 'N'.    13070000
125500             88 GETMSD-XREF-RETURN-KEY-IS-SEC       VALUE 'S'.    13080000
125600             88 GETMSD-XREF-RETURN-IO-ERROR         VALUE 'X'.    13090000
125700         05  GETMSD-XREF-SEARCH-KEY       PIC X(13) VALUE SPACES. 13100000
125800*                                                                 13110000
125900*   X R E F   R E C O R D   R E T U R N E D                       13120000
126000*                                                                 13130000
126100 02  MSD-XREF-RECORD-AREA.                                        13140000
126200     05  MSXREF-KEY-AREA.                                         13150000
126300         07  MSXREF-KEY                   PIC X(12).              13160000
126400         07  MSXREF-WI-CODE               PIC X(01).              13170000
126500     05  MSXREF-EXCHANGE                  PIC X(01).              13180000
126600     05  MSXREF-ADP-NO                    PIC X(07).              13190000
126700/                                                                 13200000
126800 01  FILLER                       PIC X(12) VALUE 'GETMSD AREA'.  13210000
126900*                                                                 13220000
127000*      INITIALIZE GETMSD CALLING PARAMETERS                       13230000
127100*                                                                 13240000
127200 01  GETMSD-INIT-CALLING-INFO.                                    13250000
127300     03  GETMSD-INIT-DEVICE       PIC X           VALUE 'D'.      13260000
127400     03  GETMSD-INIT-ACCESS       PIC X           VALUE 'R'.      13270000
127500     03  GETMSD-INIT-FORMAT       PIC X           VALUE 'N'.      13280000
127600     03  GETMSD-INIT-RETURN       PIC X           VALUE SPACE.    13290000
127700     03  GETMSD-INIT-SEARCH       PIC X(12)       VALUE SPACE.    13300000
127800     03  GETMSD-INIT-WICODE       PIC X           VALUE SPACES.   13310000
127900     03  GETMSD-INIT-CLIENT       PIC XXX         VALUE SPACE.    13320000
           03  FILLER REDEFINES GETMSD-INIT-CLIENT.                     13330000
               05  FILLER                  PIC X(01).                   13340000
               05  GETMSD-INIT-CLIENT-PL2  PIC 9(03) COMP-3.            13350000
128000                                                                  13360000
128100     COPY RECMSDC.                                                13370000
128200/                                                                 13380000
128300 01  WS-SEC-TYPE-PICX.                                            13390000
128400     05  FILLER                       PIC X.                      13400000
128500     05  WS-SEC-TYPE-PICX-BYTE2       PIC X.                      13410000
128600                                                                  13420000
128700 01  WS-SEC-TYPE-COMP3                PIC S9(3) COMP-3.           13430000
128800 01  FILLER REDEFINES WS-SEC-TYPE-COMP3.                          13440000
128900     05  WS-SEC-TYPE-COMP3-BYTE1      PIC X.                      13450000
129000     05  FILLER                       PIC X.                      13460000
129100                                                                  13470000
129200 01  WS-SEC-TYPE-PIC9                 PIC 9(3).                   13480000
129300 01  FILLER REDEFINES WS-SEC-TYPE-PIC9.                           13490000
129400     05  FILLER                       PIC X.                      13500000
129500     05  WS-EXCHANGE-CODE             PIC X.                      13510000
129600         88  CBOE-OPTION    VALUE '1'.                            13520000
129700         88  AMEX-OPTION    VALUE '2'.                            13530000
129800         88  PBW-OPTION     VALUE '3'.                            13540000
129900         88  PSE-OPTION     VALUE '4'.                            13550000
130000         88  NYSE-OPTION    VALUE '8'.                            13560000
130100     05  FILLER                       PIC X.                      13570000
130200                                                                  13580000
130300/                                                                 13590000
130400 01  SYMBOL-SW                        PIC X.                      13600000
130500     88  SYMBOL-IS-FOUND              VALUE 'Y'.                  13610000
130600     88  SYMBOL-NOT-FOUND             VALUE 'N'.                  13620000
130700                                                                  13630000
130800 01  WS-ADP-SYMBOL.                                               13640000
130900     05 WS-ADP-SYMBOL-CHAR OCCURS 13 TIMES PIC X.                 13650000
131000                                                                  13660000
131100 01  WS-FMT-SYMBOL.                                               13670000
131200     05 WS-FMT-SYMBOL-CHAR OCCURS 6 TIMES PIC X.                  13680000
131300                                                                  13690000
131400 01  SUBS.                                                        13700000
131500     05  ADP-SYMBOL-SUB               PIC S9(4) COMP SYNC.        13710000
131600     05  FMT-SYMBOL-SUB               PIC S9(4) COMP SYNC.        13720000
131700     05  SUB                          PIC S9(4) COMP SYNC.        13730000
131800                                                                  13740000
131900 01  EXP-MONTH-TABLE.                                             13750000
132000     05  FILLER                       PIC X(4) VALUE '01AM'.      13760000
132100     05  FILLER                       PIC X(4) VALUE '02BN'.      13770000
132200     05  FILLER                       PIC X(4) VALUE '03CO'.      13780000
132300     05  FILLER                       PIC X(4) VALUE '04DP'.      13790000
132400     05  FILLER                       PIC X(4) VALUE '05EQ'.      13800000
132500     05  FILLER                       PIC X(4) VALUE '06FR'.      13810000
132600     05  FILLER                       PIC X(4) VALUE '07GS'.      13820000
132700     05  FILLER                       PIC X(4) VALUE '08HT'.      13830000
132800     05  FILLER                       PIC X(4) VALUE '09IU'.      13840000
132900     05  FILLER                       PIC X(4) VALUE '10JV'.      13850000
133000     05  FILLER                       PIC X(4) VALUE '11KW'.      13860000
133100     05  FILLER                       PIC X(4) VALUE '12LX'.      13870000
133200                                                                  13880000
133300 01  FILLER REDEFINES EXP-MONTH-TABLE.                            13890000
133400     05  EXP-MONTH-ENTRY OCCURS 12 TIMES                          13900000
133500                         ASCENDING KEY IS EXP-MONTH               13910000
133600                         INDEXED BY EXP-MONTH-IND.                13920000
133700         10  EXP-MONTH                PIC X(2).                   13930000
133800         10  EXP-MONTH-CALL           PIC X(1).                   13940000
133900         10  EXP-MONTH-PUT            PIC X(1).                   13950000
134000                                                                  13960000
134100 01  STR-PRICE-TABLE.                                             13970000
134200     05  FILLER                       PIC X(3) VALUE 'T00'.       13980000
134300     05  FILLER                       PIC X(3) VALUE 'A05'.       13990000
134400     05  FILLER                       PIC X(3) VALUE 'U07'.       14000000
134500     05  FILLER                       PIC X(3) VALUE 'B10'.       14010000
134600     05  FILLER                       PIC X(3) VALUE 'V12'.       14020000
134700     05  FILLER                       PIC X(3) VALUE 'C15'.       14030000
134800     05  FILLER                       PIC X(3) VALUE 'W17'.       14040000
134900     05  FILLER                       PIC X(3) VALUE 'D20'.       14050000
135000     05  FILLER                       PIC X(3) VALUE 'X22'.       14060000
135100     05  FILLER                       PIC X(3) VALUE 'E25'.       14070000
135200     05  FILLER                       PIC X(3) VALUE 'F30'.       14080000
135300     05  FILLER                       PIC X(3) VALUE 'G35'.       14090000
135400     05  FILLER                       PIC X(3) VALUE 'H40'.       14100000
135500     05  FILLER                       PIC X(3) VALUE 'I45'.       14110000
135600     05  FILLER                       PIC X(3) VALUE 'J50'.       14120000
135700     05  FILLER                       PIC X(3) VALUE 'K55'.       14130000
135800     05  FILLER                       PIC X(3) VALUE 'L60'.       14140000
135900     05  FILLER                       PIC X(3) VALUE 'M65'.       14150000
136000     05  FILLER                       PIC X(3) VALUE 'N70'.       14160000
136100     05  FILLER                       PIC X(3) VALUE 'O75'.       14170000
136200     05  FILLER                       PIC X(3) VALUE 'P80'.       14180000
136300     05  FILLER                       PIC X(3) VALUE 'Q85'.       14190000
136400     05  FILLER                       PIC X(3) VALUE 'R90'.       14200000
136500     05  FILLER                       PIC X(3) VALUE 'S95'.       14210000
136600                                                                  14220000
136700 01  FILLER REDEFINES STR-PRICE-TABLE.                            14230000
136800     05  STR-PRICE-ENTRY OCCURS 24 TIMES                          14240000
136900                         ASCENDING KEY IS STR-PRICE               14250000
137000                         INDEXED BY STR-PRICE-IND.                14260000
137100         10  STR-PRICE-A              PIC X(1).                   14270000
137200         10  STR-PRICE                PIC X(2).                   14280000
137300                                                                  14290000
137400/                                                                 14300000
137500 01  FILLER                      PIC X(16) VALUE 'MEMO-REC-WS'.   14310000
137600                                                                  14320000
137700     COPY SRMSS  REPLACING ==:SRMSS:==  BY  ==MSS==.              14330000
137800                                                                  14340000
137900 01  MEMO-TABLE.                                                  14350000
138000     05  MEMO-CLNT               PIC 9(03).                       14360000
138100     05  FILLER                  PIC X(01).                       14370000
LRM050     05  MEMO-CODE-DETAIL                  OCCURS 6 TIMES.        14380000
138300         10  MEMO-VALUE          PIC X(02).                       14390000
138400         10  MEMO-ACCOUNT        PIC X(10).                       14400000
138500         10  MEMO-ONE-WAY-BATCH  PIC X(03).                       14410000
138600         10  MEMO-TWO-WAY-BATCH  PIC X(03).                       14420000
138700                                                                  14430000
138800/                                                                 14440000
138900 01  FILLER                      PIC X(16) VALUE 'P2BKPG-REC-WS'. 14450000
139000 01  BKCNS-ACAT-OUT-WORK-AREA.                                    14460000
139100     02  P2-BK-RECORD.                                            14470000
139200         03  P2-BK-TRID          PIC XXX   VALUE 'BNS'.           14480000
139300         03  FILLER-1  REDEFINES P2-BK-TRID.                      14490000
139400             05  P2-BK-TRID-X        PIC X.                       14500000
139500             05  P2-BK-BATCH-CODE    PIC XX.                      14510000
139600         03  P2-BK-BROKER-NBR    PIC XXX.                         14520000
139700         03  P2-BK-BUY-SELL-CODE PIC X.                           14530000
139800         03  P2-BK-QUANTITY  PIC 9(11) COMP-3.                    14540000
139900         03  P2-BK-QUANTITY-X                                     14550000
140000                    REDEFINES P2-BK-QUANTITY.                     14560000
140100             05  P2-BK-QUANTITY-SW   PIC X.                       14570000
140200             05  FILLER              PIC X(5).                    14580000
140300         03  P2-BK-SECURITY-NBR  PIC X(7).                        14590000
140400         03  FILLER              PIC XX    VALUE SPACES.          14600000
140500         03  P2-BK-ENTRY-CODE    PIC XXX   VALUE 'TFR'.           14610000
140600         03  FILLER              PIC X(5)  VALUE SPACES.          14620000
140700         03  P2-BK-BR-ACCT-T-C.                                   14630000
140800           05  P2-BK-BR-ACCT-T.                                   14640000
140900             07  P2-BK-BRANCH    PIC XXX.                         14650000
141000             07  P2-BK-ACCOUNT   PIC X(5).                        14660000
141100             07  P2-BK-TYPE      PIC 9.                           14670000
141200           05  P2-BK-CHECK-DIGIT PIC X.                           14680000
141300         03  P2-BK-SPIN-DTW      PIC XX    VALUE SPACES.          14690000
141400         03  P2-BK-AMOUNT        PIC 9(16)V99 COMP-3.             14700000
141500         03  P2-BK-AMOUNT-DOLLARS REDEFINES P2-BK-AMOUNT          14710000
141600                                 PIC 9(18)   COMP-3.              14720000
141700         03  P2-BK-DESCRIPTION.                                   14730000
141800             05  FILLER          PIC X(4)  VALUE 'ACAT'.          14740000
141900             05  P2-BK-CNTL-NBR  PIC X(14).                       14750000
142000             05  FILLER          PIC X(5)  VALUE ' BOS '.         14760000
142100             05  P2-BK-CNTRA-BKR PIC X(4).                        14770000
142200         03  FILLER              PIC X     VALUE SPACES.          14780000
142300         03  P2-BK-CURRENCY      PIC XXX   VALUE '000'.           14790000
142400***      03  FILLER              PIC X(10)  VALUE SPACES.         14800000
142500***   ADD P2-BK-VALUE-DT -- 0YYMMDD ---------------->             14810000
142600         03  P2-BK-VALUE-DT      PIC 9(07)  COMP-3.               14820000
142700         03  P2-BK-VALUE-DT-X  REDEFINES P2-BK-VALUE-DT           14830000
142800                                 PIC X(04).                       14840000
142900         03  FILLER              PIC X(06)  VALUE SPACES.         14850000
143000         03  P2-BK-FRACTION      PIC V9(5).                       14860000
143100         03  P2-BK-FRACTION-X    REDEFINES P2-BK-FRACTION         14870000
143200                                 PIC X(05).                       14880000
143300         03  FILLER              PIC X(22)  VALUE SPACES.         14890000
143400     02  P2-BK-TRAILER-RECORD.                                    14900000
139200         03  P2-BKT-TRID           PIC X(03).                     14910000
139300         03  FILLER-1  REDEFINES P2-BKT-TRID.                     14920000
139400             05  P2-BKT-TRID-X     PIC X(01).                     14930000
139500             05  P2-BKT-BATCH-CODE PIC X(02).                     14940000
139600         03  P2-BKT-BROKER-NBR     PIC X(03).                     14950000
139700         03  P2-BKT-BUY-SELL-CODE  PIC X(01).                     14960000
143700         03  P2-BKT-QUANTITY-X     PIC X(06).                     14970000
140300         03  P2-BKT-SECURITY-NBR   PIC X(07).                     14980000
140400         03  FILLER                PIC X(02).                     14990000
144000         03  P2-BKT-ENTRY-CODE     PIC X(03).                     15000000
140600         03  FILLER                PIC X(05).                     15010000
140700         03  P2-BKT-BR-ACCT-T-C.                                  15020000
140800           05  P2-BKT-BR-ACCT-T.                                  15030000
140900             07  P2-BKT-BRANCH     PIC X(03).                     15040000
141000             07  P2-BKT-ACCOUNT    PIC X(05).                     15050000
141100             07  P2-BKT-TYPE       PIC X(01).                     15060000
141200           05  P2-BKT-CHECK-DIGIT  PIC X(01).                     15070000
141300         03  FILLER                PIC X(02).                     15080000
144200         03  P2-BKT-AMOUNT-X       PIC X(10).                     15090000
144300         03  P2-BKT-DESCRIPTION.                                  15100000
144400             05  P2-BKT-RESCODE    PIC X(02).                     15110000
144500             05  P2-BKT-RESDESC    PIC X(25).                     15120000
144600         03  P2-BKT-HYPHEN         PIC X(01) VALUE SPACES.        15130000
144700         03  P2-BKT-FILLER1        PIC X(02) VALUE SPACES.        15140000
LRM034         03  P2-TRAILER-ORIG-SUFFIX.                              15150000
144800           05  P2-BKT-FILLER2        PIC X(11) VALUE SPACES.      15160000
143000           05  P2-BKT-FRACTION       PIC V9(5).                   15170000
143100           05  P2-BKT-FRACTION-X     REDEFINES P2-BKT-FRACTION    15180000
143200                                     PIC X(05).                   15190000
145000           05  FILLER                PIC X(21) VALUE SPACES.      15200000
LRM035           05  P2-BKT-TRAILER-CODE   PIC X     VALUE SPACES.      15210000
145000                                                                  15220000
145100 01  P2-DEBIT-SIGN               PIC X     VALUE '0'.             15230000
145200 01  P2-CREDIT-SIGN              PIC X     VALUE '-'.             15240000
145300 01  P2-QUANTITY-PRESENT         PIC X     VALUE LOW-VALUES.      15250000
145400 01  P2-NO-QUANTITY-PRESENT      PIC X     VALUE SPACE.           15260000
145500                                                                  15270000
145600/                                                                 15280000
145700*                                                                 15290000
145800 01  WS-BR-ACCT-TC.                                               15300000
145900     05  WS-BR-ACCT-T.                                            15310000
146000         10 WS-BRANCH            PIC X(3).                        15320000
146100         10 WS-ACCT              PIC X(5).                        15330000
146200         10 WS-TYPE              PIC 9(1).                        15340000
146300     05  WS-CHECK-DIGIT          PIC X(1).                        15350000
146400                                                                  15360000
146500 01  OB-BR-ACCT-TC.                                               15370000
146600     05  OB-BRANCH               PIC X(3).                        15380000
146700     05  FILLER                  PIC X(1)  VALUE '-'.             15390000
146800     05  OB-ACCT                 PIC X(5).                        15400000
146900     05  FILLER                  PIC X(1)  VALUE '-'.             15410000
147000     05  OB-TYPE                 PIC 9(1).                        15420000
147100     05  OB-CHECK                PIC X(1).                        15430000
147200*                                                                 15440000
147300 01  FILLER                      PIC X(16) VALUE 'T3RDFL-REC-WS'. 15450000
147400                                                                  15460000
147500      COPY ACATCG03 REPLACING ==:CAGE-03:== BY ==CAGE-03==.       15470000
147600/                                                                 15480000
147700 01  FILLER                      PIC X(16) VALUE 'CAG2FL-REC-WS'. 15490000
147800                                                                  15500000
147900     COPY ACATCG01 REPLACING ==:CAGE-01:== BY ==CAGE==.           15510000
148000/                                                                 15520000
148100     COPY XBILLCOB.                                               15530000
148200/                                                                 15540000
148300     COPY CPRTWORK.                                               15550000
148400/                                                                 15560000
148500 01  REG-OPT-RECORD-WS.                                           15570000
148600     COPY BNWREGOP.                                               15580000
148700/                                                                 15590000
148800 01  HOLD-PW-LINE                   PIC X(133) VALUE SPACES.      15600000
148900                                                                  15610000
149000 01  DATE-WORK-AREA.                                              15620000
149100     03  DATE-WORK-CC                PIC X(2).                    15630000
149200     03  DATE-WORK-YYMMDD            PIC X(6).                    15640000
149300                                                                  15650000
149400 01  DATE-WORK1-AREA.                                             15660000
149500     03  DATE-WORK1-MM               PIC X(2).                    15670000
149600     03  DATE-WORK1-DD               PIC X(2).                    15680000
149700     03  DATE-WORK1-YY               PIC X(2).                    15690000
149800 01  DATE-WORK1-AREAN  REDEFINES DATE-WORK1-AREA PIC 9(6).        15700000
149900                                                                  15710000
150000 01  WS-STTLM-DATE.                                               15720000
150100     05  WS-STTLM-DATE-CC        PIC 9(02).                       15730000
150200     05  WS-STTLM-DATE-YY        PIC 9(02).                       15740000
150300     05  FILLER                  PIC 9(01).                       15750000
150400     05  WS-STTLM-DATE-MM        PIC 9(02).                       15760000
150500     05  FILLER                  PIC 9(01).                       15770000
150600     05  WS-STTLM-DATE-DD        PIC 9(02).                       15780000
150700 01  WS-STTLM-DT-CCYYMMDD.                                        15790000
150800     05  WS-STTLM-DT-CC          PIC 9(02).                       15800000
150900     05  WS-STTLM-DT-YY          PIC 9(02).                       15810000
151000     05  WS-STTLM-DT-MM          PIC 9(02).                       15820000
151100     05  WS-STTLM-DT-DD          PIC 9(02).                       15830000
151200 01  WS-VALUE-DT-YYMMDD          PIC 9(06).                       15840000
151300 01  FILLER REDEFINES WS-VALUE-DT-YYMMDD.                         15850000
151400     05  WS-VALUE-DT-YY          PIC 9(02).                       15860000
151500     05  WS-VALUE-DT-MM          PIC 9(02).                       15870000
151600     05  WS-VALUE-DT-DD          PIC 9(02).                       15880000
151700 01  WS-DTSEARCH-DATE-CCYYMMDD.                                   15890000
151800     05  WS-DTSEARCH-DATE-CC     PIC X(02).                       15900000
151900     05  WS-DTSEARCH-DATE-YY     PIC X(02).                       15910000
152000     05  WS-DTSEARCH-DATE-MM     PIC X(02).                       15920000
152100     05  WS-DTSEARCH-DATE-DD     PIC X(02).                       15930000
152200 01  WS-DTSEARCH-DATE-9          PIC 9(08).                       15940000
152300 01  WS-LEAP-YEAR-AREA.                                           15950000
152400     05  WS-YEAR                     PIC X(02).                   15960000
152500     05  WS-YEAR-N    REDEFINES WS-YEAR                           15970000
152600                                     PIC 9(02).                   15980000
152700     05  WS-DIVIDED                  PIC 9(03).                   15990000
152800     05  WS-REMAIN                   PIC 9(03).                   16000000
152900     05  WS-LEAP-YR-SW               PIC X(01).                   16010000
153000         88  WS-LEAP-YR                        VALUE 'Y'.         16020000
153100 01  WS-CATPPL-TABLE.                                             16030000
153200     03  WS-CATPPL-RECORD-COUNT      PIC S9(4) COMP VALUE ZEROS.  16040000
153300     03  WS-CATPPL-RECORD OCCURS 500 TIMES.                       16050000
153410         05  WS-CATPPL-BROKER        PIC X(04).                   16060000
153430         05  WS-CATPPL-BROKER-NAME   PIC X(50).                   16070000
153440                                                                  16080000
LRM052 01  WS-CL-CNTL-NBR.                                              16080108
LRM052     05  WS-CL-NBR                   PIC X(03).                   16080208
LRM052     05  WS-CL-CNTL                  PIC X(14).                   16080308
LRM052 01  WS-STP-TABLE.                                                16081000
LRM052     03  WS-STP-RECORD-COUNT         PIC S9(9) COMP VALUE ZEROS.  16082000
LRM052     03  WS-STP-RECORD OCCURS 0 TO 20000 TIMES                    16083010
LRM052                   DEPENDING ON WS-STP-RECORD-COUNT               16083110
LRM052                   ASCENDING KEY IS WS-STP-CLIENT-CNTL            16083210
LRM052                   INDEXED BY STP-IND.                            16083310
LRM052        04  WS-STP-CLIENT-CNTL       PIC X(17).                   16083410
LRM052        04  FILLER REDEFINES WS-STP-CLIENT-CNTL.                  16083510
LRM052         05  WS-STP-CLIENT           PIC X(03).                   16084000
LRM052         05  WS-STP-CONTROL-NBR      PIC X(14).                   16085000
153440                                                                  16086000
153450 01  ERROR-WORK-LINE.                                             16090000
153460     03  ERROR-WORK1                 PIC X(100).                  16100000
153470     03  ERROR-WORK2                 PIC X(33).                   16110000
153480 01  TOTALS-TITLE-LINE.                                           16120000
153490     03  FILLER                     PIC X     VALUE '1'.          16130000
153500     03  FILLER                     PIC X(2)  VALUE SPACES.       16140000
153600     03  FILLER                     PIC X(6)  VALUE 'PGM = '.     16150000
153700     03  TTL-PGM-NAME               PIC X(8).                     16160000
153800     03  FILLER                     PIC X(7)  VALUE 'CLIENT '.    16170000
153900     03  TTL-CLIENT-NUMBER          PIC X(3).                     16180000
154000     03  FILLER                     PIC X(2)  VALUE SPACES.       16190000
154100     03  TTL-DESC                   PIC X(50) VALUE               16200000
154200     '           A C A T   T O T A L S              '.            16210000
154300     03  FILLER                     PIC X(12) VALUE               16220000
154400     '      DATE  '.                                              16230000
154500     03  TTL-DATE                   PIC X(08) VALUE SPACE.        16240000
154600     03  FILLER                     PIC X(11) VALUE '     PAGE  '.16250000
154700     03  TTL-PAGE                   PIC ZZ,ZZ9.                   16260000
154800                                                                  16270000
154900 01  TITLE-LINE1.                                                 16280000
155000     03  FILLER                     PIC X     VALUE '1'.          16290000
155100     03  FILLER                     PIC X(2)  VALUE SPACES.       16300000
155200     03  FILLER                     PIC X(6)  VALUE 'PGM = '.     16310000
155300     03  TL-PGM-NAME                PIC X(8).                     16320000
155400     03  FILLER                     PIC X(7)  VALUE 'CLIENT '.    16330000
155500     03  TL-CLIENT-NUMBER           PIC X(3).                     16340000
155600     03  FILLER                     PIC X(2)  VALUE SPACES.       16350000
155700     03  TL-DESC                    PIC X(50) VALUE               16360000
155800     '   A C A T   E X C E P T I O N   R E P O R T  '.            16370000
155900     03  FILLER                     PIC X(12) VALUE               16380000
156000     '      DATE  '.                                              16390000
156100     03  TL-DATE                    PIC X(8).                     16400000
156200     03  FILLER                     PIC X(11) VALUE '     PAGE  '.16410000
156300     03  T-PAGE                     PIC ZZ,ZZ9.                   16420000
156400                                                                  16430000
156500 01  HDG1.                                                        16440000
156600     03  FILLER                  PIC X     VALUE ZERO.            16450000
LRM024     03  FILLER                  PIC X(3)  VALUE SPACES.          16460000
156800     03  FILLER                  PIC X(13) VALUE ' CL-BR-ACCT'.   16470000
156900     03  FILLER                  PIC X(3)  VALUE SPACES.          16480000
157000     03  FILLER                  PIC X(9)  VALUE '  CUSIP  '.     16490000
157100     03  FILLER                  PIC X(2)  VALUE SPACES.          16500000
157200     03  FILLER                  PIC X(8)  VALUE ' CONTROL'.      16510000
157300     03  FILLER                  PIC X(2)  VALUE SPACES.          16520000
157400     03  FILLER                  PIC X(3)  VALUE 'S/B'.           16530000
157500     03  FILLER                  PIC X(13) VALUE SPACES.          16540000
157600     03  FILLER                  PIC X(21) VALUE 'DESCRIPTION'.   16550000
157700                                                                  16560000
157800 01  HDG2.                                                        16570000
157900     03  FILLER                  PIC X     VALUE SPACES.          16580000
LRM024     03  FILLER                  PIC X     VALUE SPACES.          16590000
158100     03  FILLER                  PIC X(16) VALUE ALL '-'.         16600000
158200     03  FILLER                  PIC X(2)  VALUE SPACES.          16610000
158300     03  FILLER                  PIC X(9)  VALUE '---------'.     16620000
158400     03  FILLER                  PIC X(2)  VALUE SPACES.          16630000
158500     03  FILLER                  PIC X(8)  VALUE '--------'.      16640000
158600     03  FILLER                  PIC X(2)  VALUE SPACES.          16650000
158700     03  FILLER                  PIC X(3)  VALUE '---'.           16660000
158800     03  FILLER                  PIC X(3)  VALUE SPACES.          16670000
158900     03  FILLER                  PIC X(50)                        16680000
159000         VALUE '-------------------------------------'.           16690000
159100                                                                  16700000
159200 01  DETAIL-LINE-1.                                               16710000
159300     03  FILLER                  PIC X     VALUE ZERO.            16720000
159400     03  FILLER                  PIC X     VALUE SPACES.          16730000
159500     03  DL-CLIENT-NO            PIC XXX.                         16740000
159600     03  FILLER                  PIC X     VALUE '-'.             16750000
159700     03  DL-BRANCH               PIC XXX.                         16760000
159800     03  FILLER                  PIC X     VALUE '-'.             16770000
159900     03  DL-ACCOUNT              PIC X(5).                        16780000
LRM024     03  FILLER                  PIC X     VALUE '-'.             16790000
LRM024     03  DL-ACCOUNT-TYPE         PIC X(1).                        16800000
LRM024     03  DL-ACCOUNT-CKDGT        PIC X(1).                        16810000
160000     03  FILLER                  PIC X(1)  VALUE SPACES.          16820000
160100     03  DL-CUSIP                PIC X(9).                        16830000
160200     03  FILLER                  PIC X(1)  VALUE SPACES.          16840000
160300     03  DL-CONTROL-NBR          PIC X(12).                       16850000
160400     03  FILLER                  PIC X(1)  VALUE SPACES.          16860000
160500     03  DL-STK-BND              PIC X.                           16870000
160600     03  FILLER                  PIC X(1)  VALUE SPACES.          16880000
160700     03  DL-DESCRIPTION          PIC X(76).                       16890000
160800     03  FILLER                  PIC X(1)  VALUE SPACES.          16900000
160900     03  DL-SETTLE-DATE          PIC X(8).                        16910000
161000                                                                  16920000
161100 01  DETAIL-LINE-1A.                                              16930000
161200     05  FILLER                  PIC X(60)  VALUE SPACES.         16940000
LRM024     05  DL-DESCRIPTION-2        PIC X(64).                       16950000
161400                                                                  16960000
161500 01  DETAIL-LINE-2.                                               16970000
161600     03  DL-2-CTL                PIC X     VALUE SPACE.           16980000
LRM024     03  FILLER                  PIC X(41) VALUE SPACE.           16990000
161800     03  DL-ERROR-AREA.                                           17000000
161900         05  FILLER              PIC XXX   VALUE '** '.           17010000
162000         05  DL-ERROR-VALUE      PIC X(15).                       17020000
162100         05  FILLER              PIC XXX   VALUE ' **'.           17030000
162200         05  FILLER              PIC X(3)  VALUE SPACES.          17040000
162300         05  DL-ERROR-MSG        PIC X(25).                       17050000
162400         05  FILLER              PIC XX    VALUE SPACES.          17060000
LRM024 01  DETAIL-LINE-3.                                               17070000
LRM024     03  DL-3-CTL                PIC X     VALUE SPACE.           17080000
LRM024     03  FILLER                  PIC X(03) VALUE SPACE.           17090000
LRM024     03  FILLER                  PIC X(07) VALUE 'CONTRA:'.       17100000
LRM024     03  DL-3-CONTRA             PIC X(04).                       17110000
LRM024     03  FILLER                  PIC X(14) VALUE '   SETTLE LOC:'.17120000
LRM024     03  DL-3-SLOC               PIC X(02).                       17130000
LRM024     03  FILLER                  PIC X(18) VALUE                  17140000
LRM024                                           '   SETTLE LOC RSN:'.  17150000
LRM024     03  DL-3-SLOC-RSN           PIC X(04).                       17160000
LRM024     03  FILLER                  PIC X(12) VALUE '   CURRENCY:'.  17170000
LRM024     03  DL-3-ISO-CRNCY-CD       PIC X(03).                       17180000
LRM024     03  FILLER                  PIC X(15) VALUE                  17190000
LRM024                                           '           QTY:'.     17200000
LRM024     03  DL-3-QTY                PIC ZZZ,ZZZ,ZZZ,ZZZ.9999-.       17210000
LRM024     03  FILLER                  PIC X(07) VALUE                  17220000
LRM024                                           '   AMT:'.             17230000
LRM024     03  DL-3-AMT                PIC ZZZ,ZZZ,ZZZ,ZZZ.99-.         17240000
LRM024 01  DETAIL-LINE-4.                                               17250000
LRM024     03  DL-4-CTL                PIC X     VALUE SPACE.           17260000
LRM024     03  FILLER                  PIC X(03) VALUE SPACE.           17270000
LRM024     03  DL-4-RECORD-TYPE        PIC X(02).                       17280000
LRM024     03  FILLER                  PIC X(06) VALUE ' CMNT:'.        17290000
LRM024     03  DL-4-COMMENT            PIC X(120).                      17300000
162500 01  DETAIL1-RECORD-LAYOUT.                                       17310000
162600                                                                  17320000
162700     03  DET-ERR-1A.                                              17330000
162800                                                                  17340000
162900         05  FILLER                     PIC X(50)  VALUE          17350000
163000         '....5...10....5...20....5...30....5...40....5...50'.    17360000
163100         05  FILLER                     PIC X(50)  VALUE          17370000
163200         '....5...60....5...70....5...80....5...90....5..100'.    17380000
163300         05  FILLER                     PIC X(33)  VALUE SPACES.  17390000
163400                                                                  17400000
163500     03  DET-DATA-1A.                                             17401000
163600                                                                  17402000
163700         05  DETAIL1-1-100               PIC X(100).              17403000
163800         05  FILLER                      PIC X(33).               17404000
163900                                                                  17405000
164000     03  DET-ERR-1B.                                              17406000
164100                                                                  17407000
164200         05  FILLER                     PIC X(33)  VALUE          17408000
164300         '....5..110....5..120....5..130...'.                     17409000
164400         05  FILLER                     PIC X(100) VALUE SPACES.  17410000
164500                                                                  17420000
164600     03  DET-DATA-1B.                                             17430000
164700                                                                  17440000
164800         05  DETAIL1-101-133             PIC X(33).               17450000
164900         05  FILLER                      PIC X(100) VALUE SPACES. 17460000
165000                                                                  17470000
165100 01  DETAIL2-RECORD-LAYOUT.                                       17480000
165200                                                                  17490000
165300     03  DET-ERR-2A.                                              17500000
165400                                                                  17510000
165500         05  FILLER                     PIC X(50)  VALUE          17520000
165600         '....5...10....5...20....5...30....5...40....5...50'.    17530000
165700         05  FILLER                     PIC X(50)  VALUE          17540000
165800         '....5...60....5...70....5...80....5...90....5..100'.    17550000
165900         05  FILLER                     PIC X(33).                17560000
166000                                                                  17570000
166100     03  DET-DATA-2A.                                             17580000
166200                                                                  17590000
166300         05  DETAIL2-1-100              PIC X(100).               17600000
166400         05  FILLER                     PIC X(33).                17610000
166500                                                                  17620000
166600     03  DET-ERR-2B.                                              17630000
166700                                                                  17640000
166800         05  FILLER                     PIC X(33)  VALUE          17650000
166900         '....5..110....5..120....5..130...'.                     17651000
167000         05  FILLER                     PIC X(100) VALUE SPACES.  17651100
167100                                                                  17651200
167200     03  DET-DATA-2B.                                             17651300
167300                                                                  17651400
167400         05  DETAIL2-101-133            PIC X(33).                17651500
167500         05  FILLER                     PIC X(100).               17651600
167600                                                                  17651700
167700 01  DETAIL3-RECORD-LAYOUT.                                       17651800
167800                                                                  17651900
167900     03  DET-ERR-3A.                                              17652000
168000                                                                  17652100
168100         05  FILLER                     PIC X(50)  VALUE          17652200
168200         '....5...10....5...20....5...30....5...40....5...50'.    17652300
168300         05  FILLER                     PIC X(50)  VALUE          17652400
168400         '....5...60....5...70....5...80....5...90....5..100'.    17652500
168500         05  FILLER                     PIC X(33)  VALUE SPACES.  17652600
168600                                                                  17652700
168700     03  DET-DATA-3A.                                             17652800
168800                                                                  17652900
168900         05  DETAIL3-1-100               PIC X(100).              17653000
169000         05  FILLER                      PIC X(33).               17654000
169100                                                                  17655000
169200     03  DET-ERR-3B.                                              17656000
169300                                                                  17657000
169400         05  FILLER                     PIC X(33)  VALUE          17658000
169500         '....5..110....5..120....5..130...'.                     17659000
169600         05  FILLER                     PIC X(100) VALUE SPACES.  17660000
169700                                                                  17670000
169800     03  DET-DATA-3B.                                             17680000
169900                                                                  17690000
170000         05  DETAIL3-101-133            PIC X(33).                17700000
170100         05  FILLER                     PIC X(100) VALUE SPACES.  17710000
170200                                                                  17720000
170300 01  FUND-SERV-TOTAL-LINE.                                        17730000
170400     03  FILLER                     PIC X     VALUE '0'.          17740000
170500     03  FILLER                     PIC X(11) VALUE SPACES.       17750000
170600     03  FILLER                     PIC X(28) VALUE               17760000
170700     'TOTAL FUND/SERV DELIVER     '.                              17770000
170800     03  CTL-FS-DELV                PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      17780000
170900     03  FILLER                     PIC X(10) VALUE SPACES.       17790000
171000     03  FILLER                     PIC X(26) VALUE               17800000
171100     'TOTAL FUND/SERV RECEIVE   '.                                17810000
171200     03  CTL-FS-RECV                PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      17820000
171300                                                                  17830000
171400 01  CLIENT-TOTAL-LINE.                                           17840000
171500     03  FILLER                     PIC X     VALUE '0'.          17850000
171600     03  FILLER                     PIC X(11) VALUE SPACES.       17860000
171700     03  FILLER                     PIC X(28) VALUE               17870000
171800     'TOTAL ACCOUNTS FOR CLIENT   '.                              17880000
171900     03  CTL-ACCOUNTS               PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      17890000
172000     03  FILLER                     PIC X(10) VALUE SPACES.       17900000
172100     03  FILLER                     PIC X(26) VALUE               17910000
172200     'TOTAL ASSETS FOR CLIENT   '.                                17920000
172300     03  CTL-ASSETS                 PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      17930000
172400                                                                  17940000
172500 01  CLIENT-P2-COL-HEADER.                                        17950000
172600     03  FILLER              PIC X     VALUE ZERO.                17960000
172700     03  FILLER              PIC X(11) VALUE 'DESTINATION'.       17970000
172800     03  FILLER                  PIC X(15) VALUE SPACES.          17980000
172900     03  FILLER              PIC X(20) VALUE '   DEBIT VALUE'.    17990000
173000     03  FILLER              PIC X(2)  VALUE SPACES.              18000000
173100     03  FILLER              PIC X(20) VALUE '  CREDIT VALUE'.    18010000
173200     03  FILLER              PIC X(2)  VALUE SPACES.              18020000
173300     03  FILLER              PIC X(19) VALUE ' DEBIT QUANTITY'.   18030000
173400     03  FILLER              PIC X(2)  VALUE SPACES.              18040000
173500     03  FILLER              PIC X(19) VALUE ' CREDIT QUANTITY'.  18050000
173600                                                                  18060000
173700 01  CLIENT-P2-TOTAL-LINE.                                        18070000
173800     03  FILLER                     PIC X     VALUE SPACE.        18080000
173900     03  CTL-P2-DEST-LIT            PIC X(08) VALUE SPACES.       18090000
174000     03  CTL-P2-CNS-ACCT            PIC X(15) VALUE SPACES.       18100000
174100     03  FILLER                     PIC X(02) VALUE SPACES.       18110000
174200     03  CTL-P2-DB-VALUE            PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99.     18120000
174300     03  FILLER                     PIC X(2)  VALUE SPACES.       18130000
174400     03  CTL-P2-CR-VALUE            PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99.     18140000
174500     03  FILLER                     PIC X(2)  VALUE SPACES.       18150000
174600     03  CTL-P2-DB-QTY              PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18160000
174700     03  CTL-P2-DB-QTY-FS REDEFINES CTL-P2-DB-QTY                 18170000
174800                                    PIC ZZZZZ,ZZZ,ZZ9.99999.      18180000
174900     03  FILLER                     PIC X(2)  VALUE SPACES.       18190000
175000     03  CTL-P2-CR-QTY              PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18200000
175100     03  CTL-P2-CR-QTY-FS REDEFINES CTL-P2-CR-QTY                 18210000
175200                                    PIC ZZZZZ,ZZZ,ZZ9.99999.      18220000
175300                                                                  18230000
175400 01  CLIENT-P2-TOTAL-LINE-LINE.                                   18240000
175500     03  FILLER                     PIC X     VALUE SPACE.        18250000
175600     03  FILLER                     PIC X(26) VALUE SPACES.       18260000
175700     03  FILLER                     PIC X(20)                     18270000
175800         VALUE '--------------------'.                            18280000
175900     03  FILLER                     PIC X(2)  VALUE SPACES.       18290000
176000     03  FILLER                     PIC X(20)                     18300000
176100         VALUE '--------------------'.                            18310000
176200     03  FILLER                     PIC X(2)  VALUE SPACES.       18320000
176300     03  FILLER                     PIC X(19)                     18330000
176400         VALUE '-------------------'.                             18340000
176500     03  FILLER                     PIC X(2)  VALUE SPACES.       18350000
176600     03  FILLER                     PIC X(19)                     18360000
176700         VALUE '-------------------'.                             18370000
176800                                                                  18380000
176900 01  CLIENT-REC-COL-HEADER.                                       18390000
177000     03  FILLER              PIC X     VALUE '-'.                 18400000
177100     03  FILLER              PIC X(27) VALUE SPACES.              18410000
177200     03  FILLER              PIC X(19) VALUE '  A C A T     '.    18420000
177300     03  FILLER              PIC X(2)  VALUE SPACES.              18430000
177400     03  FILLER              PIC X(19) VALUE '  P E N D     '.    18440000
177500     03  FILLER              PIC X(2)  VALUE SPACES.              18450000
177600     03  FILLER              PIC X(19) VALUE '  T O T A L   '.    18460000
177700                                                                  18470000
177800 01  CLIENT-REC-TOTAL-LINE.                                       18480000
177900     03  FILLER                     PIC X     VALUE SPACE.        18490000
178000     03  CTL-REC-LITERAL            PIC X(20).                    18500000
178100     03  FILLER                     PIC X(2)  VALUE SPACES.       18510000
178200     03  CTL-REC-TOT-ACAT           PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18520000
178300     03  FILLER                     PIC X(2)  VALUE SPACES.       18530000
178400     03  CTL-REC-TOT-PEND           PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18540000
178500     03  FILLER                     PIC X(2)  VALUE SPACES.       18550000
178600     03  CTL-REC-TOT-TOT            PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18560000
178700     03  FILLER                     PIC X(2)  VALUE SPACES.       18570000
178800                                                                  18580000
178900 01  FINAL-TOTAL-LINE.                                            18590000
179000     03  FDL-CTL                    PIC X     VALUE ' '.          18600000
179100     03  FILLER                     PIC X(26) VALUE               18610000
179200     'TOTAL NUMBER OF CLIENTS   '.                                18620000
179300     03  TOT-CLIENTS                PIC Z,ZZ9.                    18630000
179400     03  FILLER                     PIC X(27) VALUE               18640000
179500     '          TOTAL ACCOUNTS   '.                               18650000
179600     03  TOT-ACTS                   PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18660000
179700     03  FILLER                     PIC X(25) VALUE               18670000
179800     '          TOTAL ASSETS   '.                                 18680000
179900     03  TOT-ASSETS                 PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.      18690000
180000                                                                  18700000
180100/                                                                 18710000
180200 77  B1-SUB                           PIC 9(4)    VALUE 0.        18720000
180300 01  B1-TABLE-AREA.                                               18730000
180400     05  B1-TABLE   OCCURS     500 TIMES                          18740000
180600                   INDEXED BY B1-IND.                             18750000
180700         10  B1-ADP-CL-NO             PIC 9(03).                  18760000
180800         10  FILLER                   PIC X(01).                  18770000
180900         10  B1-SERVICE-STATUS        PIC X(01).                  18780000
181000         10  B1-UPDATE-SMA            PIC X(01).                  18790000
181100         10  B1-CLRNG-NO              PIC X(04).                  18800000
181200         10  B1-OFFSET-ACC-NUM        PIC X(09).                  18810000
181300         10  B1-OFFSET-ROLL-ACC       PIC X(09).                  18820000
181400         10  B1-OPTION-OFFSET-IND     PIC X(01).                  18830000
LRM021         10  B1-OPTION-OFFSET-ACCOUNT PIC X(09).                  18840000
181500         10  B1-ENTRY-CODE-DEL        PIC X(03).                  18850000
181600         10  B1-ENTRY-CODE-REC        PIC X(03).                  18860000
181700         10  B1-ENTRY-DEL-ROLL        PIC X(03).                  18870000
181800         10  B1-ENTRY-REC-ROLL        PIC X(03).                  18880000
LRM013         10  B1-ENTRY-PTR-DEL-ROLL    PIC X(03).                  18890000
LRM013         10  B1-ENTRY-PTR-REC-ROLL    PIC X(03).                  18900000
181900         10  B1-FRAC-QTY-PROC         PIC X(01).                  18910000
182000         10  B1-MISC-IRA-CLIENT       PIC X(01).                  18920000
182100         10  B1-ROLLOVER-CLIENT       PIC X(01).                  18930000
182200         10  B1-BLOTTER-CODE          PIC X(02).                  18940000
182300         10  B1-OFFSET-AMT-BYPASS     PIC X(01).                  18950000
182400         10  B1-FUND-SERV-CLIENT      PIC X(01).                  18960000
182500         10  B1-FAILS-T3-OR-T4        PIC X(01).                  18970000
182600         10  B1-POST-STL-REJ-BKP      PIC X(01).                  18980000
182700****     10  B1-PEND-STL-ACCT         PIC X(09).                  18990000
182800         10  B1-RCV-PEND-STL-ACCT     PIC X(09).                  19000000
182900         10  B1-DEL-PEND-STL-ACCT     PIC X(09).                  19010000
183000         10  B1-PEND-STL-BATCH-CODE   PIC X(03).                  19020000
LRM005         10  B1-SHADOW-POST           PIC X(01).                  19030000
LRM022         10  B1-ACAT-BOOK-DEBIT-BAL-TYPE1 PIC X(01).              19040000
183100         10  B1-MFRS-ACTIVE           PIC X(01).                  19050000
183200         10  B1-MFRS-BB-OFFSET        PIC X(09).                  19060000
183300         10  B1-MFRS-OMNIBUS-OFFSET   PIC X(09).                  19070000
LRM003         10  B1-MFRS-DST-MFE-OFFSET   PIC X(09).                  19080000
183310         10  B1-MFRS-NSCCSRC-OFFSET   PIC X(09).                  19090000
183400         10  B1-MFRS-BN-OFFSET        PIC X(09).                  19100000
LRM029         10  B1-PNC-SURPAS-OFFSET     PIC X(09).                  19110000
LRM052         10  B1-ACAT-CNS-LONG-R-ACCT  PIC X(09).                  19120000
LRM052         10  B1-ACAT-CNS-SHORT-S-ACCT PIC X(09).                  19130000
LRM002         10  B1-MFN-OMNIBUS-MULTI-PLAT-OPT  PIC X(1).             19140000
183500         10  B1-ACAT-P2-TRAILER       PIC X.                      19150000
183600         10  B1-RECV-NON-CASH-TYP     PIC X.                      19160000
183700         10  B1-RES-CREDIT-P2-TRLR    PIC X.                      19170000
183800         10  B1-ENTRY-DEL-CASH        PIC X(03).                  19180000
183900         10  B1-ENTRY-REC-CASH        PIC X(03).                  19190000
184000         10  B1-BEARER-BOND-OPT       PIC X.                      19200000
184100         10  B1-RESTRICTED-OPT        PIC X.                      19210000
184200         10  B1-MFRS-NOLOAD-CLIENT    PIC X.                      19220000
               10  B1-ACAT-MFC-RECEIVER-ACCOUNT   PIC X(9).             19230000
               10  B1-ACAT-MFC-DELIVERER-ACCOUNT  PIC X(9).             19240000
               10  B1-ACAT-DONT-BOOK-MFC-TRANSF   PIC X(1).             19250000
               10  B1-ACAT-MFC-BOOKING-BATCH-ENT.                       19260000
                   15  B1-ACAT-MFC-BOOKING-BATCH  PIC X(2).             19270000
                   15  B1-ACAT-MFC-BOOKING-ENTRE  PIC X(3).             19280000
LRM013         10  B1-ACAT-FRV-TRAILER            PIC X(30).            19290000
LRM013         10  B1-ACAT-RCL-TRAILER            PIC X(30).            19300000
LRM013         10  B1-ACAT-PTR-TRAILER            PIC X(30).            19310000
LRM013         10  B1-ACAT-PTD-TRAILER            PIC X(30).            19320000
LRM025         10  B1-ACAT-PTF-TRAILER            PIC X(30).            19330000
LRM013         10  B1-ACAT-MFC-TRAILER            PIC X(30).            19340000
LRM013         10  B1-ACAT-RCL-BATCH-ENTRY.                             19350000
LRM013             15  B1-ACAT-RCL-BATCH          PIC X(2).             19360000
LRM013             15  B1-ACAT-RCL-ENTRY          PIC X(3).             19370000
LRM013         10  B1-ACAT-PTR-BATCH-ENTRY.                             19380000
LRM013             15  B1-ACAT-PTR-BATCH          PIC X(2).             19390000
LRM013             15  B1-ACAT-PTR-ENTRY          PIC X(3).             19400000
LRM013         10  B1-ACAT-PTD-BATCH-ENTRY.                             19410000
LRM013             15  B1-ACAT-PTD-BATCH          PIC X(2).             19420000
LRM013             15  B1-ACAT-PTD-ENTRY          PIC X(3).             19430000
LRM031         10  B1-ACAT-PTR-BATCH-ENTRY-RECV.                        19440000
LRM031             15  B1-ACAT-PTR-BATCH-RECV     PIC X(2).             19450000
LRM031             15  B1-ACAT-PTR-ENTRY-RECV     PIC X(3).             19460000
LRM031         10  B1-ACAT-PTR-BATCH-ENTRY-DELIV.                       19470000
LRM031             15  B1-ACAT-PTR-BATCH-DELIV    PIC X(2).             19480000
LRM031             15  B1-ACAT-PTR-ENTRY-DELIV    PIC X(3).             19490000
LRM031         10  B1-ACAT-PTD-BATCH-ENTRY-RECV.                        19500000
LRM031             15  B1-ACAT-PTD-BATCH-RECV     PIC X(2).             19510000
LRM031             15  B1-ACAT-PTD-ENTRY-RECV     PIC X(3).             19520000
LRM031         10  B1-ACAT-PTD-BATCH-ENTRY-DELIV.                       19530000
LRM031             15  B1-ACAT-PTD-BATCH-DELIV    PIC X(2).             19540000
LRM031             15  B1-ACAT-PTD-ENTRY-DELIV    PIC X(3).             19550000
LRM025         10  B1-ACAT-PTF-BATCH-ENTRY.                             19560000
LRM025             15  B1-ACAT-PTF-BATCH          PIC X(2).             19570000
LRM025             15  B1-ACAT-PTF-ENTRY          PIC X(3).             19580000
LRM013         10  B1-ACAT-FRV-BATCH-ENTRY.                             19590000
LRM013             15  B1-ACAT-FRV-BATCH          PIC X(2).             19600000
LRM013             15  B1-ACAT-FRV-ENTRY          PIC X(3).             19610000
YH0001         10  B1-NTWRK-CNTL-CD               PIC X.                19620000
YH0001         10  B1-DST-OFFSET                  PIC X.                19630000
YH0001         10  B1-NS-BRCH-OFFSET              PIC X.                19640000
LRM032         10  B1-SFK-RSEC-MEMO               PIC X(2).             19650000
LRM036         10  B1-ACAT-BLOT-CD-OVERD-NO       PIC 9(3) COMP-3.      19660000
LRM036         10  B1-ACAT-BLOT-CD-OVERD-ENTRY   OCCURS 20.             19670000
LRM036             15  B1-ACAT-BLOT-CD-OVERD-LOC-RSN  PIC X(4).         19680000
LRM036             15  B1-ACAT-BLOT-CD-OVERD-CODE     PIC X(2).         19690000
LRM041         10  B1-ACAT-FUNDSERV-PEND-MEMO     PIC X(2).             19700000
YH0001 01  PASS-DATA.                                                   19700100
YH0001     03  PASS-PGM-NAME     PIC X(08)  VALUE 'CAT650'.             19700200
YH0001     03  PASS-MESSAGE      PIC X(45)  VALUE SPACES.               19700300
YH0001 01  PASS-MSG.                                                    19700400
YH0001     05  PASS-TABLE-NAME PIC X(15) VALUE SPACES.                  19700500
YH0001     05  FILLER          PIC X(21) VALUE                          19700600
YH0001                                   ' TABLE IS 85% FULL : '.       19700700
YH0001     05  PASS-COUNTER    PIC Z(09) VALUE ZEROES.                  19700800
YH0001 01  INFSND-MSG-SEND-SW-AREA.                                     19700900
YH0001     03  INFSND-MSG-SEND-SW          PIC X(01) VALUE SPACE.       19701000
YH0001         88  INFSND-MSG-SEND-YES               VALUE 'Y'.         19702000
YH0001 01  MFC-ERR-AREA.                                                19703000
YH0001     05  MFC-MAX   PIC  9(4) COMP-3  VALUE 0.                     19704000
YH0001     05  MFC-ERR   OCCURS 500 TIMES                               19705000
YH0001                   INDEXED BY MFC-IND.                            19706000
YH0001         10  MFC-ERR-LINE1            PIC X(133).                 19707000
YH0001         10  MFC-ERR-LINE1A           PIC X(133).                 19708000
YH0001         10  MFC-ERR-LINE2            PIC X(133).                 19709000
YH0001         10  MFC-ERR-LINE3            PIC X(133).                 19710000
YH0001         10  MFC-ERR-LINE4            PIC X(133).                 19720000
YH0001         10  MFC-ERR-LINE5            PIC X(133).                 19730000
                                                                        19740000
LRM002     COPY NTWIOREC REPLACING ==:NTWIO:== BY ==NTWIO==.            19750000
184950/                                                                 19760000
LRM004     COPY ACATPRTC.                                               19770000
185000/                                                                 19780000
LRM014     COPY ACAT866 REPLACING ==:FMT:== BY ==FMT-ROLL==.            19790000
LRM014/                                                                 19800000
LRM022     COPY ACATCASH REPLACING ==:PFX:== BY ==TYPE2-CASH==.         19810000
LRM022/                                                                 19820000
185100***************************************************************** 19830000
185200 LINKAGE SECTION.                                                 19840000
185300***************************************************************** 19850000
185400 01  PARM-AREA.                                                   19860000
185500     05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        19870000
185600         88  PARM-LENGTH-VALID                    VALUE +16.      19880000
185700     05  PARM-INFO.                                               19890000
185800         10  PARM-STREAM              PIC X(01).                  19900000
185900         10  FILLER                   PIC X(03).                  19910000
186000         10  PARM-CAGE-FILE-HDRS      PIC X(01).                  19920000
186100             88  CAGE-FILE-HDRS                   VALUE 'Y'.      19930000
186200         10  FILLER                   PIC X(01).                  19940000
186300         10  PARM-ABEND-OVERIDE       PIC X(01).                  19950000
186400             88  ABEND-OVERIDE                    VALUE 'Y'.      19960000
186500         10  FILLER                   PIC X(01).                  19970000
186600         10  PARM-RUN-TYPE            PIC X(08).                  19980000
186700             88  PARM-CAGE-RUN                  VALUE 'ACATCAGE'. 19990000
YH0001             88  PARM-INTR-RUN                  VALUE 'ACATINTR'. 20000000
186800             88  PARM-BOOK-RUN                  VALUE 'ACATPEND'. 20010000
186900             88  PARM-MRGN-RUN                  VALUE 'ACATMRGN'. 20020000
LRM005             88  PARM-SHAD-RUN                  VALUE 'ACATSHAD'. 20030000
187000/                                                                 20040000
187100***************************************************************** 20050000
187200 PROCEDURE DIVISION USING PARM-AREA.                              20060000
187300******************************************************************20070000
187400 MAINLINE SECTION.                                                20080000
187500******************************************************************20090000
187600     COPY MSGCOBO.                                                20100000
187700                                                                  20110000
187800     PERFORM  INITIAL-ROUTINE                                     20120000
187900        THRU  INITIAL-ROUTINE-EXIT.                               20130000
188000                                                                  20140000
188100     PERFORM PROCESS-BOTH-FILE                                    20150000
188200         UNTIL END-OF-PEND-FILE                                   20160000
188300           AND END-OF-MPND-FILE.                                  20170000
188400                                                                  20180000
188500** THE FOLLOWING 3 LINES ADDED TO CAUSE LAST CLIENT TO BE ADDED   20190000
188600** TO THE BOOKING RECORD TOTALS AND PRINT THEM OUT.               20200000
188700     IF PREV-ADP-CLIENT NOT ZERO                                  20210000
188800        PERFORM O-CLIENT-BREAK                                    20220000
188900     END-IF.                                                      20230000
189000                                                                  20240000
LRM012     PERFORM PROCESS-POST-SETTLE-FUNDSERV                         20250000
LRM019        UNTIL POST-SETTLE-EOF.                                    20251000
LRM012                                                                  20252000
189100     PERFORM  ENDJOB-ROUTINE                                      20253000
189200        THRU  ENDJOB-ROUTINE-EXIT.                                20254000
189300                                                                  20255000
189400     GOBACK.                                                      20256000
189500/                                                                 20257000
189600*****************                                                 20258000
189700 INITIAL-ROUTINE  SECTION.                                        20259000
189800*****************                                                 20260000
189900                                                                  20270000
190000     DISPLAY ' '.                                                 20280000
190100     DISPLAY '*** ' PGM-NAME ' BEGINNING INITIAL ROUTINE ***'.    20290000
190200                                                                  20300000
190300     PERFORM  INIT-CHECK-PARM.                                    20310000
190400                                                                  20320000
190500     PERFORM  INIT-CLEAR-CNTR-LOOP.                               20330000
190600                                                                  20340000
190700     PERFORM  INIT-B1-LOOP.                                       20350000
190800                                                                  20360000
190900     PERFORM  INIT-OPEN-FILES.                                    20370000
191000                                                                  20380000
191100     PERFORM  LOAD-CATPPL-BROKER-TABLE.                           20390000
LRM052     PERFORM  LOAD-STP-TABLE.                                     20391001
191200                                                                  20400000
191300     PERFORM  INIT-READ-INPUT-HDRS.                               20410000
191400                                                                  20420000
191500     PERFORM  INIT-WRITE-OUTPUT-HDRS.                             20430000
191600                                                                  20440000
191700     PERFORM O-CLIENT-BREAK-CLEAR-TOTALS                          20450000
191800         VARYING CL-O-CNTR-X                                      20460000
191900         FROM 1 BY 1                                              20470000
192000         UNTIL   CL-O-CNTR-X IS GREATER THAN NUM-CL-OUT-CNTRS.    20480000
192100                                                                  20490000
192200     DISPLAY '*** ' PGM-NAME ' COMPLETED INITIAL ROUTINE ***'.    20500000
192300                                                                  20510000
192400***********************                                           20520000
192500 INITIAL-ROUTINE-EXIT.  EXIT.                                     20530000
192600***********************                                           20540000
192700/                                                                 20550000
192800******************                                                20560000
192900 INIT-CHECK-PARM.                                                 20570000
193000******************                                                20580000
193100                                                                  20590000
193200     DISPLAY ' '.                                                 20600000
193300     DISPLAY 'PARM LENGTH = ' PARM-LENGTH.                        20610000
193400     DISPLAY 'PARM VALUES = ' PARM-AREA.                          20620000
193500     DISPLAY ' '.                                                 20630000
193600                                                                  20640000
193700     IF  NOT  PARM-LENGTH-VALID                                   20650000
193800         DISPLAY  'INVALID EXEC PARM, MUST BE 16 BYTES LONG'      20660000
193900         CALL ABEND                 USING ABEND-CODE-3000         20670000
194000     END-IF.                                                      20680000
194100                                                                  20690000
194200     IF  PARM-STREAM  NOT >  SPACE                                20700000
194300         DISPLAY 'INVALID EXEC PARM, (&CL) MUST BE NON-SPACE'     20710000
194400         CALL ABEND                 USING ABEND-CODE-3000         20720000
194500     END-IF.                                                      20730000
194600                                                                  20740000
194700     MOVE  'CAT650'                     TO BPDATES-CALLING-PGM.   20750000
194800     MOVE  'C'                          TO BPDATES-REQ-TYPE.      20760000
194900                                                                  20770000
195000     CALL    BPDATES            USING BPDATES-PARAMETERS.         20780000
195100                                                                  20790000
195200     MOVE  +57                     TO  PC-MAX-LINES.              20800000
195300     MOVE  +999                    TO  PC-LINE-CNT.               20810000
195400     MOVE  PGM-NAME                TO  TL-PGM-NAME.               20820000
195500     MOVE  PGM-NAME                TO  TTL-PGM-NAME.              20830000
195600     MOVE  BPD-PROC-DATE (5 : 2)   TO  TTL-DATE (1 : 2).          20840000
195700     MOVE  BPD-PROC-DATE (7 : 2)   TO  TTL-DATE (4 : 2).          20850000
195800     MOVE  BPD-PROC-DATE (3 : 2)   TO  TTL-DATE (7 : 2).          20860000
195900     MOVE  '/'                     TO  TTL-DATE (3 : 1)           20870000
196000                                       TTL-DATE (6 : 1).          20880000
196100     MOVE  BPD-PROC-DATE (3:2)     TO  ROLL-SEC-NO (6:2).         20890000
196200     MOVE  TTL-DATE        TO TL-DATE.                            20900000
196300     MOVE  BPD-PROC-PLUS-ONE-TD   TO WS-TRADE-PLUS-1.             20910000
196400     MOVE  BPD-PROC-PLUS-TWO-TD   TO WS-TRADE-PLUS-2.             20920000
196500                                                                  20930000
196600/                                                                 20940000
196700***********************                                           20950000
196800 INIT-CLEAR-CNTR-LOOP.                                            20960000
196900***********************                                           20970000
197000                                                                  20980000
197100     SET  CNTR-X                      TO  1.                      20990000
197200     PERFORM  UNTIL  CNTR-X  >  NUM-CNTRS                         21000000
197300         MOVE  ZEROS                  TO  CNTR-RECS (CNTR-X)      21010000
197400         SET  CNTR-X  UP BY  1                                    21020000
197500     END-PERFORM.                                                 21030000
197600                                                                  21040000
197700     PERFORM                                                      21050000
197800         VARYING  CL-CNTR-X                                       21060000
197900         FROM  1 BY 1                                             21070000
198000         UNTIL  CL-CNTR-X  >  NUM-CL-IN-CNTRS                     21080000
198100             IF  CL-CNTR-TYPE (CL-CNTR-X)  =  'N'                 21090000
198200                 MOVE  ZERO          TO  CL-CNTR-RECS (CL-CNTR-X) 21100000
198300             END-IF                                               21110000
198400     END-PERFORM.                                                 21120000
198500                                                                  21130000
198600/                                                                 21140000
198700***************                                                   21150000
198800 INIT-B1-LOOP.                                                    21160000
198900***************                                                   21170000
199000                                                                  21180000
199100     DISPLAY ' '.                                                 21190000
199200     DISPLAY  'B1 TABLE VALUES'.                                  21200000
199300     SET  B1-IND                 TO  1.                           21210000
199400     ADD  1                      TO  B1-SUB.                      21220000
199500     PERFORM  UNTIL  B1-SUB  >  500                               21230000
199600                                                                  21240000
199700       SET  B1-IND  TO B1-SUB                                     21250000
199800       MOVE  '0'  TO  B1-SERVICE-STATUS (B1-IND)                  21260000
199900       MOVE  ' '                    TO  BH-BROKER-HEADER-INFO     21270000
200000       MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N        21280000
200100       MOVE  '010'                  TO  BH-LOGICAL-RECORD-CODE    21290000
200200       MOVE  ' '                    TO  BH-B2-INFO-ID             21300000
200300       CALL  GETB1V               USING BH-BROKER-HEADER-INFO     21310000
200400       END-CALL                                                   21320000
200500                                                                  21330000
200600       IF  BH-BROKER-ACTIVE                                       21340000
200700                                                                  21350000
200800         IF  PARM-STREAM  =  BH-BROKER-MINI-MAXI-INDICATOR        21360000
200900             MOVE  ' '                 TO  BH-ICS-INFO            21370000
201000             MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N     21380000
201100             MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE 21390000
201200             MOVE  '434500'            TO  BH-B2-INFO-ID          21400000
201300             CALL  GETB1V            USING BH-BROKER-HEADER-INFO, 21410000
201400                                           BH-ACAT-INFO           21420000
201500             END-CALL                                             21430000
201600             IF  BH-ACAT-ACTIVE                                   21440000
201700                 ADD  1                TO  NUM-ACAT-SYS-CLIENT    21450000
201800                 MOVE  B1-SUB                              TO     21460000
201900                       B1-ADP-CL-NO               (B1-IND)        21470000
202000                 MOVE  BH-ACAT-SERVICE-STATUS              TO     21480000
202100                       B1-SERVICE-STATUS          (B1-IND)        21490000
202200                 MOVE  BH-ACAT-UPDATE-SMA                  TO     21500000
202300                       B1-UPDATE-SMA              (B1-IND)        21510000
202400                 MOVE  BH-ACAT-CLIENT-OFFSET-ACCT          TO     21520000
202500                       B1-OFFSET-ACC-NUM          (B1-IND)        21530000
202600                 MOVE  BH-ACAT-ROLLOVER-OFFSET-ACCT    TO         21540000
202700                       B1-OFFSET-ROLL-ACC         (B1-IND)        21550000
202800                 MOVE  BH-ACAT-ROLLOVER-CLIENT         TO         21560000
202900                       B1-ROLLOVER-CLIENT         (B1-IND)        21570000
203000                 MOVE  BH-ACAT-BLOTTER-CODE-FOR-FAILS      TO     21580000
203100                       B1-BLOTTER-CODE            (B1-IND)        21590000
203200                 MOVE  BH-ACAT-MF-FUND-SERV-CLIENT         TO     21600000
203300                       B1-FUND-SERV-CLIENT        (B1-IND)        21610000
203400                 MOVE  BH-ACAT-ENTRY-CODE-RECV         TO         21620000
203500                       B1-ENTRY-CODE-REC          (B1-IND)        21630000
203600                 MOVE  BH-ACAT-ENTRY-CODE-DELV         TO         21640000
203700                       B1-ENTRY-CODE-DEL          (B1-IND)        21650000
203800                 MOVE  BH-ACAT-ENTRY-CODE-REC-ROLLOVR  TO         21660000
203900                       B1-ENTRY-REC-ROLL          (B1-IND)        21670000
204000                 MOVE  BH-ACAT-ENTRY-CODE-DEL-ROLLOVR  TO         21680000
204100                       B1-ENTRY-DEL-ROLL          (B1-IND)        21690000
LRM013                 MOVE  BH-ACAT-ENTRY-PTR-RECV-ROLLOVR  TO         21700000
LRM013                       B1-ENTRY-PTR-REC-ROLL      (B1-IND)        21710000
LRM013                 MOVE  BH-ACAT-ENTRY-PTR-DELV-ROLLOVR  TO         21720000
LRM013                       B1-ENTRY-PTR-DEL-ROLL      (B1-IND)        21730000
204200                 MOVE  BH-ACAT-FUNDSERV-POST-SD-BKP        TO     21740000
204300                       B1-POST-STL-REJ-BKP        (B1-IND)        21750000
204400                 MOVE  BH-ACAT-MF-DELV-PEND-STL-ACCT       TO     21760000
204500                       B1-DEL-PEND-STL-ACCT       (B1-IND)        21770000
204600                 MOVE  BH-ACAT-MF-RECV-PEND-STL-ACCT       TO     21780000
204700                       B1-RCV-PEND-STL-ACCT       (B1-IND)        21790000
204800                 MOVE  BH-ACAT-MF-PEND-ACT-BATCH-CODE      TO     21800000
204900                       B1-PEND-STL-BATCH-CODE     (B1-IND) (2:2)  21810000
LRM005                 MOVE  BH-ACAT-SHADOW-POST                 TO     21820000
LRM005                       B1-SHADOW-POST             (B1-IND)        21830000
LRM022                 MOVE  BH-ACAT-BOOK-DEBIT-BAL-TYPE1        TO     21840000
LRM022                       B1-ACAT-BOOK-DEBIT-BAL-TYPE1 (B1-IND)      21850000
205000                 IF    BH-ACAT-MF-PEND-ACT-BATCH-CODE  NOT = ' '  21860000
205100                       MOVE  'B'                           TO     21870000
205200                       B1-PEND-STL-BATCH-CODE     (B1-IND) (1:1)  21880000
205300                 ELSE                                             21890000
205400                       MOVE 'BNS'                          TO     21900000
205500                       B1-PEND-STL-BATCH-CODE     (B1-IND)        21910000
205600                 END-IF                                           21920000
205700                 MOVE BH-ACAT-P2-CONTRA-TRAILER   TO              21930000
205800                         B1-ACAT-P2-TRAILER   (B1-IND)            21940000
205900                    MOVE BH-ACAT-BEARER-BOND-OPT     TO           21950000
206000                         B1-BEARER-BOND-OPT   (B1-IND)            21960000
206100                    MOVE BH-ACAT-CASH-ENTRY-CODE-DELV     TO      21970000
206200                         B1-ENTRY-DEL-CASH    (B1-IND)            21980000
206300                    IF   BH-ACAT-CASH-ENTRY-CODE-DELV = SPACES    21990000
206400                       MOVE BH-ACAT-ENTRY-CODE-DELV   TO          22000000
206500                         B1-ENTRY-DEL-CASH    (B1-IND)            22010000
206600                    END-IF                                        22020000
206700                    MOVE BH-ACAT-CASH-ENTRY-CODE-RECV  TO         22030000
206800                         B1-ENTRY-REC-CASH    (B1-IND)            22040000
206900                    IF   BH-ACAT-CASH-ENTRY-CODE-RECV = SPACES    22050000
207000                       MOVE BH-ACAT-ENTRY-CODE-RECV   TO          22060000
207100                         B1-ENTRY-REC-CASH    (B1-IND)            22070000
207200                    END-IF                                        22080000
207300                 MOVE  BH-ACAT-CLIENT-OFFSET-ACCT-OPT  TO         22090000
207400                       B1-OFFSET-AMT-BYPASS       (B1-IND)        22100000
210300                 END-IF                                           22110000
      *** CARD-434641                                                   22120000
                       MOVE BH-ACAT-MFC-RECEIVER-ACCOUNT                22130000
                         TO B1-ACAT-MFC-RECEIVER-ACCOUNT (B1-IND)       22140000
      *** CARD-434642                                                   22150000
                       MOVE BH-ACAT-MFC-DELIVERER-ACCOUNT               22160000
                         TO B1-ACAT-MFC-DELIVERER-ACCOUNT (B1-IND)      22170000
      *** CARD-434669                                                   22180000
                       MOVE BH-ACAT-DONT-BOOK-MFC-TRANSF                22190000
                         TO B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND)       22200000
      *** CARD-434673                                                   22210000
                       MOVE BH-ACAT-MFC-BOOKING-BATCH                   22220000
                         TO B1-ACAT-MFC-BOOKING-BATCH (B1-IND)          22230000
                       MOVE BH-ACAT-MFC-BOOKING-ENTRE                   22240000
                         TO B1-ACAT-MFC-BOOKING-ENTRE (B1-IND)          22250000
LRM013                 MOVE BH-ACAT-RCL-TRAILER                         22260000
LRM013                   TO B1-ACAT-RCL-TRAILER (B1-IND)                22270000
LRM013                 MOVE BH-ACAT-PTR-TRAILER                         22280000
LRM013                   TO B1-ACAT-PTR-TRAILER (B1-IND)                22290000
LRM013                 MOVE BH-ACAT-PTD-TRAILER                         22300000
LRM013                   TO B1-ACAT-PTD-TRAILER (B1-IND)                22310000
LRM025                 MOVE BH-ACAT-PTF-TRAILER                         22320000
LRM025                   TO B1-ACAT-PTF-TRAILER (B1-IND)                22330000
LRM013                 MOVE BH-ACAT-MFC-TRAILER                         22340000
LRM013                   TO B1-ACAT-MFC-TRAILER (B1-IND)                22350000
LRM013                 MOVE BH-ACAT-FRV-TRAILER                         22360000
LRM013                   TO B1-ACAT-FRV-TRAILER (B1-IND)                22370000
LRM013                 IF BH-ACAT-RCL-BATCH-ENTRY > SPACES              22380000
LRM013                    MOVE BH-ACAT-RCL-BATCH                        22390000
LRM013                      TO B1-ACAT-RCL-BATCH (B1-IND)               22400000
LRM013                    MOVE BH-ACAT-RCL-ENTRY                        22410000
LRM013                      TO B1-ACAT-RCL-ENTRY (B1-IND)               22420000
LRM013                 END-IF                                           22430000
LRM013                 IF BH-ACAT-PTR-BATCH-ENTRY > SPACES              22440000
LRM013                    MOVE BH-ACAT-PTR-BATCH                        22450000
LRM013                      TO B1-ACAT-PTR-BATCH (B1-IND)               22460000
LRM013                    MOVE BH-ACAT-PTR-ENTRY                        22470000
LRM013                      TO B1-ACAT-PTR-ENTRY (B1-IND)               22480000
LRM013                 END-IF                                           22490000
LRM013                 IF BH-ACAT-PTD-BATCH-ENTRY > SPACES              22500000
LRM013                    MOVE BH-ACAT-PTD-BATCH                        22510000
LRM013                      TO B1-ACAT-PTD-BATCH (B1-IND)               22520000
LRM013                    MOVE BH-ACAT-PTD-ENTRY                        22530000
LRM013                      TO B1-ACAT-PTD-ENTRY (B1-IND)               22540000
LRM013                 END-IF                                           22550000
LRM031                 MOVE BH-ACAT-PTR-BATCH-ENTRY-RECV                22560000
LRM031                      TO B1-ACAT-PTR-BATCH-ENTRY-RECV (B1-IND)    22570000
LRM031                 MOVE BH-ACAT-PTR-BATCH-ENTRY-DELIV               22580000
LRM031                      TO B1-ACAT-PTR-BATCH-ENTRY-DELIV(B1-IND)    22590000
LRM031                 MOVE BH-ACAT-PTD-BATCH-ENTRY-RECV                22600000
LRM031                      TO B1-ACAT-PTD-BATCH-ENTRY-RECV (B1-IND)    22610000
LRM031                 MOVE BH-ACAT-PTD-BATCH-ENTRY-DELIV               22620000
LRM031                      TO B1-ACAT-PTD-BATCH-ENTRY-DELIV(B1-IND)    22630000
LRM025                 IF BH-ACAT-PTF-BATCH-ENTRY > SPACES              22640000
LRM025                    MOVE BH-ACAT-PTF-BATCH-CODE                   22650000
LRM025                      TO B1-ACAT-PTF-BATCH (B1-IND)               22660000
LRM025                    MOVE BH-ACAT-PTF-ENTRY-CODE                   22670000
LRM025                      TO B1-ACAT-PTF-ENTRY (B1-IND)               22680000
LRM025                 END-IF                                           22690000
LRM013                 IF BH-ACAT-FRV-BATCH-ENTRY > SPACES              22700000
LRM013                    MOVE BH-ACAT-FRV-BATCH                        22710000
LRM013                      TO B1-ACAT-FRV-BATCH (B1-IND)               22720000
LRM013                    MOVE BH-ACAT-FRV-ENTRY                        22730000
LRM013                      TO B1-ACAT-FRV-ENTRY (B1-IND)               22731000
LRM013                 END-IF                                           22732000
LRM012                 IF B1-SUB = 235                                  22733000
LRM012                    PERFORM SAVE-WM-ACCOUNT-RTN                   22734000
LRM012                 END-IF                                           22735000
LRM021                 MOVE BH-ACAT-OPTION-OFFSET-ACCOUNT               22736000
LRM021                      TO B1-OPTION-OFFSET-ACCOUNT (B1-IND)        22737000
YH0001                 MOVE SPACE          TO                           22738000
YH0001                           B1-NTWRK-CNTL-CD   (B1-IND)            22739000
YH0001                           B1-DST-OFFSET      (B1-IND)            22740000
YH0001                           B1-NS-BRCH-OFFSET  (B1-IND)            22750000
LRM032                 MOVE BH-ACAT-SFK-RSEC-MEMO                       22751000
LRM032                        TO B1-SFK-RSEC-MEMO   (B1-IND)            22752000
LRM036** CARD-434761                                                    22753000
LRM036                 MOVE BH-ACAT-BLOT-CD-OVERD-NO                    22754000
LRM036                   TO B1-ACAT-BLOT-CD-OVERD-NO (B1-IND)           22755000
LRM036                 PERFORM VARYING SUB FROM 1 BY 1                  22756000
LRM036                             UNTIL SUB > 20                       22757000
LRM036                   MOVE BH-ACAT-BLOT-CD-OVERD-ENTRY(SUB)          22758000
LRM036                     TO B1-ACAT-BLOT-CD-OVERD-ENTRY(B1-SUB, SUB)  22759000
LRM036                 END-PERFORM                                      22760000
LRM041                 MOVE BH-ACAT-FUNDSERV-PEND-MEMO                  22761000
LRM041                   TO B1-ACAT-FUNDSERV-PEND-MEMO  (B1-IND)        22762000
LRM052                 MOVE  BH-ACAT-CNS-LONG-R-ACCT                    22763000
LRM052                   TO B1-ACAT-CNS-LONG-R-ACCT  (B1-IND)           22764000
LRM052                 MOVE  BH-ACAT-CNS-SHORT-S-ACCT                   22765000
LRM052                   TO B1-ACAT-CNS-SHORT-S-ACCT (B1-IND)           22766000
210400                                                                  22766100
210500             MOVE  '501000'            TO  BH-B2-INFO-ID          22766200
210600             CALL  GETB1V            USING BH-BROKER-HEADER-INFO, 22766300
210700                                           BH-ICS-INFO            22766400
210800             END-CALL                                             22766500
210900             IF  BH-ICS-ACTIVE                                    22766600
211000                                                                  22766700
211100             IF  BH-ICS-ACAT-DATA-EXTRACT  NOT =  '0'             22766800
211200                 MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)  TO     22766900
211300                       B1-CLRNG-NO                (B1-IND)        22767000
211400                 MOVE  BH-BTS-ACAT-SETUP-FUNDSER-FAIL      TO     22768000
211500                       B1-FAILS-T3-OR-T4          (B1-IND)        22769000
211600                                                                  22770000
211700                 MOVE  ' '             TO  BH-P1-INFO             22780000
211800                 MOVE  B1-SUB          TO  BH-BROKER-NUMBER-N     22790000
211900                 MOVE  '103'           TO  BH-LOGICAL-RECORD-CODE 22800000
212000                 MOVE  ' '             TO  BH-B2-INFO-ID          22810000
212100                 CALL  GETB1V        USING BH-BROKER-HEADER-INFO, 22820000
212200                                           BH-P1-INFO             22830000
212300                 END-CALL                                         22840000
212400                 IF  BH-P1-BROKER-STATUS  =  'A'                  22850000
212500                     MOVE  BH-P2-OPTION-B                  TO     22860000
212600                           B1-OPTION-OFFSET-IND   (B1-IND)        22870000
212700                 END-IF                                           22880000
212800                                                                  22890000
212900                 MOVE  ' '             TO  BH-MISC-INFO           22900000
213000                 MOVE  B1-SUB          TO  BH-BROKER-NUMBER-N     22910000
213100                 MOVE  '008'           TO  BH-LOGICAL-RECORD-CODE 22920000
213200                 MOVE  ' '             TO  BH-B2-INFO-ID          22930000
213300                 CALL  GETB1V        USING BH-BROKER-HEADER-INFO, 22940000
213400                                           BH-MISC-INFO           22950000
213500                 END-CALL                                         22960000
213600                 IF  BH-MISC-ACTIVE                               22970000
213700                     MOVE  BH-MISC-FRACT-QTY               TO     22980000
213800                           B1-FRAC-QTY-PROC       (B1-IND)        22990000
213900                     MOVE  BH-MISC-IRA-CLIENT              TO     23000000
214000                           B1-MISC-IRA-CLIENT     (B1-IND)        23010000
214100                 END-IF                                           23020000
214200                                                                  23030000
214300                 MOVE  ' '             TO  BH-MF-INFO             23040000
214400                 MOVE  B1-SUB          TO  BH-BROKER-NUMBER-N     23050000
214500                 MOVE  '015'           TO  BH-LOGICAL-RECORD-CODE 23060000
214600                 MOVE  '537000'        TO  BH-B2-INFO-ID          23070000
214700                 CALL  GETB1V        USING BH-BROKER-HEADER-INFO, 23080000
214800                                           BH-MF-INFO             23090000
214900                 END-CALL                                         23100000
215000                 IF  BH-MF-STATUS  =  'A'                         23110000
215100                     MOVE  BH-MF-STATUS                   TO      23120000
215200                           B1-MFRS-ACTIVE         (B1-IND)        23130000
215300*** 537323           MOVE  BH-MF-FIRM-NA-BOOK-SHR-CTL      TO     23140000
215400                     MOVE  BH-MF-OMNIBUS-SHARE-BOX-ACT  TO        23150000
215500                           B1-MFRS-OMNIBUS-OFFSET      (B1-IND)   23160000
215501                     IF  BH-MFN-STATUS  =  'A'                    23170000
215510                       MOVE  BH-MFN-OMNIBUS-NSCC-BOX-ACCT  TO     23180000
215520                           B1-MFRS-NSCCSRC-OFFSET      (B1-IND)   23190000
LRM003                       MOVE  BH-MFN-DST-MFE-NSCC-BOX-ACCT  TO     23200000
LRM003                           B1-MFRS-DST-MFE-OFFSET      (B1-IND)   23210000
215530                     END-IF                                       23220000
215600                     MOVE  BH-MF-FIRM-NA-BOOK-SHR-CTL-ACT  TO     23230000
215700                           B1-MFRS-BB-OFFSET      (B1-IND)        23240000
215800*** 537324           MOVE  BH-MF-BKR-NOM-BOOK-SHR-CTL      TO     23250000
215900                     MOVE  BH-MF-BKR-NOMINEE-BOOK-SHR-CTL  TO     23260000
216000                           B1-MFRS-BN-OFFSET      (B1-IND)        23270000
LRM002                     MOVE  BH-MFN-OMNIBUS-MULTI-PLAT-OPT   TO     23280000
LRM002                           B1-MFN-OMNIBUS-MULTI-PLAT-OPT (B1-IND) 23290000
YH0001                     MOVE  BH-ACAT-MF-REG-NETWRK-CTRL-IND  TO     23300000
YH0001                           B1-NTWRK-CNTL-CD              (B1-IND) 23310000
YH0001                     IF BH-MFN-OMNIBUS-NSCC-BOX-ACCT NOT = SPACE  23320000
YH0001                        MOVE  'Y'   TO B1-NS-BRCH-OFFSET (B1-IND) 23330000
YH0001                     END-IF                                       23340000
YH0001                     IF BH-MFN-DST-MFE-NSCC-BOX-ACCT NOT = SPACE  23350000
YH0001                        MOVE  'Y'   TO B1-DST-OFFSET     (B1-IND) 23360000
YH0001                     END-IF                                       23370000
216100                 END-IF                                           23380000
216200                                                                  23390000
216300                 MOVE  ' '             TO  BH-MF3-INFO            23400000
216400                 MOVE  B1-SUB          TO  BH-BROKER-NUMBER-N     23410000
216500                 MOVE  '015'           TO  BH-LOGICAL-RECORD-CODE 23420000
216600                 MOVE  '540000'        TO  BH-B2-INFO-ID          23430000
216700                 CALL  GETB1V        USING BH-BROKER-HEADER-INFO, 23440000
216800                                           BH-MF3-INFO            23450000
216900                 END-CALL                                         23460000
217000                 IF  BH-MF3-STATUS  =  'A'                        23470000
217100**** TEMPORARY HARDCODE FOR MISSING B1 540113 OPTION *********    23480000
217200                   IF B1-SUB = 30                                 23490000
217300                     MOVE '1'                             TO      23500000
217400                           B1-MFRS-NOLOAD-CLIENT  (B1-IND)        23510000
217500                   ELSE                                           23520000
217600                     MOVE '0'                             TO      23530000
217700                           B1-MFRS-NOLOAD-CLIENT  (B1-IND)        23540000
217800                   END-IF                                         23550000
LRM029                   MOVE BH-MF3-PNC-SURPAS-BOX-ACCOUNT     TO      23560000
LRM029                           B1-PNC-SURPAS-OFFSET   (B1-IND)        23570000
LRM029                 ELSE                                             23580000
LRM029                   MOVE SPACES                            TO      23590000
LRM029                           B1-PNC-SURPAS-OFFSET   (B1-IND)        23600000
217900                 END-IF                                           23610000
218000                                                                  23620000
218100                 MOVE  ' '             TO  BH-BTS2-INFO           23630000
218200                 MOVE  B1-SUB          TO  BH-BROKER-NUMBER-N     23640000
218300                 MOVE  '015'           TO  BH-LOGICAL-RECORD-CODE 23650000
218400                 MOVE  '511000'        TO  BH-B2-INFO-ID          23660000
218500                 CALL  GETB1V        USING BH-BROKER-HEADER-INFO, 23670000
218600                                           BH-BTS2-INFO           23680000
218700                                                                  23690000
218800                 IF BH-BTS2-ACTIVE                                23700000
218900                                                                  23710000
219000                    MOVE '0'                             TO       23720000
219100                         B1-RESTRICTED-OPT   (B1-IND)             23730000
219200                                                                  23740000
219300                    MOVE '0'                              TO      23750000
219400                         B1-RECV-NON-CASH-TYP (B1-IND)            23760000
219500                                                                  23770000
219600                    MOVE BH-BTS2-ACAT-P2-RES-CREDIT-TRL   TO      23780000
219700                         B1-RES-CREDIT-P2-TRLR(B1-IND)            23790000
219800                                                                  23800000
219900                 END-IF                                           23810000
220000****             DISPLAY  B1-TABLE (B1-IND)                       23820000
220100               END-IF                                             23830000
220300             END-IF                                               23840000
220400           END-IF                                                 23850000
220500         END-IF                                                   23860000
220600         ADD  1                      TO  B1-SUB                   23870000
220700     END-PERFORM.                                                 23880000
220800     DISPLAY ' '.                                                 23890000
220900     IF  NUM-ACAT-SYS-CLIENT  =  0                                23900000
221000         DISPLAY  'ZERO (&CL) STREAM CLIENTS ARE B1-ACAT CLIENTS' 23910000
221100         DISPLAY  'INPUT ACAT & OLDPEND FILES WILL BE BYPASSED'   23920000
221200     END-IF.                                                      23930000
221300                                                                  23940000
LRM012 SAVE-WM-ACCOUNT-RTN.                                             23950000
LRM012     PERFORM VARYING WM-SUB FROM 1 BY 1                           23960000
LRM012        UNTIL WM-SUB > BH-ACAT-WM-OMNI-BOOKING-NO                 23970000
LRM012        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'INCMPY'       23980000
LRM012           MOVE BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              23990000
LRM012                          TO WM-INTER-COMPANY-ACCOUNT             24000000
LRM012           DISPLAY 'CL235 INNER CMPY AC ' WM-INTER-COMPANY-ACCOUNT24010000
LRM012            ' ' BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB)             24020000
LRM012        ELSE                                                      24030000
LRM012        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'PEND  '       24040000
LRM012           MOVE BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              24050000
LRM012                          TO WM-PENDING-ACCOUNT                   24060000
LRM012           DISPLAY 'WM235 PENDING ACCOUNT ' WM-PENDING-ACCOUNT    24070000
LRM012        END-IF END-IF                                             24080000
LRM012     END-PERFORM.                                                 24090000
                                                                        24100000
221400     EJECT                                                        24110000
221500******************                                                24120000
221600 INIT-OPEN-FILES.                                                 24130000
221700******************                                                24140000
221800                                                                  24150000
221900     OPEN  INPUT  PEND-FILE  MFPEND-FILE.                         24160000
222000     IF  NOT  PEND-OPEN-OK                                        24170000
222100         DISPLAY  'OLDPEND FILE OPEN ERROR, STATUS = '            24180000
222200                   PEND-FILE-STATUS                               24190000
222300     END-IF.                                                      24200000
222400                                                                  24210000
222500     OPEN  INPUT  NTWREG-FILE.                                    24220000
222600     OPEN  INPUT  MEMO-FILE.                                      24230000
222700     IF  NOT  MEMO-OPEN-OK                                        24240000
222800         DISPLAY  'MEMO FILE OPEN ERROR, STATUS = '               24250000
222900                   MEMO-FILE-STATUS                               24260000
223000     END-IF.                                                      24270000
223100                                                                  24280000
223200     OPEN  INPUT  PRNG-FILE.                                      24290000
223300     IF  NOT  PRNG-OPEN-OK                                        24300000
223400         DISPLAY  'PRNG FILE OPEN ERROR, STATUS = '               24310000
223500                   PRNG-FILE-STATUS                               24320000
223600     END-IF.                                                      24330000
223700                                                                  24340000
223800     OPEN  INPUT  BROKER-FILE.                                    24350000
223900     IF  NOT  BROKER-OPEN-OK                                      24360000
224000         DISPLAY  'BROKER FILE OPEN ERROR, STATUS = '             24370000
224100                   BROKER-FILE-STATUS                             24380000
224200     END-IF.                                                      24390000
224300     OPEN INPUT  ACATS-PARTICIPANT-FILE                           24400000
LRM012     OPEN INPUT  POST-SETTLE-FILE                                 24410000
LRM052     OPEN INPUT  ACATS-STP-FILE                                   24410101
224400                                                                  24420000
224500     OPEN  OUTPUT  P2BKPG-FILE.                                   24430000
224600     IF  NOT  P2BKPG-OPEN-OK                                      24440000
224700         DISPLAY  'P2BKPG FILE OPEN ERROR, STATUS = '             24450000
224800                   P2BKPG-FILE-STATUS                             24460000
224900     END-IF.                                                      24470000
225000                                                                  24480000
225100     OPEN  OUTPUT  T3RDFL-FILE.                                   24490000
225200     IF  NOT  T3RDFL-OPEN-OK                                      24500000
225300         DISPLAY  'T3RDFL FILE OPEN ERROR, STATUS = '             24510000
225400                   T3RDFL-FILE-STATUS                             24520000
225500     END-IF.                                                      24530000
225600                                                                  24540000
225700     OPEN  OUTPUT  CAG2FL-FILE.                                   24550000
225800     IF  NOT  CAG2FL-OPEN-OK                                      24560000
225900         DISPLAY  'CAG2FL FILE OPEN ERROR, STATUS = '             24570000
226000                   CAG2FL-FILE-STATUS                             24580000
226100     END-IF.                                                      24590000
226200                                                                  24600000
226300     OPEN OUTPUT  CAGE-CAT13-FILE.                                24610000
226400                                                                  24620000
226500     OPEN  OUTPUT  XSTLPI-FILE.                                   24630000
226600     IF  NOT  XSTLPI-OPEN-OK                                      24640000
226700         DISPLAY  'XSTLPI FILE OPEN ERROR, STATUS = '             24650000
226800                   XSTLPI-FILE-STATUS                             24660000
226900     END-IF.                                                      24670000
227000                                                                  24680000
227100     MOVE  'O'                        TO  GETNA-REQ-FUNC.         24690000
227200     MOVE  'R'                        TO  GETNA-REQ-FILE.         24700000
227300     MOVE  'R'                        TO  GETNA-REQ-FUNC2.        24710000
227400     MOVE  'N'                        TO  GETNA-REQ-YEAREND.      24720000
227500     MOVE  PGM-NAME                   TO  GETNA-PGM-NAME.         24730000
227600     CALL    GETNA               USING GETNA-PARAMETERS           24740000
227700                                       GETNA-SEGMENT-INCLUDES     24750000
227800     END-CALL.                                                    24760000
227900     IF  GETNA-RETURN-FOUND                                       24770000
228000         MOVE  'R'                    TO  GETNA-REQ-FUNC          24780000
228100         MOVE  SPACES                 TO  GETNA-KEY               24790000
228200     ELSE                                                         24800000
228300         DISPLAY 'NAFILE A/I OPEN ERROR, GETNA RC = '             24810000
228400                  GETNA-RETURN-CODE                               24820000
228500     END-IF.                                                      24830000
228600                                                                  24840000
228700     IF  PEND-OPEN-OK AND                                         24850000
228800         MEMO-OPEN-OK     AND                                     24860000
228900         PRNG-OPEN-OK     AND                                     24870000
229000         BROKER-OPEN-OK   AND                                     24880000
229100         P2BKPG-OPEN-OK   AND                                     24890000
229200         T3RDFL-OPEN-OK   AND                                     24900000
229300         CAG2FL-OPEN-OK   AND                                     24910000
229400         XSTLPI-OPEN-OK   AND                                     24920000
229500         GETNA-RETURN-FOUND  CONTINUE                             24930000
229600     ELSE                                                         24940000
229700         CALL ABEND                 USING ABEND-CODE-4000         24950000
229800     END-IF.                                                      24960000
LRM002     MOVE  SPACES      TO NTWIO-PARAMETERS.                       24970000
LRM002     MOVE  'CAT650'    TO NTWIO-PGM-NAME.                         24980000
LRM002     MOVE  'O'         TO NTWIO-FUNCTION-CODE.                    24990000
LRM002     MOVE  'ALL'       TO NTWIO-REQUEST-TYPE.                     25000000
LRM002     CALL  BNWNTWIO USING NTWIO-PARAMETERS.                       25010000
229900                                                                  25020000
LRM009     OPEN OUTPUT FUNDSERV-EXTR-FILE.                              25030000
LRM014     OPEN OUTPUT ROLLOVER-866-EXTR.                               25040000
LRM022     OPEN OUTPUT TYPE2-CASH-EXTR.                                 25050000
230000     EJECT                                                        25060000
230100***********************                                           25070000
230200 INIT-READ-INPUT-HDRS.                                            25080000
230300***********************                                           25090000
230400     PERFORM  O-READ-PEND-FILE.                                   25100000
230500                                                                  25110000
YH0001     IF  END-OF-PEND-FILE  AND NOT PARM-INTR-RUN                  25120000
230700           DISPLAY 'ACATPEND FILE HAS ZERO RECORDS'               25130000
230800           CALL ABEND                 USING ABEND-CODE-4000       25140000
230900     END-IF                                                       25150000
231000     IF  NOT PEND-HEADER-ID                                       25160000
231100           DISPLAY 'ACATPEND FILE HEADER MISSING'                 25170000
231200           CALL ABEND                 USING ABEND-CODE-4000       25180000
231300     END-IF.                                                      25190000
231400     MOVE PEND-HEADER-RECORD TO FMT-HEADER-RECORD.                25200000
231500     DISPLAY 'PROCESS DATE  = ' BPD-PROC-DATE.                    25210000
231600     DISPLAY 'BOOKING DATE  = ' FMT-BOOK-DATE.                    25220000
231700     IF PARM-MRGN-RUN                                             25230000
231800        DISPLAY 'PARM HAS MRGN RUN'                               25240000
231900     ELSE                                                         25250000
232000     IF PARM-CAGE-RUN                                             25260000
232010        DISPLAY 'PARM HAS CAGE RUN'                               25270000
232020     ELSE                                                         25280000
LRM005     IF PARM-SHAD-RUN                                             25290000
LRM005        DISPLAY 'PARM HAS SHADOW RUN'                             25300000
YH0001     ELSE                                                         25310000
YH0001     IF PARM-INTR-RUN                                             25320000
LRM005        DISPLAY 'PARM HAS CAGE INTRA DAY RUN'                     25330000
LRM005     ELSE                                                         25340000
232030        DISPLAY 'PARM HAS BOOKING RUN'                            25350000
232040        MOVE '    A C A T   B O O K I N G   T O T A L S     '     25360000
232050             TO TTL-DESC                                          25370000
232060     END-IF.                                                      25380000
232070     MOVE BPD-PROC-DATE TO ACAT-PROC-DATE.                        25390000
232080     DISPLAY 'CAGE DATE  = ' WS-TRADE-PLUS-1.                     25400000
232090     DISPLAY '             ' WS-TRADE-PLUS-2.                     25410000
232100                                                                  25420000
YH0001     IF PARM-INTR-RUN                                             25430000
YH0001        MOVE 'Y' TO END-OF-PEND-FILE-SWITCH                       25440000
YH0001        MOVE ALL '9' TO PEND-TI-ADP-CL-NO-X                       25450000
YH0001     ELSE                                                         25460000
YH0001        PERFORM O-READ-PEND-FILE                                  25470000
           END-IF                                                       25480000
                                                                        25490000
232300     PERFORM O-READ-MPND-FILE.                                    25500000
232400                                                                  25510000
YH0001     IF PARM-CAGE-RUN                                             25520000
YH0001        MOVE 'Y' TO END-OF-MPND-FILE-SWITCH                       25530000
YH0001        MOVE ALL '9' TO MPND-TI-ADP-CL-NO-X                       25540000
YH0001     END-IF.                                                      25550000
232400                                                                  25560000
232500     EJECT                                                        25570000
232600*************************                                         25580000
232700 INIT-WRITE-OUTPUT-HDRS.                                          25590000
232800*************************                                         25600000
232900     MOVE  SPACES                     TO  P2BKPG-RECORD.          25610000
233000     MOVE  'DATE='                    TO  P2BKPG-RECORD (1:5).    25620000
233100     MOVE  ACAT-PROC-DATE (5:4)       TO  P2BKPG-RECORD (6:4).    25630000
233200     MOVE  ACAT-PROC-DATE (3:2)       TO  P2BKPG-RECORD (10:2).   25640000
233300     WRITE  P2BKPG-RECORD.                                        25650000
233400     IF  NOT  P2BKPG-FILE-OK                                      25660000
233500         DISPLAY  'P2BKPG FILE WRITE HEADER ERROR, STATUS = '     25670000
233600                   P2BKPG-FILE-STATUS                             25680000
233700         CALL ABEND            USING ABEND-CODE-4000              25690000
233800     END-IF.                                                      25700000
233900                                                                  25710000
234000                                                                  25720000
234100     IF  CAGE-FILE-HDRS                                           25730000
234200         MOVE  SPACES                 TO  CAGE-03-DETAIL-AREA     25740000
234300         SET CAGE-03-HDR-DATE-LITERAL TO TRUE                     25750000
234400         MOVE BPD-PROC-DATE           TO  CAGE-03-HDR-PROC-DATE   25760000
234500         WRITE  T3RDFL-RECORD FROM CAGE-03-HEADER-AREA            25770000
234600         IF  NOT  T3RDFL-FILE-OK                                  25780000
234700             DISPLAY  'T3RDFL FILE WRITE HEADER ERROR, STATUS = ' 25790000
234800                       T3RDFL-FILE-STATUS                         25800000
234900             CALL ABEND            USING  ABEND-CODE-4000         25810000
235000         END-IF                                                   25820000
235100                                                                  25830000
235200         MOVE  SPACES                 TO  CAGE-RECORD             25840000
235300         SET CAGE-HDR-DATE-LITERAL TO TRUE                        25850000
235400         MOVE  BPD-PROC-DATE          TO  CAGE-HDR-PROC-DATE      25860000
235500         WRITE  CAG2FL-RECORD FROM CAGE-HEADER-AREA               25870000
235600         IF  NOT  CAG2FL-FILE-OK                                  25880000
235700             DISPLAY  'CAG2FL FILE WRITE HEADER ERROR, STATUS = ' 25890000
235800                       CAG2FL-FILE-STATUS                         25900000
235900             CALL ABEND            USING  ABEND-CODE-4000         25910000
236000         END-IF                                                   25920000
236100     END-IF.                                                      25930000
236200                                                                  25940000
236300                                                                  25950000
236400     MOVE SPACES TO CAT13-RECORD.                                 25960000
236500                                                                  25970000
236600     SET CAT13-HDR-DATE-LITERAL  TO TRUE.                         25980000
236700     MOVE BPD-PROC-DATE TO CAT13-HDR-PROC-DATE.                   25990000
236800     WRITE CAT13-RECORD.                                          26000000
236900                                                                  26010000
LRM009     MOVE SPACES TO OFUND-HEADER-RECORD.                          26020000
LRM009     SET OFUND-HEADER-ID  TO TRUE.                                26030000
LRM009     SET OFUND-HEADER-LIT1 TO TRUE.                               26040000
LRM009     SET OFUND-HEADER-LIT2 TO TRUE.                               26050000
LRM009     SET OFUND-HEADER-LIT3 TO TRUE.                               26060000
LRM009     MOVE ACAT-PROC-DATE  TO  OFUND-BOOK-DATE                     26070000
LRM009     MOVE WS-TRADE-PLUS-1 TO  OFUND-CAGE-DATE                     26080000
LRM009     WRITE OFUND-HEADER-RECORD.                                   26090000
LRM014     MOVE  SPACES                     TO  ROLL866-RECORD          26100000
LRM014     MOVE  'DATE='                    TO  ROLL866-RECORD (1:5).   26110000
LRM014     MOVE  ACAT-PROC-DATE (5:4)       TO  ROLL866-RECORD (6:4).   26120000
LRM014     MOVE  ACAT-PROC-DATE (3:2)       TO  ROLL866-RECORD (10:2).  26130000
LRM014     WRITE ROLL866-RECORD.                                        26140000
LRM022     MOVE  SPACES                 TO  TYPE2-CASH-RECORD           26150000
LRM022     MOVE  'DATE='                TO  TYPE2-CASH-RECORD (1:5).    26160000
LRM022     MOVE  ACAT-PROC-DATE (5:4)   TO  TYPE2-CASH-RECORD (6:4).    26170000
LRM022     MOVE  ACAT-PROC-DATE (3:2)   TO  TYPE2-CASH-RECORD (10:2).   26180000
LRM022     WRITE TYPE2-CASH-RECORD.                                     26190000
237000 LOAD-CATPPL-BROKER-TABLE.                                        26200000
237100     PERFORM UNTIL CATPPL-BROKER-EOF                              26210000
237200                 OR WS-CATPPL-RECORD-COUNT GREATER 499            26220000
237300        READ ACATS-PARTICIPANT-FILE                               26230000
                     INTO WS-ACAT-PARTICIPANT-RECORD                    26240000
237400           AT END                                                 26250000
237500              SET CATPPL-BROKER-EOF TO TRUE                       26260000
237600           NOT AT END                                             26270000
237610              ADD 1 TO WS-CATPPL-RECORD-COUNT                     26280000
237620              MOVE WS-PRTCP-NBR TO                                26290000
153410                    WS-CATPPL-BROKER(WS-CATPPL-RECORD-COUNT)      26300000
                    MOVE WS-PRTCP-NM TO                                 26310000
153430                    WS-CATPPL-BROKER-NAME(WS-CATPPL-RECORD-COUNT) 26320000
237640        END-READ                                                  26330000
237650     END-PERFORM.                                                 26340000
237660     IF NOT CATPPL-BROKER-EOF                                     26350000
237670        DISPLAY 'TABLE OVERFLOW ON CATPPL BROKER'                 26360000
237680        MOVE 'NEED TABLE EXPANSION' TO INFSND-MSG                 26370000
237681        CALL  INFSND  USING INFSND-DATA                           26380000
237682     ELSE                                                         26390000
237683        IF WS-CATPPL-RECORD-COUNT > 450                           26400000
237684          MOVE 'MAY NEED EXPANSION SOON BROKER' TO INFSND-MSG     26410000
237685          CALL  INFSND  USING INFSND-DATA                         26420000
237686     END-IF.                                                      26430000
LRM052 LOAD-STP-TABLE.                                                  26431001
LRM052     PERFORM UNTIL STP-EOF                                        26432002
LRM052                 OR WS-STP-RECORD-COUNT GREATER 20000             26433002
LRM052        READ ACATS-STP-FILE                                       26434002
LRM052           AT END                                                 26436002
LRM052              SET STP-EOF TO TRUE                                 26437002
LRM052           NOT AT END                                             26438002
LRM052              ADD 1 TO WS-STP-RECORD-COUNT                        26439002
LRM052              MOVE STP-TI-ADP-CL-NO-X TO                          26439102
LRM052                    WS-STP-CLIENT(WS-STP-RECORD-COUNT)            26439302
LRM052              MOVE STP-TI-CONTROL-NUM TO                          26439502
LRM052                    WS-STP-CONTROL-NBR(WS-STP-RECORD-COUNT)       26439602
LRM052        END-READ                                                  26439702
LRM052     END-PERFORM.                                                 26439802
LRM052     IF NOT STP-EOF                                               26439902
LRM052        DISPLAY 'TABLE OVERFLOW ON STP LOAD'                      26440002
LRM052        MOVE 'NEED TABLE EXPANSION' TO INFSND-MSG                 26440102
LRM052        CALL  INFSND  USING INFSND-DATA                           26440202
LRM052     END-IF.                                                      26440702
LRM052 SEARCH-STP-TABLE.                                                26440803
LRM052     MOVE FMT-TI-ADP-CL-NO-X  TO WS-CL-NBR.                       26440908
LRM052     MOVE FMT-TI-CONTROL-NUM  TO WS-CL-CNTL.                      26441008
LRM052     SEARCH ALL WS-STP-RECORD                                     26441104
LRM052         AT END                                                   26441204
LRM052             SET STP-NOTFND TO TRUE                               26441304
LRM052         WHEN WS-STP-CLIENT-CNTL (STP-IND) = WS-CL-CNTL-NBR       26441408
LRM052             SET STP-FOUND  TO TRUE                               26441604
           END-SEARCH.                                                  26442104
237687     EJECT                                                        26443000
237688 PROCESS-BOTH-FILE.                                               26450000
237689                                                                  26460000
237690     PERFORM                                                      26470000
237700         UNTIL PEND-TI-ADP-CL-NO-X > MPND-TI-ADP-CL-NO-X          26480000
237800            OR END-OF-PEND-FILE                                   26490000
237900         MOVE 'P' TO RECORD-FROM-SWITCH                           26500000
238000         IF  PEND-TI-RECORD-ID                                    26510000
238100           MOVE PEND-TI-RECORD      TO FMT-TI-RECORD              26520000
238200           SET NEW-TI TO TRUE                                     26530000
238300         ELSE                                                     26540000
238400           MOVE PEND-AT-RECORD      TO FMT-AT-RECORD              26550000
238500           SET NEW-AT TO TRUE                                     26560000
238600           PERFORM PROCESS-PEND-FILE                              26561000
LRM012              THRU PROCESS-PEND-EXIT                              26562000
238700         END-IF                                                   26563000
238800         PERFORM O-READ-PEND-FILE                                 26564000
238900     END-PERFORM.                                                 26565000
239000                                                                  26565100
239100     PERFORM                                                      26565200
239200         UNTIL MPND-TI-ADP-CL-NO-X NOT < PEND-TI-ADP-CL-NO-X      26565300
239300            OR END-OF-MPND-FILE                                   26565400
239400         MOVE 'M' TO RECORD-FROM-SWITCH                           26565500
YH0001         IF  MPND-TI-RECORD-ID                                    26565600
YH0001           MOVE MPND-TI-RECORD    TO FMT-TI-RECORD                26565700
YH0001           PERFORM O-READ-MPND-FILE                               26565800
YH0001           MOVE MPND-AT-RECORD    TO FMT-AT-RECORD                26565900
YH0001         ELSE                                                     26566000
YH0001           MOVE MPND-AT-RECORD    TO FMT-AT-RECORD                26567000
YH0001                                     FMT-TI-RECORD                26568000
               END-IF                                                   26569000
239700         PERFORM SET-AT-RECORD                                    26570000
239800                                                                  26580000
239900         PERFORM PROCESS-PEND-FILE                                26590000
LRM012            THRU PROCESS-PEND-EXIT                                26600000
240000         PERFORM O-READ-MPND-FILE                                 26610000
240100     END-PERFORM.                                                 26620000
240200                                                                  26630000
240300 PROCESS-PEND-FILE.                                               26640000
240400                                                                  26650000
240500     IF PREV-ADP-CLIENT = ZERO                                    26660000
240600         SET B1-IND TO FMT-TI-ADP-CL-NO                           26670000
240700         PERFORM O-CLIENT-BREAK-SET-UP-NEXT-CL                    26680000
240800     ELSE                                                         26690000
240900        IF FMT-TI-ADP-CL-NO-X NOT = PREV-ADP-CLIENT               26700000
241000           PERFORM O-CLIENT-BREAK                                 26710000
241100           IF NOT (END-OF-PEND-FILE AND END-OF-MPND-FILE)         26720000
241200               SET B1-IND TO FMT-TI-ADP-CL-NO                     26730000
241300               PERFORM O-CLIENT-BREAK-SET-UP-NEXT-CL              26740000
241400     END-IF.                                                      26750000
241500                                                                  26760000
           PERFORM READ-NTWREGOP.                                       26770000
                                                                        26780000
           IF  RECORD-IS-FROM-MPND-FILE                                 26790000
              SET NON-CNS  TO TRUE                                      26800000
              IF  FMT-FUND-SERV                                         26810000
                PERFORM O-FUND-FAIL-PAST                                26820000
              END-IF                                                    26830000
           ELSE                                                         26840000
             SET FMT-REC-IS-VALID TO TRUE                               26850000
             PERFORM O-EDIT-PEND-RECS                                   26860000
                                                                        26870000
DJ0001       IF FMT-TRNFR-TYPE = 'MFC'                                  26880000
DJ0001          IF  B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) NOT = '0'     26890000
DJ0001              CONTINUE                                            26900000
DJ0001          ELSE                                                    26910000
LRM030           IF PARM-SHAD-RUN                                       26920000
LRM030           AND B1-SERVICE-STATUS (B1-IND) = '1'                   26930000
LRM030           AND B1-SHADOW-POST   (B1-IND) = '1'                    26940000
LRM030           AND (FMT-SETTL-DATE  =   WS-TRADE-PLUS-1               26950000
LRM030           OR  FMT-SETTL-DATE  =  WS-TRADE-PLUS-2)                26960000
LRM030           AND (FMT-STATUS-CD  = '300' OR '310')                  26970000
LRM030              PERFORM O-MFC-P2-CREATE                             26980000
LRM030           ELSE                                                   26990000
DJ0001              IF  B1-SERVICE-STATUS (B1-IND) = '1'                27000000
DJ0001              AND (FMT-SETTL-DATE =  ACAT-PROC-DATE)              27010000
DJ0001              AND (FMT-STATUS-CD  =  '300' OR '310')              27020000
DJ0001              AND (NOT FMT-MEMO)                                  27030000
DJ0001                  PERFORM O-MFC-P2-CREATE                         27040000
DJ0001              END-IF                                              27050000
DJ0001          END-IF                                                  27060000
LRM007     END-IF.                                                      27070000
                                                                        27080000
LRM007     IF RECORD-IS-FROM-MPND-FILE                                  27090000
LRM007       CONTINUE                                                   27100000
LRM007     ELSE                                                         27110000
YH0001       IF  FMT-REC-IS-VALID                                       27120000
YH0001           ADD 1 TO TOT-CL-PEND-READ                              27130000
YH0001           PERFORM O-DETERMINE-P2-VS-PENDING                      27140000
YH0001       ELSE                                                       27150000
YH0001           ADD 1 TO TOT-CL-INVALID-SORT-RECS                      27160000
YH0001       END-IF                                                     27170000
                                                                        27180000
           END-IF.                                                      27181000
LRM012 PROCESS-PEND-EXIT. EXIT.                                         27182000
                                                                        27183000
243900 SET-AT-RECORD.                                                   27184000
244000                                                                  27185000
244100        SET      MPND-TI-RECORD-ID TO TRUE.                       27186000
244200        MOVE MPND-AT-CONTRA-BRK-NUM                               27187000
244300                             TO  FMT-CONTRA-BRK-NUM.              27188000
244400        MOVE MPND-AT-CONTRA-ACCOUNT                               27189000
244500                             TO  FMT-CONTRA-ACCOUNT.              27190000
244600/                                                                 27200000
244700******************************************************************27210000
244800*** PERFORMED BY:                                              ***27220000
244900***     O-PROCESS-PEND-RECORD                                  ***27230000
245000******************************************************************27240000
245100                                                                  27250000
245200 O-DETERMINE-P2-VS-PENDING.                                       27260000
245300     IF FMT-CNS                                                   27270000
245400        SET CNS TO TRUE                                           27280000
245500     ELSE                                                         27290000
245600        SET NON-CNS  TO TRUE                                      27300000
245700     END-IF.                                                      27310000
245800                                                                  27320000
245900** CHECK IF RECORD GOES TO CAT13 CAGE FILE **                     27330000
246000                                                                  27340000
LRM022     IF B1-ACAT-BOOK-DEBIT-BAL-TYPE1(B1-IND) = '1'                27350000
TEST**********DISPLAY 'READING N/A FOR ' FMT-TI-CUST-ACCOUNT            27360000
LRM022        PERFORM O-PROC-GETNA-FILE                                 27370000
LRM022           THRU O-PROC-GETNA-FILE-EXIT                            27380000
LRM022     END-IF.                                                      27390000
LRM022     IF B1-ACAT-BOOK-DEBIT-BAL-TYPE1 (B1-IND) = '1'               27400000
LRM022     AND GETNA-RETURN-FOUND                                       27410000
LRM022     AND NOT  NAPPA-SEGMENT-MISSING                               27420000
LRM022     AND NAPPA-MGN-AGRMNT NOT = '1'                               27430000
LRM022     AND FMT-CASH                                                 27440000
LRM022     AND NOT FMT-CASH-ACT                                         27450000
LRM022     AND FMT-DEBIT                                                27460000
LRM022     AND FMT-CLNT-IS-RECEIVER                                     27470000
LRM022     AND (FMT-TRNFR-TYPE = 'PTD' OR 'PTR' OR 'FUL' OR 'RCR')      27480000
LRM022        SET FMT-CASH-ACT TO TRUE                                  27490000
TEST          DISPLAY 'FORCING CASH DEBIT TO TYPE 1 '                   27500000
TEST              FMT-TI-ADP-CL-NO-X ' ' FMT-TI-CUST-ACCOUNT            27510000
              MOVE SPACES TO TYPE2-CASH-DETAIL-RECORD                   27520000
              MOVE FMT-TI-ADP-CL-NO-X TO TYPE2-CASH-ADP-CL-NO-X         27530000
              MOVE FMT-TI-CUST-ACCOUNT TO TYPE2-CASH-BRANCH-ACCOUNT     27540000
              MOVE FMT-ASSET-VALUE     TO TYPE2-CASH-AMOUNT             27550000
LRM023        MOVE FMT-STTLM-LCTN-CD   TO TYPE2-CASH-SETTLE-LOC         27560000
              WRITE TYPE2-CASH-RECORD FROM TYPE2-CASH-DETAIL-RECORD     27570000
LRM022     END-IF.                                                      27580000
                                                                        27590000
LRM023     IF B1-ACAT-BOOK-DEBIT-BAL-TYPE1 (B1-IND) = '1'               27600000
LRM023     AND GETNA-RETURN-FOUND                                       27610000
LRM023     AND NOT  NAPPA-SEGMENT-MISSING                               27620000
LRM023     AND NAPPA-MGN-AGRMNT NOT = '1'                               27630000
LRM023     AND NOT FMT-CASH                                             27640000
LRM023     AND NOT FMT-CASH-ACT                                         27650000
LRM023     AND FMT-SHORT                                                27660000
LRM023     AND FMT-CLNT-IS-RECEIVER                                     27670000
LRM023     AND FMT-ADP-SEC-NO > SPACES                                  27680000
LRM023     AND (FMT-TRNFR-TYPE = 'PTD' OR 'PTR' OR 'FUL' OR 'RCR')      27690000
LRM023        SET FMT-CASH-ACT TO TRUE                                  27700000
LRM023        DISPLAY 'FORCING NON CASH SHORT TO TYPE 1 '               27710000
LRM023            FMT-TI-ADP-CL-NO-X ' ' FMT-TI-CUST-ACCOUNT            27720000
LRM023        MOVE SPACES TO TYPE2-CASH-DETAIL-RECORD                   27730000
LRM023        MOVE FMT-TI-ADP-CL-NO-X TO TYPE2-CASH-ADP-CL-NO-X         27740000
LRM023        MOVE FMT-TI-CUST-ACCOUNT TO TYPE2-CASH-BRANCH-ACCOUNT     27750000
LRM023        MOVE FMT-ASSET-VALUE     TO TYPE2-CASH-AMOUNT             27760000
LRM023        MOVE FMT-STTLM-LCTN-CD   TO TYPE2-CASH-SETTLE-LOC         27770000
LRM023        MOVE FMT-ADP-SEC-NO      TO TYPE2-CASH-ADP-NUMBER         27780000
LRM023        MOVE FMT-CUSIP-NUM       TO TYPE2-CASH-CUSIP              27790000
LRM023        MOVE FMT-ASSET-QUAN      TO TYPE2-CASH-QUANTITY           27800000
LRM023        MOVE FMT-SEC-DESC-1      TO TYPE2-CASH-ASSET-DESC         27810000
LRM023        WRITE TYPE2-CASH-RECORD FROM TYPE2-CASH-DETAIL-RECORD     27820000
LRM023     END-IF.                                                      27830000
                                                                        27840000
246100     IF NOT FMT-MEMO                                              27850000
246200       AND ((FMT-SETTL-DATE  =  WS-TRADE-PLUS-2                   27860000
246300       AND FMT-TRNFR-TYPE  = 'FUL')                               27870000
246300       OR (FMT-TRNFR-TYPE  NOT = 'FUL'                            27880000
LRM037       AND FMT-SETTL-DATE  = WS-TRADE-PLUS-1))                    27890000
246400         PERFORM WRITE-CAT13-RECORD-RTN                           27900000
246500     END-IF.                                                      27910000
246600                                                                  27920000
246700** CHECK IF RECORD GOES TO T+1 FILE OF NON-CNS FAILS FOR CAGE **  27930000
YH0001                                                                  27940000
247000     IF ((FMT-SETTL-DATE  =  WS-TRADE-PLUS-2                      27950000
LRM         AND FMT-TRNFR-TYPE      = 'FUL')                            27960000
LRM        OR  (FMT-SETTL-DATE  =  WS-TRADE-PLUS-1                      27970000
LRM         AND FMT-TRNFR-TYPE  NOT = 'FUL'))                           27980000
247200       IF  NOT FMT-MEMO                                           27990000
247300       AND NOT FMT-CASH                                           28000000
247400       AND NOT FMT-OCC                                            28010000
247500       IF (NON-CNS  AND NOT FMT-FUND-SERV)                        28020000
247600                    OR                                            28030000
247700          (FMT-FUND-SERV    AND                                   28040000
247800           B1-FUND-SERV-CLIENT  (B1-IND)  =  '0')                 28050000
247900           PERFORM  O-FORMAT-T3RDFL-RECORD                        28060000
248000           PERFORM  O-WRITE-CAGE-NOTIFY-UPD-REC                   28070000
248100       END-IF                                                     28080000
248200     END-IF.                                                      28090000
248300                                                                  28091000
248400** CHECK IF RECORD GOES TO THE CAG2FL OUTPUT FILE **              28092000
248500                                                                  28093000
248600     IF  FMT-SETTL-DATE  =  WS-TRADE-PLUS-1                       28094000
248700         AND NOT FMT-MEMO                                         28095000
248800         AND  FMT-CLNT-IS-DELIVERER                               28096000
248900         AND  ( FMT-ACT-TYPE = 'SN' OR 'JT' OR 'DR' OR 'OT' OR    28097000
249000                               'ES' OR 'CU' OR 'TR' OR 'CO' )     28098000
249100         AND  CNS                                                 28099000
249200         AND  FMT-CASH-ACT                                        28100000
249300         PERFORM  O-FORMAT-CAG2FL-RECORD                          28100100
249400     END-IF.                                                      28100200
249500                                                                  28100300
249600** CHECK B1 OPTION AND STATUS FOR FUNDSERV FAILS FOR CAGE **      28100400
249700                                                                  28100500
249800     IF  FMT-FUND-SERV                                            28100600
249900     AND NOT FMT-MEMO                                             28100700
250000     AND B1-FUND-SERV-CLIENT  (B1-IND)  =  '1'                    28100800
YH0001       IF   (FMT-TRNFR-TYPE =  'FRV' OR 'MFC')                    28100900
YH0001         IF     FMT-SETTL-DATE  =  WS-TRADE-PLUS-1                28101000
YH0001           AND (FMT-TRNFR-TYPE =  'FRV'                           28102000
YH0001                OR (FMT-CAGE-TAG > SPACE AND                      28103000
YH0001                   B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) = '0'))  28104000
YH0001           PERFORM  O-FORMAT-T3RDFL-RECORD                        28105000
YH0001         END-IF                                                   28106000
YH0001       ELSE                                                       28107000
250100                                                                  28108000
250200         IF  FMT-REJECTED-BY-FUND                                 28109000
250300             IF  B1-FAILS-T3-OR-T4  (B1-IND)  =  '1'              28110000
250400****************IF  FMT-SETTL-DATE  =  BPD-PROC-DATE              28120000
LRM008                IF (FMT-SETTL-DATE  =  WS-TRADE-PLUS-2            28130000
LRM008                OR (FMT-SETTL-DATE  =  WS-TRADE-PLUS-1            28140000
LRM008                   AND  PEND-FNDSRVS-PRCS-DT = BPD-PROC-DATE))    28150000
250500*******************AND  PEND-UPDT-TMSTP = BPD-PROC-DATE           28160000
TEST  *******    DISPLAY 'T+1 FAIL ' FMT-TRNFR-TYPE                     28170000
TEST  ******       ' S/D ' FMT-SETTL-DATE                               28180000
250600                   PERFORM  O-FORMAT-T3RDFL-RECORD                28190000
250700                   PERFORM  O-WRITE-CAGE-REJECT-UPD-REC           28200000
250800                   MOVE 'Y' TO FMT-FAIL-OPEN-CAGE-IND             28210000
250900                END-IF                                            28220000
251000              ELSE                                                28230000
251100                IF  FMT-SETTL-DATE  =  WS-TRADE-PLUS-1            28240000
251200                   PERFORM  O-FORMAT-T3RDFL-RECORD                28250000
251300                   PERFORM  O-WRITE-CAGE-REJECT-UPD-REC           28260000
251400                   MOVE 'Y' TO FMT-FAIL-OPEN-CAGE-IND             28270000
251500                END-IF                                            28280000
251600             END-IF                                               28290000
251700         END-IF                                                   28300000
251800                                                                  28310000
251900         IF  FMT-ACCEPTED-BY-FUND                                 28320000
252000         AND FMT-FAIL-OPEN-CAGE-IND = 'Y'                         28330000
252100             IF  B1-FAILS-T3-OR-T4  (B1-IND)  =  '1'              28340000
252200                 PERFORM  O-WRITE-CAGE-ACCEPT-UPD-REC             28350000
252300         END-IF                                                   28360000
252400     END-IF.                                                      28370000
252500                                                                  28380000
252600                                                                  28390000
LRM005     IF PARM-SHAD-RUN                                             28400000
LRM005        IF B1-SERVICE-STATUS (B1-IND) = '1'                       28410000
LRM005        AND B1-SHADOW-POST   (B1-IND) = '1'                       28420000
LRM005        AND FMT-SETTL-DATE  =   WS-TRADE-PLUS-1                   28430000
LRM005***      OR  FMT-SETTL-DATE  =  WS-TRADE-PLUS-2)                  28440000
LRM005        AND (FMT-STATUS-CD  = '300' OR '310')                     28450000
LRM005        AND NOT FMT-MEMO                                          28460000
LRM005           PERFORM O-FORMAT-P2-RECORD                             28470000
LRM005        ELSE                                                      28480000
LRM005           CONTINUE                                               28490000
LRM005     ELSE                                                         28500000
252700     IF  FMT-SETTL-DATE  =  ACAT-PROC-DATE                        28510000
252800     AND B1-SERVICE-STATUS (B1-IND) = '1'                         28520000
252900     AND (FMT-STATUS-CD  = '300' OR '310')                        28530000
253000     AND NOT FMT-MEMO                                             28540000
253100         PERFORM O-FORMAT-P2-RECORD                               28550000
253200       IF  FMT-FUND-SERV    AND                                   28560000
253300           B1-FUND-SERV-CLIENT  (B1-IND)  =  '1'                  28570000
253400           IF  FMT-CLNT-IS-RECEIVER                               28580000
253500               ADD  1                   TO  TOT-CL-FS-RECV        28590000
253600           ELSE                                                   28600000
253700               ADD  1                   TO  TOT-CL-FS-DELV        28610000
253800           END-IF                                                 28620000
LRM009           PERFORM WRITE-FUNDSERV-EXTRACT                         28630000
253900       END-IF                                                     28640000
254000       IF NEW-TI                                                  28650000
254100       AND NOT PARM-CAGE-RUN                                      28660000
254200          ADD 1 TO TOT-CL-ACCOUNTS                                28670000
254300          SET NOT-NEW-TI TO TRUE                                  28680000
254400       END-IF                                                     28690000
254500       IF NEW-AT                                                  28700000
254600       AND NOT PARM-CAGE-RUN                                      28710000
254700          ADD 1 TO TOT-CL-ASSETS                                  28720000
254800          SET NOT-NEW-AT TO TRUE                                  28730000
254900       END-IF                                                     28740000
255000     END-IF.                                                      28750000
255100                                                                  28760000
255200** NEVER OUTPUT SMA FOR SHADOW POSTING RUN                        28770000
LRM005     IF PARM-SHAD-RUN                                             28780000
LRM005     AND FMT-SMA                                                  28790000
LRM005        CONTINUE                                                  28800000
LRM005     ELSE                                                         28810000
255300     IF  FMT-SETTL-DATE  =  ACAT-PROC-DATE                        28820000
255400     AND B1-SERVICE-STATUS (B1-IND) = '1'                         28830000
255500     AND B1-UPDATE-SMA (B1-IND) = '1'                             28840000
255600     AND (FMT-STATUS-CD  = '300' OR '310')                        28850000
255700     AND FMT-SMA                                                  28860000
255800     AND FMT-CLNT-IS-RECEIVER                                     28870000
255900         PERFORM O-FORMAT-SMA-RTN                                 28880000
256000     END-IF.                                                      28890000
256100/                                                                 28900000
256200 O-FUND-FAIL-PAST.                                                28910000
256300*** NO CAHNGES TO ACCEPTED BY MF       OR SETTLEMENT DATES ARE    28920000
256400*** IF REJECTED ON OR AFTER S/D                                   28930000
256500***   CREATE INTRA FILE ON ALL SITUATION                          28940000
256500***   IF S/D = TODAY BOOKEEPING FROM PEND FILE                    28950000
256500***   IF S/D < TODAY FORCE BOOKKEEPING FROM MPEND(NOT ON PEND)    28960000
256500**                                                                28970000
256600*-------------------------------------------------------------    28980000
256700*   IN HERE FUND-FAILS RECORD IS CREATED TO CAGE-FEED             28990000
256800*-------------------------------------------------------------    29000000
YH0001     IF  B1-SERVICE-STATUS (B1-IND) = '1'                         29010000
YH0001      IF     FMT-SETTL-DATE  <  ACAT-PROC-DATE                    29020000
YH0001        AND  FMT-ACCEPTED-BY-FUND                                 29030000
YH0001         PERFORM O-FORMAT-P2-RECORD                               29040000
YH0001      ELSE                                                        29050000
YH0001       IF   FMT-SETTL-DATE  NOT > ACAT-PROC-DATE                  29060000
YH0001        AND FMT-REJECTED-BY-FUND                                  29070000
YH0001         IF B1-POST-STL-REJ-BKP  (B1-IND)  = '0'                  29080000
YH0001         AND (FMT-UPDT-TMSTP  = ACAT-PROC-DATE                    29090000
YH0001               OR  FMT-SETTL-DATE  < ACAT-PROC-DATE )             29100000
YH0001         AND PARM-INTR-RUN                                        29110000
YH0001              PERFORM O-FORMAT-T3RDFL-RECORD                      29120000
YH0001              ADD +1  TO TOT-CAGE-FAIL-REC                        29130000
YH0001         END-IF                                                   29140000
YH0001                                                                  29150000
YH0001         IF   FMT-SETTL-DATE  <  ACAT-PROC-DATE                   29160000
YH0001           PERFORM O-FORMAT-P2-RECORD                             29170000
YH0001                                                                  29180000
YH0001       END-IF                                                     29190000
YH0001      END-IF                                                      29200000
YH0001     END-IF.                                                      29210000
261900                                                                  29220000
262000 O-FORMAT-SMA-RTN.                                                29230000
262100     MOVE 'MNS' TO P2-BK-TRID                                     29240000
262200     MOVE FMT-TI-ADP-CL-NO   TO P2-BK-BROKER-NBR                  29250000
262300** ALWAYS BOOK SMA AS A CREDIT.                                   29260000
262400     MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE                  29270000
262500     PERFORM O-CUST-ACT-MOVE-BR-ACT                               29280000
262600     MOVE SPACES TO P2-BK-SECURITY-NBR.                           29290000
262700     MOVE 'TFR'  TO P2-BK-ENTRY-CODE.                             29300000
262800     MOVE 'SMA TRANSFERED' TO P2-BK-DESCRIPTION                   29310000
262900     MULTIPLY FMT-ASSET-VALUE BY 1                                29320000
263000                         GIVING P2-BK-AMOUNT-DOLLARS.             29330000
263100     MOVE SPACES             TO P2-BK-QUANTITY-X                  29340000
263200     MOVE ZERO               TO P2-BK-FRACTION                    29350000
263300     MOVE 'D '  TO  P2-BK-SPIN-DTW                                29360000
263400     PERFORM O-WRITE-P2-ENTRY-CODE                                29370000
263500     WRITE P2BKPG-RECORD FROM P2-BK-RECORD                        29380000
263600     ADD 1 TO TOT-CL-P2-RECS-WRITTEN.                             29390000
263700                                                                  29400000
263800     MOVE '  '  TO  P2-BK-SPIN-DTW.                               29410000
263900 O-WRITE-CAGE-NOTIFY-UPD-REC.                                     29420000
264000**   DISPLAY 'NEED TO UPD CAGE IND'                               29430000
264100**                                    ' ' WS-SAVE-SEC             29440000
264200**         FMT-TI-ADP-CL-NO  ' '   FMT-TI-CUST-ACCOUNT.           29450000
264300 O-WRITE-CAGE-REJECT-UPD-REC.                                     29460000
264400**   DISPLAY 'NEED TO UPD CAGE REJECT'                            29470000
264500**                                    ' ' WS-SAVE-SEC             29480000
264600**         FMT-TI-ADP-CL-NO  ' '   FMT-TI-CUST-ACCOUNT.           29490000
264700 O-WRITE-CAGE-ACCEPT-UPD-REC.                                     29500000
264800**   DISPLAY 'NEED TO UPD CAGE ACCEPT'                            29510000
264900**                                    ' ' WS-SAVE-SEC             29511000
265000**         FMT-TI-ADP-CL-NO  ' '   FMT-TI-CUST-ACCOUNT.           29512000
265100******************************************************************29513000
265200*** PERFORMED BY:                                              ***29514000
265300***     O-DETERMINE-P2-VS-PENDING                              ***29515000
265400******************************************************************29516000
265500                                                                  29517000
265600 O-FORMAT-T3RDFL-RECORD.                                          29518000
265700     MOVE  FMT-TI-ADP-CL-NO           TO  CAGE-03-ADP-CLIENT-NBR. 29519000
265800     MOVE  FMT-SETTL-DATE             TO  CAGE-03-SETTLE-DATE.    29520000
LRM019**** PROBLEM FOUND IN CAGE QA TESTING; USE PROCESS DATE ON POST   29530000
LRM019**** S/D FAIL SETUP. NEXT 8 LINES COMMENTED OUT.                  29540000
YH0001**** IF    FMT-TRNFR-TYPE = 'MFC'                                 29550000
YH0001****   AND FMT-STTLM-ASCTD-DT > SPACES                            29560000
YH0001****   MOVE FMT-STTLM-ASCTD-DT        TO  CAGE-03-SETTLE-DATE     29570000
YH0001****   MOVE FMT-STTLM-ASCTD-DT (6 : 2)  TO                        29580000
YH0001****                                 CAGE-03-SETTLE-DATE (5 : 2)  29590000
YH0001****   MOVE FMT-STTLM-ASCTD-DT (9 : 2)  TO                        29600000
YH0001****                                 CAGE-03-SETTLE-DATE (7 : 2)  29610000
YH0001**** END-IF.                                                      29620000
                                                                        29630000
265900     IF  (FMT-LONG AND FMT-CLNT-IS-RECEIVER) OR                   29640000
266000         (FMT-SHORT AND FMT-CLNT-IS-DELIVERER)                    29650000
266100        MOVE '1'                      TO  CAGE-03-SPIN-CODE       29660000
266200     ELSE                                                         29670000
266300        MOVE '2'                      TO  CAGE-03-SPIN-CODE       29680000
266400     END-IF.                                                      29690000
266500     MOVE  SPACE                    TO  CAGE-03-NON-CNS-SK-IND.   29700000
266600     IF FMT-SAFE-KEEPING                                          29710000
266700      MOVE 'X'                        TO  CAGE-03-NON-CNS-SK-IND. 29720000
LRM036     MOVE SPACES TO CAGE-03-BLOTTER-CODE.                         29730000
LRM036     IF B1-ACAT-BLOT-CD-OVERD-NO (B1-IND) > ZERO                  29740000
LRM036        SET B1-SUB TO B1-IND                                      29750000
LRM036        PERFORM VARYING SUB FROM 1 BY 1                           29760000
LRM036              UNTIL SUB > B1-ACAT-BLOT-CD-OVERD-NO (B1-SUB)       29770000
LRM036           IF B1-ACAT-BLOT-CD-OVERD-LOC-RSN(B1-SUB, SUB)          29780000
LRM036                      = FMT-STTLM-RSN-CD                          29790000
LRM036              MOVE B1-ACAT-BLOT-CD-OVERD-CODE(B1-SUB, SUB)        29800000
LRM036                                      TO  CAGE-03-BLOTTER-CODE    29810000
LRM036              MOVE 20 TO SUB                                      29820000
LRM036            END-IF                                                29820100
LRM036        END-PERFORM                                               29820200
LRM036     END-IF.                                                      29820300
LRM036     IF CAGE-03-BLOTTER-CODE = SPACES                             29820400
266800        MOVE  B1-BLOTTER-CODE (B1-IND) TO CAGE-03-BLOTTER-CODE.   29820500
266900     MOVE  FMT-TI-CUST-ACCOUNT (1:3)  TO  CAGE-03-BRANCH-NBR.     29820600
267000     MOVE  FMT-TI-CUST-ACCOUNT (4:5)  TO  CAGE-03-ACCOUNT-NBR.    29820700
267100     MOVE  FMT-CASH-MGN-IND           TO  CAGE-03-ACCOUNT-TYPE.   29820800
267200     MOVE  FMT-ACT-TITLE              TO  CAGE-03-ACCOUNT-NAME.   29820900
267300     MOVE  FMT-ACT-TYPE               TO  CAGE-03-NSCC-CUST-TYPE. 29821000
267400     MOVE  FMT-ADP-SEC-NO             TO  CAGE-03-ADP-SECURITY-NBR29822000
267500     MOVE  FMT-CUSIP-NUM              TO  CAGE-03-CUSIP.          29823000
267600     MOVE  SPACES                     TO  CAGE-03-CURRENCY-CODE.  29824000
267700     MOVE  FMT-ASSET-VALUE            TO  CAGE-03-AMOUNT.         29825000
267800     MOVE  FMT-ASSET-QUAN             TO  CAGE-03-QUANTITY.       29826000
267900     MOVE  FMT-CONTRA-BRK-NUM         TO  CAGE-03-CONTRA-BROKER.  29827000
268000     MOVE  FMT-CONTRA-ACCOUNT         TO  CAGE-03-CONTRA-ACCOUNT. 29828000
268100     MOVE  FMT-TI-CONTROL-NUM         TO  CAGE-03-CONTROL-NBR.    29829000
268200     MOVE  '00'               TO  CAGE-03-ASSET-SEQ-NBR(1 : 2).   29830000
268300     MOVE  FMT-ASSET-SEQ-NO   TO  CAGE-03-ASSET-SEQ-NBR(3 : 4).   29840000
LRM009     IF (FMT-TRNFR-TYPE = 'MFC' OR 'FRV')                         29850000
LRM028        MOVE FMT-ORIG-STTLM-LCTN-CD   TO CAGE-03-AT-STL-LOC       29860000
LRM009        MOVE 'R'           TO CAGE-03-FAIL-REVERSAL-IND           29870000
LRM009        IF FMT-CAGE-TAG > SPACES                                  29880000
LRM009           MOVE FMT-CAGE-TAG  TO CAGE-03-CAGE-TAG                 29890000
LRM009        ELSE                                                      29900000
LRM009           MOVE 'ACAT'        TO CAGE-03-CAGE-TAG                 29910000
LRM009        END-IF                                                    29920000
LRM009     ELSE                                                         29930000
LRM028        MOVE FMT-STTLM-LCTN-CD        TO CAGE-03-AT-STL-LOC       29940000
LRM009        MOVE SPACES        TO CAGE-03-FAIL-REVERSAL-IND           29950000
LRM009                              CAGE-03-CAGE-TAG                    29960000
LRM009     END-IF.                                                      29970000
268400                                                                  29980000
268500     IF  (FMT-LONG AND FMT-CLNT-IS-RECEIVER) OR                   29990000
268600         (FMT-SHORT AND FMT-CLNT-IS-DELIVERER)                    30000000
268700          ADD  FMT-ASSET-VALUE        TO  TOT-CL-EARLY-CR-VALUE   30010000
268800          ADD  FMT-ASSET-QUAN         TO  TOT-CL-EARLY-CR-QTY     30020000
268900     END-IF.                                                      30030000
269000     IF  (FMT-LONG AND FMT-CLNT-IS-DELIVERER) OR                  30040000
269100         (FMT-SHORT AND FMT-CLNT-IS-RECEIVER)                     30050000
269200          ADD  FMT-ASSET-VALUE        TO  TOT-CL-EARLY-DB-VALUE   30060000
269300          ADD  FMT-ASSET-QUAN         TO  TOT-CL-EARLY-DB-QTY     30070000
269400     END-IF.                                                      30071000
269500                                                                  30072000
LRM025* NEVER SEND FAIL SETUP FOR PTF                                   30073000
LRM026* ONLY SEND INTRA-DAY FAIL SET-UP (POST SETTLE F/R REJECT) WHEN   30074000
LRM026*     CLIENT B1 434610 = 0 (THEY WANT POST SETTLE BOOKEEPING).    30075000
LRM026* ONLY SEND FAIL REVERSAL FOR MFC WHEN WE HAVE A TAG AND          30076000
LRM026*     CLIENT B1 434669 = 2 (THEY WANT MFC BOOKEEPING).            30077000
LRM025     IF    FMT-TRNFR-TYPE = 'PTF'                                 30078000
LRM026     OR (B1-POST-STL-REJ-BKP       (B1-IND) = '1'                 30079000
LRM026        AND PARM-INTR-RUN)                                        30080000
LRM026     OR (FMT-TRNFR-TYPE = 'MFC'                                   30090000
LRM026        AND (B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) NOT = '2'      30100000
LRM026         OR FMT-CAGE-TAG NOT > SPACE))                            30110000
LRM025        CONTINUE                                                  30120000
LRM025     ELSE                                                         30130000
269600        WRITE  T3RDFL-RECORD       FROM CAGE-03-RECORD            30140000
269700        IF  NOT  T3RDFL-FILE-OK                                   30150000
269800          DISPLAY  'T3RDFL FILE WRITE ERROR, STATUS = '           30160000
269900                    T3RDFL-FILE-STATUS                            30170000
270000          CALL ABEND            USING ABEND-CODE-4000             30180000
270100        END-IF                                                    30190000
270200        ADD  1                      TO  TOT-CL-EARLY-WRITTEN.     30200000
270300                                                                  30210000
270400/                                                                 30220000
270500******************************************************************30230000
270600*** PERFORMED BY:                                              ***30240000
270700***     O-DETERMINE-P2-VS-PENDING                              ***30250000
270800******************************************************************30260000
270900                                                                  30270000
271000 O-FORMAT-CAG2FL-RECORD.                                          30280000
271100                                                                  30290000
271200     MOVE  FMT-TI-ADP-CL-NO           TO  CAGE-ADP-CLIENT-NBR.    30300000
271300     MOVE  FMT-ADP-SEC-NO             TO  CAGE-ADP-SECURITY-NBR.  30310000
271400     MOVE  FMT-TI-CUST-ACCOUNT(1 : 8) TO  CAGE-ACCOUNT-NBR.       30320000
271500     MOVE  FMT-ASSET-QUAN             TO  CAGE-QUANTITY.          30330000
271600     MOVE  FMT-CASH-MGN-IND           TO  CAGE-ACCOUNT-TYPE.      30340000
271700     WRITE CAG2FL-RECORD             FROM CAGE-DETAIL-AREA.       30350000
271800     IF  NOT  CAG2FL-FILE-OK                                      30360000
271900         DISPLAY  'CAG2FL FILE WRITE ERROR, STATUS = '            30370000
272000                   CAG2FL-FILE-STATUS                             30380000
272100         CALL ABEND                 USING ABEND-CODE-4000         30390000
272200     END-IF.                                                      30400000
272300     ADD  +1                          TO  CAG2FL-RECS.            30410000
272400                                                                  30420000
272500/                                                                 30430000
272600 WRITE-CAT13-RECORD-RTN.                                          30440000
272700                                                                  30450000
272800     MOVE FMT-TI-ADP-CL-NO   TO CAT13-ADP-CLIENT-NBR.             30460000
272900     MOVE FMT-DSTBN-SIDE-CD  TO CAT13-TRANSFER-SIDE.              30470000
273000     MOVE FMT-AT-CUST-ACCOUNT TO CAT13-BRANCH-NBR.                30480000
273100     MOVE FMT-AT-CUST-ACCOUNT(4 : 5) TO CAT13-ACCOUNT-NBR.        30490000
273200     MOVE FMT-CASH-MGN-IND    TO CAT13-ACCOUNT-TYPE.              30491000
273300     MOVE FMT-CUSIP-NUM       TO  CAT13-CUSIP.                    30491100
273400     MOVE FMT-ASSET-QUAN      TO CAT13-QUANTITY.                  30491200
273400     IF   FMT-SHORT                                               30491300
273400      MULTIPLY -1             BY CAT13-QUANTITY                   30491400
273900     END-IF.                                                      30491500
273500     IF CNS                                                       30491600
273600         SET CAT13-SETTLE-CNS TO TRUE                             30491700
273700     ELSE                                                         30491800
273800         SET CAT13-SETTLE-NON-CNS TO TRUE                         30491900
273900     END-IF.                                                      30492000
274000     MOVE FMT-SETTL-DATE      TO CAT13-SETTLE-DATE.               30493000
274100     WRITE CAT13-RECORD.                                          30494000
274200                                                                  30495000
LRM009 WRITE-FUNDSERV-EXTRACT.                                          30496000
LRM009     IF (FMT-TRNFR-TYPE = 'FUL' OR 'PTR' OR 'PTD' OR 'RCR')       30497000
LRM009        MOVE PEND-AT-RECORD    TO OFUND-AT-RECORD                 30498000
LRM009        MOVE MF-PROCESS-OPTION TO OFUND-FUND-PROC-CD              30499000
LRM009        WRITE OFUND-AT-RECORD                                     30500000
LRM009     END-IF.                                                      30510000
274300/                                                                 30520000
274400******************************************************************30530000
274500*** PERFORMED BY:                                              ***30540000
274600***     O-PROCESS-ACAT-CLIENT                                  ***30550000
274700******************************************************************30560000
274800                                                                  30570000
274900 O-CLIENT-BREAK.                                                  30580000
275000                                                                  30590000
275100     MOVE B1-ADP-CL-NO (B1-IND) TO NUM-OUT-CLIENT-NUMBER          30600000
275200                                                                  30610000
YH0001     IF  PC-LINE-CNT NOT = 999                                    30620000
              MOVE 999     TO PC-LINE-CNT.                              30630000
           PERFORM VARYING MFC-IND FROM 1 BY 1                          30640000
                UNTIL MFC-IND > MFC-MAX                                 30650000
              MOVE MFC-ERR-LINE1 (MFC-IND) TO PW-LINE                   30660000
              PERFORM O-PRINT-LINE                                      30670000
              IF   MFC-ERR-LINE1A (MFC-IND) NOT = SPACES                30680000
               MOVE MFC-ERR-LINE1A (MFC-IND) TO PW-LINE                 30690000
               PERFORM O-PRINT-LINE                                     30700000
              END-IF                                                    30710000
              MOVE MFC-ERR-LINE3 (MFC-IND) TO PW-LINE                   30720000
              PERFORM O-PRINT-LINE                                      30730000
              IF   MFC-ERR-LINE4 (MFC-IND) NOT = SPACES                 30740000
               MOVE MFC-ERR-LINE4 (MFC-IND) TO PW-LINE                  30750000
               PERFORM O-PRINT-LINE                                     30760000
              END-IF                                                    30770000
              IF   MFC-ERR-LINE5 (MFC-IND) NOT = SPACES                 30780000
               MOVE MFC-ERR-LINE5 (MFC-IND) TO PW-LINE                  30790000
               PERFORM O-PRINT-LINE                                     30800000
              END-IF                                                    30810000
              MOVE MFC-ERR-LINE2 (MFC-IND) TO PW-LINE                   30820000
              PERFORM O-PRINT-LINE                                      30830000
           END-PERFORM.                                                 30840000
           MOVE   0         TO MFC-MAX.                                 30850000
                                                                        30860000
275300     PERFORM O-CLIENT-BREAK-ADD-TOT-DB-CR                         30870000
275400                                                                  30880000
275500     PERFORM O-PRINT-CLIENT-TOTALS                                30890000
275600                                                                  30900000
275700     IF PARM-BOOK-RUN                                             30910000
275800        PERFORM O-CLIENT-BREAK-BILLING                            30920000
275900     END-IF.                                                      30930000
276000                                                                  30940000
276100     PERFORM O-CLIENT-BREAK-DISPLAY-TOTALS                        30950000
276200         VARYING CL-O-CNTR-X                                      30960000
276300         FROM 1 BY 1                                              30970000
276400         UNTIL   CL-O-CNTR-X IS GREATER THAN NUM-CL-OUT-CNTRS     30980000
276500                                                                  30990000
276600     PERFORM O-CLIENT-BREAK-ROLL-TOTALS                           31000000
276700                                                                  31010000
276800     PERFORM O-CLIENT-BREAK-CLEAR-TOTALS                          31020000
276900         VARYING CL-O-CNTR-X                                      31030000
277000         FROM 1 BY 1                                              31040000
277100         UNTIL   CL-O-CNTR-X IS GREATER THAN NUM-CL-OUT-CNTRS.    31050000
277200/                                                                 31060000
277300******************************************************************31070000
277400*** PERFORMED BY:                                              ***31080000
277500***     O-PROCESS-ACAT-CLIENT                                  ***31090000
277600******************************************************************31100000
277700                                                                  31110000
277800 O-CLIENT-BREAK-SET-UP-NEXT-CL.                                   31120000
277900                                                                  31130000
278000     ADD 1 TO NUM-OF-CLIENTS                                      31140000
278100     MOVE B1-ADP-CL-NO (B1-IND) TO TL-CLIENT-NUMBER               31150000
278200     MOVE B1-ADP-CL-NO (B1-IND) TO TTL-CLIENT-NUMBER              31160000
278300     MOVE B1-ADP-CL-NO (B1-IND) TO PREV-ADP-CLIENT                31170000
278400     MOVE B1-ADP-CL-NO (B1-IND) TO PW-CL                          31180000
278500*    DISPLAY 'NEW CLIENT SET-UP ' PREV-ADP-CLIENT.                31190000
278600****************************************************************  31200000
278700     DISPLAY  ' '                                                 31210000
278800     DISPLAY  '*===============================================*' 31211000
278900     DISPLAY  '     CAT650: B1 VALUES FOR ACAT CLIENT: '          31212000
279000                                         B1-ADP-CL-NO (B1-IND)    31213000
279100     DISPLAY  '*===============================================*' 31214000
279200     DISPLAY                                                      31215000
279300     'CAT650: B1-SERVICE-STATUS                 (434502) = '      31216000
279400              B1-SERVICE-STATUS (B1-IND)                          31217000
279500     DISPLAY                                                      31218000
279600     'CAT650: B1-UPDATE-SMA                     (434513) = '      31219000
279700              B1-UPDATE-SMA (B1-IND)                              31219100
279800     DISPLAY                                                      31219200
279900     'CAT650: B1-OFFSET-ACC-NUM                 (434639) = '      31219300
280000              B1-OFFSET-ACC-NUM (B1-IND)                          31219400
280100     DISPLAY                                                      31219500
280200     'CAT650: B1-OFFSET-ROLL-ACC                (434640) = '      31219600
280300              B1-OFFSET-ROLL-ACC (B1-IND)                         31219700
280400     DISPLAY                                                      31219800
280500     'CAT650: B1-P2-OPTION-B                    (006200) = '      31219900
280600              B1-OPTION-OFFSET-IND (B1-IND)                       31220000
280700     DISPLAY                                                      31230000
280800     'CAT650: B1-ENTRY-CODE-DEL                 (434627) = '      31240000
280900              B1-ENTRY-CODE-DEL (B1-IND)                          31250000
281000     DISPLAY                                                      31260000
281100     'CAT650: B1-ENTRY-CODE-REC                 (434626) = '      31270000
281200              B1-ENTRY-CODE-REC (B1-IND)                          31280000
281300     DISPLAY                                                      31290000
281400     'CAT650: B1-ENTRY-DEL-ROLL                 (434628) = '      31300000
281500              B1-ENTRY-DEL-ROLL (B1-IND)                          31310000
281600     DISPLAY                                                      31320000
281700     'CAT650: B1-ENTRY-REC-ROLL                 (434629) = '      31330000
281800              B1-ENTRY-REC-ROLL (B1-IND)                          31340000
LRM013     DISPLAY                                                      31350000
LRM013     'CAT650: B1-ENTRY-PTR-DEL-ROLL             (434630) = '      31360000
LRM013              B1-ENTRY-PTR-DEL-ROLL (B1-IND)                      31370000
LRM013     DISPLAY                                                      31380000
LRM013     'CAT650: B1-ENTRY-PTR-REC-ROLL             (434631) = '      31390000
LRM013              B1-ENTRY-PTR-REC-ROLL (B1-IND)                      31400000
281810     DISPLAY                                                      31410000
281820     'CAT650: B1-MISC-FRACT-QTY                 (001209) = '      31420000
281830              B1-FRAC-QTY-PROC  (B1-IND)                          31430000
281840     DISPLAY                                                      31440000
281850     'CAT650: B1-MISC-IRA-CLIENT                (001202) = '      31450000
281860              B1-MISC-IRA-CLIENT (B1-IND)                         31460000
281870     DISPLAY                                                      31470000
281880     'CAT650: B1-ROLLOVER-CLIENT                (434584) = '      31480000
281890              B1-ROLLOVER-CLIENT (B1-IND)                         31490000
281900     DISPLAY                                                      31500000
282000     'CAT650: B1-BLOTTER-CODE-FOR-FAILS         (434622) = '      31510000
282100              B1-BLOTTER-CODE (B1-IND)                            31520000
282200     DISPLAY                                                      31530000
282300     'CAT650: B1-OFFSET-AMT-BYPASS              (434585) = '      31540000
282400              B1-OFFSET-AMT-BYPASS (B1-IND)                       31550000
282500     DISPLAY                                                      31560000
282600     'CAT650: B1-FUND-MF-SERV-CLIENT            (434606) = '      31570000
282700              B1-FUND-SERV-CLIENT (B1-IND)                        31580000
282800     DISPLAY                                                      31590000
282900     'CAT650: B1-FAILS-T3-OR-T4                 (501361) = '      31600000
283000              B1-FAILS-T3-OR-T4 (B1-IND)                          31610000
283100     DISPLAY                                                      31620000
283200     'CAT650: B1-POST-STL-REJ-BKP               (434610) = '      31630000
283300              B1-POST-STL-REJ-BKP (B1-IND)                        31640000
LRM026     DISPLAY                                                      31650000
LRM026     'CAT650: B1-ACAT-DONT-BOOK-MFC-TRANSF      (434669) = '      31660000
LRM026              B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND)               31670000
283400     DISPLAY                                                      31680000
283500     'CAT650: B1-RCV-PEND-STL-ACCT              (434637) = '      31690000
283600              B1-RCV-PEND-STL-ACCT (B1-IND)                       31700000
283700     DISPLAY                                                      31710000
283800     'CAT650: B1-DEL-PEND-STL-ACCT              (434638) = '      31720000
283900              B1-DEL-PEND-STL-ACCT (B1-IND)                       31730000
284000     DISPLAY                                                      31740000
284100     'CAT650: B1-PEND-STL-BATCH-CODE            (434623) = '      31750000
284200              B1-PEND-STL-BATCH-CODE (B1-IND)                     31760000
284300     DISPLAY                                                      31770000
284400     'CAT650: B1-MFRS-ACTIVE                    (537011) = '      31780000
284500              B1-MFRS-ACTIVE (B1-IND)                             31790000
284600     DISPLAY                                                      31800000
284700     'CAT650: BH-MF-FIRM-NA-BOOK-SHR-CTL-ACT    (537448) = '      31810000
284800              B1-MFRS-BB-OFFSET (B1-IND)                          31820000
284900     DISPLAY                                                      31830000
285000     'CAT650: B1-MFRS-OMNIBUS-OFFSET            (537435) = '      31840000
285100              B1-MFRS-OMNIBUS-OFFSET (B1-IND)                     31850000
285110     DISPLAY                                                      31860000
285120     'CAT650: B1-MFRS-NSCCSRC-OFFSET            (537596) = '      31870000
285130              B1-MFRS-NSCCSRC-OFFSET (B1-IND)                     31880000
LRM003     DISPLAY                                                      31890000
LRM003     'CAT650: BH-MFN-DST-MFE-NSCC-BOX-ACCT      (537601) = '      31900000
LRM003              B1-MFRS-DST-MFE-OFFSET (B1-IND)                     31910000
LRM029     DISPLAY                                                      31920000
LRM029     'CAT650: BH-MF3-PNC-SURPAS-BOX-ACCOUNT     (540238) = '      31930000
LRM029              B1-PNC-SURPAS-OFFSET   (B1-IND)                     31940000
285200     DISPLAY                                                      31950000
285300     'CAT650: BH-MF-BKR-NOMINEE-BOOK-SHR-CTL    (537449) = '      31960000
285400              B1-MFRS-BN-OFFSET (B1-IND)                          31970000
285500     DISPLAY                                                      31980000
285600     'CAT650: B1-ACAT-P2-CONTRA-TRAILER         (434587) = '      31990000
285700              B1-ACAT-P2-TRAILER (B1-IND)                         32000000
285800     DISPLAY                                                      32010000
285900     'CAT650: B1-RES-CREDIT-P2-TRLR             (511224) = '      32020000
286000               B1-RES-CREDIT-P2-TRLR (B1-IND)                     32030000
286100     DISPLAY                                                      32040000
286200     'CAT650: B1-ENTRY-DEL-CASH                 (434625) = '      32050000
286300               B1-ENTRY-DEL-CASH (B1-IND)                         32060000
286400     DISPLAY                                                      32070000
286500     'CAT650: B1-ENTRY-REC-CASH                 (434624) = '      32080000
286600               B1-ENTRY-REC-CASH (B1-IND)                         32090000
286700     DISPLAY                                                      32100000
286800     'CAT650: B1-BEARER-BOND-OPT                (434591) = '      32110000
286900               B1-BEARER-BOND-OPT (B1-IND)                        32120000
287000     DISPLAY                                                      32130000
287100     'CAT650: B1-RESTRICTED-OPT  =                         '      32140000
287200               B1-RESTRICTED-OPT (B1-IND)                         32150000
287300     DISPLAY                                                      32160000
287400     'CAT650: B1-MFRS-NOLOAD-CLIENT             (540113) = '      32170000
287500               B1-MFRS-NOLOAD-CLIENT (B1-IND)                     32180000
287600**** DISPLAY                                                      32190000
287700**** 'CAT650: B1-POST-STL-REJ-BKP               (434610) = '      32200000
287800****           B1-POST-STL-REJ-BKP       (B1-IND)                 32210000
287900**** DISPLAY                                                      32220000
288000**** 'CAT650: B1-FAIL-DELIVR-BATCH-ENTRY        (434656) = '      32221000
288100****          B1-FAIL-DELIVR-BATCH-ENTRY (B1-IND)                 32222000
LRM005     DISPLAY                                                      32223000
LRM005     'CAT650: B1-ACAT-SHADOW-POST               (434686) = '      32224000
LRM005              B1-SHADOW-POST   (B1-IND).                          32225000
LRM022     DISPLAY                                                      32226000
LRM022     'CAT650: B1-ACAT-BOOK-DEBIT-BAL-TYPE1      (434734) = '      32227000
LRM022              B1-ACAT-BOOK-DEBIT-BAL-TYPE1 (B1-IND).              32228000
LRM032     DISPLAY                                                      32229000
LRM032     'CAT650: B1-SFK-RSEC-MEMO                  (434760) = '      32230000
LRM032              B1-SFK-RSEC-MEMO (B1-IND).                          32240000
LRM041     DISPLAY                                                      32250000
LRM041     'CAT650: B1-ACAT-FUNDSERV-PEND-MEMO        (434764) = '      32260000
LRM041              B1-ACAT-FUNDSERV-PEND-MEMO (B1-IND).                32270000
289700****************************************************************  32280000
289800     IF  B1-OFFSET-ACC-NUM (B1-IND) GREATER THAN SPACES           32290000
289900         MOVE  B1-OFFSET-ACC-NUM (B1-IND)                         32300000
290000            TO ALT-OFFSET-BR-ACCT-TYPE                            32310000
290100         CALL  CKDIGIT  USING                                     32320000
290200                        ALT-OFFSET-BR-ACCT-TYPE                   32330000
290300                        LENGTH-KEY                                32340000
290400                        ALT-OFFSET-CHECK-DIGIT                    32350000
290500         END-CALL                                                 32360000
290600     ELSE                                                         32370000
290700         MOVE  CNS-BR-ACCT-T-C TO ALTERNATE-OFFSET-ACCOUNT        32380000
290800     END-IF                                                       32390000
290900                                                                  32400000
LRM021     IF B1-OPTION-OFFSET-ACCOUNT (B1-IND) > SPACES                32410000
LRM021         MOVE  B1-OPTION-OFFSET-ACCOUNT (B1-IND)                  32420000
LRM021            TO ALT-OPTION-OFFSET-BR-ACCT-TYPE                     32430000
LRM021         CALL  CKDIGIT  USING                                     32440000
LRM021                        ALT-OPTION-OFFSET-BR-ACCT-TYPE            32450000
LRM021                        LENGTH-KEY                                32460000
LRM021                        ALT-OPTION-OFFSET-CHECK-DIGIT             32470000
LRM021         END-CALL                                                 32480000
LRM021     ELSE                                                         32490000
LRM021         MOVE  SPACES          TO ALT-OPTION-OFFSET-ACCOUNT       32500000
LRM021     END-IF                                                       32510000
LRM021                                                                  32520000
291000     IF  B1-OFFSET-ROLL-ACC (B1-IND) GREATER THAN SPACES          32530000
291100         MOVE  B1-OFFSET-ROLL-ACC (B1-IND)                        32540000
291200            TO ROL-OFFSET-BR-ACCT-TYPE                            32550000
291300         CALL  CKDIGIT  USING                                     32560000
291400                        ROL-OFFSET-BR-ACCT-TYPE                   32570000
291500                        LENGTH-KEY                                32580000
291600                        ROL-OFFSET-CHECK-DIGIT                    32590000
291700         END-CALL                                                 32600000
291800     ELSE                                                         32610000
291900         MOVE  WS-ROLL-OFFSET-ACC TO ROLLOVER-OFFSET-ACCOUNT      32620000
292000     END-IF.                                                      32630000
292100                                                                  32640000
292200     IF  B1-FUND-SERV-CLIENT (B1-IND)  =  '1'                     32650000
292300         PERFORM  O-LOAD-MEMO-TABLE                               32660000
292400     END-IF.                                                      32670000
292500/                                                                 32680000
292600******************************************************************32690000
292700*** PERFORMED BY:                                              ***32700000
292800***     O-CLIENT-BREAK-SET-UP-NEXT-CL                          ***32710000
292900******************************************************************32720000
293000                                                                  32730000
293100 O-LOAD-MEMO-TABLE.                                               32740000
293200     INITIALIZE  MEMO-TABLE.                                      32750000
293300     MOVE  +1                         TO  MEMO-SUB.               32760000
293400     MOVE  B1-ADP-CL-NO (B1-IND)      TO  MEMO-CLIENT.            32770000
293500     MOVE  B1-ADP-CL-NO (B1-IND)      TO  MEMO-CLNT.              32780000
293600     PERFORM                                                      32790000
293700       UNTIL  MEMO-ENDFILE  OR                                    32800000
LRM050              MEMO-SUB  >  +6                                     32810000
293900         EVALUATE  MEMO-SUB                                       32820000
294000           WHEN  1    MOVE  'N1'      TO  MEMO-CODE               32830000
294100           WHEN  2    MOVE  'N2'      TO  MEMO-CODE               32840000
294200           WHEN  3    MOVE  'N3'      TO  MEMO-CODE               32850000
294300           WHEN  4    MOVE  'N4'      TO  MEMO-CODE               32860000
294400           WHEN  5    MOVE  'M9'      TO  MEMO-CODE               32870000
LRM050           WHEN  6    MOVE  'N6'      TO  MEMO-CODE               32880000
294500         END-EVALUATE                                             32890000
294600         READ  MEMO-FILE             INTO MSS-RECORD              32900000
294700         IF  MEMO-ENDFILE  OR                                     32910000
294800             MEMO-NOTFOUND                                        32920000
294900*            PERFORM O-PRINT-ERROR??????                          32930000
295000             CONTINUE                                             32940000
295100         ELSE                                                     32950000
295200           IF  NOT  MEMO-FILE-OK                                  32960000
295300               DISPLAY  'MEMO FILE READ KEY ERROR, STATUS = '     32970000
295400                         MEMO-FILE-STATUS                         32980000
295500               CALL  ABEND          USING ABEND-CODE-4000         32990000
295600           ELSE                                                   33000000
295700               MOVE  MEMO-CODE  TO  MEMO-VALUE (MEMO-SUB)         33010000
295800               MOVE  MSS-SS-LOW-1 (3:3)                           33020000
295900                 TO  MEMO-ACCOUNT (MEMO-SUB) (1:3)                33030000
296000               MOVE  MSS-SS-LOW-1 (11:5)                          33040000
296100                 TO  MEMO-ACCOUNT (MEMO-SUB) (4:5)                33050000
296200               MOVE  MSS-SS-LOW-1 (16:2)                          33060000
296300                 TO  MEMO-ACCOUNT (MEMO-SUB) (9:2)                33070000
296400               MOVE  'S'                                          33080000
296500                 TO  MEMO-ONE-WAY-BATCH (MEMO-SUB) (1:1)          33090000
296600               MOVE  'S'                                          33100000
296700                 TO  MEMO-TWO-WAY-BATCH (MEMO-SUB) (1:1)          33110000
296800               EVALUATE  MSS-NUMBER-OF-OFFSETS                    33120000
296900                 WHEN  1                                          33130000
297000                   MOVE  MSS-MEMO                                 33140000
297100                     TO  MEMO-ONE-WAY-BATCH (MEMO-SUB) (2:2)      33150000
297200                 WHEN  2                                          33160000
297300                   MOVE  MSS-MEMO                                 33170000
297400                     TO  MEMO-TWO-WAY-BATCH (MEMO-SUB) (2:2)      33180000
297500               END-EVALUATE                                       33190000
297600               EVALUATE  MSS-CORR-MEMO-1-NUM-OFFSETS              33200000
297700                 WHEN  1                                          33210000
297800                   MOVE  MSS-CORR-MEMO1                           33220000
297900                     TO  MEMO-ONE-WAY-BATCH (MEMO-SUB) (2:2)      33230000
298000                 WHEN  2                                          33240000
298100                   MOVE  MSS-CORR-MEMO1                           33250000
298200                     TO  MEMO-TWO-WAY-BATCH (MEMO-SUB) (2:2)      33260000
298300               END-EVALUATE                                       33270000
298400               EVALUATE  MSS-CORR-MEMO-2-NUM-OFFSETS              33280000
298500                 WHEN  1                                          33290000
298600                   MOVE  MSS-CORR-MEMO2                           33300000
298700                     TO  MEMO-ONE-WAY-BATCH (MEMO-SUB) (2:2)      33310000
298800                 WHEN  2                                          33320000
298900                   MOVE  MSS-CORR-MEMO2                           33330000
299000                     TO  MEMO-TWO-WAY-BATCH (MEMO-SUB) (2:2)      33340000
299100               END-EVALUATE                                       33350000
299200           END-IF                                                 33360000
299300         END-IF                                                   33370000
299400         ADD  +1                      TO  MEMO-SUB                33380000
299500     END-PERFORM.                                                 33390000
299600     DISPLAY  'MEMO TABLE VALUES'.                                33400000
299700     DISPLAY   MEMO-TABLE.                                        33410000
299800                                                                  33420000
299900/                                                                 33430000
300000******************************************************************33440000
300100*** PERFORMED BY:                                              ***33450000
300200***     O-CLIENT-BREAK                                         ***33460000
300300******************************************************************33470000
300400                                                                  33480000
300500 O-CLIENT-BREAK-ADD-TOT-DB-CR.                                    33490000
300600                                                                  33500000
300700     COMPUTE TOT-CL-BK-DB-VALUE = TOT-CL-BK-CUST-DB-VALUE         33510000
300800                                + TOT-CL-OFFSET-DB-VALUE          33520000
300900                                + TOT-CL-OFFSET-BYP-DB-VALUE      33530000
301000                                + TOT-CL-PEND-DEL-DB-VALUE        33540000
301100                                + TOT-CL-PEND-REC-DB-VALUE        33550000
301200     END-COMPUTE                                                  33560000
301300                                                                  33570000
301400     COMPUTE TOT-CL-BK-CR-VALUE = TOT-CL-BK-CUST-CR-VALUE         33580000
301500                                + TOT-CL-OFFSET-CR-VALUE          33590000
301600                                + TOT-CL-OFFSET-BYP-CR-VALUE      33600000
301700                                + TOT-CL-PEND-DEL-CR-VALUE        33610000
301800                                + TOT-CL-PEND-REC-CR-VALUE        33620000
301900     END-COMPUTE                                                  33630000
302000                                                                  33640000
302100     COMPUTE TOT-CL-BK-DB-QTY = TOT-CL-BK-CUST-DB-QTY             33650000
302200                              + TOT-CL-BK-CNS-DB-QTY              33660000
302300                              + TOT-CL-BK-OPTION-DB-QTY           33670000
302400                              + TOT-CL-OPT-CBOE-DB-QTY            33680000
302500                              + TOT-CL-AMEX-NYSE-DB-QTY           33690000
302600                              + TOT-CL-OPT-PBW-DB-QTY             33700000
302700                              + TOT-CL-OPT-PSE-DB-QTY             33710000
302800                              + TOT-CL-OPT-DFLT-DB-QTY            33720000
302900                              + TOT-N1-MEMO-DB-QTY                33730000
303000                              + TOT-N2-MEMO-DB-QTY                33740000
303100                              + TOT-N3-MEMO-DB-QTY                33750000
303200                              + TOT-N4-MEMO-DB-QTY                33760000
LRM050                              + TOT-N6-MEMO-DB-QTY                33770000
303300                              + TOT-N0-MEMO-DB-QTY                33780000
303400                                + TOT-CL-PEND-DEL-DB-QTY          33781000
303500                                + TOT-CL-PEND-REC-DB-QTY          33782000
303600     END-COMPUTE                                                  33783000
303700                                                                  33784000
303800     COMPUTE TOT-CL-BK-CR-QTY = TOT-CL-BK-CUST-CR-QTY             33785000
303900                              + TOT-CL-BK-CNS-CR-QTY              33786000
304000                              + TOT-CL-BK-OPTION-CR-QTY           33787000
304100                              + TOT-CL-OPT-CBOE-CR-QTY            33788000
304200                              + TOT-CL-AMEX-NYSE-CR-QTY           33789000
304300                              + TOT-CL-OPT-PBW-CR-QTY             33790000
304400                              + TOT-CL-OPT-PSE-CR-QTY             33800000
304500                              + TOT-CL-OPT-DFLT-CR-QTY            33810000
304600                              + TOT-N1-MEMO-CR-QTY                33820000
304700                              + TOT-N2-MEMO-CR-QTY                33830000
304800                              + TOT-N3-MEMO-CR-QTY                33840000
304900                              + TOT-N4-MEMO-CR-QTY                33850000
LRM050                              + TOT-N6-MEMO-CR-QTY                33860000
305000                              + TOT-N0-MEMO-CR-QTY                33870000
305100                                + TOT-CL-PEND-DEL-CR-QTY          33880000
305200                                + TOT-CL-PEND-REC-CR-QTY          33890000
305300     END-COMPUTE                                                  33900000
305400                                                                  33910000
305500     COMPUTE TOT-CL-DB-VALUE = TOT-CL-BK-CUST-DB-VALUE            33920000
305600                             + TOT-CL-OFFSET-DB-VALUE             33930000
305700                             + TOT-CL-OFFSET-BYP-DB-VALUE         33940000
305800                             + TOT-CL-RD-CL-DB-VALUE              33950000
305900                                + TOT-CL-PEND-DEL-DB-VALUE        33960000
306000                                + TOT-CL-PEND-REC-DB-VALUE        33970000
306100     END-COMPUTE                                                  33980000
306200                                                                  33990000
306300     COMPUTE TOT-CL-CR-VALUE = TOT-CL-BK-CUST-CR-VALUE            34000000
306400                             + TOT-CL-OFFSET-CR-VALUE             34010000
306500                             + TOT-CL-OFFSET-BYP-CR-VALUE         34020000
306600                             + TOT-CL-RD-CL-CR-VALUE              34030000
306700                                + TOT-CL-PEND-DEL-CR-VALUE        34040000
306800                                + TOT-CL-PEND-REC-CR-VALUE        34050000
306900     END-COMPUTE                                                  34060000
307000                                                                  34070000
307100     COMPUTE TOT-CL-DB-QTY   = TOT-CL-BK-CUST-DB-QTY              34080000
307200                             + TOT-CL-BK-CNS-DB-QTY               34090000
307300                             + TOT-CL-RD-CL-DB-QTY                34100000
307400                             + TOT-CL-BK-OPTION-DB-QTY            34110000
307500                             + TOT-CL-OPT-CBOE-DB-QTY             34120000
307600                             + TOT-CL-AMEX-NYSE-DB-QTY            34130000
307700                             + TOT-CL-OPT-PBW-DB-QTY              34140000
307800                             + TOT-CL-OPT-PSE-DB-QTY              34150000
307900                             + TOT-CL-OPT-DFLT-DB-QTY             34160000
308000                              + TOT-N1-MEMO-DB-QTY                34170000
308100                              + TOT-N2-MEMO-DB-QTY                34180000
308200                              + TOT-N3-MEMO-DB-QTY                34190000
308300                              + TOT-N4-MEMO-DB-QTY                34200000
LRM050                              + TOT-N6-MEMO-DB-QTY                34210000
308400                              + TOT-N0-MEMO-DB-QTY                34220000
308500                                + TOT-CL-PEND-DEL-DB-QTY          34230000
308600                                + TOT-CL-PEND-REC-DB-QTY          34240000
308700     END-COMPUTE                                                  34250000
308800                                                                  34260000
308900     COMPUTE TOT-CL-CR-QTY   = TOT-CL-BK-CUST-CR-QTY              34270000
309000                             + TOT-CL-BK-CNS-CR-QTY               34280000
309100                             + TOT-CL-RD-CL-CR-QTY                34290000
309200                             + TOT-CL-BK-OPTION-CR-QTY            34300000
309300                             + TOT-CL-OPT-CBOE-CR-QTY             34310000
309400                             + TOT-CL-AMEX-NYSE-CR-QTY            34320000
309500                             + TOT-CL-OPT-PBW-CR-QTY              34330000
309600                             + TOT-CL-OPT-PSE-CR-QTY              34340000
309700                             + TOT-CL-OPT-DFLT-CR-QTY             34350000
309800                              + TOT-N1-MEMO-CR-QTY                34360000
309900                              + TOT-N2-MEMO-CR-QTY                34370000
310000                              + TOT-N3-MEMO-CR-QTY                34380000
310100                              + TOT-N4-MEMO-CR-QTY                34390000
LRM050                              + TOT-N6-MEMO-CR-QTY                34400000
310200                              + TOT-N0-MEMO-CR-QTY                34410000
310300                                + TOT-CL-PEND-DEL-CR-QTY          34420000
310400                                + TOT-CL-PEND-REC-CR-QTY          34430000
310500     END-COMPUTE                                                  34440000
310600                                                                  34450000
310700     IF  TOT-CL-DB-VALUE  NOT =  TOT-CL-CR-VALUE                  34460000
310800         DISPLAY 'CLIENT TOTAL VALUE DEBITS & CREDITS DONT AGREE' 34470000
310900         DISPLAY 'CLIENT VALUE DEBITS  = ' TOT-CL-DB-VALUE        34480000
311000         DISPLAY 'CLIENT VALUE CREDITS = ' TOT-CL-CR-VALUE        34490000
311100*        CALL  ABEND        USING ABEND-CODE-4000                 34500000
311200     END-IF                                                       34510000
311300                                                                  34520000
311400     IF  TOT-CL-DB-QTY    NOT =  TOT-CL-CR-QTY                    34530000
311500         DISPLAY 'CLIENT TOTAL QTY DEBITS & CREDITS DONT AGREE'   34540000
311600         DISPLAY 'CLIENT QTY DEBITS  = ' TOT-CL-DB-QTY            34550000
311700         DISPLAY 'CLIENT QTY CREDITS = ' TOT-CL-CR-QTY            34560000
311800*        CALL  ABEND        USING ABEND-CODE-4000                 34570000
311900     END-IF.                                                      34580000
312000/                                                                 34590000
312100******************************************************************34600000
312200*** PERFORMED BY:                                              ***34610000
312300***     O-CLIENT-BREAK                                         ***34620000
312400******************************************************************34630000
312500                                                                  34640000
312600 O-CLIENT-BREAK-DISPLAY-TOTALS.                                   34650000
312700                                                                  34660000
312800     IF  CL-OUT-CNTR-TYPE (CL-O-CNTR-X) = 'N'                     34670000
312900         MOVE CL-OUT-CNTR-RECS (CL-O-CNTR-X)                      34680000
313000                                   TO CNTR-MASK-RECS              34690000
313100     ELSE                                                         34700000
313200         IF  CL-OUT-CNTR-TYPE (CL-O-CNTR-X) = 'M'                 34710000
313300             MOVE CL-OUT-CNTR-MONEY (CL-O-CNTR-X)                 34720000
313400                                   TO CNTR-MASK-MONEY             34730000
313500         ELSE                                                     34740000
313600           IF  CL-OUT-CNTR-TYPE (CL-O-CNTR-X) = 'S'               34750000
313700               MOVE CL-OUT-CNTR-SHARE (CL-O-CNTR-X)               34760000
313800                                   TO CNTR-MASK-SHARE             34770000
313900           ELSE                                                   34780000
314000             MOVE SPACES TO CNTR-MASK                             34790000
314100           END-IF                                                 34800000
314200         END-IF                                                   34810000
314300     END-IF                                                       34820000
314400                                                                  34830000
314500     DISPLAY CL-OUT-CNTR-DESC (CL-O-CNTR-X) CNTR-MASK.            34840000
314600/                                                                 34850000
314700******************************************************************34860000
314800*** PERFORMED BY:                                              ***34870000
314900***     O-CLIENT-BREAK                                         ***34880000
315000******************************************************************34890000
315100                                                                  34900000
315200 O-CLIENT-BREAK-ROLL-TOTALS.                                      34910000
315300                                                                  34920000
315400     ADD TOT-CL-ASSETS            TO FDL-TOT-ASSETS               34930000
315500     ADD TOT-CL-ACCOUNTS          TO FDL-TOT-ACTS                 34940000
315600     ADD TOT-CL-VALID-SORT-RECS   TO TOT-VALID-SORT-RECS          34950000
315700     ADD TOT-CL-INVALID-SORT-RECS TO TOT-INVALID-SORT-RECS        34960000
315800     ADD TOT-CL-SELECTED-FOR-P2   TO TOT-SELECTED-FOR-P2          34970000
315900     ADD TOT-CL-ACAT-SELECTED-FOR-P2 TO TOT-ACAT-SELECTED-FOR-P2  34980000
316000     ADD TOT-CL-PEND-SELECTED-FOR-P2 TO TOT-PEND-SELECTED-FOR-P2  34990000
316100     ADD TOT-CL-P2-RECS-WRITTEN   TO TOT-P2-RECS-WRITTEN          35000000
316200     ADD TOT-CL-PEND-READ         TO TOT-PEND-READ                35010000
316300     ADD TOT-CL-BK-CUST-DB-VALUE  TO TOT-BK-CUST-DB-VALUE         35020000
316400     ADD TOT-CL-BK-CUST-CR-VALUE  TO TOT-BK-CUST-CR-VALUE         35030000
316500     ADD TOT-CL-BK-CUST-DB-QTY    TO TOT-BK-CUST-DB-QTY           35040000
316600     ADD TOT-CL-BK-CUST-CR-QTY    TO TOT-BK-CUST-CR-QTY           35050000
316700     ADD TOT-CL-OFFSET-DB-VALUE TO TOT-OFFSET-DB-VALUE            35060000
316800     ADD TOT-CL-OFFSET-CR-VALUE TO TOT-OFFSET-CR-VALUE            35070000
316900     ADD TOT-CL-OFFSET-BYP-DB-VALUE TO TOT-OFFSET-BYP-DB-VALUE    35080000
317000     ADD TOT-CL-OFFSET-BYP-CR-VALUE TO TOT-OFFSET-BYP-CR-VALUE    35090000
317100     ADD TOT-CL-BK-CNS-DB-QTY     TO TOT-BK-CNS-DB-QTY            35100000
317200     ADD TOT-CL-BK-CNS-CR-QTY     TO TOT-BK-CNS-CR-QTY            35110000
317300     ADD TOT-CL-BK-DB-VALUE       TO TOT-BK-DB-VALUE              35120000
317400     ADD TOT-CL-BK-CR-VALUE       TO TOT-BK-CR-VALUE              35130000
317500     ADD TOT-CL-BK-DB-QTY         TO TOT-BK-DB-QTY                35140000
317600     ADD TOT-CL-BK-CR-QTY         TO TOT-BK-CR-QTY                35150000
317700     ADD TOT-CL-RD-CL-DB-VALUE    TO TOT-RD-CL-DB-VALUE           35160000
317800     ADD TOT-CL-RD-CL-CR-VALUE    TO TOT-RD-CL-CR-VALUE           35170000
317900     ADD TOT-CL-RD-CL-DB-QTY      TO TOT-RD-CL-DB-QTY             35180000
318000     ADD TOT-CL-RD-CL-CR-QTY      TO TOT-RD-CL-CR-QTY             35190000
318100     ADD TOT-CL-DB-VALUE          TO TOT-DB-VALUE                 35200000
318200     ADD TOT-CL-CR-VALUE          TO TOT-CR-VALUE                 35210000
318300     ADD TOT-CL-DB-QTY            TO TOT-DB-QTY                   35220000
318400     ADD TOT-CL-CR-QTY            TO TOT-CR-QTY                   35230000
318500     ADD TOT-CL-EARLY-WRITTEN     TO TOT-EARLY-WRITTEN            35240000
318600     ADD TOT-CL-EARLY-DB-VALUE    TO TOT-EARLY-DB-VALUE           35250000
318700     ADD TOT-CL-EARLY-CR-VALUE    TO TOT-EARLY-CR-VALUE           35260000
318800     ADD TOT-CL-EARLY-DB-QTY      TO TOT-EARLY-DB-QTY             35270000
318900     ADD TOT-CL-EARLY-CR-QTY      TO TOT-EARLY-CR-QTY             35280000
319000     ADD TOT-CL-BK-OPTION-DB-QTY TO TOT-BK-OPTION-DB-QTY          35290000
319100     ADD TOT-CL-BK-OPTION-CR-QTY TO TOT-BK-OPTION-CR-QTY          35300000
319200     ADD TOT-CL-OPT-CBOE-DB-QTY  TO TOT-OPT-CBOE-DB-QTY           35310000
319300     ADD TOT-CL-OPT-CBOE-CR-QTY  TO TOT-OPT-CBOE-CR-QTY           35320000
319400     ADD TOT-CL-AMEX-NYSE-DB-QTY TO TOT-AMEX-NYSE-DB-QTY          35330000
319500     ADD TOT-CL-AMEX-NYSE-CR-QTY TO TOT-AMEX-NYSE-CR-QTY          35340000
319600     ADD TOT-CL-OPT-PBW-DB-QTY   TO TOT-OPT-PBW-DB-QTY            35350000
319700     ADD TOT-CL-OPT-PBW-CR-QTY   TO TOT-OPT-PBW-CR-QTY            35360000
319800     ADD TOT-CL-OPT-PSE-DB-QTY   TO TOT-OPT-PSE-DB-QTY            35370000
319900     ADD TOT-CL-OPT-PSE-CR-QTY   TO TOT-OPT-PSE-CR-QTY            35380000
320000     ADD TOT-CL-OPT-DFLT-DB-QTY  TO TOT-OPT-DFLT-DB-QTY           35390000
320100     ADD TOT-CL-OPT-DFLT-CR-QTY  TO TOT-OPT-DFLT-CR-QTY.          35400000
320200/                                                                 35410000
320300******************************************************************35420000
320400*** PERFORMED BY:                                              ***35430000
320500***     SORTED-OUTPUT SECTION                                  ***35440000
320600***     O-CLIENT-BREAK                                         ***35450000
320700******************************************************************35460000
320800                                                                  35470000
320900 O-CLIENT-BREAK-CLEAR-TOTALS.                                     35480000
321000                                                                  35490000
321100     IF  CL-OUT-CNTR-TYPE (CL-O-CNTR-X) = 'N' OR 'M' OR 'S'       35500000
321200         MOVE ZERO TO CL-OUT-CNTR-RECS (CL-O-CNTR-X)              35510000
321300     END-IF.                                                      35520000
321400/                                                                 35530000
321500******************************************************************35540000
321600*** PERFORMED BY:                                              ***35550000
321700***     O-CLIENT-BREAK                                         ***35560000
321800******************************************************************35570000
321900                                                                  35580000
322000 O-CLIENT-BREAK-BILLING.                                          35590000
322100                                                                  35600000
322200     MOVE  B1-ADP-CL-NO (B1-IND)      TO  XBILL-CLT.              35610000
322300     MOVE  'X'                        TO  XBILL-XMS.              35620000
322400                                                                  35630000
322500     IF  TOT-CL-ACCOUNTS  NOT =  0                                35640000
322600         MOVE  XBILL-SEC-ACAT-ACCTS   TO  XBILL-APPL              35650000
322700         MOVE  TOT-CL-ACCOUNTS        TO  XBILL-CNT               35660000
322800         CALL   ZXBILL              USING XBILL-LIST              35670000
322900         IF  XBILL-RC  NOT =  ' '                                 35680000
323000             DISPLAY  'ZXBILL ROUTINE FAILED, RC = ' XBILL-RC     35690000
323100         END-IF                                                   35700000
323200     END-IF.                                                      35710000
323300                                                                  35720000
323400     IF  TOT-CL-ASSETS  NOT =  0                                  35730000
323500         MOVE  XBILL-SEC-ACAT-ASSETS  TO  XBILL-APPL              35740000
323600         MOVE  TOT-CL-ASSETS          TO  XBILL-CNT               35750000
323700         CALL   ZXBILL              USING XBILL-LIST              35760000
323800         IF  XBILL-RC  NOT =  ' '                                 35770000
323900             DISPLAY  'ZXBILL ROUTINE FAILED, RC = ' XBILL-RC     35780000
324000         END-IF                                                   35790000
324100     END-IF.                                                      35800000
324200                                                                  35810000
324300     IF  TOT-CL-FS-RECV  NOT =  0                                 35820000
324400         MOVE  XBILL-SEC-FUND-SERV-RECV TO  XBILL-APPL            35830000
324500         MOVE  TOT-CL-FS-RECV         TO  XBILL-CNT               35840000
324600         CALL   ZXBILL              USING XBILL-LIST              35850000
324700         IF  XBILL-RC  NOT =  ' '                                 35860000
324800             DISPLAY  'ZXBILL ROUTINE FAILED, RC = ' XBILL-RC     35870000
324900         END-IF                                                   35880000
325000     END-IF.                                                      35890000
325100                                                                  35900000
325200     IF  TOT-CL-FS-DELV  NOT =  0                                 35910000
325300         MOVE  XBILL-SEC-FUND-SERV-DELV TO  XBILL-APPL            35920000
325400         MOVE  TOT-CL-FS-DELV         TO  XBILL-CNT               35930000
325500         CALL   ZXBILL              USING XBILL-LIST              35940000
325600         IF  XBILL-RC  NOT =  ' '                                 35950000
325700             DISPLAY  'ZXBILL ROUTINE FAILED, RC = ' XBILL-RC     35960000
325800         END-IF                                                   35970000
325900     END-IF.                                                      35980000
326000                                                                  35990000
326100/                                                                 36000000
326200******************************************************************36010000
326300*** PERFORMED BY:                                              ***36020000
326400***     O-DETERMINE-P2-VS-PENDING                              ***36030000
326500******************************************************************36040000
326600                                                                  36050000
326700 O-FORMAT-P2-RECORD.                                              36060000
326800                                                                  36070000
327300                                                                  36080000
327400     ADD 1 TO TOT-CL-SELECTED-FOR-P2                              36090000
327500     MOVE  'ACAT               BOS' TO P2-BK-DESCRIPTION.         36100000
327600     IF  RECORD-IS-FROM-ACAT-FILE                                 36110000
327700         ADD 1 TO TOT-CL-ACAT-SELECTED-FOR-P2                     36120000
327800     ELSE                                                         36130000
327900         ADD 1 TO TOT-CL-PEND-SELECTED-FOR-P2                     36140000
328000     END-IF                                                       36150000
328100                                                                  36160000
328200     IF CNS OR NON-CNS                                            36170000
328300       IF  NOT (FMT-OPTION OR FMT-CASH)                           36180000
328400          IF  NOT FMT-SHORT                                       36190000
328500             SET FMT-LONG TO TRUE.                                36200000
328600                                                                  36210000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    36220000
              IF  B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) NOT = '2'       36230000
                  CONTINUE                                              36240000
              ELSE                                                      36250000
LRM030           IF PARM-SHAD-RUN                                       36260000
LRM030           AND B1-SERVICE-STATUS (B1-IND) = '1'                   36270000
LRM030           AND B1-SHADOW-POST   (B1-IND) = '1'                    36280000
LRM030           AND (FMT-SETTL-DATE  =   WS-TRADE-PLUS-1               36290000
LRM030           OR  FMT-SETTL-DATE  =  WS-TRADE-PLUS-2)                36300000
LRM030           AND (FMT-STATUS-CD  = '300' OR '310')                  36310000
LRM030                PERFORM O-MFC-P2-CREATE-NEW                       36320000
LRM030           ELSE                                                   36330000
                  IF  B1-SERVICE-STATUS (B1-IND) = '1'                  36340000
                  AND (FMT-SETTL-DATE =  ACAT-PROC-DATE)                36350000
                  AND (FMT-STATUS-CD  =  '300' OR '310')                36360000
                  AND (NOT FMT-MEMO)                                    36370000
                      PERFORM O-MFC-P2-CREATE-NEW                       36380000
                  END-IF                                                36390000
LRM030           END-IF                                                 36400000
              END-IF                                                    36410000
           ELSE                                                         36420000
328700     IF  FMT-CLNT-IS-DELIVERER                                    36430000
328800         PERFORM O-SETUP-DELIVERER-P2                             36440000
328900     ELSE                                                         36450000
329000         PERFORM O-SETUP-RECEIVER-P2                              36460000
329100     END-IF.                                                      36461000
329200/                                                                 36462000
329300******************************************************************36463000
329400*** PERFORMED BY:                                              ***36464000
329500***     O-FORMAT-P2-RECORD                                     ***36465000
329600******************************************************************36466000
329700                                                                  36467000
329800 O-SETUP-DELIVERER-P2.                                            36468000
329900                                                                  36469000
330000     EVALUATE TRUE                                                36470000
330100         WHEN FMT-OPTION                                          36480000
330200             PERFORM O-SETUP-DELIVERER-P2-OPTION                  36490000
330300         WHEN FMT-CASH AND FMT-DEBIT                              36500000
330400             PERFORM O-DLVR-DB-CASH-BAL                           36510000
330500         WHEN FMT-CASH AND FMT-CREDIT                             36520000
330600             PERFORM O-DLVR-CR-CASH-BAL                           36530000
330700         WHEN FMT-LONG                                            36540000
330800             AND CNS                                              36550000
330900             PERFORM O-DLVR-LONG-CNS                              36560000
331000         WHEN FMT-LONG                                            36570000
331100             AND (FMT-FUND-SERV    AND                            36580000
331200                  B1-FUND-SERV-CLIENT  (B1-IND)  =  '1')          36590000
331300             PERFORM O-DLVR-LONG-FUND-SERV                        36600000
LRM005                THRU O-DLVR-LONG-FUND-SERV-EXIT                   36610000
331400         WHEN FMT-LONG                                            36620000
331500             AND (NON-CNS  OR                                     36630000
331600                 (FMT-FUND-SERV    AND                            36640000
331700                  B1-FUND-SERV-CLIENT  (B1-IND)  =  '0'))         36650000
331800           IF  RECORD-IS-FROM-PEND-FILE                           36660000
331900             PERFORM O-DLVR-LONG-NON-CNS                          36670000
332000           END-IF                                                 36680000
332100         WHEN FMT-SHORT                                           36690000
332200             AND CNS                                              36700000
332300             PERFORM O-DLVR-SHORT-CNS                             36710000
332400         WHEN FMT-SHORT                                           36720000
332500             AND NON-CNS                                          36730000
332600             PERFORM O-DLVR-SHORT-NON-CNS                         36740000
332700         WHEN OTHER                                               36750000
332800             CONTINUE                                             36751000
332900     END-EVALUATE.                                                36752000
333000/                                                                 36753000
333100******************************************************************36754000
333200*** PERFORMED BY:                                              ***36755000
333300***     O-SETUP-DELIVERER-P2                                   ***36756000
333400******************************************************************36757000
333500                                                                  36758000
333600 O-SETUP-DELIVERER-P2-OPTION.                                     36759000
333700                                                                  36760000
333800     IF  FMT-BUY                                                  36770000
333900         PERFORM O-DLVR-LONG-OPTION                               36780000
334000     ELSE                                                         36790000
334100         IF  FMT-SELL                                             36800000
334200             PERFORM O-DLVR-SHORT-OPTION                          36810000
334300         END-IF                                                   36820000
334400     END-IF.                                                      36830000
334500/                                                                 36840000
334600******************************************************************36850000
334700*** PERFORMED BY:                                              ***36860000
334800***     O-SETUP-DELIVERER-P2-OPTION                            ***36870000
334900******************************************************************36880000
335000                                                                  36890000
335100 O-DLVR-SHORT-OPTION.                                             36900000
335200                                                                  36910000
335300     MOVE FMT-ADP-SEC-NO TO P2-BK-SECURITY-NBR                    36920000
335400     PERFORM O-BK-OPTION-CR-QUANTITY                              36930000
LRM005     IF NOT PARM-SHAD-RUN                                         36940000
335500        PERFORM O-BK-OPTION-OFFSET-DB-QTY.                        36950000
335600/                                                                 36960000
335700******************************************************************36970000
335800*** PERFORMED BY:                                              ***36980000
335900***     O-SETUP-DELIVERER-P2-OPTION                            ***36990000
336000******************************************************************37000000
336100                                                                  37010000
336200 O-DLVR-LONG-OPTION.                                              37020000
336300     MOVE FMT-ADP-SEC-NO TO P2-BK-SECURITY-NBR                    37030000
336400     PERFORM O-BK-OPTION-DB-QUANTITY                              37040000
LRM005     IF NOT PARM-SHAD-RUN                                         37050000
336500        PERFORM O-BK-OPTION-OFFSET-CR-QTY.                        37060000
336600/                                                                 37070000
336700******************************************************************37080000
336800*** PERFORMED BY:                                              ***37090000
336900***     O-SETUP-DELIVERER-P2                                   ***37100000
337000******************************************************************37110000
337100                                                                  37120000
337200 O-DLVR-DB-CASH-BAL.                                              37130000
337300                                                                  37140000
337400     MOVE SPACES          TO P2-BK-SECURITY-NBR                   37150000
337500     PERFORM O-BK-CUST-CR-VALUE                                   37160000
LRM005     IF NOT PARM-SHAD-RUN                                         37170000
337600        PERFORM O-BK-OFFSET-DB-CASH-VALUE.                        37180000
337700/                                                                 37190000
337800******************************************************************37200000
337900*** PERFORMED BY:                                              ***37210000
338000***     O-SETUP-DELIVERER-P2                                   ***37220000
338100******************************************************************37230000
338200                                                                  37240000
338300 O-DLVR-CR-CASH-BAL.                                              37250000
338400                                                                  37260000
338500     MOVE SPACES          TO P2-BK-SECURITY-NBR                   37270000
338600     PERFORM O-BK-CUST-DB-VALUE                                   37280000
LRM005     IF NOT PARM-SHAD-RUN                                         37290000
338700        PERFORM O-BK-OFFSET-CR-CASH-VALUE.                        37300000
338800/                                                                 37310000
338900******************************************************************37320000
339000*** PERFORMED BY:                                              ***37330000
339100***     O-SETUP-DELIVERER-P2                                   ***37340000
339200******************************************************************37350000
339300                                                                  37360000
339400 O-DLVR-LONG-CNS.                                                 37370000
339500                                                                  37380000
339600     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   37390000
339700     PERFORM O-BK-CUST-CR-QUANTITY                                37400000
LRM005     IF NOT PARM-SHAD-RUN                                         37410000
339800        PERFORM O-BK-CNS-DB-QUANTITY.                             37420000
339900/                                                                 37430000
340000******************************************************************37440000
340100*** PERFORMED BY:                                              ***37450000
340200***     O-SETUP-DELIVERER-P2                                   ***37460000
340300******************************************************************37470000
340400                                                                  37480000
340500 O-DLVR-LONG-FUND-SERV.                                           37490000
340600                                                                  37500000
340700*****                                                             37510000
340800*    DISPLAY '  '                                                 37520000
340900*    DISPLAY '=============================='                     37530000
341000*    DISPLAY 'O-DLVR-LONG-FUND-SERV =======>'                     37540000
341100*    DISPLAY '=============================='                     37550000
341200*****                                                             37560000
341300     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   37570000
341400                                                                  37580000
341500******************************************************************37590000
341600****  CHANGES MADE FOR ACAT FAILS FOR FUND SERVE ITEMS      ******37600000
341700**** AS PER SPECS: (NEW B1 = 434617)                          ****37610000
341800***  DELIVER REJECTED ON SETTLEMENT DATE =====>                  *37620000
341900* FAIL ACCOUNT :                                                 *37630000
342000*     THE FAIL TO DELIVER ACCOUNT 4-06, WILL BE DEBITED FOR THE  *37640000
342100*     SHARES & MONEY.  THE BATCH CODE AND THE ENTRY CODE ARE USED*37650000
342200*     ARE DEFINED IN B1434656                                    *37660000
342300* NOTE: THE SYSTEM IS CURRENTLY GENERATEING A DEBIT ENTRY TO THE *37670000
342400*       PENDING ACCOUNT FOR SHARES & MONEY.  THIS ENTRY WILL BE  *37680000
342500*       DISCONTINUED.                                            *37690000
342600*                                                                *37700000
342700***  DELIVER REJECTED AFTER SETTLEMENT DATE =====>               *37710000
342800* FAIL ACCOUNT :                                                 *37720000
342900*     THE FAIL TO DELIVER ACCOUNT 4-06, WILL BE DEBITED FOR THE  *37730000
343000*     SHARES & MONEY.  THE BATCH CODE AND THE ENTRY CODE ARE USED*37740000
343100*     ARE DEFINED IN B1434657(THESE ARE THE SAME BATCH & ENTRY   *37750000
343200*     CODES THAT ARE USED TO SET UP FAILS ON SETTLEMENT DATE,    *37760000
343300*     THE CREATION OF THIS ENTRY IS ALSO CONTROLLED BY B1# 434610*37770000
343400* PENDING ACCOUNT :                                              *37780000
343500*     IS CREDITED THE SHARES AND MONEY. IF B1434610 HAS A VALUE  *37790000
343600*     OF 1, NO ENTRY IS MADE TO THE PENDING ACCOUNT.             *37800000
343700*                                                                *37810000
343800******************************************************************37820000
LRM005     IF PARM-SHAD-RUN                                             37830000
LRM005        IF FMT-SETTL-DATE = WS-TRADE-PLUS-1                       37840000
LRM005           PERFORM O-BK-CUST-CR-QUANTITY                          37850000
LRM005        END-IF                                                    37860000
LRM005        GO TO O-DLVR-LONG-FUND-SERV-EXIT                          37870000
LRM005     END-IF                                                       37880000
                                                                        37890000
343900     IF  FMT-SETTL-DATE  =  ACAT-PROC-DATE                        37900000
344000         PERFORM O-BK-CUST-CR-QUANTITY                            37910000
344100         PERFORM O-BK-OFFSET-CR-VALUE                             37920000
344200       EVALUATE TRUE                                              37930000
344300         WHEN  FMT-ACCEPTED-BY-FUND                               37940000
LRM050         WHEN  FMT-PENDING-FUND-APPROV                            37950000
LRM050               AND  DST-DIRECT                                    37960000
LRM050               AND NTWIO-MATRIX-LEVEL = '6'                       37970000
LRM050               AND  MEMO-TWO-WAY-BATCH (6) > SPACES               37980000
344400           PERFORM O-BK-MEMO-CR-QUANTITY                          37990000
344500           PERFORM O-BK-PEND-DB-VALUE                             38000000
344600         WHEN  FMT-REJECTED-BY-FUND                               38010000
345100*******     TREATE THIS AS PENDING FOR ANOTHER DAY IF POST S/D    38020000
345100*******     B1 IS NOT ON                                          38030000
                                                                        38040000
345000***YH01 FOR REJECTED, CAGEFAIL WILL BE THE OFFSET                 38050000
345000***YH01      IF FMT-SETTL-DATE  =  FMT-UPDT-TMSTP                 38060000
345600***YH01          PERFORM O-BK-PEND-DB-BOTH                        38070000
345800***YH01      ELSE                                                 38080000
345900***YH01          PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY             38090000
346000***YH01      END-IF                                               38100000
YH0001           IF  B1-POST-STL-REJ-BKP    (B1-IND) = '0'              38110000
345900                 PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY             38120000
                 ELSE                                                   38130000
                  IF  FMT-TI-ADP-CL-NO  =  63                           38140000
                      PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY              38150000
                  ELSE                                                  38160000
345000             IF FMT-SETTL-DATE  =  FMT-UPDT-TMSTP                 38170000
345600                 PERFORM O-BK-PEND-DB-BOTH                        38180000
345800             ELSE                                                 38190000
345900                 PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY             38200000
346000             END-IF                                               38210000
346000            END-IF                                                38220000
                 END-IF                                                 38230000
346200         WHEN  OTHER                                              38240000
346300           PERFORM O-BK-PEND-DB-BOTH                              38250000
346400       END-EVALUATE                                               38260000
346500     ELSE                                                         38270000
346600       EVALUATE TRUE                                              38280000
346700         WHEN  FMT-ACCEPTED-BY-FUND                               38290000
346800           PERFORM O-BK-MEMO-CR-QUANTITY                          38300000
LRM005           IF PARM-SHAD-RUN                                       38310000
LRM005              GO TO O-DLVR-LONG-FUND-SERV-EXIT                    38320000
LRM005           END-IF                                                 38330000
346900           PERFORM O-BK-PEND-CR-QUANTITY                          38340000
347000         WHEN  FMT-REJECTED-BY-FUND                               38350000
YH0001****** THIS SWITCH IS ALREADY ON  BUT........                     38360000
YH0001           IF  B1-POST-STL-REJ-BKP    (B1-IND) = '0'              38370000
347500               PERFORM O-BK-PEND-CR-BOTH                          38380000
347900           END-IF                                                 38390000
YH0001*** THIS SEEMS TO BE MAING OUT OF BALANCE IN SHARES               38400000
YH0001***        PERFORM O-RD-CL-DB-QUANTITY                            38410000
348100         WHEN  OTHER                                              38420000
348200           CONTINUE                                               38430000
348300       END-EVALUATE                                               38440000
348400     END-IF.                                                      38450000
LRM005 O-DLVR-LONG-FUND-SERV-EXIT. EXIT.                                38460000
348500/                                                                 38470000
348600******************************************************************38480000
348700*** PERFORMED BY:                                              ***38481000
348800***     O-SETUP-DELIVERER-P2                                   ***38482000
348900******************************************************************38483000
349000                                                                  38484000
349100 O-DLVR-LONG-NON-CNS.                                             38485000
349300                                                                  38486000
349400     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   38487000
349500     PERFORM O-BK-CUST-CR-QUANTITY                                38488000
LRM005     IF NOT PARM-SHAD-RUN                                         38489000
349600        PERFORM O-BK-OFFSET-CR-VALUE                              38489100
349700        PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY.                     38489200
349800/                                                                 38489300
349900******************************************************************38489400
350000*** PERFORMED BY:                                              ***38489500
350100***     O-SETUP-DELIVERER-P2                                   ***38489600
350200******************************************************************38489700
350300                                                                  38489800
350400 O-DLVR-SHORT-CNS.                                                38489900
350600                                                                  38490000
351400     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   38500000
351500     PERFORM O-BK-CUST-DB-QUANTITY                                38510000
LRM005     IF NOT PARM-SHAD-RUN                                         38520000
351600        PERFORM O-BK-CNS-CR-QUANTITY.                             38530000
351700/                                                                 38540000
351800******************************************************************38550000
351900*** PERFORMED BY:                                              ***38560000
352000***     O-SETUP-DELIVERER-P2                                   ***38570000
352100******************************************************************38580000
352200                                                                  38590000
352300 O-DLVR-SHORT-NON-CNS.                                            38600000
352500                                                                  38610000
352600     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   38620000
352700     PERFORM O-BK-CUST-DB-QUANTITY                                38630000
LRM005     IF NOT PARM-SHAD-RUN                                         38640000
352800        PERFORM O-BK-OFFSET-DB-VALUE                              38650000
352900        PERFORM O-RD-CL-CR-VALUE-CR-QUANTITY.                     38660000
353000/                                                                 38670000
353100******************************************************************38680000
353200*** PERFORMED BY:                                              ***38690000
353300***     O-FORMAT-P2-RECORD                                     ***38700000
353400******************************************************************38710000
353500                                                                  38720000
353600 O-SETUP-RECEIVER-P2.                                             38730000
353700                                                                  38740000
353800     EVALUATE TRUE                                                38750000
353900         WHEN  FMT-OPTION                                         38760000
354000             PERFORM O-SETUP-RECEIVER-P2-OPTION                   38770000
354100         WHEN  FMT-CASH AND FMT-DEBIT                             38780000
354200             PERFORM O-RCVR-DB-CASH-BAL                           38790000
354300         WHEN  FMT-CASH AND FMT-CREDIT                            38800000
354400             PERFORM O-RCVR-CR-CASH-BAL                           38810000
354500         WHEN  FMT-LONG                                           38820000
354600             AND CNS                                              38830000
354700             PERFORM O-RCVR-LONG-CNS                              38840000
354800         WHEN  FMT-LONG                                           38850000
354900             AND (FMT-FUND-SERV    AND                            38860000
355000                  B1-FUND-SERV-CLIENT  (B1-IND)  =  '1')          38870000
355100             PERFORM O-RCVR-LONG-FUND-SERV                        38880000
LRM005                THRU O-RCVR-LONG-FUND-SERV-EXIT                   38890000
355200         WHEN  FMT-LONG                                           38900000
355300             AND (NON-CNS  OR                                     38910000
355400                 (FMT-FUND-SERV    AND                            38920000
355500                  B1-FUND-SERV-CLIENT  (B1-IND)  =  '0'))         38930000
355600           IF  RECORD-IS-FROM-PEND-FILE                           38940000
355700             PERFORM O-RCVR-LONG-NON-CNS                          38950000
355800           END-IF                                                 38960000
355900         WHEN FMT-SHORT                                           38970000
356000             AND CNS                                              38980000
356100             PERFORM O-RCVR-SHORT-CNS                             38990000
356200         WHEN  FMT-SHORT                                          39000000
356300             AND NON-CNS                                          39010000
356400             PERFORM O-RCVR-SHORT-NON-CNS                         39020000
356500         WHEN  OTHER                                              39030000
356600             CONTINUE                                             39040000
356700     END-EVALUATE.                                                39050000
356800/                                                                 39060000
356900******************************************************************39070000
357000*** PERFORMED BY:                                              ***39080000
357100***     O-SETUP-RECEIVER-P2                                    ***39090000
357200******************************************************************39100000
357300                                                                  39110000
357400 O-SETUP-RECEIVER-P2-OPTION.                                      39120000
357500                                                                  39130000
357600     IF  FMT-BUY                                                  39140000
357700         PERFORM O-RCVR-LONG-OPTION                               39150000
357800     ELSE                                                         39160000
357900         IF  FMT-SELL                                             39170000
358000             PERFORM O-RCVR-SHORT-OPTION                          39180000
358100         END-IF                                                   39190000
358200     END-IF.                                                      39200000
358300/                                                                 39210000
358400******************************************************************39220000
358500*** PERFORMED BY:                                              ***39230000
358600***     O-SETUP-RECEIVER-P2-OPTION                             ***39240000
358700******************************************************************39250000
358800                                                                  39260000
358900 O-RCVR-LONG-OPTION.                                              39270000
359000                                                                  39280000
359100     MOVE FMT-ADP-SEC-NO TO P2-BK-SECURITY-NBR                    39290000
359200     PERFORM O-BK-OPTION-DB-QUANTITY                              39300000
LRM005     IF NOT PARM-SHAD-RUN                                         39310000
359300        PERFORM O-BK-OPTION-OFFSET-CR-QTY.                        39320000
359400/                                                                 39330000
359500******************************************************************39340000
359600*** PERFORMED BY:                                              ***39350000
359700***     O-SETUP-RECEIVER-P2-OPTION                             ***39360000
359800******************************************************************39370000
359900                                                                  39380000
360000 O-RCVR-SHORT-OPTION.                                             39390000
360100     MOVE FMT-ADP-SEC-NO TO P2-BK-SECURITY-NBR                    39400000
360200     PERFORM O-BK-OPTION-CR-QUANTITY                              39410000
LRM005     IF NOT PARM-SHAD-RUN                                         39420000
360300        PERFORM O-BK-OPTION-OFFSET-DB-QTY.                        39430000
360400/                                                                 39440000
360500******************************************************************39450000
360600*** PERFORMED BY:                                              ***39460000
360700***     O-SETUP-RECEIVER-P2                                    ***39470000
360800******************************************************************39480000
360900                                                                  39490000
361000 O-RCVR-DB-CASH-BAL.                                              39500000
361100                                                                  39510000
361200     MOVE SPACES          TO P2-BK-SECURITY-NBR                   39520000
361300     PERFORM O-BK-CUST-DB-VALUE                                   39530000
LRM005     IF NOT PARM-SHAD-RUN                                         39540000
361400        PERFORM O-BK-OFFSET-CR-CASH-VALUE.                        39550000
361500/                                                                 39560000
361600******************************************************************39570000
361700*** PERFORMED BY:                                              ***39580000
361800***     O-SETUP-RECEIVER-P2                                    ***39590000
361900******************************************************************39600000
362000                                                                  39610000
362100 O-RCVR-CR-CASH-BAL.                                              39620000
362200                                                                  39630000
362300     MOVE SPACES          TO P2-BK-SECURITY-NBR                   39640000
362400     PERFORM O-BK-CUST-CR-VALUE                                   39650000
LRM005     IF NOT PARM-SHAD-RUN                                         39660000
362500        PERFORM O-BK-OFFSET-DB-CASH-VALUE.                        39670000
362600/                                                                 39680000
362700******************************************************************39690000
362800*** PERFORMED BY:                                              ***39700000
362900***     O-SETUP-RECEIVER-P2                                    ***39710000
363000******************************************************************39720000
363100                                                                  39730000
363200 O-RCVR-LONG-CNS.                                                 39740000
363400                                                                  39750000
363500     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   39760000
363600     PERFORM O-BK-CUST-DB-QUANTITY                                39770000
LRM005     IF NOT PARM-SHAD-RUN                                         39780000
363700        PERFORM O-BK-CNS-CR-QUANTITY.                             39790000
363800/                                                                 39800000
363900******************************************************************39810000
364000*** PERFORMED BY:                                              ***39820000
364100***     O-SETUP-RECEIVER-P2                                    ***39830000
364200******************************************************************39840000
364300                                                                  39850000
364400 O-RCVR-LONG-FUND-SERV.                                           39860000
364600                                                                  39870000
364700******************************************************************39880000
364800****  CHANGES MADE FOR ACAT FAILS FOR FUND SERVE ITEMS      ******39890000
364900**** AS PER SPECS: (NEW B1 = 434617)                          ****39900000
365000***  RECEIVER REJECTED ON SETTLEMENT DATE =====>                 *39910000
365100* FAIL ACCOUNT :                                                 *39920000
365200*     THE FAIL TO RECEIVR ACCOUNT 3-07, WILL BE CREDITED FOR THE *39930000
365300*     SHARES & MONEY.  THE BATCH CODE AND THE ENTRY CODE ARE USED*39940000
365400*     ARE DEFINED IN B1434657                                    *39950000
365500* NOTE: THE SYSTEM IS CURRENTLY GENERATEING A CREDIT ENTRY TO THE*39960000
365600*       PENDING ACCOUNT FOR SHARES & MONEY.  THIS ENTRY WILL BE  *39970000
365700*       DISCONTINUED.                                            *39980000
365800*                                                                *39990000
365900***  RECEIVER REJECTED AFTER SETTLEMENT DATE =====>              *40000000
366000* FAIL ACCOUNT :                                                 *40010000
366100*     THE FAIL TO RECEIVER ACCOUNT 3-07, WILL BE CREDITED FOR THE*40020000
366200*     SHARES & MONEY.  THE BATCH CODE AND THE ENTRY CODE ARE USED*40030000
366300*     ARE DEFINED IN B1434657(THESE ARE THE SAME BATCH & ENTRY   *40040000
366400*     CODES THAT ARE USED TO SET UP FAILS ON SETTLEMENT DATE,    *40050000
366500*     THE CREATION OF THIS ENTRY IS ALSO CONTROLLED BY B1 434610 *40060000
366600* PENDING ACCOUNT :                                              *40070000
366700*     IS CREDITED THE SHARES AND MONEY. IF B1434610 HAS A VALUE  *40080000
366800*     OF 1, NO ENTRY IS MADE TO THE PENDING ACCOUNT.             *40090000
366900*                                                                *40100000
367000******************************************************************40110000
367100     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   40120000
367200                                                                  40130000
LRM007     IF PARM-SHAD-RUN                                             40140000
LRM007        IF FMT-SETTL-DATE = WS-TRADE-PLUS-1                       40150000
LRM007           PERFORM O-BK-CUST-DB-QUANTITY                          40160000
LRM007        END-IF                                                    40170000
LRM007        GO TO O-RCVR-LONG-FUND-SERV-EXIT                          40180000
LRM007     END-IF                                                       40190000
                                                                        40200000
367300     IF  FMT-SETTL-DATE  =  ACAT-PROC-DATE                        40210000
367400         PERFORM O-BK-CUST-DB-QUANTITY                            40220000
367500         PERFORM O-BK-OFFSET-DB-VALUE                             40230000
367600       EVALUATE TRUE                                              40240000
367700         WHEN  FMT-ACCEPTED-BY-FUND                               40250000
367800           PERFORM O-BK-MEMO-DB-QUANTITY                          40260000
367900           IF  B1-MFRS-ACTIVE (B1-IND)  =  'A'  AND               40270000
368000               FMT-NTWRK-CNTL-CD = '0' AND FMT-FUND-BK-CD = 'BC'  40280000
368100               MOVE 'BNS' TO P2-BK-TRID                           40290000
368200               MOVE FMT-TI-ADP-CL-NO   TO P2-BK-BROKER-NBR        40300000
368300               MOVE P2-CREDIT-SIGN     TO P2-BK-BUY-SELL-CODE     40310000
368400               PERFORM O-CUST-ACT-MOVE-BR-ACT                     40320000
368500               MOVE 'SHARES HELD AT FUND' TO P2-BK-DESCRIPTION    40330000
368600               MOVE ZERO               TO P2-BK-AMOUNT            40340000
368700               MOVE  FMT-ASSET-QUAN    TO  WS-QTY                 40350000
368800               MOVE WS-QTY             TO P2-BK-QUANTITY          40360000
368900               MOVE WS-QTY             TO P2-BK-FRACTION          40370000
369000               ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CUST-CR-QTY   40380000
369100               PERFORM O-WRITE-P2-ENTRY-CODE                      40390000
369200               WRITE P2BKPG-RECORD FROM P2-BK-RECORD              40400000
369300               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    40410000
369400                                                                  40420000
369500               MOVE SPACES TO P2-BK-TRAILER-RECORD                40430000
369600               MOVE P2-BK-RECORD TO P2-BK-TRAILER-RECORD          40440000
369700               MOVE 'CUST# ' TO P2-BKT-DESCRIPTION                40450000
369800               MOVE FMT-FNBR                                      40460000
369900                             TO P2-BKT-DESCRIPTION (7:20)         40470000
370000               MOVE SPACES TO P2-BKT-QUANTITY-X                   40480000
370100                              P2-BKT-ENTRY-CODE                   40490000
370200                              P2-BKT-AMOUNT-X                     40500000
370300               MOVE '-' TO P2-BKT-HYPHEN                          40510000
370400               MOVE 0 TO P2-BKT-FRACTION                          40520000
370500               WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD      40530000
370600               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    40540000
370700* ACAT TRAILER PROCESSING                                         40550000
370800               IF (B1-ACAT-P2-TRAILER (B1-IND) =                  40560000
370900                                      '1' OR '2' OR '3') AND      40570000
371000                  (FMT-CLNT-IS-RECEIVER OR FMT-CLNT-IS-DELIVERER) 40580000
371100                 PERFORM O-WRITE-ACAT-P2-TRAILER                  40590000
371200               END-IF                                             40600000
371300                                                                  40610000
371400               MOVE 'BNS' TO P2-BK-TRID                           40620000
371500               MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR          40630000
371600               MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE         40640000
371700               MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C 40650000
371800               MOVE 'SHARES HELD AT FUND' TO P2-BK-DESCRIPTION    40660000
371900               MOVE ZERO               TO P2-BK-AMOUNT            40670000
372000               MOVE  FMT-ASSET-QUAN    TO  WS-QTY                 40680000
372100               MOVE WS-QTY             TO P2-BK-QUANTITY          40690000
372200               MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION     40700000
372300               ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CNS-DB-QTY    40710000
372400               PERFORM O-WRITE-P2-ENTRY-CODE                      40720000
372500               WRITE P2BKPG-RECORD FROM P2-BK-RECORD              40730000
372600               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    40740000
372700                                                                  40750000
372800               MOVE SPACES TO P2-BK-TRAILER-RECORD                40760000
372900               MOVE P2-BK-RECORD TO P2-BK-TRAILER-RECORD          40770000
373000               MOVE 'CUST# ' TO P2-BKT-DESCRIPTION                40780000
373100               MOVE FMT-FNBR                                      40790000
373200                             TO P2-BKT-DESCRIPTION (7:20)         40800000
373300               MOVE SPACES TO P2-BKT-QUANTITY-X                   40810000
373400                              P2-BKT-ENTRY-CODE                   40820000
373500                              P2-BKT-AMOUNT-X                     40830000
373600               MOVE '-' TO P2-BKT-HYPHEN                          40840000
373700               MOVE 0 TO P2-BKT-FRACTION                          40850000
373800               WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD      40860000
373900               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    40870000
374000                                                                  40880000
374100* ACAT TRAILER PROCESSING                                         40890000
374200               IF (B1-ACAT-P2-TRAILER (B1-IND) =                  40900000
374300                                      '1' OR '2' OR '3') AND      40910000
374400                  (FMT-CLNT-IS-RECEIVER OR FMT-CLNT-IS-DELIVERER) 40920000
374500                 PERFORM O-WRITE-ACAT-P2-TRAILER                  40930000
374600               END-IF                                             40940000
374700                                                                  40950000
374800             MOVE  'ACAT               BOS' TO P2-BK-DESCRIPTION  40960000
374900                                                                  40970000
375000           END-IF                                                 40980000
375100           PERFORM O-BK-PEND-CR-VALUE                             40990000
375200         WHEN  FMT-REJECTED-BY-FUND                               41000000
YH0001*******REMOVED  63 HARD CODE TO REPLACE WITH PSOT S/D B1          41010000
YH0001*******B1IS OFF AND REJECTED TODAY == TREATED AS PENDING          41020000
YH0001*******OR ASSUME TO AHVE CAGE FAIL SET UP SAME DAY                41030000
YH0001           IF B1-POST-STL-REJ-BKP       (B1-IND) = '0'            41040000
YH0001                 PERFORM O-RD-CL-CR-VALUE-CR-QUANTITY             41050000
YH0001           ELSE                                                   41060000
YH0001            IF  FMT-TI-ADP-CL-NO  =  63                           41070000
YH0001                PERFORM O-RD-CL-CR-VALUE-CR-QUANTITY              41080000
YH0001            ELSE                                                  41090000
YH0001             IF FMT-SETTL-DATE  =  FMT-UPDT-TMSTP                 41100000
YH0001                  PERFORM O-BK-PEND-CR-BOTH                       41110000
YH0001             ELSE                                                 41120000
YH0001                  PERFORM O-RD-CL-CR-VALUE-CR-QUANTITY            41130000
YH0001             END-IF                                               41140000
YH0001            END-IF                                                41150000
YH0001           END-IF                                                 41160000
                                                                        41170000
377500         WHEN  OTHER                                              41180000
377600           PERFORM O-BK-PEND-CR-BOTH                              41190000
377700       END-EVALUATE                                               41200000
377800     ELSE                                                         41210000
377900       EVALUATE TRUE                                              41220000
378000         WHEN  FMT-ACCEPTED-BY-FUND                               41230000
378100           PERFORM O-BK-MEMO-DB-QUANTITY                          41240000
378200           PERFORM O-BK-PEND-DB-QUANTITY                          41250000
378300           IF  B1-MFRS-ACTIVE (B1-IND)  =  'A'  AND               41260000
378400               FMT-NTWRK-CNTL-CD = '0' AND FMT-FUND-BK-CD = 'BC'  41270000
378500               MOVE 'BNS' TO P2-BK-TRID                           41280000
378600               MOVE FMT-TI-ADP-CL-NO   TO P2-BK-BROKER-NBR        41290000
378700               MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE        41300000
378800               PERFORM O-CUST-ACT-MOVE-BR-ACT                     41310000
378900               MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR          41320000
379000               MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR         41330000
379100               MOVE ZERO               TO P2-BK-AMOUNT            41340000
379200               MOVE  FMT-ASSET-QUAN    TO  WS-QTY                 41350000
379300               MOVE WS-QTY             TO P2-BK-QUANTITY          41360000
379400               MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION     41370000
379500               ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CUST-CR-QTY   41380000
379600               PERFORM O-WRITE-P2-ENTRY-CODE                      41390000
379700               WRITE P2BKPG-RECORD FROM P2-BK-RECORD              41400000
379800               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    41410000
379900                                                                  41420000
380000               MOVE SPACES TO P2-BK-TRAILER-RECORD                41430000
380100               MOVE P2-BK-RECORD TO P2-BK-TRAILER-RECORD          41440000
380200               MOVE 'SHARES HELD AT FUND' TO P2-BKT-RESDESC       41450000
380300               MOVE SPACES TO P2-BKT-QUANTITY-X                   41460000
380400                              P2-BKT-ENTRY-CODE                   41470000
380500                              P2-BKT-AMOUNT-X                     41480000
380600               MOVE '-' TO P2-BKT-HYPHEN                          41490000
380700               MOVE 0 TO P2-BKT-FRACTION                          41500000
380800               WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD      41510000
380900               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    41520000
381000                                                                  41530000
381100* ACAT TRAILER PROCESSING                                         41540000
381200               IF (B1-ACAT-P2-TRAILER (B1-IND) =                  41550000
381300                                      '1' OR '2' OR '3') AND      41560000
381400                  (FMT-CLNT-IS-RECEIVER OR FMT-CLNT-IS-DELIVERER) 41570000
381500                 PERFORM O-WRITE-ACAT-P2-TRAILER                  41580000
381600               END-IF                                             41590000
381700                                                                  41600000
381800               MOVE 'BNS' TO P2-BK-TRID                           41610000
381900               MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR          41620000
382000               MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE         41630000
382100               MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C 41640000
382200               MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR          41650000
382300               MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR         41660000
382400               MOVE ZERO               TO P2-BK-AMOUNT            41670000
382500               MOVE  FMT-ASSET-QUAN    TO  WS-QTY                 41680000
382600               MOVE WS-QTY             TO P2-BK-QUANTITY          41690000
382700               MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION     41700000
382800               ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CNS-DB-QTY    41710000
382900               PERFORM O-WRITE-P2-ENTRY-CODE                      41720000
383000               WRITE P2BKPG-RECORD FROM P2-BK-RECORD              41730000
383100               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    41740000
383200                                                                  41750000
383300               MOVE SPACES TO P2-BK-TRAILER-RECORD                41760000
383400               MOVE P2-BK-RECORD TO P2-BK-TRAILER-RECORD          41770000
383500               MOVE 'SHARES HELD AT FUND' TO P2-BKT-RESDESC       41780000
383600               MOVE SPACES TO P2-BKT-QUANTITY-X                   41790000
383700                              P2-BKT-ENTRY-CODE                   41800000
383800                              P2-BKT-AMOUNT-X                     41810000
383900               MOVE '-' TO P2-BKT-HYPHEN                          41820000
384000               MOVE 0 TO P2-BKT-FRACTION                          41830000
384100               WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD      41840000
384200               ADD 1 TO TOT-CL-P2-RECS-WRITTEN                    41850000
384300* ACAT TRAILER PROCESSING                                         41860000
384400               IF (B1-ACAT-P2-TRAILER (B1-IND) =                  41870000
384500                                      '1' OR '2' OR '3') AND      41880000
384600                  (FMT-CLNT-IS-RECEIVER OR FMT-CLNT-IS-DELIVERER) 41890000
384700                 PERFORM O-WRITE-ACAT-P2-TRAILER                  41900000
384800               END-IF                                             41910000
384900           END-IF                                                 41920000
385000         WHEN  FMT-REJECTED-BY-FUND                               41930000
385300*** B1 434610 ---                                                 41940000
YH0001           IF B1-POST-STL-REJ-BKP       (B1-IND) = '0'            41950000
YH0001              PERFORM O-BK-PEND-DB-BOTH                           41960000
YH0001*** THIS SEEMS TO BE MAKING OUT OF BALANCE IN SHARES              41970000
YH0001**         ELSE                                                   41980000
YH0001***           PERFORM O-RD-CL-CR-QUANTITY                         41990000
YH0001           END-IF                                                 42000000
387000         WHEN  OTHER                                              42010000
387100           CONTINUE                                               42020000
387200       END-EVALUATE                                               42030000
387300     END-IF.                                                      42040000
LRM041     IF B1-ACAT-FUNDSERV-PEND-MEMO (B1-IND) > SPACES              42050000
LRM041     AND FMT-SETTL-DATE  =  ACAT-PROC-DATE                        42060000
LRM041     AND (FMT-PENDING-FUND-APPROV OR FMT-REJECTED-BY-FUND)        42070000
LRM041       PERFORM O-CUST-ACT-MOVE-BR-ACT                             42071000
LRM041       IF FMT-MEMO-ORG-RVRSL-QTY > ZERO                           42071100
LRM041       AND FMT-MEMO-ORG-RVRSL-QTY NOT =  FMT-ASSET-QTY-DEC        42071200
LRM041          DISPLAY 'LONG-CNS USING ORIG DLVY QTY ON FUNDSERV MEMO '42071300
LRM041          DISPLAY '  ' FMT-ADP-SEC-NO ' ' FMT-TRNFR-TYPE          42071400
LRM041           ' ' FMT-MEMO-ORG-RVRSL-QTY ' BK= ' P2-BK-QUANTITY      42071500
LRM041          MOVE FMT-MEMO-ORG-RVRSL-QTY TO P2-BK-QUANTITY           42071600
LRM041                                         P2-BK-FRACTION           42071700
LRM041       ELSE                                                       42071800
LRM041          MOVE FMT-ASSET-QTY-DEC      TO P2-BK-QUANTITY           42071900
LRM041                                         P2-BK-FRACTION           42072000
LRM041          DISPLAY 'LONG-CNS FUNDSERV MEMO '                       42072100
LRM041          DISPLAY '  ' FMT-ADP-SEC-NO ' ' FMT-TRNFR-TYPE          42072200
LRM041             ' BK= ' P2-BK-QUANTITY                               42072300
LRM041       END-IF                                                     42072400
LRM041       MOVE 'S' TO P2-BK-TRID-X                                   42072500
LRM041       MOVE B1-ACAT-FUNDSERV-PEND-MEMO(B1-IND) TO P2-BK-BATCH-CODE42072600
LRM041       MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE                 42072700
LRM041       MOVE ZERO           TO P2-BK-AMOUNT                        42072800
LRM041       WRITE P2BKPG-RECORD FROM P2-BK-RECORD                      42072900
LRM041       ADD 1 TO TOT-CL-P2-RECS-WRITTEN                            42073000
LRM041     END-IF.                                                      42074000
LRM005 O-RCVR-LONG-FUND-SERV-EXIT. EXIT.                                42075000
387400/                                                                 42076000
387500******************************************************************42077000
387600*** PERFORMED BY:                                              ***42078000
387700***     O-SETUP-RECEIVER-P2                                    ***42079000
387800******************************************************************42080000
387900                                                                  42080100
388000 O-RCVR-LONG-NON-CNS.                                             42080200
388200                                                                  42080300
388300     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   42080400
           DISPLAY 'RCVR-LONG-NON ' FMT-ADP-SEC-NO                      42080500
              ' ' FMT-TRNFR-TYPE                                        42080600
              ' R-D=' FMT-STTLM-LCTN-CD                                 42080700
              ' MUTUAL-FUND=' FMT-PRC-CTGY-CD                           42080800
388400     PERFORM O-BK-CUST-DB-QUANTITY                                42080900
LRM005     IF NOT PARM-SHAD-RUN                                         42081000
388500        PERFORM O-BUILD-SAFEKEEPING-RECORD                        42082000
388600        PERFORM O-BK-OFFSET-DB-VALUE                              42083000
388700        PERFORM O-RD-CL-CR-VALUE-CR-QUANTITY.                     42084000
LRM041     IF B1-ACAT-FUNDSERV-PEND-MEMO (B1-IND) > SPACES              42085000
LRM041     AND ((FMT-TRNFR-TYPE = 'MFC'                                 42086000
LRM041       AND B1-ACAT-DONT-BOOK-MFC-TRANSF (B1-IND) NOT = '1')       42087000
LRM041     OR ((FMT-TRNFR-TYPE = 'FRV' OR 'FUL' OR 'PTR' OR 'PTD')      42088000
LRM041     AND FMT-R-D                                                  42089000
LRM041     AND NOT FMT-SAFE-KEEPING                                     42090000
LRM041     AND FMT-MUTUAL-FUND))                                        42100000
LRM041       PERFORM O-CUST-ACT-MOVE-BR-ACT                             42110000
LRM041       IF FMT-MEMO-ORG-RVRSL-QTY > ZERO                           42120000
LRM041       AND FMT-MEMO-ORG-RVRSL-QTY NOT =  FMT-ASSET-QTY-DEC        42130000
LRM041          MOVE FMT-MEMO-ORG-RVRSL-QTY TO P2-BK-QUANTITY           42140000
LRM041                                         P2-BK-FRACTION           42150000
LRM041          DISPLAY 'LONG-NON-CNS ORIG DLVY QTY ON FUNDSERV MEMO'   42160000
LRM041          DISPLAY '    RCVR-LONG-NON ' FMT-ADP-SEC-NO             42170000
LRM041           ' ' FMT-MEMO-ORG-RVRSL-QTY ' BK= ' P2-BK-QUANTITY      42180000
LRM041       ELSE                                                       42190000
LRM041          MOVE FMT-ASSET-QTY-DEC      TO P2-BK-QUANTITY           42200000
LRM041                                         P2-BK-FRACTION           42210000
LRM041          DISPLAY 'RCVR-LONG-NON ' FMT-ADP-SEC-NO                 42220000
LRM041          DISPLAY '    LONG-NON-CNS FUNDSERV MEMO '               42221000
LRM041            ' BK= ' P2-BK-QUANTITY                                42222000
LRM041       END-IF                                                     42222100
LRM041       MOVE 'S' TO P2-BK-TRID-X                                   42222200
LRM041       MOVE B1-ACAT-FUNDSERV-PEND-MEMO(B1-IND) TO P2-BK-BATCH-CODE42222300
LRM041       IF FMT-TRNFR-TYPE = 'FRV' OR 'MFC'                         42222400
LRM041          MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE             42222500
LRM041       ELSE                                                       42222600
LRM041          MOVE P2-DEBIT-SIGN   TO P2-BK-BUY-SELL-CODE             42222700
LRM041       END-IF                                                     42222800
LRM041       MOVE ZERO            TO P2-BK-AMOUNT                       42222900
LRM041       WRITE P2BKPG-RECORD FROM P2-BK-RECORD                      42223000
LRM041       ADD 1 TO TOT-CL-P2-RECS-WRITTEN                            42223100
LRM041     END-IF.                                                      42223200
388800/                                                                 42223300
388900******************************************************************42223400
389000*** PERFORMED BY:                                              ***42223500
389100***     O-SETUP-RECEIVER-P2                                    ***42223600
389200******************************************************************42223700
389300                                                                  42223800
389400 O-RCVR-SHORT-CNS.                                                42223900
389600                                                                  42224000
389700     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   42225000
389800     PERFORM O-BK-CUST-CR-QUANTITY                                42226000
LRM005     IF NOT PARM-SHAD-RUN                                         42227000
389900        PERFORM O-BK-CNS-DB-QUANTITY.                             42228000
390000/                                                                 42229000
390100******************************************************************42230000
390200*** PERFORMED BY:                                              ***42240000
390300***     O-SETUP-RECEIVER-P2                                    ***42250000
390400******************************************************************42260000
390500                                                                  42270000
390600 O-RCVR-SHORT-NON-CNS.                                            42280000
390700*    DISPLAY 'O-RCVR-SHORT-NON-CNS.'                              42290000
390800                                                                  42300000
390900     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR                   42310000
391000     PERFORM O-BK-CUST-CR-QUANTITY                                42320000
LRM005     IF NOT PARM-SHAD-RUN                                         42330000
391100        PERFORM O-BK-OFFSET-CR-VALUE                              42340000
391200        PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY.                     42350000
391300/                                                                 42360000
391400******************************************************************42370000
391500*** PERFORMED BY:                                              ***42380000
391600***     O-DLVR-DB-CASH-BAL                                     ***42390000
391700***     O-RCVR-CR-CASH-BAL                                     ***42400000
391800******************************************************************42410000
391900                                                                  42420000
392000 O-BK-CUST-CR-VALUE.                                              42430000
392100*    DISPLAY 'O-BK-CUST-CR-VALUE.'                                42440000
392200                                                                  42450000
392300     MOVE 'BNS' TO P2-BK-TRID                                     42460000
392400     MOVE FMT-TI-ADP-CL-NO   TO P2-BK-BROKER-NBR                  42470000
392500     MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE                  42480000
392600                                                                  42490000
392700     PERFORM O-CUST-ACT-MOVE-BR-ACT                               42500000
392800                                                                  42510000
392900     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    42520000
393000     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   42530000
393100     MOVE SPACES             TO P2-BK-QUANTITY-X                  42540000
393200     MOVE SPACES             TO P2-BK-FRACTION-X                  42550000
393300     MOVE FMT-ASSET-VALUE    TO AMOUNT-OVERFLOW                   42560000
393400     ADD  FMT-ASSET-VALUE    TO TOT-CL-BK-CUST-CR-VALUE           42570000
393500                                                                  42580000
393600     MOVE '1' TO OVERFLOW-SW                                      42590000
393700     PERFORM O-CASH-AMT-OVRFLOW-CHK-RTN                           42600000
393800         UNTIL NO-MORE-OVERFLOW.                                  42610000
393900/                                                                 42620000
394000******************************************************************42630000
394100*** PERFORMED BY:                                              ***42640000
394200***     O-DLVR-CR-CASH-BAL                                     ***42650000
394300***     O-RCVR-DB-CASH-BAL                                     ***42660000
394400******************************************************************42670000
394500                                                                  42680000
394600 O-BK-CUST-DB-VALUE.                                              42690000
394700**   DISPLAY 'O-BK-CUST-DB-VALUE.'                                42700000
394800                                                                  42710000
394900     MOVE 'BNS' TO P2-BK-TRID                                     42720000
395000     MOVE FMT-TI-ADP-CL-NO  TO P2-BK-BROKER-NBR                   42730000
395100     MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE                   42740000
395200                                                                  42750000
395300     PERFORM O-CUST-ACT-MOVE-BR-ACT                               42760000
395400                                                                  42770000
395500     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    42780000
395600     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   42790000
395700     MOVE SPACES             TO P2-BK-QUANTITY-X                  42800000
395800     MOVE SPACES             TO P2-BK-FRACTION-X                  42810000
395900     MOVE FMT-ASSET-VALUE    TO AMOUNT-OVERFLOW                   42820000
396000     ADD  FMT-ASSET-VALUE    TO TOT-CL-BK-CUST-DB-VALUE           42830000
396100                                                                  42840000
396200     MOVE '1' TO OVERFLOW-SW                                      42850000
396300     PERFORM O-CASH-AMT-OVRFLOW-CHK-RTN                           42860000
396400         UNTIL NO-MORE-OVERFLOW.                                  42870000
396500/                                                                 42880000
396600******************************************************************42890000
396700*** PERFORMED BY:                                              ***42900000
396800***     O-DLVR-LONG-CNS                                        ***42910000
396900***     O-DLVR-LONG-NON-CNS                                    ***42920000
397000***     O-RCVR-SHORT-CNS                                       ***42930000
397100***     O-RCVR-SHORT-NON-CNS                                   ***42940000
397200******************************************************************42950000
397300                                                                  42960000
397400 O-BK-CUST-CR-QUANTITY.                                           42970000
397500                                                                  42980000
397600     MOVE 'BNS' TO P2-BK-TRID                                     42990000
397700     MOVE FMT-TI-ADP-CL-NO   TO P2-BK-BROKER-NBR                  43000000
397800     MOVE P2-CREDIT-SIGN  TO P2-BK-BUY-SELL-CODE                  43010000
397900                                                                  43020000
398000     PERFORM O-CUST-ACT-MOVE-BR-ACT                               43030000
398100                                                                  43040000
398200     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    43050000
398300     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   43060000
398400     MOVE ZERO               TO P2-BK-AMOUNT                      43070000
398500     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           43080000
398600     MOVE WS-QTY             TO P2-BK-QUANTITY                    43090000
398700     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               43100000
398800     ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CUST-CR-QTY             43110000
LRM039     IF FMT-CURRENCY-CD > '000'                                   43120000
LRM039        MOVE FMT-CURRENCY-CD TO P2-BK-CURRENCY                    43130000
LRM039     END-IF.                                                      43140000
398900                                                                  43150000
399000     PERFORM O-WRITE-P2-REC.                                      43160000
LRM039     MOVE '000'              TO P2-BK-CURRENCY.                   43170000
399100/                                                                 43180000
399200******************************************************************43190000
399300*** PERFORMED BY:                                              ***43200000
399400***     O-DLVR-SHORT-CNS                                       ***43210000
399500***     O-DLVR-SHORT-NON-CNS                                   ***43220000
399600***     O-RCVR-LONG-CNS                                        ***43230000
399700***     O-RCVR-LONG-NON-CNS                                    ***43240000
399800******************************************************************43250000
399900                                                                  43260000
400000 O-BK-CUST-DB-QUANTITY.                                           43270000
400100                                                                  43280000
400200     MOVE 'BNS' TO P2-BK-TRID                                     43290000
400300     MOVE FMT-TI-ADP-CL-NO   TO P2-BK-BROKER-NBR                  43300000
400400     MOVE P2-DEBIT-SIGN   TO P2-BK-BUY-SELL-CODE                  43310000
400500                                                                  43320000
400600     PERFORM O-CUST-ACT-MOVE-BR-ACT                               43330000
400700                                                                  43340000
400800     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    43350000
400900     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   43360000
401000     MOVE ZERO               TO P2-BK-AMOUNT                      43370000
401100     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           43380000
401200     MOVE WS-QTY             TO P2-BK-QUANTITY                    43390000
401300     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               43400000
401400     ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CUST-DB-QTY             43410000
LRM039     IF FMT-CURRENCY-CD > '000'                                   43420000
LRM039        MOVE FMT-CURRENCY-CD TO P2-BK-CURRENCY                    43430000
LRM039     END-IF.                                                      43440000
401500                                                                  43450000
401600     PERFORM O-WRITE-P2-REC.                                      43460000
LRM039     MOVE '000'              TO P2-BK-CURRENCY.                   43470000
401700/                                                                 43480000
401800******************************************************************43490000
401900*** PERFORMED BY:                                              ***43500000
402000***     O-DLVR-LONG-OPTION                                     ***43510000
402100***     O-RCVR-LONG-OPTION                                     ***43520000
402200******************************************************************43530000
402300                                                                  43540000
402400 O-BK-OPTION-DB-QUANTITY.                                         43550000
402500                                                                  43560000
402600     MOVE 'BNS' TO P2-BK-TRID                                     43570000
402700     MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                    43580000
402800     MOVE P2-DEBIT-SIGN TO P2-BK-BUY-SELL-CODE                    43590000
402900                                                                  43600000
403000     PERFORM O-CUST-ACT-MOVE-BR-ACT                               43610000
403100                                                                  43620000
403200     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    43630000
403300     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   43640000
403400     MOVE ZERO               TO P2-BK-AMOUNT                      43650000
403500     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           43660000
403600     MOVE WS-QTY             TO P2-BK-QUANTITY                    43670000
403700     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               43680000
403800     ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-OPTION-DB-QTY           43690000
403900                                                                  43700000
404000     PERFORM O-WRITE-P2-REC.                                      43710000
404100/                                                                 43720000
404200******************************************************************43730000
404300*** PERFORMED BY:                                              ***43740000
404400***     O-DLVR-SHORT-OPTION                                    ***43750000
404500***     O-RCVR-SHORT-OPTION                                    ***43760000
404600******************************************************************43770000
404700                                                                  43780000
404800 O-BK-OPTION-CR-QUANTITY.                                         43790000
404900                                                                  43800000
405000     MOVE 'BNS' TO P2-BK-TRID                                     43810000
405100     MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                    43820000
405200     MOVE P2-CREDIT-SIGN TO P2-BK-BUY-SELL-CODE                   43830000
405300                                                                  43840000
405400     PERFORM O-CUST-ACT-MOVE-BR-ACT                               43850000
405500                                                                  43860000
405600     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    43870000
405700     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   43880000
405800     MOVE ZERO               TO P2-BK-AMOUNT                      43890000
405900     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           43900000
406000     MOVE WS-QTY             TO P2-BK-QUANTITY                    43910000
406100     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               43920000
406200     ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-OPTION-CR-QTY           43930000
406300                                                                  43940000
406400     PERFORM O-WRITE-P2-REC.                                      43950000
406500/                                                                 43960000
406600******************************************************************43970000
406700*** PERFORMED BY:                                              ***43980000
406800***     O-DLVR-SHORT-OPTION                                    ***43990000
406900***     O-RCVR-SHORT-OPTION                                    ***44000000
407000******************************************************************44010000
407100                                                                  44020000
407200 O-BK-OPTION-OFFSET-DB-QTY.                                       44030000
407300                                                                  44040000
407400     MOVE 'BNS' TO P2-BK-TRID                                     44050000
407500     MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                    44060000
407600     MOVE P2-DEBIT-SIGN TO P2-BK-BUY-SELL-CODE                    44070000
407700                                                                  44080000
407800     PERFORM O-GET-OPTION-OFFSET-ACT-DB                           44090000
407900                                                                  44100000
408000     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    44110000
408100     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   44120000
408200     MOVE ZERO               TO P2-BK-AMOUNT                      44130000
408300     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           44140000
408400     MOVE WS-QTY             TO P2-BK-QUANTITY                    44150000
408500     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               44160000
408600                                                                  44170000
408700     PERFORM O-WRITE-P2-REC.                                      44180000
408800/                                                                 44190000
408900******************************************************************44200000
409000*** PERFORMED BY:                                              ***44210000
409100***     O-DLVR-LONG-OPTION                                     ***44220000
409200***     O-RCVR-LONG-OPTION                                     ***44230000
409300******************************************************************44240000
409400                                                                  44250000
409500 O-BK-OPTION-OFFSET-CR-QTY.                                       44260000
409600                                                                  44270000
409700     MOVE 'BNS' TO P2-BK-TRID                                     44280000
409800     MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                    44290000
409900     MOVE P2-CREDIT-SIGN TO P2-BK-BUY-SELL-CODE                   44300000
410000                                                                  44310000
410100     PERFORM O-GET-OPTION-OFFSET-ACT-CR                           44320000
410200                                                                  44330000
410300     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    44340000
410400     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   44350000
410500     MOVE ZERO               TO P2-BK-AMOUNT                      44360000
410600     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           44370000
410700     MOVE WS-QTY             TO P2-BK-QUANTITY                    44380000
410800     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               44390000
410900                                                                  44400000
411000     PERFORM O-WRITE-P2-REC.                                      44410000
411100/                                                                 44420000
411200******************************************************************44430000
411300*** PERFORMED BY:                                              ***44440000
411400***     O-BK-OPTION-OFFSET-DB-QTY                              ***44450000
411500******************************************************************44460000
411600                                                                  44470000
411700 O-GET-OPTION-OFFSET-ACT-DB.                                      44480000
411800                                                                  44490000
LRM021     IF ALT-OPTION-OFFSET-ACCOUNT > SPACES                        44500000
LRM021         MOVE ALT-OPTION-OFFSET-ACCOUNT TO                        44510000
LRM021                              P2-BK-BR-ACCT-T-C                   44520000
LRM021         ADD FMT-ASSET-QUAN TO TOT-CL-OPT-CBOE-DB-QTY             44530000
LRM021     ELSE                                                         44540000
411900     IF B1-OPTION-OFFSET-IND (B1-IND) = '1'                       44550000
412000         MOVE '0982008013' TO P2-BK-BR-ACCT-T-C                   44560000
412100         ADD FMT-ASSET-QUAN TO TOT-CL-OPT-CBOE-DB-QTY             44570000
412200     ELSE                                                         44580000
412300         MOVE LOW-VALUES TO MSD-RECORD-AREA                       44590000
412400         MOVE FMT-ADP-SEC-NO TO GETMSD-INIT-SEARCH                44600000
412500         PERFORM O-CALL-MSD-FILE                                  44610000
412600                                                                  44620000
412700         PERFORM O-GET-EXCHANGE-CODE                              44630000
412800                                                                  44640000
412900         EVALUATE TRUE                                            44650000
413000             WHEN CBOE-OPTION                                     44660000
413100                 MOVE '0982008013' TO P2-BK-BR-ACCT-T-C           44670000
413200                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-CBOE-DB-QTY     44680000
413300             WHEN AMEX-OPTION OR NYSE-OPTION                      44690000
413400                 MOVE '0982009011' TO P2-BK-BR-ACCT-T-C           44700000
413500                 ADD FMT-ASSET-QUAN TO TOT-CL-AMEX-NYSE-DB-QTY    44710000
413600             WHEN PBW-OPTION                                      44720000
413700                 MOVE '0982001513' TO P2-BK-BR-ACCT-T-C           44730000
413800                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-PBW-DB-QTY      44740000
413900             WHEN PSE-OPTION                                      44750000
414000                 MOVE '0982001612' TO P2-BK-BR-ACCT-T-C           44760000
414100                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-PSE-DB-QTY      44770000
414200             WHEN OTHER                                           44780000
414300                 MOVE '0982006019' TO P2-BK-BR-ACCT-T-C           44790000
414400                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-DFLT-DB-QTY     44800000
414500         END-EVALUATE                                             44810000
414600     END-IF.                                                      44820000
414700/                                                                 44830000
414800******************************************************************44840000
414900*** PERFORMED BY:                                              ***44850000
415000***     O-BK-OPTION-OFFSET-CR-QTY                              ***44860000
415100******************************************************************44870000
415200                                                                  44880000
415300 O-GET-OPTION-OFFSET-ACT-CR.                                      44890000
415400                                                                  44900000
LRM021     IF ALT-OPTION-OFFSET-ACCOUNT > SPACES                        44910000
LRM021         MOVE ALT-OPTION-OFFSET-ACCOUNT TO                        44920000
LRM021                              P2-BK-BR-ACCT-T-C                   44930000
LRM021         ADD FMT-ASSET-QUAN TO TOT-CL-OPT-CBOE-CR-QTY             44940000
LRM021     ELSE                                                         44950000
415500     IF B1-OPTION-OFFSET-IND (B1-IND) = '1'                       44960000
415600         MOVE '0982008013' TO P2-BK-BR-ACCT-T-C                   44970000
415700         ADD FMT-ASSET-QUAN TO TOT-CL-OPT-CBOE-CR-QTY             44980000
415800     ELSE                                                         44990000
415900         MOVE LOW-VALUES TO MSD-RECORD-AREA                       45000000
416000         MOVE FMT-ADP-SEC-NO TO GETMSD-INIT-SEARCH                45010000
416100         PERFORM O-CALL-MSD-FILE                                  45020000
416200                                                                  45030000
416300         PERFORM O-GET-EXCHANGE-CODE                              45040000
416400                                                                  45050000
416500         EVALUATE TRUE                                            45060000
416600             WHEN CBOE-OPTION                                     45070000
416700                 MOVE '0982008013' TO P2-BK-BR-ACCT-T-C           45080000
416800                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-CBOE-CR-QTY     45090000
416900             WHEN AMEX-OPTION OR NYSE-OPTION                      45100000
417000                 MOVE '0982009011' TO P2-BK-BR-ACCT-T-C           45110000
417100                 ADD FMT-ASSET-QUAN TO TOT-CL-AMEX-NYSE-CR-QTY    45120000
417200             WHEN PBW-OPTION                                      45130000
417300                 MOVE '0982001513' TO P2-BK-BR-ACCT-T-C           45140000
417400                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-PBW-CR-QTY      45150000
417500             WHEN PSE-OPTION                                      45160000
417600                 MOVE '0982001612' TO P2-BK-BR-ACCT-T-C           45170000
417700                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-PSE-CR-QTY      45180000
417800             WHEN OTHER                                           45190000
417900                 MOVE '0982006019' TO P2-BK-BR-ACCT-T-C           45200000
418000                 ADD FMT-ASSET-QUAN TO TOT-CL-OPT-DFLT-CR-QTY     45210000
418100         END-EVALUATE                                             45220000
418200     END-IF.                                                      45230000
418300/                                                                 45240000
418400******************************************************************45250000
418500*** PERFORMED BY:                                              ***45260000
418600***     O-GET-OPTION-OFFSET-ACT-DB                             ***45270000
418700***     O-GET-OPTION-OFFSET-ACT-CR                             ***45280000
418800******************************************************************45290000
418900                                                                  45300000
419000 O-GET-EXCHANGE-CODE.                                             45310000
419100                                                                  45320000
419200     MOVE ZERO TO WS-SEC-TYPE-COMP3                               45330000
419300     MOVE MS-SECURITY-TYPE TO WS-SEC-TYPE-PICX                    45340000
419400     MOVE WS-SEC-TYPE-PICX-BYTE2 TO WS-SEC-TYPE-COMP3-BYTE1       45350000
419500     MOVE WS-SEC-TYPE-COMP3 TO WS-SEC-TYPE-PIC9                   45360000
419600     DISPLAY 'MS-SECURITY-TYPE=', MS-SECURITY-TYPE                45370000
419700     DISPLAY 'WS-SEC-TYPE-PIC9=', WS-SEC-TYPE-PIC9.               45380000
419800/                                                                 45390000
419900******************************************************************45400000
420000*** PERFORMED BY:                                              ***45410000
420100***     O-DLVR-CR-CASH-BAL                                     ***45420000
420200***     O-RCVR-DB-CASH-BAL                                     ***45430000
420300******************************************************************45440000
420400                                                                  45450000
420500 O-BK-OFFSET-CR-CASH-VALUE.                                       45460000
420600                                                                  45470000
420700     IF B1-OFFSET-AMT-BYPASS (B1-IND) = '1'                       45480000
420800        ADD FMT-ASSET-VALUE  TO TOT-CL-OFFSET-BYP-CR-VALUE        45490000
420900     ELSE                                                         45500000
421000        MOVE 'BNS' TO P2-BK-TRID                                  45510000
421100        MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                 45520000
421200        MOVE P2-CREDIT-SIGN TO P2-BK-BUY-SELL-CODE                45530000
421300                                                                  45540000
421400        MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C        45550000
421500                                                                  45560000
421600        MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                 45570000
421700        MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                45580000
421800        MOVE SPACES             TO P2-BK-QUANTITY-X               45590000
421900        MOVE SPACES             TO P2-BK-FRACTION-X               45600000
422000        MOVE FMT-ASSET-VALUE    TO AMOUNT-OVERFLOW                45610000
422100        ADD FMT-ASSET-VALUE     TO TOT-CL-OFFSET-CR-VALUE         45620000
422200                                                                  45630000
422300        MOVE '1' TO OVERFLOW-SW                                   45640000
422400        PERFORM O-CASH-AMT-OVRFLOW-CHK-RTN                        45650000
422500            UNTIL NO-MORE-OVERFLOW                                45660000
422600     END-IF.                                                      45670000
422700/                                                                 45680000
422800******************************************************************45690000
422900*** PERFORMED BY:                                              ***45700000
423000***     O-DLVR-DB-CASH-BAL                                     ***45710000
423100***     O-RCVR-CR-CASH-BAL                                     ***45720000
423200******************************************************************45730000
423300                                                                  45740000
423400 O-BK-OFFSET-DB-CASH-VALUE.                                       45750000
423500                                                                  45760000
423600     IF B1-OFFSET-AMT-BYPASS (B1-IND) = '1'                       45770000
423700        ADD FMT-ASSET-VALUE  TO TOT-CL-OFFSET-BYP-DB-VALUE        45780000
423800     ELSE                                                         45790000
423900        MOVE 'BNS' TO P2-BK-TRID                                  45800000
424000        MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                 45810000
424100        MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE                45820000
424200                                                                  45830000
424300        MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C        45840000
424400                                                                  45850000
424500        MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                 45860000
424600        MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                45870000
424700        MOVE SPACES             TO P2-BK-QUANTITY-X               45880000
424800        MOVE SPACES             TO P2-BK-FRACTION-X               45890000
424900        MOVE FMT-ASSET-VALUE    TO AMOUNT-OVERFLOW                45900000
425000        ADD FMT-ASSET-VALUE     TO TOT-CL-OFFSET-DB-VALUE         45910000
425100                                                                  45920000
425200        MOVE '1' TO OVERFLOW-SW                                   45930000
425300        PERFORM O-CASH-AMT-OVRFLOW-CHK-RTN                        45940000
425400         UNTIL NO-MORE-OVERFLOW                                   45950000
425500     END-IF.                                                      45960000
425600/                                                                 45970000
425700******************************************************************45980000
425800*** PERFORMED BY:                                              ***45990000
425900***     O-DLVR-LONG-NON-CNS                                   *** 46000000
426000***     O-RCVR-SHORT-NON-CNS                                   ***46010000
426100******************************************************************46020000
426200                                                                  46030000
426300 O-BK-OFFSET-CR-VALUE.                                            46040000
426400                                                                  46050000
426500     IF B1-OFFSET-AMT-BYPASS (B1-IND) = '1'                       46060000
426600        ADD  FMT-ASSET-VALUE TO TOT-CL-OFFSET-BYP-CR-VALUE        46070000
426700     ELSE                                                         46080000
426800        MOVE 'BNS' TO P2-BK-TRID                                  46090000
426900        MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                 46100000
427000        MOVE P2-CREDIT-SIGN TO P2-BK-BUY-SELL-CODE                46110000
427100                                                                  46120000
427200        MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C        46130000
427300                                                                  46140000
427400        MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                 46150000
427500        MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                46160000
427600        MOVE ZEROS              TO TST-P2-BK-QTY                  46170000
427700        MOVE ZEROS              TO P2-BK-FRACTION                 46180000
427800        MOVE FMT-ASSET-VALUE    TO AMOUNT-OVERFLOW                46190000
427900        ADD  FMT-ASSET-VALUE    TO TOT-CL-OFFSET-CR-VALUE         46200000
428000                                                                  46210000
428100        MOVE '1' TO OVERFLOW-SW                                   46220000
428200        PERFORM O-AMT-OVRFLOW-CHK-RTN                             46230000
428300         UNTIL NO-MORE-OVERFLOW                                   46240000
428400     END-IF.                                                      46250000
428500/                                                                 46260000
428600******************************************************************46270000
428700*** PERFORMED BY:                                              ***46280000
428800***     O-DLVR-SHORT-NON-CNS                                   ***46290000
428900***     O-RCVR-LONG-NON-CNS                                    ***46300000
429000******************************************************************46310000
429100                                                                  46320000
429200 O-BK-OFFSET-DB-VALUE.                                            46330000
429300                                                                  46340000
429400     IF B1-OFFSET-AMT-BYPASS (B1-IND) = '1'                       46350000
429500        ADD  FMT-ASSET-VALUE  TO TOT-CL-OFFSET-BYP-DB-VALUE       46360000
429600     ELSE                                                         46370000
429700        MOVE 'BNS' TO P2-BK-TRID                                  46380000
429800        MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                 46390000
429900        MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE                46400000
430000                                                                  46410000
430100        MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C        46420000
430200                                                                  46430000
430300        MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                 46440000
430400        MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                46450000
430500        MOVE ZEROS              TO TST-P2-BK-QTY                  46460000
430600        MOVE ZEROS              TO P2-BK-FRACTION                 46470000
430700        MOVE FMT-ASSET-VALUE    TO AMOUNT-OVERFLOW                46480000
430800        ADD  FMT-ASSET-VALUE    TO TOT-CL-OFFSET-DB-VALUE         46490000
430900                                                                  46500000
431000        MOVE '1' TO OVERFLOW-SW                                   46510000
431100        PERFORM O-AMT-OVRFLOW-CHK-RTN                             46520000
431200         UNTIL NO-MORE-OVERFLOW                                   46530000
431300     END-IF.                                                      46540000
431400/                                                                 46550000
431500******************************************************************46560000
431600*** PERFORMED BY:                                              ***46570000
431700***     O-DLVR-SHORT-CNS                                       ***46580000
431800***     O-RCVR-LONG-CNS                                        ***46590000
431900******************************************************************46600000
432000                                                                  46610000
432100 O-BK-CNS-CR-QUANTITY.                                            46620000
432200                                                                  46630000
432300     MOVE 'BNS' TO P2-BK-TRID                                     46640000
432400     MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                    46650000
432500     MOVE P2-CREDIT-SIGN TO P2-BK-BUY-SELL-CODE                   46660000
432600                                                                  46670000
LRM050     IF DST-DIRECT AND                                            46680000
LRM050        NTWIO-MATRIX-LEVEL = '6' AND                              46690000
LRM050        B1-MFRS-DST-MFE-OFFSET (B1-IND) > SPACES                  46700000
LRM050        MOVE  B1-MFRS-DST-MFE-OFFSET (B1-IND)                     46710000
LRM050                          TO P2-BK-BR-ACCT-T                      46720000
LRM050        MOVE 'X'          TO P2-BK-CHECK-DIGIT                    46721000
LRM050     ELSE                                                         46721100
432700        MOVE CNS-BR-ACCT-T-C TO P2-BK-BR-ACCT-T-C                 46721200
LRM052        IF B1-ACAT-CNS-LONG-R-ACCT (B1-IND) > SPACES              46721300
LRM052        AND FMT-CNS                                               46721400
LRM052        AND FMT-ADP-SEC-NO(1 : 3) NOT = '866'                     46721500
LRM052           PERFORM SEARCH-STP-TABLE                               46721603
LRM052           IF STP-NOTFND                                          46721710
LRM052              MOVE B1-ACAT-CNS-LONG-R-ACCT (B1-IND)               46721810
LRM052                                  TO P2-BK-BR-ACCT-T              46721903
LRM052                MOVE 'X'          TO P2-BK-CHECK-DIGIT            46722003
LRM052           ELSE                                                   46722112
LRM052                DISPLAY 'BYPASS CNS STP ' FMT-TI-ADP-CL-NO-X      46722212
LRM052                                      ' ' FMT-TI-CONTROL-NUM      46722312
LRM052        END-IF                                                    46722400
LRM050     END-IF.                                                      46722500
432800                                                                  46722600
432900     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    46722700
433000     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   46722800
433100     MOVE ZERO               TO P2-BK-AMOUNT                      46722900
433200     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           46723000
433300     MOVE WS-QTY             TO P2-BK-QUANTITY                    46723100
433400     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               46723200
433500     ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CNS-CR-QTY              46723300
433600                                                                  46723400
433700     PERFORM O-WRITE-P2-REC.                                      46723500
433800/                                                                 46724000
433900******************************************************************46725000
434000*** PERFORMED BY:                                              ***46726000
434100***     O-DLVR-LONG-CNS                                        ***46727000
434200***     O-RCVR-SHORT-CNS                                       ***46728000
434300******************************************************************46729000
434400                                                                  46730000
434500 O-BK-CNS-DB-QUANTITY.                                            46740000
434600                                                                  46750000
434700     MOVE 'BNS' TO P2-BK-TRID                                     46760000
434800     MOVE FMT-TI-ADP-CL-NO TO P2-BK-BROKER-NBR                    46770000
434900     MOVE P2-DEBIT-SIGN  TO P2-BK-BUY-SELL-CODE                   46780000
435000                                                                  46790000
LRM050     IF DST-DIRECT AND                                            46800000
LRM050        NTWIO-MATRIX-LEVEL = '6' AND                              46810000
LRM050        B1-MFRS-DST-MFE-OFFSET (B1-IND) > SPACES                  46820000
LRM050        MOVE  B1-MFRS-DST-MFE-OFFSET (B1-IND)                     46830000
LRM050                          TO P2-BK-BR-ACCT-T                      46840000
LRM050        MOVE 'X'          TO P2-BK-CHECK-DIGIT                    46850000
LRM050     ELSE                                                         46860000
435100        MOVE CNS-BR-ACCT-T-C TO P2-BK-BR-ACCT-T-C                 46870000
LRM052        IF B1-ACAT-CNS-SHORT-S-ACCT (B1-IND) > SPACES             46880000
LRM052        AND FMT-CNS                                               46890000
LRM052        AND FMT-ADP-SEC-NO(1 : 3) NOT = '866'                     46900000
LRM052           PERFORM SEARCH-STP-TABLE                               46900103
LRM052           IF STP-NOTFND                                          46900203
LRM052              MOVE B1-ACAT-CNS-SHORT-S-ACCT (B1-IND)              46901003
LRM052                                TO P2-BK-BR-ACCT-T                46902003
LRM052              MOVE 'X'          TO P2-BK-CHECK-DIGIT              46903003
LRM052           ELSE                                                   46903112
LRM052                DISPLAY 'BYPASS CNS STP ' FMT-TI-ADP-CL-NO-X      46903212
LRM052                                      ' ' FMT-TI-CONTROL-NUM      46903312
LRM052        END-IF                                                    46904000
LRM050     END-IF.                                                      46905000
435200                                                                  46906000
435300     MOVE FMT-TI-CONTROL-NUM TO P2-BK-CNTL-NBR                    46907000
435400     MOVE FMT-CONTRA-BRK-NUM TO P2-BK-CNTRA-BKR                   46908000
435500     MOVE ZERO               TO P2-BK-AMOUNT                      46909000
435600     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           46910000
435700     MOVE WS-QTY             TO P2-BK-QUANTITY                    46920000
435800     MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION               46930000
435900     ADD  FMT-ASSET-QUAN     TO TOT-CL-BK-CNS-DB-QTY              46940000
436000                                                                  46950000
436100     PERFORM O-WRITE-P2-REC.                                      46960000
436200                                                                  46970000
436300/                                                                 46980000
436400* FUND/SERV                                                       46990000
436500 O-BK-MEMO-CR-QUANTITY.                                           47000000
436600                                                                  47010000
LRM001     IF (B1-MFRS-ACTIVE (B1-IND)  =  'A'  OR                      47020000
LRM001         FMT-TI-ADP-CL-NO = 63)   AND                             47030000
LRM001                OMNIBUS-PROCESS   AND                             47040000
LRM001                MF-NSCC-SOURCE    AND                             47050000
LRM001                B1-MFRS-NSCCSRC-OFFSET (B1-IND) > SPACES  AND     47060000
LRM001                FMT-ACCEPTED-BY-FUND                              47070000
LRM001           MOVE B1-MFRS-NSCCSRC-OFFSET (B1-IND)                   47080000
LRM001                      TO P2-BK-BR-ACCT-T                          47090000
LRM001           MOVE 'X' TO P2-BK-CHECK-DIGIT                          47100000
LRM001           MOVE  P2-DEBIT-SIGN      TO  P2-BK-BUY-SELL-CODE       47110000
LRM001           MOVE SPACES TO P2-BK-VALUE-DT-X                        47120000
LRM001           MOVE  'BNS'                   TO  P2-BK-TRID           47130000
LRM001     ELSE                                                         47140000
LRM050     IF DST-MFE-PROCESS   AND                                     47150000
LRM050        NTWIO-MATRIX-LEVEL = '6' AND                              47160000
LRM050        B1-MFRS-DST-MFE-OFFSET (B1-IND) > SPACES                  47170000
LRM050        MOVE  B1-MFRS-DST-MFE-OFFSET (B1-IND)                     47180000
LRM050                                       TO P2-BK-BR-ACCT-T         47190000
LRM050        MOVE 'X'                       TO P2-BK-CHECK-DIGIT       47200000
LRM050        MOVE  P2-DEBIT-SIGN            TO  P2-BK-BUY-SELL-CODE    47210000
LRM050        PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT           47220000
LRM050        IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND                    47230000
LRM050               WS-VALUE-DT-YYMMDD > ZEROES                        47240000
LRM050            MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT             47250000
LRM050        ELSE                                                      47260000
LRM050            MOVE SPACES TO P2-BK-VALUE-DT-X                       47270000
LRM050        END-IF                                                    47280000
LRM050     END-IF                                                       47290000
LRM029     IF PNC-OMNIBUS-PROCESS AND                                   47300000
LRM029        B1-PNC-SURPAS-OFFSET (B1-IND) > SPACES                    47310000
LRM029        MOVE  B1-PNC-SURPAS-OFFSET (B1-IND)                       47320000
LRM029                                       TO P2-BK-BR-ACCT-T         47330000
LRM029        MOVE 'X'                       TO P2-BK-CHECK-DIGIT       47340000
LRM029        MOVE  P2-DEBIT-SIGN            TO  P2-BK-BUY-SELL-CODE    47350000
LRM029        PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT           47360000
LRM029        IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND                    47370000
LRM029               WS-VALUE-DT-YYMMDD > ZEROES                        47380000
LRM029            MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT             47390000
LRM029        ELSE                                                      47400000
LRM029            MOVE SPACES TO P2-BK-VALUE-DT-X                       47410000
LRM029        END-IF                                                    47420000
LRM029     ELSE                                                         47430000
436700     IF  B1-MFRS-ACTIVE (B1-IND)  =  'A'  OR                      47440000
436800         FMT-TI-ADP-CL-NO = 63                                    47450000
436900                                                                  47460000
437000       EVALUATE TRUE                                              47470000
437100         WHEN  FMT-NTWRK-CNTL-CD = '1'                            47480000
437200               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    47490000
437210               MOVE  P2-CREDIT-SIGN       TO  P2-BK-BUY-SELL-CODE 47500000
437220               IF  FMT-TI-ADP-CL-NO = 63                          47510000
437230                   MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID     47520000
437240                   ADD  FMT-ASSET-QUAN     TO  TOT-N0-MEMO-DB-QTY 47530000
437250               ELSE                                               47540000
437260                   MOVE  MEMO-TWO-WAY-BATCH (1) TO P2-BK-TRID     47550000
437270                   ADD  FMT-ASSET-QUAN     TO  TOT-N1-MEMO-DB-QTY 47560000
437280               END-IF                                             47570000
LRM015               SET MEMO-TRID TO TRUE                              47580000
437290         WHEN  FMT-NTWRK-CNTL-CD = '2'                            47590000
437300               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    47600000
437400               MOVE  P2-CREDIT-SIGN       TO  P2-BK-BUY-SELL-CODE 47610000
437500               IF  FMT-TI-ADP-CL-NO = 63                          47620000
437600                   MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID     47630000
437700                   ADD  FMT-ASSET-QUAN     TO  TOT-N0-MEMO-DB-QTY 47640000
437800               ELSE                                               47650000
437900                   MOVE  MEMO-TWO-WAY-BATCH (2) TO P2-BK-TRID     47660000
438000                   ADD  FMT-ASSET-QUAN     TO  TOT-N2-MEMO-DB-QTY 47670000
438100               END-IF                                             47671000
LRM015               SET MEMO-TRID TO TRUE                              47672000
438200         WHEN  FMT-NTWRK-CNTL-CD = '3'                            47673000
438300               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    47674000
438400               MOVE  P2-CREDIT-SIGN       TO  P2-BK-BUY-SELL-CODE 47675000
438500               MOVE  MEMO-TWO-WAY-BATCH (3) TO P2-BK-TRID         47676000
LRM050               IF DST-DIRECT                                      47677000
LRM050               AND NTWIO-MATRIX-LEVEL = '6'                       47678000
LRM050               AND  MEMO-TWO-WAY-BATCH (6) > SPACES               47679000
LRM050                  MOVE  MEMO-TWO-WAY-BATCH (6) TO P2-BK-TRID      47680000
LRM050                  ADD  FMT-ASSET-QUAN     TO  TOT-N6-MEMO-DB-QTY  47690000
LRM050               ELSE                                               47700000
438500                  MOVE  MEMO-TWO-WAY-BATCH (3) TO P2-BK-TRID      47710000
438600                  ADD  FMT-ASSET-QUAN     TO  TOT-N3-MEMO-DB-QTY  47720000
LRM050               END-IF                                             47730000
LRM015               SET MEMO-TRID TO TRUE                              47740000
438700         WHEN  FMT-NTWRK-CNTL-CD = '4'                            47741000
438800               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    47742000
438900               MOVE  P2-CREDIT-SIGN       TO  P2-BK-BUY-SELL-CODE 47742100
439000               IF  FMT-TI-ADP-CL-NO = 63                          47742200
439100                   MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID     47742300
439200                   ADD  FMT-ASSET-QUAN     TO  TOT-N0-MEMO-DB-QTY 47742400
439300               ELSE                                               47742500
439400                   MOVE  MEMO-TWO-WAY-BATCH (4) TO P2-BK-TRID     47742600
439500                   ADD  FMT-ASSET-QUAN     TO  TOT-N4-MEMO-DB-QTY 47742700
439600               END-IF                                             47742800
LRM015               SET MEMO-TRID TO TRUE                              47742900
439700         WHEN  OTHER                                              47743000
YH0001*****ADD THIS HARD CODING FOR CLIET 63 TO MAKE IT = TO            47744000
YH0001*****MEMO-DB PROCESSING                                           47745000
YH0001           IF  FMT-TI-ADP-CL-NO = 63                              47746000
YH0001                PERFORM  O-CUST-ACT-MOVE-BR-ACT                   47747000
YH0001                MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID        47748000
YH0001                MOVE  P2-CREDIT-SIGN      TO  P2-BK-BUY-SELL-CODE 47749000
YH0001                ADD  FMT-ASSET-QUAN       TO  TOT-N0-MEMO-DB-QTY  47750000
YH0001           ELSE                                                   47760000
440810            IF OMNIBUS-PROCESS   AND                              47770000
440820              B1-MFRS-OMNIBUS-OFFSET (B1-IND) > SPACES            47780000
440830               MOVE  B1-MFRS-OMNIBUS-OFFSET (B1-IND)              47790000
440840                                              TO P2-BK-BR-ACCT-T  47800000
440850               MOVE 'X'                       TO P2-BK-CHECK-DIGIT47810000
440860               PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT    47820000
440870               IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND             47830000
440880                    WS-VALUE-DT-YYMMDD > ZEROES                   47840000
440890                    MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT     47850000
440891               ELSE                                               47860000
440892                    MOVE SPACES TO P2-BK-VALUE-DT-X               47870000
440893               END-IF                                             47880000
440900            ELSE                                                  47890000
LRM006******       IF FMT-CASH-MGN-IND = 'M'       AND                  47900000
LRM006             IF FMT-VMF-ACCT-TYPE-CD = '2'   AND                  47910000
441100               FMT-BK-PHSCL-SHR-CD =  '1' AND                     47920000
441200               B1-MFRS-BB-OFFSET (B1-IND) > SPACES                47930000
441400                PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT   47940000
441500                IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND            47950000
441600                    WS-VALUE-DT-YYMMDD > ZEROES                   47960000
441700                    MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT     47970000
441800                ELSE                                              47980000
441900                    MOVE SPACES             TO P2-BK-VALUE-DT-X   47990000
442000                END-IF                                            48000000
442100                MOVE B1-MFRS-BB-OFFSET (B1-IND) TO P2-BK-BR-ACCT-T48010000
442110                MOVE 'X'                      TO P2-BK-CHECK-DIGIT48020000
442200             ELSE                                                 48030000
442300              MOVE SPACES TO P2-BK-VALUE-DT-X                     48040000
442400              MOVE ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C  48050000
442500             END-IF                                               48060000
442600            END-IF                                                48070000
442700            MOVE  'BNS'                 TO  P2-BK-TRID            48080000
442800            MOVE  P2-DEBIT-SIGN         TO  P2-BK-BUY-SELL-CODE   48090000
442900            ADD  FMT-ASSET-QUAN         TO  TOT-N0-MEMO-DB-QTY    48100000
YH0001          END-IF                                                  48110000
443000       END-EVALUATE                                               48120000
443100     ELSE                                                         48130000
443200        MOVE  'BNS'                    TO  P2-BK-TRID             48140000
443300        MOVE  P2-DEBIT-SIGN            TO  P2-BK-BUY-SELL-CODE    48150000
443400        MOVE  ALTERNATE-OFFSET-ACCOUNT TO  P2-BK-BR-ACCT-T-C      48160000
443500        ADD  FMT-ASSET-QUAN            TO  TOT-N0-MEMO-DB-QTY     48170000
443600     END-IF.                                                      48180000
443700     MOVE  FMT-TI-ADP-CL-NO           TO  P2-BK-BROKER-NBR.       48190000
443800     MOVE  FMT-TI-CONTROL-NUM         TO  P2-BK-CNTL-NBR.         48200000
443900     MOVE  FMT-CONTRA-BRK-NUM         TO  P2-BK-CNTRA-BKR.        48210000
444000     MOVE  ZERO                       TO  P2-BK-AMOUNT.           48220000
444100     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           48230000
444200     MOVE WS-QTY             TO P2-BK-QUANTITY                    48240000
444300     MOVE  FMT-ASSET-QUAN-FRACTION    TO  P2-BK-FRACTION.         48250000
444400                                                                  48260000
444500     IF  P2-BK-TRID (2:2) NOT = SPACES                            48270000
444600         IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND             48280000
444700             FMT-ACT-TYPE  =  'DR')                               48290000
444800         OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND             48300000
ET0001            (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR             48310000
ET0001                              'SI' OR 'EI' OR 'RI'))              48320000
LRM027         OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND             48330000
LRM027            (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR             48340000
LRM027                              'SI' OR 'EI' OR 'RI' OR             48350000
LRM027                              'BI' OR 'BR' OR '4K' OR             48360000
LRM027                              '4B' OR '7B' OR '5P' OR 'HS'))      48370000
445000            IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                  48380000
445100               SET FUND-SERV-ROLLOVER TO TRUE                     48390000
445200            END-IF                                                48400000
445300         END-IF                                                   48410000
445400         PERFORM  O-WRITE-P2-REC                                  48420000
445500         MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW   48430000
445600     END-IF.                                                      48440000
445700                                                                  48450000
445800 GET-VALUE-DATE.                                                  48460000
445900                                                                  48470000
446000     IF FMT-STTLM-DT = '0001-01-01'  OR                           48480000
446100        FMT-STTLM-DT = '          '                               48490000
446200        GO TO GET-VALUE-DATE-EXIT                                 48500000
446300     END-IF.                                                      48510000
446400                                                                  48520000
446500     INITIALIZE BPDATES-PARAMETERS.                               48530000
446600                                                                  48540000
446700     MOVE 'CAT650'                    TO  BPDATES-CALLING-PGM.    48550000
446800     MOVE 'D'                         TO  BPDATES-REQ-TYPE.       48560000
446900     MOVE '  '                        TO  BPDATES-CALENDAR-TYPE.  48570000
447000     MOVE FMT-STTLM-DT                TO  WS-STTLM-DATE.          48580000
447100     MOVE WS-STTLM-DATE-CC            TO  WS-STTLM-DT-CC.         48590000
447200     MOVE WS-STTLM-DATE-YY            TO  WS-STTLM-DT-YY.         48600000
447300     MOVE WS-STTLM-DATE-MM            TO  WS-STTLM-DT-MM.         48610000
447400     MOVE WS-STTLM-DATE-DD            TO  WS-STTLM-DT-DD.         48620000
447500     MOVE WS-STTLM-DT-CCYYMMDD        TO  BPDATES-BASE-DATE.      48630000
447600     MOVE 'M'                         TO  BPDATES-DTSEARCH-IND.   48640000
447700     MOVE 'C'                         TO  BPDATES-DTSEARCH-TYPE.  48650000
447800     MOVE 2                           TO  BPDATES-DTSEARCH-DISP.  48660000
447900                                                                  48670000
448000     CALL   BPDATES                 USING  BPDATES-PARAMETERS.    48680000
448100                                                                  48690000
448200     IF NOT BPD-VALID-RETURN                                      48700000
448300        DISPLAY '************************************************'48710000
448400        DISPLAY '*DTSEARCH VIA BPDATES FAILES, RETURN CODE = '    48720000
448500                  BPDATES-RETURN-CODE ' *'                        48730000
448600        DISPLAY '************************************************'48740000
448700        MOVE '00010101'               TO WS-DTSEARCH-DATE-CCYYMMDD48750000
448800     ELSE                                                         48760000
448900        MOVE BPD-DT-CALDATE           TO WS-DTSEARCH-DATE-CCYYMMDD48770000
449000     END-IF.                                                      48780000
449100     MOVE WS-DTSEARCH-DATE-YY TO WS-VALUE-DT-YY                   48790000
449200     MOVE WS-DTSEARCH-DATE-MM TO WS-VALUE-DT-MM                   48800000
449300     MOVE WS-DTSEARCH-DATE-DD TO WS-VALUE-DT-DD.                  48810000
449400                                                                  48820000
449500                                                                  48830000
449600  GET-VALUE-DATE-EXIT.                                            48840000
449700     EXIT.                                                        48850000
449800/                                                                 48860000
449900* FUND/SERV                                                       48870000
450000 O-BK-PEND-DB-VALUE.                                              48880000
450100***  DISPLAY ' O-BK-PEND-DB-VALUE ------>'                        48890000
450200                                                                  48900000
450400     IF  B1-DEL-PEND-STL-ACCT (B1-IND)  >  SPACES                 48910000
450500       IF  B1-PEND-STL-BATCH-CODE (B1-IND)  >  SPACES             48920000
450600           MOVE  B1-PEND-STL-BATCH-CODE (B1-IND)                  48930000
450700                                      TO  P2-BK-TRID              48940000
450800       ELSE                                                       48950000
450900            MOVE  'BNS'               TO  P2-BK-TRID              48960000
451000       END-IF                                                     48970000
451100       MOVE  FMT-TI-ADP-CL-NO         TO  P2-BK-BROKER-NBR        48980000
451200       MOVE  P2-DEBIT-SIGN            TO  P2-BK-BUY-SELL-CODE     48990000
451300       MOVE  B1-DEL-PEND-STL-ACCT(B1-IND) TO  P2-BK-BR-ACCT-T     49000000
YH0001       IF FMT-TRNFR-TYPE = 'MFC'                                  49010000
YH0001            PERFORM O-WRITE-P2-MFC-ACCOUNT                        49020000
YH0001       END-IF                                                     49030000
YH0001                                                                  49040000
451400       MOVE  'X'                      TO  P2-BK-CHECK-DIGIT       49050000
451500       MOVE  FMT-TI-CONTROL-NUM       TO  P2-BK-CNTL-NBR          49060000
451600       MOVE  FMT-CONTRA-BRK-NUM       TO  P2-BK-CNTRA-BKR         49070000
451700       MOVE  ZEROS                    TO  TST-P2-BK-QTY           49080000
451800       MOVE  ZEROS                    TO  P2-BK-FRACTION          49090000
451900       MOVE  FMT-ASSET-VALUE          TO  AMOUNT-OVERFLOW         49100000
452000       MOVE  '1'                      TO  OVERFLOW-SW             49110000
452100       IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND               49120000
452200           FMT-ACT-TYPE  =  'DR')                                 49130000
452300       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND               49140000
ET0001          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               49150000
ET0001                            'SI' OR 'EI' OR 'RI'))                49160000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               49170000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               49180000
LRM027                            'SI' OR 'EI' OR 'RI' OR               49190000
LRM027                            'BI' OR 'BR' OR '4K' OR               49200000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        49210000
452500          IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                    49220000
453400             SET FUND-SERV-ROLLOVER TO TRUE                       49230000
453500          END-IF                                                  49240000
453600       END-IF                                                     49250000
453700       PERFORM  O-AMT-OVRFLOW-CHK-RTN                             49260000
453800          UNTIL NO-MORE-OVERFLOW                                  49270000
453900       MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW     49280000
455200     END-IF.                                                      49290000
455300     IF  FMT-CLNT-IS-RECEIVER                                     49300000
455400         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-REC-DB-VALUE49310000
455500     ELSE                                                         49320000
455600         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-DEL-DB-VALUE49330000
455700     END-IF.                                                      49340000
455800                                                                  49350000
456100* FUND/SERV                                                       49360000
456200 O-BK-PEND-DB-BOTH.                                               49370000
457200                                                                  49380000
457300***  IF RECEIVER AND B1(434637) IS ON ============>               49390000
457400     IF  FMT-CLNT-IS-RECEIVER    AND                              49400000
457500         B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES                 49410000
457600         MOVE B1-RCV-PEND-STL-ACCT (B1-IND) TO  P2-BK-BR-ACCT-T   49420000
457700     ELSE                                                         49430000
457800***  IF DELIVERER AND B1(434638) IS ON ============>              49440000
457900        IF FMT-CLNT-IS-DELIVERER AND                              49450000
458000            B1-DEL-PEND-STL-ACCT (B1-IND) > SPACES                49460000
458100            MOVE B1-DEL-PEND-STL-ACCT (B1-IND)                    49470000
458200                                            TO  P2-BK-BR-ACCT-T   49480000
458300        END-IF                                                    49490000
458400     END-IF.                                                      49500000
                                                                        49510000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    49520000
YH0001         PERFORM O-WRITE-P2-MFC-ACCOUNT                           49530000
YH0001     END-IF.                                                      49540000
458500                                                                  49550000
458600     IF (B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES)  OR            49560000
458700        (B1-DEL-PEND-STL-ACCT (B1-IND)  >  SPACES)                49570000
458800       IF  B1-PEND-STL-BATCH-CODE (B1-IND)  >  SPACES             49580000
458900           MOVE  B1-PEND-STL-BATCH-CODE (B1-IND)                  49590000
459000                                      TO  P2-BK-TRID              49600000
459400       ELSE                                                       49610000
459500            MOVE  'BNS'               TO  P2-BK-TRID              49620000
459600       END-IF                                                     49630000
459700       MOVE  FMT-TI-ADP-CL-NO         TO  P2-BK-BROKER-NBR        49640000
459800       MOVE  P2-DEBIT-SIGN            TO  P2-BK-BUY-SELL-CODE     49650000
459900       MOVE  'X'                      TO  P2-BK-CHECK-DIGIT       49660000
460000       MOVE  FMT-TI-CONTROL-NUM       TO  P2-BK-CNTL-NBR          49670000
460100       MOVE  FMT-CONTRA-BRK-NUM       TO  P2-BK-CNTRA-BKR         49680000
460200       MOVE  FMT-ASSET-QUAN           TO  WS-QTY                  49690000
460300       MOVE  WS-QTY                   TO  P2-BK-QUANTITY          49700000
460400       MOVE  FMT-ASSET-QUAN-FRACTION  TO  P2-BK-FRACTION          49710000
460500       MOVE  FMT-ASSET-VALUE          TO  P2-BK-AMOUNT            49720000
461800                                                                  49730000
461900       IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND               49740000
462000           FMT-ACT-TYPE  =  'DR')                                 49750000
462100       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND               49760000
ET0001          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               49770000
ET0001                            'SI' OR 'EI' OR 'RI'))                49780000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               49790000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               49800000
LRM027                            'SI' OR 'EI' OR 'RI' OR               49810000
LRM027                            'BI' OR 'BR' OR '4K' OR               49820000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        49830000
462300           IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                   49840000
463200              SET FUND-SERV-ROLLOVER TO TRUE                      49850000
463300           END-IF                                                 49860000
463400       END-IF                                                     49870000
463500       PERFORM  O-WRITE-P2-REC                                    49880000
463600       MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW     49890000
463700                                                                  49900000
463800     END-IF.                                                      49910000
463900                                                                  49920000
464000     IF  FMT-CLNT-IS-RECEIVER                                     49930000
464100         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-REC-DB-VALUE49940000
464200         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-REC-DB-QTY  49950000
464300     ELSE                                                         49960000
464400         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-DEL-DB-VALUE49961000
464500         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-DEL-DB-QTY  49962000
464600     END-IF.                                                      49963000
464700                                                                  49964000
464800/                                                                 49965000
464900* FUND/SERV                                                       49966000
465000 O-BK-PEND-CR-QUANTITY.                                           49967000
465200***  IF RECEIVER AND B1(434637) IS ON ============>               49968000
465300     IF  FMT-CLNT-IS-RECEIVER    AND                              49969000
465400         B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES                 49970000
465500         MOVE B1-RCV-PEND-STL-ACCT (B1-IND) TO  P2-BK-BR-ACCT-T   49980000
465600     ELSE                                                         49990000
465700***  IF DELIVERER AND B1(434638) IS ON ============>              50000000
465800        IF FMT-CLNT-IS-DELIVERER AND                              50010000
465900            B1-DEL-PEND-STL-ACCT (B1-IND) > SPACES                50020000
466000            MOVE B1-DEL-PEND-STL-ACCT (B1-IND)                    50030000
466100                                            TO  P2-BK-BR-ACCT-T   50040000
466200        END-IF                                                    50050000
466300     END-IF.                                                      50060000
466400                                                                  50061000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    50062000
               PERFORM O-WRITE-P2-MFC-ACCOUNT                           50063000
           END-IF.                                                      50064000
                                                                        50065000
466500     IF (B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES)  OR            50066000
466600        (B1-DEL-PEND-STL-ACCT (B1-IND)  >  SPACES)                50067000
466700       IF  B1-PEND-STL-BATCH-CODE (B1-IND)  >  SPACES             50068000
466800           MOVE  B1-PEND-STL-BATCH-CODE (B1-IND)                  50069000
466900                                      TO  P2-BK-TRID              50070000
467000*          DISPLAY '  '                                           50080000
467100*          DISPLAY ' O-BK-PEND-CR-QUANTITY  ---->'                50090000
467200*          DISPLAY '==========================='                  50100000
467300       ELSE                                                       50110000
467400            MOVE  'BNS'               TO  P2-BK-TRID              50120000
467500       END-IF                                                     50130000
467600       MOVE  FMT-TI-ADP-CL-NO         TO  P2-BK-BROKER-NBR        50140000
467700       MOVE  P2-CREDIT-SIGN           TO  P2-BK-BUY-SELL-CODE     50150000
467800       MOVE  'X'                      TO  P2-BK-CHECK-DIGIT       50160000
467900       MOVE  FMT-TI-CONTROL-NUM       TO  P2-BK-CNTL-NBR          50170000
468000       MOVE  FMT-CONTRA-BRK-NUM       TO  P2-BK-CNTRA-BKR         50180000
468100       MOVE  FMT-ASSET-QUAN           TO  WS-QTY                  50190000
468200       MOVE  WS-QTY                   TO  P2-BK-QUANTITY          50200000
468300       MOVE  FMT-ASSET-QUAN-FRACTION  TO  P2-BK-FRACTION          50210000
468400       MOVE  ZERO                     TO  P2-BK-AMOUNT            50220000
469700                                                                  50230000
469800       IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND               50240000
469900           FMT-ACT-TYPE  =  'DR')                                 50250000
470000       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND               50260000
ET0001          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               50270000
ET0001                            'SI' OR 'EI' OR 'RI'))                50280000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               50290000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               50300000
LRM027                            'SI' OR 'EI' OR 'RI' OR               50310000
LRM027                            'BI' OR 'BR' OR '4K' OR               50320000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        50330000
470200         IF  B1-MISC-IRA-CLIENT (B1-IND) = '1'                    50340000
471100             SET  FUND-SERV-ROLLOVER  TO  TRUE                    50350000
471200          END-IF                                                  50360000
471300       END-IF                                                     50370000
471400       PERFORM  O-WRITE-P2-REC                                    50380000
471500       MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW     50390000
471600                                                                  50400000
471700     END-IF.                                                      50410000
471800                                                                  50420000
471900     IF  FMT-CLNT-IS-RECEIVER                                     50430000
472000         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-REC-CR-QTY  50440000
472100     ELSE                                                         50450000
472200         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-DEL-CR-QTY  50460000
472300     END-IF.                                                      50470000
472400                                                                  50480000
472500/                                                                 50490000
472600* FUND/SERV                                                       50500000
472700 O-BK-MEMO-DB-QUANTITY.                                           50510000
472800                                                                  50520000
LRM001     IF (B1-MFRS-ACTIVE (B1-IND)  =  'A'  OR                      50530000
LRM001         FMT-TI-ADP-CL-NO = 63)   AND                             50540000
LRM001                OMNIBUS-PROCESS   AND                             50550000
LRM001                MF-NSCC-SOURCE    AND                             50560000
LRM001                B1-MFRS-NSCCSRC-OFFSET (B1-IND) > SPACES  AND     50570000
LRM001                FMT-ACCEPTED-BY-FUND                              50580000
LRM001            MOVE B1-MFRS-NSCCSRC-OFFSET (B1-IND)                  50590000
LRM001                     TO P2-BK-BR-ACCT-T                           50600000
LRM001            MOVE 'X' TO P2-BK-CHECK-DIGIT                         50610000
LRM001            MOVE  P2-CREDIT-SIGN     TO  P2-BK-BUY-SELL-CODE      50620000
LRM001            MOVE SPACES TO P2-BK-VALUE-DT-X                       50630000
LRM001            MOVE  'BNS'                   TO  P2-BK-TRID          50640000
LRM003     ELSE                                                         50650000
LRM003     IF (B1-MFRS-ACTIVE (B1-IND)  =  'A'  OR                      50660000
LRM003         FMT-TI-ADP-CL-NO = 63)   AND                             50670000
LRM050                DST-MFE-PROCESS   AND                             50680000
LRM051                NTWIO-MATRIX-LEVEL NOT = '6' AND                  50690000
LRM050                B1-MFRS-DST-MFE-OFFSET (B1-IND) > SPACES  AND     50700000
LRM003                FMT-ACCEPTED-BY-FUND                              50710000
LRM003            MOVE B1-MFRS-DST-MFE-OFFSET (B1-IND)                  50720000
LRM003                     TO P2-BK-BR-ACCT-T                           50730000
LRM003            MOVE 'X' TO P2-BK-CHECK-DIGIT                         50740000
LRM003            MOVE  P2-CREDIT-SIGN     TO  P2-BK-BUY-SELL-CODE      50750000
LRM003            MOVE SPACES TO P2-BK-VALUE-DT-X                       50760000
LRM003            MOVE  'BNS'                   TO  P2-BK-TRID          50770000
LRM003     ELSE                                                         50780000
LRM029     IF (B1-MFRS-ACTIVE (B1-IND)  =  'A'  OR                      50790000
LRM029         FMT-TI-ADP-CL-NO = 63)   AND                             50800000
LRM029                PNC-OMNIBUS-PROCESS AND                           50810000
LRM029                B1-PNC-SURPAS-OFFSET (B1-IND) > SPACES  AND       50820000
LRM029                FMT-ACCEPTED-BY-FUND                              50830000
LRM029            MOVE B1-PNC-SURPAS-OFFSET (B1-IND)                    50840000
LRM029                     TO P2-BK-BR-ACCT-T                           50850000
LRM029            MOVE 'X' TO P2-BK-CHECK-DIGIT                         50860000
LRM029            MOVE  P2-CREDIT-SIGN     TO  P2-BK-BUY-SELL-CODE      50870000
LRM029            MOVE SPACES TO P2-BK-VALUE-DT-X                       50880000
LRM029            MOVE  'BNS'                   TO  P2-BK-TRID          50890000
LRM029     ELSE                                                         50900000
472900     IF  B1-MFRS-ACTIVE (B1-IND)  =  'A'  OR                      50910000
473000         FMT-TI-ADP-CL-NO = 63                                    50920000
473100       EVALUATE TRUE                                              50930000
473200         WHEN  FMT-NTWRK-CNTL-CD = '1'                            50940000
473300               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    50950000
473400               MOVE  P2-DEBIT-SIGN        TO  P2-BK-BUY-SELL-CODE 50960000
473500               IF  FMT-TI-ADP-CL-NO = 63                          50970000
473600                   MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID     50980000
473700                   ADD  FMT-ASSET-QUAN     TO  TOT-N0-MEMO-CR-QTY 50990000
473800               ELSE                                               51000000
473900                   MOVE  MEMO-TWO-WAY-BATCH (1) TO P2-BK-TRID     51010000
474000                   ADD  FMT-ASSET-QUAN     TO  TOT-N1-MEMO-CR-QTY 51020000
474100               END-IF                                             51030000
                     SET MEMO-TRID TO TRUE                              51040000
474200         WHEN  FMT-NTWRK-CNTL-CD = '2'                            51050000
474300               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    51060000
474400               MOVE  P2-DEBIT-SIGN        TO  P2-BK-BUY-SELL-CODE 51070000
474500               IF  FMT-TI-ADP-CL-NO = 63                          51080000
474600                   MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID     51090000
474700                   ADD  FMT-ASSET-QUAN     TO  TOT-N0-MEMO-CR-QTY 51100000
474800               ELSE                                               51110000
474900                   MOVE  MEMO-TWO-WAY-BATCH (2) TO P2-BK-TRID     51111000
475000                   ADD  FMT-ASSET-QUAN     TO  TOT-N2-MEMO-CR-QTY 51112000
475100               END-IF                                             51113000
                     SET MEMO-TRID TO TRUE                              51114000
475200         WHEN  FMT-NTWRK-CNTL-CD = '3'                            51115000
475300               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    51116000
475400               MOVE  P2-DEBIT-SIGN        TO  P2-BK-BUY-SELL-CODE 51117000
LRM050               IF DST-DIRECT                                      51118000
LRM050               AND NTWIO-MATRIX-LEVEL = '6'                       51119000
LRM050               AND MEMO-TWO-WAY-BATCH (6) > SPACES                51119100
LRM050                  MOVE  MEMO-TWO-WAY-BATCH (6) TO P2-BK-TRID      51119200
LRM050                  ADD  FMT-ASSET-QUAN      TO  TOT-N6-MEMO-CR-QTY 51119300
LRM050               ELSE                                               51119400
475500                  MOVE  MEMO-TWO-WAY-BATCH (3) TO P2-BK-TRID      51119500
475600                  ADD  FMT-ASSET-QUAN      TO  TOT-N3-MEMO-CR-QTY 51119600
LRM050               END-IF                                             51119700
                     SET MEMO-TRID TO TRUE                              51119800
475700         WHEN  FMT-NTWRK-CNTL-CD = '4'                            51119900
475800               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    51120000
475900               MOVE  P2-DEBIT-SIGN        TO  P2-BK-BUY-SELL-CODE 51120100
476000               IF  FMT-TI-ADP-CL-NO = 63                          51120200
476100                   MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID     51120300
476200                   ADD  FMT-ASSET-QUAN     TO  TOT-N0-MEMO-CR-QTY 51120400
476300               ELSE                                               51120500
476400                   MOVE  MEMO-TWO-WAY-BATCH (4) TO P2-BK-TRID     51120600
476500                   ADD  FMT-ASSET-QUAN     TO  TOT-N4-MEMO-CR-QTY 51120700
476600               END-IF                                             51120800
                     SET MEMO-TRID TO TRUE                              51120900
476700         WHEN  OTHER                                              51121000
476800           IF  FMT-TI-ADP-CL-NO = 63                              51122000
476900               PERFORM  O-CUST-ACT-MOVE-BR-ACT                    51123000
477000               MOVE  P2-DEBIT-SIGN        TO  P2-BK-BUY-SELL-CODE 51124000
477100               MOVE  MEMO-TWO-WAY-BATCH (5) TO P2-BK-TRID         51125000
477200           ELSE                                                   51126000
477300            MOVE  'BNS'                   TO  P2-BK-TRID          51127000
477400            MOVE  P2-CREDIT-SIGN       TO  P2-BK-BUY-SELL-CODE    51128000
477410                                                                  51129000
478810             IF OMNIBUS-PROCESS   AND                             51130000
478820                B1-MFRS-OMNIBUS-OFFSET (B1-IND) > SPACES  AND     51140000
478830                FMT-ACCEPTED-BY-FUND                              51150000
478840                MOVE B1-MFRS-OMNIBUS-OFFSET (B1-IND)              51160000
478850                         TO P2-BK-BR-ACCT-T                       51170000
478860                MOVE 'X' TO P2-BK-CHECK-DIGIT                     51180000
478870                 PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT  51190000
478880                 IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND           51200000
478890                    WS-VALUE-DT-YYMMDD > ZEROES                   51210000
478891                    MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT     51220000
478892                 ELSE                                             51230000
478893                    MOVE SPACES TO P2-BK-VALUE-DT-X               51240000
478894                 END-IF                                           51250000
LRM003            ELSE                                                  51260000
LRM003            IF DST-MFE-PROCESS   AND                              51270000
LRM003              B1-MFRS-DST-MFE-OFFSET (B1-IND) > SPACES            51280000
LRM003               MOVE  B1-MFRS-DST-MFE-OFFSET (B1-IND)              51290000
LRM003                                              TO P2-BK-BR-ACCT-T  51300000
LRM003               MOVE 'X'                       TO P2-BK-CHECK-DIGIT51310000
LRM003               PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT    51320000
LRM003               IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND             51330000
LRM003                    WS-VALUE-DT-YYMMDD > ZEROES                   51340000
LRM003                    MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT     51350000
LRM003               ELSE                                               51360000
LRM003                    MOVE SPACES TO P2-BK-VALUE-DT-X               51370000
LRM003               END-IF                                             51380000
LRM029            ELSE                                                  51390000
LRM029            IF PNC-OMNIBUS-PROCESS AND                            51400000
LRM029               B1-PNC-SURPAS-OFFSET (B1-IND) > SPACES             51410000
LRM029               MOVE  B1-PNC-SURPAS-OFFSET (B1-IND)                51420000
LRM029                                              TO P2-BK-BR-ACCT-T  51430000
LRM029               MOVE 'X'                       TO P2-BK-CHECK-DIGIT51440000
LRM029               PERFORM GET-VALUE-DATE THRU GET-VALUE-DATE-EXIT    51450000
LRM029               IF WS-VALUE-DT-YYMMDD IS NUMERIC   AND             51460000
LRM029                    WS-VALUE-DT-YYMMDD > ZEROES                   51470000
LRM029                    MOVE WS-VALUE-DT-YYMMDD TO P2-BK-VALUE-DT     51480000
LRM029               ELSE                                               51490000
LRM029                    MOVE SPACES TO P2-BK-VALUE-DT-X               51500000
LRM029               END-IF                                             51510000
478895             ELSE                                                 51520000
478900              MOVE SPACES               TO P2-BK-VALUE-DT-X       51530000
479000              IF FMT-FUND-BK-CD = 'BB' AND                        51540000
479100                B1-MFRS-BB-OFFSET (B1-IND) > SPACES               51550000
479200                MOVE B1-MFRS-BB-OFFSET (B1-IND)                   51560000
479300                  TO P2-BK-BR-ACCT-T                              51570000
479400                MOVE 'X' TO P2-BK-CHECK-DIGIT                     51580000
479500              ELSE                                                51590000
479600               IF FMT-FUND-BK-CD = 'BN' AND                       51600000
479700                  B1-MFRS-BN-OFFSET (B1-IND) > SPACES             51610000
479800                  MOVE B1-MFRS-BN-OFFSET (B1-IND)                 51620000
479900                    TO P2-BK-BR-ACCT-T                            51630000
480000                  MOVE 'X' TO P2-BK-CHECK-DIGIT                   51640000
480100               ELSE                                               51650000
480200                  MOVE ALTERNATE-OFFSET-ACCOUNT                   51660000
480300                    TO P2-BK-BR-ACCT-T-C                          51670000
480400               END-IF                                             51680000
480500              END-IF                                              51690000
LRM003             END-IF                                               51700000
LRM029             END-IF                                               51710000
480600             END-IF                                               51720000
480700           END-IF                                                 51730000
480800           ADD  FMT-ASSET-QUAN        TO  TOT-N0-MEMO-CR-QTY      51740000
480900       END-EVALUATE                                               51750000
481000     ELSE                                                         51760000
481100        MOVE  'BNS'                   TO  P2-BK-TRID              51770000
481200           MOVE  P2-CREDIT-SIGN       TO  P2-BK-BUY-SELL-CODE     51780000
481300        MOVE  ALTERNATE-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C       51790000
481400        ADD  FMT-ASSET-QUAN             TO  TOT-N0-MEMO-CR-QTY    51800000
481500        MOVE SPACES               TO P2-BK-VALUE-DT-X             51810000
481600     END-IF.                                                      51820000
481700     MOVE  FMT-TI-ADP-CL-NO           TO  P2-BK-BROKER-NBR.       51830000
481800     MOVE  FMT-TI-CONTROL-NUM         TO  P2-BK-CNTL-NBR.         51840000
481900     MOVE  FMT-CONTRA-BRK-NUM         TO  P2-BK-CNTRA-BKR.        51850000
482000     MOVE  ZERO                       TO  P2-BK-AMOUNT.           51860000
482100     MOVE  FMT-ASSET-QUAN    TO  WS-QTY                           51870000
482200     MOVE WS-QTY             TO P2-BK-QUANTITY                    51880000
482300     MOVE  FMT-ASSET-QUAN-FRACTION    TO  P2-BK-FRACTION.         51890000
482400                                                                  51900000
482500     IF  P2-BK-TRID (2:2) NOT = SPACES                            51910000
482600         IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND             51920000
482700             FMT-ACT-TYPE  =  'DR')                               51930000
482800         OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND             51940000
ET0001            (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR             51950000
ET0001                              'SI' OR 'EI' OR 'RI'))              51960000
LRM027         OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND             51970000
LRM027            (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR             51980000
LRM027                              'SI' OR 'EI' OR 'RI' OR             51990000
LRM027                              'BI' OR 'BR' OR '4K' OR             52000000
LRM027                              '4B' OR '7B' OR '5P' OR 'HS'))      52010000
483000            IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                  52020000
483100               SET FUND-SERV-ROLLOVER TO  TRUE                    52030000
483200            END-IF                                                52040000
483300         END-IF                                                   52050000
483400         PERFORM  O-WRITE-P2-REC                                  52060000
483500         MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW   52070000
483600     END-IF.                                                      52080000
483700                                                                  52090000
483800* FUND/SERV                                                       52100000
483900 O-BK-PEND-CR-VALUE.                                              52110000
484000***  IF RECEIVER AND B1(434637) IS ON ============>               52120000
484100                                                                  52130000
484200     IF  B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES                 52140000
484300       IF  B1-PEND-STL-BATCH-CODE (B1-IND)  >  SPACES             52150000
484400           MOVE  B1-PEND-STL-BATCH-CODE (B1-IND)                  52160000
484500                                      TO  P2-BK-TRID              52170000
484900       ELSE                                                       52180000
485000            MOVE  'BNS'               TO  P2-BK-TRID              52190000
485100       END-IF                                                     52200000
485200       MOVE  FMT-TI-ADP-CL-NO         TO  P2-BK-BROKER-NBR        52210000
485300       MOVE  P2-CREDIT-SIGN           TO  P2-BK-BUY-SELL-CODE     52220000
485400       MOVE  B1-RCV-PEND-STL-ACCT(B1-IND)                         52230000
485500                                      TO  P2-BK-BR-ACCT-T         52240000
YH0001       IF FMT-TRNFR-TYPE = 'MFC'                                  52250000
               PERFORM O-WRITE-P2-MFC-ACCOUNT                           52260000
             END-IF                                                     52270000
YH0001                                                                  52280000
485600       MOVE  'X'                      TO  P2-BK-CHECK-DIGIT       52290000
485700       MOVE  FMT-TI-CONTROL-NUM       TO  P2-BK-CNTL-NBR          52300000
485800       MOVE  FMT-CONTRA-BRK-NUM       TO  P2-BK-CNTRA-BKR         52301000
485900       MOVE  ZEROS                    TO  TST-P2-BK-QTY           52302000
486000       MOVE  ZEROS                    TO  P2-BK-FRACTION          52303000
486100       MOVE  FMT-ASSET-VALUE          TO  AMOUNT-OVERFLOW         52304000
487400                                                                  52305000
487500       MOVE  '1'                      TO  OVERFLOW-SW             52306000
487600       IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND               52307000
487700           FMT-ACT-TYPE  =  'DR')                                 52308000
487800       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND               52309000
ET0001          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               52310000
ET0001                            'SI' OR 'EI' OR 'RI'))                52320000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               52330000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               52340000
LRM027                            'SI' OR 'EI' OR 'RI' OR               52350000
LRM027                            'BI' OR 'BR' OR '4K' OR               52360000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        52370000
488000          IF  B1-MISC-IRA-CLIENT (B1-IND) = '1'                   52380000
488900             SET  FUND-SERV-ROLLOVER  TO  TRUE                    52390000
489000          END-IF                                                  52400000
489100       END-IF                                                     52410000
489200       PERFORM  O-AMT-OVRFLOW-CHK-RTN                             52420000
489300          UNTIL NO-MORE-OVERFLOW                                  52430000
489400       MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW     52440000
489500     END-IF.                                                      52450000
489600     IF  FMT-CLNT-IS-RECEIVER                                     52460000
489700         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-REC-CR-VALUE52470000
489800     ELSE                                                         52480000
489900         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-DEL-CR-VALUE52490000
490000     END-IF.                                                      52500000
490100                                                                  52510000
490200/                                                                 52520000
490300* FUND/SERV                                                       52530000
490400 O-BK-PEND-CR-BOTH.                                               52540000
491700***  IF RECEIVER AND B1(434637) IS ON ============>               52550000
491800     IF  FMT-CLNT-IS-RECEIVER   AND                               52560000
491900         B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES                 52570000
492000          MOVE B1-RCV-PEND-STL-ACCT(B1-IND)                       52580000
492100                                      TO  P2-BK-BR-ACCT-T         52590000
492200     ELSE                                                         52600000
492300***  IF DELIVERER AND B1(434638) IS ON ============>              52610000
492400        IF FMT-CLNT-IS-DELIVERER  AND                             52620000
492500            B1-DEL-PEND-STL-ACCT (B1-IND) > SPACES                52630000
492600            MOVE B1-DEL-PEND-STL-ACCT(B1-IND)                     52631000
492700                                      TO  P2-BK-BR-ACCT-T         52632000
492800        END-IF                                                    52633000
492900     END-IF.                                                      52634000
493000                                                                  52635000
493100     IF (B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES) OR             52636000
493200        (B1-DEL-PEND-STL-ACCT (B1-IND)  >  SPACES)                52637000
493300       IF  B1-PEND-STL-BATCH-CODE (B1-IND)  >  SPACES             52638000
493400           MOVE  B1-PEND-STL-BATCH-CODE (B1-IND)                  52639000
493500                                      TO  P2-BK-TRID              52640000
493900       ELSE                                                       52650000
494000            MOVE  'BNS'               TO  P2-BK-TRID              52660000
494100       END-IF                                                     52670000
494200       MOVE  FMT-TI-ADP-CL-NO         TO  P2-BK-BROKER-NBR        52680000
494300       MOVE  P2-CREDIT-SIGN           TO  P2-BK-BUY-SELL-CODE     52690000
494400       MOVE  'X'                      TO  P2-BK-CHECK-DIGIT       52700000
494500       MOVE  FMT-TI-CONTROL-NUM       TO  P2-BK-CNTL-NBR          52710000
494600       MOVE  FMT-CONTRA-BRK-NUM       TO  P2-BK-CNTRA-BKR         52720000
494700       MOVE  FMT-ASSET-QUAN           TO  WS-QTY                  52730000
494800       MOVE  WS-QTY                   TO  P2-BK-QUANTITY          52740000
494900       MOVE  FMT-ASSET-QUAN-FRACTION  TO  P2-BK-FRACTION          52750000
495000       MOVE  FMT-ASSET-VALUE          TO  P2-BK-AMOUNT            52760000
496300                                                                  52770000
496400       IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND               52780000
496500           FMT-ACT-TYPE  =  'DR')                                 52790000
496600       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND               52800000
ET0001          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               52810000
ET0001                            'SI' OR 'EI' OR 'RI'))                52820000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               52830000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               52840000
LRM027                            'SI' OR 'EI' OR 'RI' OR               52850000
LRM027                            'BI' OR 'BR' OR '4K' OR               52860000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        52870000
496800          IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                    52880000
497700              SET FUND-SERV-ROLLOVER TO  TRUE                     52890000
497800          END-IF                                                  52900000
497900       END-IF                                                     52910000
498000       PERFORM  O-WRITE-P2-REC                                    52920000
498100       MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW     52930000
498200                                                                  52940000
498300     END-IF.                                                      52950000
498400                                                                  52960000
498500     IF  FMT-CLNT-IS-RECEIVER                                     52970000
498600         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-REC-CR-VALUE52980000
498700         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-REC-CR-QTY  52990000
498800     ELSE                                                         53000000
498900         ADD  FMT-ASSET-VALUE         TO  TOT-CL-PEND-DEL-CR-VALUE53010000
499000         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-DEL-CR-QTY  53020000
499100     END-IF.                                                      53030000
499200                                                                  53040000
499300/                                                                 53050000
499400* FUND/SERV                                                       53060000
499500 O-BK-PEND-DB-QUANTITY.                                           53070000
499600***  IF RECEIVER AND B1(434637) IS ON ============>               53080000
499700     IF  FMT-CLNT-IS-RECEIVER    AND                              53090000
499800         B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES                 53100000
499900          MOVE B1-RCV-PEND-STL-ACCT(B1-IND)                       53110000
500000                                      TO  P2-BK-BR-ACCT-T         53120000
500100     ELSE                                                         53130000
500200***  IF DELIVERER AND B1(434638) IS ON ============>              53140000
500300        IF FMT-CLNT-IS-DELIVERER  AND                             53150000
500400            B1-DEL-PEND-STL-ACCT (B1-IND) > SPACES                53151000
500500            MOVE B1-DEL-PEND-STL-ACCT(B1-IND)                     53152000
500600                                      TO  P2-BK-BR-ACCT-T         53153000
500700        END-IF                                                    53154000
500800     END-IF.                                                      53155000
500900                                                                  53156000
501000     IF (B1-RCV-PEND-STL-ACCT (B1-IND)  >  SPACES) OR             53157000
501100        (B1-DEL-PEND-STL-ACCT (B1-IND)  >  SPACES)                53158000
501200       IF  B1-PEND-STL-BATCH-CODE (B1-IND)  >  SPACES             53159000
501300           MOVE  B1-PEND-STL-BATCH-CODE (B1-IND)                  53160000
501400                                      TO  P2-BK-TRID              53170000
501800       ELSE                                                       53180000
501900            MOVE  'BNS'               TO  P2-BK-TRID              53190000
502000       END-IF                                                     53200000
502100       MOVE  FMT-TI-ADP-CL-NO         TO  P2-BK-BROKER-NBR        53210000
502200       MOVE  P2-DEBIT-SIGN            TO  P2-BK-BUY-SELL-CODE     53220000
502300       MOVE  'X'                      TO  P2-BK-CHECK-DIGIT       53230000
502400       MOVE  FMT-TI-CONTROL-NUM       TO  P2-BK-CNTL-NBR          53240000
502500       MOVE  FMT-CONTRA-BRK-NUM       TO  P2-BK-CNTRA-BKR         53250000
502600       MOVE  FMT-ASSET-QUAN           TO  WS-QTY                  53260000
502700       MOVE  WS-QTY                   TO  P2-BK-QUANTITY          53270000
502800       MOVE  FMT-ASSET-QUAN-FRACTION  TO  P2-BK-FRACTION          53280000
502900       MOVE  ZERO                     TO  P2-BK-AMOUNT            53290000
504200                                                                  53300000
504300       IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1'  AND               53310000
504400           FMT-ACT-TYPE  =  'DR')                                 53320000
504500       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '2'  AND               53330000
ET0001          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               53340000
ET0001                            'SI' OR 'EI' OR 'RI'))                53350000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               53360000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               53370000
LRM027                            'SI' OR 'EI' OR 'RI' OR               53380000
LRM027                            'BI' OR 'BR' OR '4K' OR               53390000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        53400000
504700          IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                    53410000
505600             SET  FUND-SERV-ROLLOVER  TO  TRUE                    53420000
505700          END-IF                                                  53430000
505800       END-IF                                                     53440000
505900       PERFORM  O-WRITE-P2-REC                                    53450000
506000       MOVE  'N'                    TO  FUND-SERV-ROLLOVER-SW     53460000
506100                                                                  53470000
506200     END-IF.                                                      53480000
506300                                                                  53490000
506400     IF  FMT-CLNT-IS-RECEIVER                                     53500000
506500         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-REC-DB-QTY  53510000
506600     ELSE                                                         53520000
506700         ADD  FMT-ASSET-QUAN          TO  TOT-CL-PEND-DEL-DB-QTY  53530000
506800     END-IF.                                                      53540000
506900                                                                  53550000
507000/                                                                 53560000
519470******************************************************************53570000
519480*** PERFORMED BY:                                              ***53580000
519490***     O-DLVR-LONG-NON-CNS                                    ***53590000
519500***     O-RCVR-SHORT-NON-CNS                                   ***53600000
519600******************************************************************53610000
519700                                                                  53620000
519800 O-RD-CL-CR-VALUE-CR-QUANTITY.                                    53630000
519900                                                                  53640000
520000     ADD  FMT-ASSET-VALUE    TO TOT-CL-RD-CL-CR-VALUE             53650000
520100     ADD  FMT-ASSET-QUAN     TO TOT-CL-RD-CL-CR-QTY.              53660000
520200                                                                  53670000
520300 O-RD-CL-CR-QUANTITY.                                             53680000
520400                                                                  53690000
520500     ADD  FMT-ASSET-QUAN     TO TOT-CL-RD-CL-CR-QTY.              53700000
520600/                                                                 53710000
520700******************************************************************53720000
520800*** PERFORMED BY:                                              ***53730000
520900***     O-DLVR-LONG-NON-CNS                                    ***53740000
521000***     O-RCVR-SHORT-NON-CNS                                   ***53750000
521100******************************************************************53760000
521200                                                                  53770000
521300 O-RD-CL-DB-VALUE-DB-QUANTITY.                                    53780000
521400                                                                  53790000
521500     ADD  FMT-ASSET-VALUE    TO TOT-CL-RD-CL-DB-VALUE             53800000
521600     ADD  FMT-ASSET-QUAN     TO TOT-CL-RD-CL-DB-QTY.              53810000
521700                                                                  53820000
521800 O-RD-CL-DB-QUANTITY.                                             53830000
521900                                                                  53840000
522000     ADD  FMT-ASSET-QUAN     TO TOT-CL-RD-CL-DB-QTY.              53850000
522100/                                                                 53860000
522200******************************************************************53870000
522300*** PERFORMED BY:                                              ***53880000
522400***     O-BK-CUST-CR-VALUE                                     ***53890000
522500***     O-BK-CUST-DB-VALUE                                     ***53900000
522600***     O-BK-OFFSET-CR-CASH-VALUE                              ***53910000
522700***     O-BK-OFFSET-DB-CASH-VALUE                              ***53920000
522800***     O-BK-OPTION-DB-QUANTITY                                ***53930000
522900***     O-BK-OPTION-CR-QUANTITY                                ***53940000
523000******************************************************************53950000
523100                                                                  53960000
523200 O-CUST-ACT-MOVE-BR-ACT.                                          53970000
523300     MOVE FMT-TI-CUST-ACCOUNT (1:3) TO P2-BK-BRANCH               53980000
523400     MOVE FMT-TI-CUST-ACCOUNT (4:5) TO P2-BK-ACCOUNT              53990000
523500** FORCE SMA TO BOOK AS TYPE 2:                                   54000000
523600     IF FMT-SMA                                                   54010000
523700             MOVE '2' TO P2-BK-TYPE                               54020000
523800     ELSE                                                         54030000
523900       EVALUATE TRUE                                              54040000
524000         WHEN     FMT-CASH-ACT                                    54050000
524100             OR   FMT-OTHER-ACT                                   54060000
524200             MOVE '1' TO P2-BK-TYPE                               54070000
524300         WHEN     FMT-MARGIN-ACT                                  54080000
524400             MOVE '2' TO P2-BK-TYPE                               54090000
524500         WHEN     FMT-SHORT-ACT                                   54100000
524600             MOVE '5' TO P2-BK-TYPE                               54110000
524700         WHEN     OTHER                                           54120000
524800             MOVE '1' TO P2-BK-TYPE                               54130000
524900       END-EVALUATE                                               54140000
525000     END-IF.                                                      54150000
525100                                                                  54160000
525200     CALL  CKDIGIT  USING                                         54170000
525300                        P2-BK-BR-ACCT-T                           54180000
525400                        LENGTH-KEY                                54190000
525500                        P2-BK-CHECK-DIGIT                         54200000
525600     END-CALL.                                                    54210000
525700/                                                                 54220000
525800 O-CUST-ACT-MOVE-OMNIBUS.                                         54230000
525900     MOVE FMT-TI-CUST-ACCOUNT (1:3) TO WS-BRANCH                  54240000
526000     MOVE FMT-TI-CUST-ACCOUNT (4:5) TO WS-ACCT                    54250000
526100** FORCE SMA TO BOOK AS TYPE 2:                                   54260000
526200     IF FMT-SMA                                                   54270000
526300             MOVE '2' TO WS-TYPE                                  54280000
526400     ELSE                                                         54290000
526500       EVALUATE TRUE                                              54300000
526600         WHEN     FMT-CASH-ACT                                    54310000
526700             OR   FMT-OTHER-ACT                                   54320000
526800             MOVE '1' TO WS-TYPE                                  54330000
526900         WHEN     FMT-MARGIN-ACT                                  54340000
527000             MOVE '2' TO WS-TYPE                                  54350000
527100         WHEN     FMT-SHORT-ACT                                   54360000
527200             MOVE '5' TO WS-TYPE                                  54370000
527300         WHEN     OTHER                                           54380000
527400             MOVE '1' TO WS-TYPE                                  54390000
527500       END-EVALUATE                                               54400000
527600     END-IF.                                                      54410000
527700                                                                  54420000
527800     CALL  CKDIGIT  USING                                         54430000
527900                        WS-BR-ACCT-T                              54440000
528000                        LENGTH-KEY                                54450000
528100                        WS-CHECK-DIGIT                            54460000
528200     END-CALL.                                                    54470000
528300/                                                                 54480000
528400******************************************************************54490000
528500*** PERFORMED BY:                                              ***54500000
528600***     O-BK-OFFSET-CR-CASH-VALUE                              ***54510000
528700***     O-BK-OFFSET-DB-CASH-VALUE                              ***54520000
528800******************************************************************54530000
528900                                                                  54540000
529000 O-AMT-OVRFLOW-CHK-RTN.                                           54550000
529100                                                                  54560000
529200     IF  AMOUNT-OVERFLOW > AMOUNT-FULL                            54570000
529300         SUBTRACT AMOUNT-FULL FROM AMOUNT-OVERFLOW                54580000
529400                            GIVING AMOUNT-OVERFLOW                54590000
529500         END-SUBTRACT                                             54600000
529600         MOVE AMOUNT-FULL     TO P2-BK-AMOUNT                     54610000
529700         MOVE TST-P2-BK-QTY   TO P2-BK-QUANTITY                   54620000
529800         MOVE ZERO            TO TST-P2-BK-QTY                    54630000
529900         MOVE '1' TO OVERFLOW-SW                                  54640000
530000     ELSE                                                         54650000
530100         MOVE AMOUNT-OVERFLOW TO P2-BK-AMOUNT                     54660000
530200         MOVE TST-P2-BK-QTY   TO P2-BK-QUANTITY                   54670000
530300         MOVE '0' TO OVERFLOW-SW                                  54680000
530400     END-IF                                                       54690000
530500                                                                  54700000
530600     PERFORM O-WRITE-P2-REC.                                      54710000
530700/                                                                 54720000
530800******************************************************************54730000
530900*** PERFORMED BY:                                              ***54740000
531000***     O-BK-CUST-CR-VALUE                                     ***54750000
531100***     O-BK-CUST-DB-VALUE                                     ***54760000
531200***     O-BK-OFFSET-CR-CASH-VALUE                              ***54770000
531300***     O-BK-OFFSET-DB-CASH-VALUE                              ***54780000
531400******************************************************************54790000
531500                                                                  54800000
531600 O-CASH-AMT-OVRFLOW-CHK-RTN.                                      54810000
531700                                                                  54820000
531800     IF  AMOUNT-OVERFLOW > AMOUNT-FULL                            54830000
531900         SUBTRACT AMOUNT-FULL FROM AMOUNT-OVERFLOW                54840000
532000                            GIVING AMOUNT-OVERFLOW                54850000
532100         END-SUBTRACT                                             54860000
532200         MOVE AMOUNT-FULL     TO P2-BK-AMOUNT                     54870000
532300         MOVE '1' TO OVERFLOW-SW                                  54880000
532400     ELSE                                                         54890000
532500         MOVE AMOUNT-OVERFLOW TO P2-BK-AMOUNT                     54900000
532600         MOVE '0' TO OVERFLOW-SW                                  54910000
532700     END-IF                                                       54920000
532800                                                                  54930000
532900     PERFORM O-WRITE-P2-REC.                                      54940000
533000/                                                                 54950000
533100******************************************************************54960000
533200*** PERFORMED BY:                                              ***54970000
533300***     O-RCVR-LONG-NON-CNS                                    ***54980000
533400******************************************************************54990000
533500                                                                  55000000
533600 O-BUILD-SAFEKEEPING-RECORD.                                      55010000
533700                                                                  55020000
TEST       DISPLAY 'IN O-BUILD-SAFEK B1=' B1-SFK-RSEC-MEMO (B1-IND)     55030000
TEST          ' PEND-STTL-RSN=' FMT-STTLM-RSN-CD                        55040000
LRM032     IF  B1-SFK-RSEC-MEMO (B1-IND) > SPACES                       55050000
LRM032     AND (FMT-SAFE-KEEPING OR FMT-RESTRICTED-SECURITY)            55060000
LRM032         MOVE 'S' TO P2-BK-TRID-X                                 55070000
LRM032         MOVE B1-SFK-RSEC-MEMO (B1-IND) TO P2-BK-BATCH-CODE       55080000
TEST           DISPLAY 'ATTEMPT TO CRT MEMO ' B1-SFK-RSEC-MEMO (B1-IND) 55090000
LRM043         SET SFK-TRID TO TRUE                                     55100000
LRM043         MOVE  FMT-ASSET-QUAN    TO  WS-QTY                       55110000
LRM043         MOVE WS-QTY             TO P2-BK-QUANTITY                55120000
LRM043         MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION           55130000
LRM032         PERFORM O-WRITE-P2-REC                                   55140000
LRM032     ELSE                                                         55150000
533800     IF FMT-SAFE-KEEPING                                          55151000
LRM043         MOVE P2-BK-TRID       TO SFK-SAVE-TRID                   55152000
LRM043         MOVE P2-BK-BATCH-CODE TO SFK-SAVE-BATCH                  55153000
533900         MOVE 'SSB' TO P2-BK-TRID                                 55154000
TEST           DISPLAY 'SET TRID TO SSB'                                55155000
LRM043         SET SFK-TRID TO TRUE                                     55156000
LRM043         MOVE  FMT-ASSET-QUAN    TO  WS-QTY                       55157000
LRM043         MOVE WS-QTY             TO P2-BK-QUANTITY                55158000
LRM043         MOVE FMT-ASSET-QUAN-FRACTION TO P2-BK-FRACTION           55159000
534000         PERFORM O-WRITE-P2-REC                                   55160000
LRM043         MOVE SFK-SAVE-TRID  TO P2-BK-TRID                        55170000
LRM043         MOVE SFK-SAVE-BATCH TO P2-BK-BATCH-CODE                  55180000
534100     END-IF.                                                      55190000
534200/                                                                 55200000
534300******************************************************************55210000
534400*** PERFORMED BY:                                              ***55211000
534500***     O-BK-CUST-CR-QUANTITY                                  ***55212000
534600***     O-BK-CUST-DB-QUANTITY                                  ***55213000
534700***     O-BK-OPTION-DB-QUANTITY                                ***55214000
534800***     O-BK-OPTION-CR-QUANTITY                                ***55215000
534900***     O-BK-OPTION-OFFSET-DB-QTY                              ***55216000
535000***     O-BK-OPTION-OFFSET-CR-QTY                              ***55217000
535100***     O-BK-CNS-CR-QUANTITY                                   ***55218000
535200***     O-BK-CNS-DB-QUANTITY                                   ***55219000
535300***     O-AMT-OVRFLOW-CHK-RTN                                  ***55220000
535400***     O-CASH-AMT-OVRFLOW-CHK-RTN                             ***55230000
535500***     O-BUILD-SAFEKEEPING-RECORD                             ***55240000
535600******************************************************************55241000
535700                                                                  55242000
535800 O-WRITE-P2-REC.                                                  55243000
535900*    DISPLAY '   '                                                55244000
536000*    DISPLAY ' ***** O-WRITE-P2-REC.******'                       55245000
LRM043     IF NOT SFK-TRID                                              55246000
536100        PERFORM O-WRITE-P2-ENTRY-CODE                             55247000
LRM043     END-IF.                                                      55248000
LRM043     MOVE 'N' TO SFK-TRID-SW.                                     55249000
536200     IF P2-BK-VALUE-DT-X  = LOW-VALUE                             55250000
536300        MOVE SPACES TO P2-BK-VALUE-DT-X                           55260000
536400     END-IF                                                       55270000
536500     WRITE P2BKPG-RECORD FROM P2-BK-RECORD                        55280000
536600     MOVE SPACES TO P2-BK-VALUE-DT-X                              55290000
536700     ADD 1 TO TOT-CL-P2-RECS-WRITTEN                              55300000
536800     IF FMT-TRNFR-TYPE-RSN-CD > '00' AND < '13'                   55310000
536900        IF  FMT-FUND-SERV    AND                                  55320000
537000            P2-BK-TRID  >  'S  '                                  55330000
537100            CONTINUE                                              55340000
537200        ELSE                                                      55350000
537300          IF  B1-RES-CREDIT-P2-TRLR (B1-IND)  =  '0'              55360000
537400            PERFORM O-WRITE-P2-TRAILER                            55370000
537500          END-IF                                                  55380000
537600        END-IF                                                    55390000
537700     END-IF                                                       55400000
537800* ACAT TRAILER PROCESSING                                         55410000
537900     IF (B1-ACAT-P2-TRAILER (B1-IND) = '1' OR '2' OR '3') AND     55420000
538000        (FMT-CLNT-IS-RECEIVER OR FMT-CLNT-IS-DELIVERER)           55430000
538100            PERFORM O-WRITE-ACAT-P2-TRAILER                       55440000
538200     END-IF                                                       55450000
LRM013     IF (FMT-TRNFR-TYPE = 'PTR'                                   55460000
LRM013     AND B1-ACAT-PTR-TRAILER (B1-IND) > SPACES)                   55470000
LRM013     OR (FMT-TRNFR-TYPE = 'PTD'                                   55480000
LRM013     AND B1-ACAT-PTD-TRAILER (B1-IND) > SPACES)                   55490000
LRM025     OR (FMT-TRNFR-TYPE = 'PTF'                                   55500000
LRM025     AND B1-ACAT-PTF-TRAILER (B1-IND) > SPACES)                   55510000
LRM013     OR (FMT-TRNFR-TYPE = 'FRV'                                   55520000
LRM013     AND B1-ACAT-FRV-TRAILER (B1-IND) > SPACES)                   55530000
LRM013     OR (FMT-TRNFR-TYPE = 'RCL'                                   55540000
LRM013     AND B1-ACAT-RCL-TRAILER (B1-IND) > SPACES)                   55550000
LRM013     OR (FMT-TRNFR-TYPE = 'MFC'                                   55560000
LRM013     AND B1-ACAT-MFC-TRAILER (B1-IND) > SPACES)                   55570000
LRM013        PERFORM O-WRITE-P2-NS-TRAILER                             55580000
LRM013     END-IF.                                                      55590000
538300     IF  FUND-SERV-ROLLOVER                                       55600000
538400         CONTINUE                                                 55610000
538500     ELSE                                                         55620000
538600       IF (B1-ROLLOVER-CLIENT (B1-IND) = '1'  AND                 55630000
538700           FMT-ACT-TYPE = 'DR'  AND  P2-BK-TRID  NOT > 'S  ')     55640000
538800       OR (B1-ROLLOVER-CLIENT (B1-IND) = '2'    AND               55650000
ET0001          (FMT-ACT-TYPE = 'DR' OR 'IR' OR 'QP'                    55660000
ET0001                       OR 'SI' OR 'EI' OR 'RI') AND               55670000
539000           P2-BK-TRID NOT > 'S  ')                                55680000
LRM027       OR (B1-ROLLOVER-CLIENT (B1-IND)  =  '3'  AND               55690000
LRM027          (FMT-ACT-TYPE  =  'DR' OR 'IR' OR 'QP' OR               55700000
LRM027                            'SI' OR 'EI' OR 'RI' OR               55710000
LRM027                            'BI' OR 'BR' OR '4K' OR               55720000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS') AND     55730000
LRM027           P2-BK-TRID NOT > 'S  ')                                55740000
LRM027       OR ((B1-ROLLOVER-CLIENT (B1-IND) = '1' OR '2' OR '3')      55750000
LRM016       AND (FMT-TRNFR-TYPE = 'FRV' OR 'RCL')                      55760000
LRM016       AND FMT-SCRTY-866-NBR > SPACES)                            55770000
539100           IF B1-MISC-IRA-CLIENT (B1-IND) = '1'                   55780000
539200              PERFORM O-WRITE-P2-ROLLOVER-TRAILER                 55790000
539300              MOVE WS-SAVE-SEC    TO P2-BK-SECURITY-NBR           55800000
539700           END-IF                                                 55810000
539800       END-IF                                                     55820000
539900     END-IF.                                                      55830000
YH0001                                                                  55840000
YH0001     IF FMT-TRNFR-TYPE = 'MFC' AND FMT-CAGE-TAG NOT > SPACES      55850000
YH0001       MOVE  P2-BK-RECORD     TO  P2-BK-TRAILER-RECORD            55860000
YH0001       MOVE 'NO TAG EXISTS FOR MFC' TO P2-BKT-DESCRIPTION         55870000
YH0001       MOVE SPACES                  TO P2-BKT-QUANTITY-X          55880000
YH0001                                       P2-BKT-ENTRY-CODE          55890000
YH0001                                       P2-BKT-AMOUNT-X            55900000
YH0001       MOVE '-'                     TO P2-BKT-HYPHEN              55910000
YH0001       MOVE  0                      TO P2-BKT-FRACTION            55920000
YH0001       WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD              55930000
YH0001       ADD 1 TO TOT-CL-P2-RECS-WRITTEN                            55940000
YH0001     END-IF.                                                      55950000
540000                                                                  55960000
540100     MOVE SPACE TO WS-BK-FAIL-SW.                                 55970000
540200                                                                  55980000
540400******************************************************************55990000
540500*** PERFORMED BY:                                              ***56000000
540600***     O-WRITE-P2-REC                                         ***56010000
540700******************************************************************56020000
540800                                                                  56021000
540900 O-WRITE-P2-ENTRY-CODE.                                           56022000
LRM013     MOVE B1-ENTRY-DEL-ROLL (B1-IND) TO WS-ENTRY-DEL-ROLL         56023000
LRM013     MOVE B1-ENTRY-REC-ROLL (B1-IND) TO WS-ENTRY-REC-ROLL         56024000
LRM013     IF FMT-TRNFR-TYPE = 'PTR'                                    56025000
LRM013        IF B1-ENTRY-PTR-DEL-ROLL (B1-IND) NOT = SPACES            56026000
LRM013           MOVE B1-ENTRY-PTR-DEL-ROLL (B1-IND) TO                 56027000
LRM013                       WS-ENTRY-DEL-ROLL                          56028000
LRM013        END-IF                                                    56029000
LRM013        IF B1-ENTRY-PTR-REC-ROLL (B1-IND) NOT = SPACES            56030000
LRM013           MOVE B1-ENTRY-PTR-REC-ROLL (B1-IND) TO                 56040000
LRM013                       WS-ENTRY-REC-ROLL                          56050000
LRM013        END-IF                                                    56060000
LRM013     END-IF.                                                      56070000
541000     IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1' OR '2' OR '3')  AND  56080000
541100         FMT-ACT-TYPE  =  'DR'                                    56090000
541200     AND FMT-CLNT-IS-DELIVERER                                    56100000
541300     AND WS-ENTRY-DEL-ROLL NOT = SPACES                           56110000
541400        MOVE WS-ENTRY-DEL-ROLL TO P2-BK-ENTRY-CODE                56120000
541500     ELSE                                                         56130000
541600     IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1' OR '2' OR '3')  AND  56140000
541700         FMT-ACT-TYPE  =  'DR'                                    56150000
541800     AND NOT FMT-CLNT-IS-DELIVERER                                56160000
541900     AND WS-ENTRY-REC-ROLL NOT = SPACES                           56170000
542000        MOVE WS-ENTRY-REC-ROLL TO P2-BK-ENTRY-CODE                56180000
542100     ELSE                                                         56190000
542200     IF (B1-ROLLOVER-CLIENT (B1-IND)  =  '1' OR '2' OR '3')  AND  56200000
542300         FMT-ACT-TYPE  =  'DR'                                    56210000
542400        AND B1-MISC-IRA-CLIENT (B1-IND) = '1'                     56220000
542500        IF  FMT-CLNT-IS-DELIVERER                                 56230000
542600           IF WS-ENTRY-DEL-ROLL NOT = SPACES                      56240000
542700              MOVE WS-ENTRY-DEL-ROLL TO P2-BK-ENTRY-CODE          56250000
542800           ELSE                                                   56260000
542900*** ADD FOR CAGE/FAILS                                            56270000
LRM019*****         IF BK-FAIL-DB                                       56280000
543100*****            MOVE 'B' TO P2-BK-TRID-X                         56290000
543200*****            MOVE B1-FAIL-DELIVR-BATCH-CODE (B1-IND) TO       56300000
543300*****                 P2-BK-BATCH-CODE                            56310000
543400*****            MOVE B1-FAIL-DELIVR-ENTRY-CODE (B1-IND) TO       56320000
543500*****                 P2-BK-ENTRY-CODE                            56330000
544000*****         ELSE                                                56340000
544100                 MOVE B1-ENTRY-CODE-DEL (B1-IND) TO               56350000
544200                                                  P2-BK-ENTRY-CODE56360000
544000*****         END-IF                                              56370000
544400           END-IF                                                 56380000
544500        ELSE                                                      56390000
544600           IF WS-ENTRY-REC-ROLL NOT = SPACES                      56400000
544700              MOVE WS-ENTRY-REC-ROLL TO P2-BK-ENTRY-CODE          56410000
544800           ELSE                                                   56420000
544900*****          IF BK-FAIL-CR                                      56430000
545000*****             MOVE 'B' TO P2-BK-TRID-X                        56440000
545100*****             MOVE B1-FAIL-RECEIV-BATCH-CODE (B1-IND) TO      56450000
545200*****                  P2-BK-BATCH-CODE                           56460000
545300*****             MOVE B1-FAIL-RECEIV-ENTRY-CODE (B1-IND) TO      56470000
545400*****                  P2-BK-ENTRY-CODE                           56480000
546000*****          ELSE                                               56490000
546100                  MOVE B1-ENTRY-CODE-REC (B1-IND) TO              56500000
546200                                                  P2-BK-ENTRY-CODE56510000
546300*****          END-IF                                             56520000
546400           END-IF                                                 56530000
546410        END-IF                                                    56540000
546420     ELSE                                                         56550000
546430        IF  FMT-CLNT-IS-DELIVERER                                 56560000
546440           MOVE B1-ENTRY-CODE-DEL (B1-IND) TO P2-BK-ENTRY-CODE    56570000
546450           IF B1-ENTRY-DEL-CASH (B1-IND) > SPACES AND             56580000
546460              FMT-CASH                                            56590000
546470              MOVE B1-ENTRY-DEL-CASH (B1-IND) TO P2-BK-ENTRY-CODE 56600000
546480*** ADD FOR CAGE/FAILS                                            56610000
546490*****      ELSE                                                   56620000
LRM019*****         IF BK-FAIL-DB                                       56630000
546600*****             MOVE 'B' TO P2-BK-TRID-X                        56640000
546700*****             MOVE B1-FAIL-DELIVR-BATCH-CODE (B1-IND) TO      56650000
546800*****                  P2-BK-BATCH-CODE                           56660000
546900*****             MOVE B1-FAIL-DELIVR-ENTRY-CODE (B1-IND) TO      56670000
547000*****                  P2-BK-ENTRY-CODE                           56680000
547600*****         END-IF                                              56690000
547700           END-IF                                                 56700000
547800        ELSE                                                      56710000
547900           MOVE B1-ENTRY-CODE-REC (B1-IND) TO P2-BK-ENTRY-CODE    56720000
548000           IF B1-ENTRY-REC-CASH (B1-IND) > SPACES AND             56730000
548100              FMT-CASH                                            56740000
548200              MOVE B1-ENTRY-REC-CASH (B1-IND) TO P2-BK-ENTRY-CODE 56750000
548300*** ADD FOR CAGE/FAILS                                            56760000
548400*****      ELSE                                                   56770000
548500*****          IF BK-FAIL-CR                                      56780000
548600*****             MOVE 'B' TO P2-BK-TRID-X                        56790000
548700*****             MOVE B1-FAIL-RECEIV-BATCH-CODE (B1-IND) TO      56800000
548800*****                  P2-BK-BATCH-CODE                           56810000
548900*****             MOVE B1-FAIL-RECEIV-ENTRY-CODE (B1-IND) TO      56820000
549000*****                  P2-BK-ENTRY-CODE                           56830000
549600*****          END-IF                                             56840000
549700           END-IF                                                 56850000
549800        END-IF                                                    56860000
549900     END-IF                                                       56870000
550000     IF  P2-BK-ENTRY-CODE = SPACES                                56880000
550200         MOVE 'TFR'  TO  P2-BK-ENTRY-CODE                         56890000
LRM013     END-IF                                                       56900000
LRM013     IF FMT-TRNFR-TYPE = 'RCL'                                    56910000
LRM013     AND B1-ACAT-RCL-BATCH-ENTRY (B1-IND) > SPACES                56920000
LRM015     AND NOT MEMO-TRID                                            56930000
LRM013         MOVE B1-ACAT-RCL-BATCH (B1-IND) TO P2-BK-BATCH-CODE      56940000
LRM013         MOVE B1-ACAT-RCL-ENTRY (B1-IND) TO P2-BK-ENTRY-CODE      56950000
LRM013     END-IF                                                       56960000
LRM013     IF FMT-TRNFR-TYPE = 'PTR'                                    56970000
LRM013     AND B1-ACAT-PTR-BATCH-ENTRY (B1-IND) > SPACES                56980000
LRM015     AND NOT MEMO-TRID                                            56990000
LRM013         MOVE B1-ACAT-PTR-BATCH (B1-IND) TO P2-BK-BATCH-CODE      57000000
LRM013         MOVE B1-ACAT-PTR-ENTRY (B1-IND) TO P2-BK-ENTRY-CODE      57010000
LRM031         IF FMT-CLNT-IS-RECEIVER                                  57020000
LRM031         AND B1-ACAT-PTR-BATCH-ENTRY-RECV (B1-IND) > SPACES       57030000
LRM031             MOVE B1-ACAT-PTR-BATCH-RECV (B1-IND)                 57040000
LRM031                                         TO P2-BK-BATCH-CODE      57050000
LRM031             MOVE B1-ACAT-PTR-ENTRY-RECV (B1-IND)                 57060000
LRM031                                         TO P2-BK-ENTRY-CODE      57070000
LRM031         ELSE                                                     57080000
LRM031         IF FMT-CLNT-IS-DELIVERER                                 57090000
LRM031         AND B1-ACAT-PTR-BATCH-ENTRY-DELIV (B1-IND) > SPACES      57100000
LRM031             MOVE B1-ACAT-PTR-BATCH-DELIV (B1-IND)                57110000
LRM031                                         TO P2-BK-BATCH-CODE      57120000
LRM031             MOVE B1-ACAT-PTR-ENTRY-DELIV (B1-IND)                57130000
LRM031                                         TO P2-BK-ENTRY-CODE      57140000
LRM031         END-IF END-IF                                            57150000
LRM013     END-IF                                                       57160000
LRM013     IF FMT-TRNFR-TYPE = 'PTD'                                    57170000
LRM013     AND B1-ACAT-PTD-BATCH-ENTRY (B1-IND) > SPACES                57180000
LRM015     AND NOT MEMO-TRID                                            57190000
LRM013         MOVE B1-ACAT-PTD-BATCH (B1-IND) TO P2-BK-BATCH-CODE      57200000
LRM013         MOVE B1-ACAT-PTD-ENTRY (B1-IND) TO P2-BK-ENTRY-CODE      57210000
LRM031         IF FMT-CLNT-IS-RECEIVER                                  57220000
LRM031         AND B1-ACAT-PTD-BATCH-ENTRY-RECV (B1-IND) > SPACES       57230000
LRM031             MOVE B1-ACAT-PTD-BATCH-RECV (B1-IND)                 57240000
LRM031                                         TO P2-BK-BATCH-CODE      57250000
LRM031             MOVE B1-ACAT-PTD-ENTRY-RECV (B1-IND)                 57250100
LRM031                                         TO P2-BK-ENTRY-CODE      57250200
LRM031         ELSE                                                     57250300
LRM031         IF FMT-CLNT-IS-DELIVERER                                 57250400
LRM031         AND B1-ACAT-PTD-BATCH-ENTRY-DELIV (B1-IND) > SPACES      57250500
LRM031             MOVE B1-ACAT-PTD-BATCH-DELIV (B1-IND)                57250600
LRM031                                         TO P2-BK-BATCH-CODE      57250700
LRM031             MOVE B1-ACAT-PTD-ENTRY-DELIV (B1-IND)                57250800
LRM031                                         TO P2-BK-ENTRY-CODE      57250900
LRM031         END-IF END-IF                                            57251000
LRM013     END-IF                                                       57252000
LRM025     IF FMT-TRNFR-TYPE = 'PTF'                                    57253000
LRM025     AND B1-ACAT-PTF-BATCH-ENTRY (B1-IND) > SPACES                57254000
LRM025     AND NOT MEMO-TRID                                            57255000
LRM025         MOVE B1-ACAT-PTF-BATCH (B1-IND) TO P2-BK-BATCH-CODE      57256000
LRM025         MOVE B1-ACAT-PTF-ENTRY (B1-IND) TO P2-BK-ENTRY-CODE      57257000
LRM025     END-IF                                                       57258000
LRM013     IF FMT-TRNFR-TYPE = 'FRV'                                    57259000
LRM013     AND B1-ACAT-FRV-BATCH-ENTRY (B1-IND) > SPACES                57260000
LRM015     AND NOT MEMO-TRID                                            57270000
LRM013         MOVE B1-ACAT-FRV-BATCH (B1-IND) TO P2-BK-BATCH-CODE      57280000
LRM013         MOVE B1-ACAT-FRV-ENTRY (B1-IND) TO P2-BK-ENTRY-CODE      57290000
550300     END-IF.                                                      57300000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    57310000
YH0001       IF    B1-ACAT-MFC-BOOKING-BATCH (B1-IND) > ' '             57311000
LRM015         AND NOT MEMO-TRID                                        57312000
YH0001           MOVE B1-ACAT-MFC-BOOKING-BATCH (B1-IND)                57313000
YH0001                                   TO  P2-BK-BATCH-CODE           57314000
YH0001       END-IF                                                     57315000
YH0001       MOVE  'MFC'                 TO  P2-BK-ENTRY-CODE           57316000
YH0001       IF  B1-ACAT-MFC-BOOKING-ENTRE (B1-IND) > ' '               57317000
YH0001           MOVE B1-ACAT-MFC-BOOKING-ENTRE (B1-IND)                57318000
YH0001                                   TO  P2-BK-ENTRY-CODE           57319000
YH0001       END-IF                                                     57319100
YH0001     END-IF.                                                      57319200
YH0001                                                                  57319300
LRM015     SET MEMO-TRID-NOT-USED TO TRUE.                              57319400
550600                                                                  57319500
YH0001 O-WRITE-P2-MFC-ACCOUNT.                                          57319600
                                                                        57319700
           IF  FMT-CLNT-IS-DELIVERER                                    57319800
               IF  B1-ACAT-MFC-DELIVERER-ACCOUNT (B1-IND) > ' '         57319900
                   MOVE B1-ACAT-MFC-DELIVERER-ACCOUNT (B1-IND)          57320000
                                           TO  P2-BK-BR-ACCT-T          57330000
                   MOVE  'X'               TO  P2-BK-CHECK-DIGIT        57340000
               END-IF                                                   57350000
           ELSE                                                         57360000
               IF  B1-ACAT-MFC-RECEIVER-ACCOUNT (B1-IND) > ' '          57370000
                   MOVE B1-ACAT-MFC-RECEIVER-ACCOUNT (B1-IND)           57380000
                                           TO  P2-BK-BR-ACCT-T          57390000
                   MOVE  'X'               TO  P2-BK-CHECK-DIGIT        57400000
               END-IF                                                   57410000
           END-IF.                                                      57420000
                                                                        57430000
550700******************************************************************57440000
550800*** PERFORMED BY:                                              ***57450000
550900***     O-WRITE-P2-REC                                         ***57460000
551000******************************************************************57470000
551100                                                                  57480000
551200 O-WRITE-P2-ROLLOVER-TRAILER.                                     57490000
551300*    DISPLAY ' '                                                  57500000
551400*    DISPLAY '****** O-WRITE-P2-ROLLOVER-TRAILER. '               57501000
551500     IF  P2-BK-BR-ACCT-T-C = (CNS-BR-ACCT-T-C   OR                57502000
551600                   '0982008013' OR '0982009011' OR                57503000
551700                   '0982001513' OR '0982001612' OR                57504000
551800         '0982006019' OR  ALTERNATE-OFFSET-ACCOUNT                57505000
LRM050                      OR B1-MFRS-DST-MFE-OFFSET (B1-IND)          57506000
LRM021                      OR  ALT-OPTION-OFFSET-ACCOUNT)              57507000
LRM052     OR P2-BK-BR-ACCT-T = B1-ACAT-CNS-LONG-R-ACCT (B1-IND)        57508000
LRM052     OR P2-BK-BR-ACCT-T = B1-ACAT-CNS-SHORT-S-ACCT (B1-IND)       57509000
551900         MOVE ROLLOVER-OFFSET-ACCOUNT TO P2-BK-BR-ACCT-T-C        57510000
552000         MOVE  P2-CREDIT-SIGN  TO  P2-BK-BUY-SELL-CODE            57520000
552100     ELSE                                                         57530000
552200         MOVE  P2-DEBIT-SIGN   TO  P2-BK-BUY-SELL-CODE            57540000
552300     END-IF.                                                      57550000
552400     MOVE P2-BK-SECURITY-NBR  TO WS-SAVE-SEC                      57560000
552500     IF FMT-CLNT-IS-DELIVERER                                     57570000
552600        MOVE '8660324'    TO P2-BK-SECURITY-NBR                   57580000
552700     ELSE                                                         57590000
552800        MOVE ROLL-SEC-NO  TO P2-BK-SECURITY-NBR                   57600000
552900     END-IF.                                                      57610000
553000     IF (B1-ROLLOVER-CLIENT (B1-IND) = '2' AND                    57620000
ET0001        (FMT-ACT-TYPE  =  'IR' OR 'QP' OR 'SI' OR 'EI' OR 'RI'))  57630000
553200         IF FMT-CLNT-IS-DELIVERER                                 57640000
553300            MOVE '8660301' TO P2-BK-SECURITY-NBR                  57650000
553400         ELSE                                                     57660000
553500            MOVE '8660314' TO P2-BK-SECURITY-NBR                  57670000
553600         END-IF                                                   57680000
553700     END-IF.                                                      57690000
LRM027     IF (B1-ROLLOVER-CLIENT (B1-IND) = '3' AND                    57700000
LRM027          (FMT-ACT-TYPE  =  'IR' OR 'QP' OR 'SI' OR 'EI' OR 'RI'  57710000
LRM027                         OR 'BI' OR 'BR' OR '4K' OR               57720000
LRM027                            '4B' OR '7B' OR '5P' OR 'HS'))        57730000
LRM027         IF FMT-CLNT-IS-DELIVERER                                 57740000
LRM027            MOVE '8660301' TO P2-BK-SECURITY-NBR                  57750000
LRM027         ELSE                                                     57760000
LRM027            MOVE '8660314' TO P2-BK-SECURITY-NBR                  57770000
LRM027         END-IF                                                   57780000
LRM027     END-IF.                                                      57790000
LRM010     IF (FMT-TRNFR-TYPE  = 'PTR' OR 'PTD')                        57800000
LRM010     AND FMT-CLNT-IS-DELIVERER                                    57810000
LRM010        MOVE '8661278'    TO P2-BK-SECURITY-NBR                   57820000
LRM010     END-IF.                                                      57830000
LRM016     IF (FMT-TRNFR-TYPE = 'FRV' OR 'RCL')                         57840000
LRM016     AND FMT-SCRTY-866-NBR > SPACES                               57850000
LRM016         MOVE FMT-SCRTY-866-NBR TO P2-BK-SECURITY-NBR             57860000
LRM016     END-IF.                                                      57870000
554300                                                                  57880000
554400     MOVE ZERO                TO P2-BK-AMOUNT                     57890000
554500     MOVE ZERO                TO P2-BK-FRACTION                   57900000
554600     MOVE ZERO                TO WS-BK-QUANTITY                   57910000
554700     MOVE P2-QUANTITY-PRESENT TO P2-BK-QUANTITY-SW                57920000
LRM016     IF (FMT-TRNFR-TYPE = 'FRV' OR 'RCL')                         57930000
LRM016     AND FMT-SCRTY-866-NBR > SPACES                               57940000
LRM016        MOVE FMT-ASSET-866-QTY TO WS-BK-QUANTITY                  57950000
LRM016     ELSE                                                         57960000
554800     IF  FMT-ASSET-QUAN NOT = ZERO                                57970000
554900         MOVE LOW-VALUES     TO MSD-RECORD-AREA                   57980000
555000         MOVE WS-SAVE-SEC    TO GETMSD-INIT-SEARCH                57990000
555100         PERFORM O-CALL-MSD-FILE                                  58000000
555200      IF  MS-CLOSING-PRICE  NUMERIC                               58010000
555300      AND MS-CLOSING-PRICE  NOT = ZERO                            58020000
LRM019         INITIALIZE  LINK-TO-MGR02MKV-AREA                        58030000
555500         MOVE   ZEROES                 TO LINK-FIG-MKT-VALUE      58040000
555600         MOVE   WS-SAVE-SEC            TO LINK-SECURITY           58050000
555700         MOVE   ZERO                   TO LINK-QUANTITY           58060000
555800         MOVE   FMT-ASSET-QUAN         TO LINK-QUANTITY           58070000
555900         MOVE   ZERO                   TO LINK-PRICE              58080000
556000         MOVE   MS-CLOSING-PRICE       TO LINK-PRICE              58090000
556100         SET    MSD-SETUP              TO TRUE                    58100000
556200         MOVE   '1'                    TO LINK-WI                 58101000
556300         MOVE   MS-FORMAT-IND          TO LINK-MS-FORMAT          58102000
556400         MOVE   MS-SECURITY-TYPE       TO LINK-MS-TYPE            58103000
556500         MOVE   MS-SECURITY-TYPE-2     TO LINK-MS-SECURITY-TYPE-2 58104000
556600         MOVE   MS-CMO                 TO LINK-MS-CMO             58105000
556700        MOVE   MS-BOND-CURRENT-FACTOR TO LINK-MS-BOND-CURR-FACTOR 58106000
556800         MOVE   MS-PRICE-MULTIPLIER    TO LINK-MS-PRICE-MULTIPLR  58107000
556900                                                                  58108000
LRM019         CALL    MGR02MKV          USING  LINK-TO-MGR02MKV-AREA   58109000
557100         IF  LINK-VALIDERR-CODE  NOT =  SPACES                    58110000
557200             MOVE    ZEROES  TO  LINK-FIG-MKT-VALUE               58120000
557300         END-IF                                                   58130000
557400         MOVE    LINK-FIG-MKT-VALUE  TO  WS-BK-QUANTITY           58140000
557500       ELSE                                                       58150000
557600         MOVE FMT-ASSET-VALUE  TO WS-BK-QUANTITY                  58160000
557700       END-IF                                                     58170000
557800     ELSE                                                         58180000
557900        MOVE FMT-ASSET-VALUE  TO WS-BK-QUANTITY                   58190000
558000     END-IF                                                       58200000
LRM016     END-IF.                                                      58210000
558100     MOVE ZERO                TO P2-BK-QUANTITY                   58220000
558200     MOVE WS-BK-QUAN-WHOLE    TO P2-BK-QUANTITY                   58230000
558300     MOVE WS-BK-QUAN-FRACTION TO P2-BK-FRACTION                   58240000
558400     WRITE P2BKPG-RECORD   FROM  P2-BK-RECORD                     58250000
558500     ADD 1 TO TOT-CL-P2-RECS-WRITTEN.                             58260000
LRM014     PERFORM O-WRITE-SECR-866-EXTR                                58270000
558600* ACAT TRAILER PROCESSING                                         58280000
558700     IF (B1-ACAT-P2-TRAILER (B1-IND) = '1' OR '2' OR '3') AND     58290000
558800        (FMT-CLNT-IS-RECEIVER OR FMT-CLNT-IS-DELIVERER)           58300000
558900         PERFORM O-WRITE-ACAT-P2-TRAILER                          58310000
559000     END-IF.                                                      58320000
LRM013     IF (FMT-TRNFR-TYPE = 'PTR'                                   58330000
LRM013     AND B1-ACAT-PTR-TRAILER (B1-IND) > SPACES)                   58340000
LRM013     OR (FMT-TRNFR-TYPE = 'PTD'                                   58350000
LRM013     AND B1-ACAT-PTD-TRAILER (B1-IND) > SPACES)                   58360000
LRM025     OR (FMT-TRNFR-TYPE = 'PTF'                                   58370000
LRM025     AND B1-ACAT-PTF-TRAILER (B1-IND) > SPACES)                   58380000
LRM013     OR (FMT-TRNFR-TYPE = 'FRV'                                   58390000
LRM013     AND B1-ACAT-FRV-TRAILER (B1-IND) > SPACES)                   58400000
LRM013     OR (FMT-TRNFR-TYPE = 'RCL'                                   58410000
LRM013     AND B1-ACAT-RCL-TRAILER (B1-IND) > SPACES)                   58420000
LRM013     OR (FMT-TRNFR-TYPE = 'MFC'                                   58430000
LRM013     AND B1-ACAT-MFC-TRAILER (B1-IND) > SPACES)                   58440000
LRM013        PERFORM O-WRITE-P2-NS-TRAILER                             58450000
LRM013     END-IF.                                                      58460000
559100/                                                                 58470000
559200******************************************************************58480000
559300*** PERFORMED BY:                                              ***58490000
559400***     O-WRITE-P2-REC                                         ***58500000
559500******************************************************************58510000
559600                                                                  58520000
559700 O-WRITE-P2-TRAILER.                                              58530000
559800**   DISPLAY ' O-WRITE-P2-TRAILER.'                               58540000
559900                                                                  58550000
560000     MOVE  SPACES           TO  P2-BK-TRAILER-RECORD              58560000
560100     MOVE SPACES            TO  P2-BK-VALUE-DT-X                  58570000
560200     MOVE  P2-BK-RECORD     TO  P2-BK-TRAILER-RECORD              58580000
560300     MOVE FMT-TRNFR-TYPE-RSN-CD TO P2-BKT-RESCODE                 58590000
560400     EVALUATE FMT-TRNFR-TYPE-RSN-CD                               58600000
560500         WHEN '01'                                                58610000
560600             MOVE  'CASH DIVIDEND'       TO P2-BKT-RESDESC        58620000
560700         WHEN '02'                                                58630000
560800             MOVE  ' INTEREST    '       TO P2-BKT-RESDESC        58640000
560900         WHEN '03'                                                58650000
561000             MOVE  'LIQUIDATION  '       TO P2-BKT-RESDESC        58660000
561100         WHEN '04'                                                58670000
561200             MOVE  'STOCK DIV. / DISTR.' TO P2-BKT-RESDESC        58680000
561300         WHEN '05'                                                58690000
561400             MOVE  'STOCK SPLIT  '       TO P2-BKT-RESDESC        58700000
561500         WHEN '06'                                                58710000
561600             MOVE  'REORGANIZATION'      TO P2-BKT-RESDESC        58720000
561700         WHEN '07'                                                58730000
561800             MOVE  'REDEMPTION    '      TO P2-BKT-RESDESC        58740000
561900         WHEN '08'                                                58750000
562000             MOVE  'UNDERLYING OPTION'   TO P2-BKT-RESDESC        58760000
562100         WHEN '09'                                                58770000
562200             MOVE  'UNDERLYING SECURITY' TO P2-BKT-RESDESC        58780000
562300         WHEN '10'                                                58790000
562400             MOVE  'MISCELLANEOUS'       TO P2-BKT-RESDESC        58800000
562500         WHEN '11'                                                58810000
562600             MOVE  'MFUND FRAC CASH IN LIEU' TO P2-BKT-RESDESC    58820000
562700         WHEN '12'                                                58830000
562800             MOVE  'MUTUAL FUND ACCURAL' TO P2-BKT-RESDESC        58840000
562900         WHEN '13'                                                58850000
563000             MOVE  'MUTUAL FUND RESIDUAL' TO P2-BKT-RESDESC       58860000
563100         WHEN OTHER                                               58870000
563200             CONTINUE                                             58880000
563300     END-EVALUATE                                                 58890000
563400     MOVE SPACES                    TO P2-BKT-QUANTITY-X          58900000
563500                                       P2-BKT-ENTRY-CODE          58910000
563600                                       P2-BKT-AMOUNT-X            58920000
563700     MOVE '-'                       TO P2-BKT-HYPHEN              58930000
563800     MOVE  0                        TO P2-BKT-FRACTION            58940000
563900     WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD.               58950000
564000     ADD 1 TO TOT-CL-P2-RECS-WRITTEN.                             58960000
564100*    DISPLAY ' P2-BK-TRAILER-RECORD = ' P2-BK-TRAILER-RECORD.     58970000
LRM013/                                                                 58980000
LRM013 O-WRITE-P2-NS-TRAILER.                                           58990000
LRM013**  DISPLAY ' O-WRITE-P2-NS-TRAILER.'                             59000000
LRM013                                                                  59010000
LRM013     MOVE  SPACES           TO  P2-BK-TRAILER-RECORD              59020000
LRM013     MOVE SPACES            TO  P2-BK-VALUE-DT-X                  59030000
LRM013     MOVE  P2-BK-RECORD     TO  P2-BK-TRAILER-RECORD              59040000
LRM013     EVALUATE FMT-TRNFR-TYPE                                      59050000
LRM013        WHEN 'FRV'                                                59060000
LRM013            MOVE  B1-ACAT-FRV-TRAILER (B1-IND) TO                 59070000
LRM013                                            P2-BKT-DESCRIPTION    59080000
LRM013        WHEN 'PTR'                                                59090000
LRM013            MOVE  B1-ACAT-PTR-TRAILER (B1-IND) TO                 59100000
LRM013                                            P2-BKT-DESCRIPTION    59110000
LRM013        WHEN 'PTD'                                                59120000
LRM013            MOVE  B1-ACAT-PTD-TRAILER (B1-IND) TO                 59130000
LRM013                                            P2-BKT-DESCRIPTION    59140000
LRM025        WHEN 'PTF'                                                59150000
LRM025            MOVE  B1-ACAT-PTF-TRAILER (B1-IND) TO                 59160000
LRM025                                            P2-BKT-DESCRIPTION    59170000
LRM013        WHEN 'RCL'                                                59180000
LRM013            MOVE  B1-ACAT-RCL-TRAILER (B1-IND) TO                 59190000
LRM013                                            P2-BKT-DESCRIPTION    59200000
LRM013        WHEN 'MFC'                                                59210000
LRM013            MOVE  B1-ACAT-MFC-TRAILER (B1-IND) TO                 59220000
LRM013                                            P2-BKT-DESCRIPTION    59230000
LRM013        WHEN OTHER                                                59240000
LRM013             CONTINUE                                             59250000
LRM013     END-EVALUATE                                                 59260000
LRM013     MOVE SPACES                    TO P2-BKT-QUANTITY-X          59270000
LRM013                                       P2-BKT-ENTRY-CODE          59280000
LRM013                                       P2-BKT-AMOUNT-X            59290000
LRM013     MOVE '-'                       TO P2-BKT-HYPHEN              59300000
LRM013     MOVE  0                        TO P2-BKT-FRACTION            59310000
LRM013     WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD.               59320000
LRM013     ADD 1 TO TOT-CL-P2-RECS-WRITTEN.                             59330000
LRM013*   DISPLAY ' P2-BK-TRAILER-RECORD = ' P2-BK-TRAILER-RECORD.      59340000
564200/                                                                 59350000
564300******************************************************************59360000
564400*** PERFORMED BY:                                              ***59370000
564500***     O-RCVR-LONG-FUND-SERV                                  ***59380000
564600***     O-WRITE-P2-REC                                         ***59390000
564700***     O-WRITE-P2-ROLLOVER-TRAILER                            ***59400000
564800******************************************************************59410000
564900                                                                  59420000
565000 O-WRITE-ACAT-P2-TRAILER.                                         59430000
565100                                                                  59440000
565200*    DISPLAY ' '                                                  59450000
565300*    DISPLAY '****** O-WRITE-ACAT-P2-TRAILER.'                    59460000
565400     MOVE  SPACES           TO  P2-BK-TRAILER-RECORD.             59470000
565500     MOVE SPACES            TO  P2-BK-VALUE-DT-X.                 59480000
565600     MOVE  P2-BK-RECORD     TO  P2-BK-TRAILER-RECORD.             59490000
565700                                                                  59500000
565800* READ BROKER FILE FOR BROKER NAME                                59510000
565900                                                                  59520000
566000     MOVE LOW-VALUES           TO  BROKER-KEY.                    59530000
566100     MOVE 'O'                  TO  BROKER-EXCHANGE.               59540000
566200     MOVE FMT-CONTRA-BRK-NUM   TO  BROKER-BADGE.                  59550000
566210                                                                  59560000
566220     START BROKER-FILE                                            59570000
566230          KEY IS NOT < BROKER-KEY.                                59580000
566240                                                                  59590000
566250     IF BROKER-FILE-OK OR                                         59600000
566260        BROKER-ENDFILE                                            59610000
566270       CONTINUE                                                   59620000
566280     ELSE                                                         59630000
566290       DISPLAY 'BROKER FILE START ERROR, STATUS = '               59640000
566300       DISPLAY BROKER-FILE-STATUS                                 59650000
566400       CALL    ABEND          USING ABEND-CODE-4000.              59660000
566500                                                                  59670000
566600     READ BROKER-FILE NEXT.                                       59680000
566700                                                                  59690000
566800     IF BROKER-FILE-OK OR                                         59700000
566900        BROKER-ENDFILE                                            59710000
567000       CONTINUE                                                   59720000
567100     ELSE                                                         59730000
567200       DISPLAY 'BROKER FILE READ NEXT ERROR, STATUS = '           59740000
567300       DISPLAY BROKER-FILE-STATUS                                 59750000
567400       CALL    ABEND          USING ABEND-CODE-4000.              59760000
567500                                                                  59770000
567600     IF BROKER-FILE-OK                                            59780000
567700     AND BROKER-EXCHANGE = 'O' AND                                59790000
567800        BROKER-BADGE    = FMT-CONTRA-BRK-NUM                      59800000
567900       MOVE BROKER-NAME    TO TRLR-BRKR                           59810000
568000     ELSE                                                         59820000
568100        MOVE 1 TO SUB                                             59830000
568200        PERFORM UNTIL SUB > WS-CATPPL-RECORD-COUNT                59840000
568300                  OR FMT-CONTRA-BRK-NUM = WS-CATPPL-BROKER(SUB)   59850000
568400           ADD 1 TO SUB                                           59860000
568500        END-PERFORM                                               59870000
568600        IF SUB NOT > WS-CATPPL-RECORD-COUNT                       59880000
568700           MOVE WS-CATPPL-BROKER-NAME(SUB) TO TRLR-BRKR           59890000
568800        ELSE                                                      59900000
568900           MOVE 'NOT ON FILE ' TO TRLR-BRKR                       59910000
569000     END-IF.                                                      59920000
569100                                                                  59930000
569200     IF (B1-ACAT-P2-TRAILER (B1-IND) = '1' OR '3') AND            59940000
569300        FMT-CLNT-IS-DELIVERER                                     59950000
569400       MOVE 'TOA TO '     TO TRLR-MSG.                            59960000
569500                                                                  59970000
569600     IF (B1-ACAT-P2-TRAILER (B1-IND) = '2' OR '3') AND            59980000
569700        FMT-CLNT-IS-RECEIVER                                      59990000
569800       MOVE 'TOA FROM '   TO TRLR-MSG.                            60000000
569900                                                                  60010000
570000     IF ((B1-ACAT-P2-TRAILER (B1-IND) = '1' OR '3') AND           60020000
570100        FMT-CLNT-IS-DELIVERER)                      OR            60030000
570200        ((B1-ACAT-P2-TRAILER (B1-IND) = '2' OR '3') AND           60040000
570300        FMT-CLNT-IS-RECEIVER)                                     60050000
570400       MOVE TRLR-MESSAGE TO P2-BKT-DESCRIPTION                    60060000
570500       MOVE SPACES       TO P2-BKT-QUANTITY-X                     60070000
570600                            P2-BKT-ENTRY-CODE                     60080000
570700                            P2-BKT-AMOUNT-X                       60090000
570800       MOVE '-'          TO P2-BKT-HYPHEN                         60100000
LRM034       IF FMT-TRNFR-TYPE = 'PTF'                                  60110000
LRM034       AND FMT-FND-SERV-CNTL-NBR > SPACES                         60120000
LRM034       AND FMT-AT-CUST-ACCOUNT(1 : 8) = P2-BKT-BR-ACCT-T(1 : 8)   60130000
LRM034       AND P2-BKT-SECURITY-NBR(1 : 3) NOT = '866'                 60140000
LRM035          MOVE SPACES TO P2-BKT-FILLER1                           60150000
LRM035                         P2-BKT-FILLER2                           60160000
LRM034          MOVE 'CATS'             TO P2-TRAILER-ORIG-SUFFIX       60170000
LRM034          MOVE  FMT-FND-SERV-CNTL-NBR                             60180000
LRM034                                  TO P2-TRAILER-ORIG-SUFFIX(5:)   60190000
LRM035          MOVE '2'          TO P2-BKT-TRAILER-CODE                60200000
LRM034       ELSE                                                       60210000
LRM038       IF FMT-TRNFR-TYPE NOT = 'PTF'                              60220000
LRM038       AND FMT-AT-CUST-ACCOUNT(1 : 8) = P2-BKT-BR-ACCT-T(1 : 8)   60230000
LRM038       AND P2-BKT-SECURITY-NBR(1 : 3) NOT = '866'                 60240000
LRM038       AND P2-BKT-SECURITY-NBR > SPACES                           60250000
LRM038          MOVE SPACES TO P2-BKT-FILLER1                           60260000
LRM038                         P2-BKT-FILLER2                           60270000
LRM038          MOVE 'SEQN00'           TO P2-TRAILER-ORIG-SUFFIX       60271000
LRM038          MOVE  FMT-ASSET-SEQ-NO                                  60272000
LRM038                                  TO P2-TRAILER-ORIG-SUFFIX(7:)   60273000
LRM038          MOVE '2'          TO P2-BKT-TRAILER-CODE                60274000
LRM038       ELSE                                                       60275000
570900          MOVE  0           TO P2-BKT-FRACTION                    60276000
LRM034       END-IF                                                     60277000
LRM038       END-IF.                                                    60277100
YH0001       PERFORM O-WRITE-ACAT-P2BKPG-TRL.                           60277200
LRM035       MOVE SPACES       TO P2-BKT-TRAILER-CODE.                  60277300
571200                                                                  60277400
571300     IF (OMNIBUS-PROCESS                                  AND     60277500
571400         B1-MFRS-OMNIBUS-OFFSET (B1-IND) > SPACES         AND     60277600
571500         P2-BK-BR-ACCT-T = B1-MFRS-OMNIBUS-OFFSET (B1-IND)   )    60277700
571510      OR                                                          60277800
571511        (OMNIBUS-PROCESS                                  AND     60277900
571512         MF-NSCC-SOURCE                                   AND     60278000
571520         B1-MFRS-NSCCSRC-OFFSET (B1-IND) > SPACES         AND     60279000
571530         P2-BK-BR-ACCT-T = B1-MFRS-NSCCSRC-OFFSET (B1-IND)   )    60280000
571510      OR                                                          60281000
571511        (PNC-OMNIBUS-PROCESS                              AND     60282000
571520         B1-PNC-SURPAS-OFFSET (B1-IND) > SPACES           AND     60283000
571530         P2-BK-BR-ACCT-T = B1-PNC-SURPAS-OFFSET (B1-IND)     )    60284000
571600       MOVE SPACES TO TRLR-MESSAGE                                60285000
571700       MOVE 'TO ACCT  '  TO TRLR-MSG                              60286000
571800       MOVE OB-BR-ACCT-TC     TO TRLR-BRKR                        60287000
571900       MOVE TRLR-MESSAGE TO P2-BKT-DESCRIPTION                    60288000
572000       MOVE SPACES       TO P2-BKT-QUANTITY-X                     60289000
572100                            P2-BKT-ENTRY-CODE                     60290000
572200                            P2-BKT-AMOUNT-X                       60300000
572300       MOVE '-'          TO P2-BKT-HYPHEN                         60310000
572400       MOVE  0           TO P2-BKT-FRACTION                       60320000
YH0001       PERFORM O-WRITE-ACAT-P2BKPG-TRL                            60330000
572700     END-IF.                                                      60340000
572800                                                                  60350000
LRM003     IF (DST-MFE-PROCESS                                  AND     60360000
LRM003         B1-MFRS-DST-MFE-OFFSET (B1-IND) > SPACES         AND     60370000
LRM003         P2-BK-BR-ACCT-T = B1-MFRS-DST-MFE-OFFSET (B1-IND)   )    60380000
LRM003       MOVE SPACES TO TRLR-MESSAGE                                60390000
LRM003       MOVE 'TO ACCT  '  TO TRLR-MSG                              60400000
LRM003       MOVE OB-BR-ACCT-TC     TO TRLR-BRKR                        60410000
LRM003       MOVE TRLR-MESSAGE TO P2-BKT-DESCRIPTION                    60420000
LRM003       MOVE SPACES       TO P2-BKT-QUANTITY-X                     60430000
LRM003                            P2-BKT-ENTRY-CODE                     60440000
LRM003                            P2-BKT-AMOUNT-X                       60450000
LRM003       MOVE '-'          TO P2-BKT-HYPHEN                         60460000
LRM003       MOVE  0           TO P2-BKT-FRACTION                       60470000
YH0001       PERFORM O-WRITE-ACAT-P2BKPG-TRL                            60480000
LRM003     END-IF.                                                      60490000
                                                                        60500000
572900*    DISPLAY ' P2-BK-TRAILER-RECORD = ' P2-BK-TRAILER-RECORD.     60510000
LRM014/                                                                 60520000
YH0001 O-WRITE-ACAT-P2BKPG-TRL.                                         60530000
                                                                        60540000
           WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD                60550000
           ADD 1 TO TOT-CL-P2-RECS-WRITTEN.                             60560000
                                                                        60570000
LRM014 O-WRITE-SECR-866-EXTR.                                           60580000
LRM014                                                                  60590000
LRM014     MOVE SPACES TO FMT-ROLL-DETAIL-RECORD.                       60591000
LRM014     MOVE P2-BK-BROKER-NBR         TO FMT-ROLL-ADP-CL-NO-X.       60592000
LRM014     MOVE P2-BK-SECURITY-NBR       TO FMT-ROLL-SECR-866-NBR       60593000
LRM014     MOVE WS-BK-QUAN-WHOLE         TO FMT-ROLL-SECR-866-QTY       60594000
LRM014     MOVE WS-BK-QUAN-FRACTION      TO FMT-ROLL-SECR-866-QTY-FRAC. 60595000
LRM014     MOVE FMT-TI-CONTROL-NUM       TO FMT-ROLL-CONTROL-NBR        60596000
LRM014     MOVE FMT-ASSET-SEQ-NO-9       TO FMT-ROLL-ASSET-SEQ-NBR      60597000
LRM014     WRITE ROLL866-RECORD FROM FMT-ROLL-DETAIL-RECORD.            60598000
573000/                                                                 60599000
573100******************************************************************60600000
573200*** PERFORMED BY:                                              ***60610000
573300***     O-PROCESS-ACAT-RECORD                                  ***60620000
573400******************************************************************60630000
573500                                                                  60640000
573600 O-EDIT-PEND-RECS.                                                60650000
573700                                                                  60660000
573800     MOVE 'N' TO THIS-RECORD-PRINTED-SWITCH                       60670000
573900     MOVE 'Y' TO FMT-REC-IS-VALID-SWITCH                          60680000
574000                                                                  60690000
574100     PERFORM O-EDIT-STL-IND                                       60700000
574200     PERFORM O-EDIT-WHEN-ISSUE                                    60710000
574300     PERFORM O-EDIT-FRACT-QUANT                                   60720000
574400*** OPTION TO CONVERT RECEIVE OF BEARER BOND TO REGISTERED **     60730000
574500     IF  B1-BEARER-BOND-OPT (B1-IND) = '1' AND                    60740000
574600         FMT-CLNT-IS-RECEIVER               AND                   60750000
574700         FMT-BEARER-BOND                                          60760000
574800         MOVE  ' '  TO  FMT-SEC-TYPE                              60770000
574900*        MOVE  '1'  TO  FMT-STCK-BND-IND                          60780000
575000     END-IF                                                       60790000
575100     IF FMT-UNDELIVERABLE                                         60800000
575200     OR FMT-MEMO                                                  60810000
575300        CONTINUE                                                  60820000
575400     ELSE                                                         60830000
575500        PERFORM O-EDIT-ADP-CUSIP-NO.                              60840000
YH0001                                                                  60850000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    60860000
YH0001        PERFORM O-EDIT-MFC-TRANSFER.                              60870000
575600/                                                                 60880000
575700******************************************************************60890000
575800*** PERFORMED BY:                                              ***60900000
575900***     O-EDIT-RETURN-SORT-FILE                                ***60910000
576000******************************************************************60920000
576100                                                                  60930000
576200 O-EDIT-STL-IND.                                                  60940000
576300                                                                  60950000
576400     IF FMT-EXPIRING-OPTION                                       60960000
576500         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      60970000
576600         MOVE FMT-STTLM-RSN-CD           TO ERROR-VALUE           60980000
576700         MOVE 'EXPIRING OPTION'          TO ERROR-MSG             60990000
576800****     PERFORM O-PRINT-ERROR-RECORD                             61000000
576900     END-IF                                                       61010000
577000                                                                  61020000
577100     IF FMT-UNDERLYING-SECURITY                                   61030000
577200         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      61040000
577300         MOVE FMT-STTLM-RSN-CD           TO ERROR-VALUE           61050000
577400         MOVE 'UNDERLYING-SECURITY'      TO ERROR-MSG             61060000
577500****     PERFORM O-PRINT-ERROR-RECORD                             61070000
577600     END-IF                                                       61080000
577700                                                                  61090000
577800     IF FMT-FUND-SERV AND FMT-SHORT                               61100000
577900         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      61110000
578000         MOVE FMT-STTLM-RSN-CD           TO ERROR-VALUE           61120000
578100         MOVE 'SHORT FUND/SERV POSN'     TO ERROR-MSG             61130000
578200         PERFORM O-PRINT-ERROR-RECORD                             61140000
578300     END-IF.                                                      61150000
578400                                                                  61160000
578500     IF FMT-UNDELIVERABLE                                         61170000
578600         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      61180000
578700         MOVE FMT-STTLM-RSN-CD           TO ERROR-VALUE           61190000
578800         MOVE 'UNDELIVERABLE SECURITY '  TO ERROR-MSG             61200000
578900*****    PERFORM O-PRINT-ERROR-RECORD                             61210000
579000     END-IF.                                                      61220000
579100                                                                  61230000
LRM033     IF PARM-SHAD-RUN                                             61240000
LRM033     AND FMT-TRNFR-TYPE = 'PTF'                                   61250000
LRM033     AND FMT-ASSET-QUAN = ZEROS                                   61260000
LRM033         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      61270000
LRM033         DISPLAY 'SKIP SHADOW PTF W/ZERO QTY '                    61280000
LRM033                FMT-TI-ADP-CL-NO-X ' ' FMT-TI-CONTROL-NUM         61290000
LRM033     END-IF.                                                      61300000
579200/                                                                 61310000
579300******************************************************************61320000
579400*** PERFORMED BY:                                              ***61330000
579500***     O-EDIT-RETURN-SORT-FILE                                ***61340000
579600******************************************************************61350000
579700                                                                  61360000
579800 O-EDIT-WHEN-ISSUE.                                               61370000
579900                                                                  61380000
580000     IF  FMT-SEC-TYPE-IS-WHEN-ISSUE                               61390000
580100         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      61400000
580200         ADD 1 TO NUM-SEC-TYPE-WRONG                              61410000
580300         MOVE FMT-SEC-TYPE               TO ERROR-VALUE           61420000
580400         MOVE 'SEC TYPE IS WHEN ISSUE '  TO ERROR-MSG             61430000
580500         PERFORM O-PRINT-ERROR-RECORD                             61440000
580600     END-IF.                                                      61450000
580700/                                                                 61460000
580800******************************************************************61461000
580900*** PERFORMED BY:                                              ***61462000
581000***     O-EDIT-RETURN-SORT-FILE                                ***61463000
581100******************************************************************61464000
581200                                                                  61465000
581300 O-EDIT-FRACT-QUANT.                                              61466000
581400                                                                  61467000
581500     EVALUATE TRUE                                                61468000
581600         WHEN  NOT FMT-ASSET-QUAN-IS-WHOLE-NUM                    61469000
581700               AND B1-FRAC-QTY-PROC (B1-IND) = '0'                61470000
581800             MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                  61480000
581900             ADD 1 TO NUM-FRACTION-QTY                            61490000
582000             MOVE FMT-ASSET-QUAN-FRACTION-X   TO ERROR-VALUE      61500000
582100             MOVE 'FRACTION QUANTITY ' TO ERROR-MSG               61510000
582200             PERFORM O-PRINT-ERROR-RECORD                         61520000
582300         WHEN  OTHER                                              61530000
582400             CONTINUE                                             61540000
582500     END-EVALUATE.                                                61550000
582600/                                                                 61560000
582700******************************************************************61570000
582800*** PERFORMED BY:                                              ***61580000
582900***     O-EDIT-RETURN-SORT-FILE                                ***61590000
583000******************************************************************61600000
583100                                                                  61610000
583200 O-EDIT-ADP-CUSIP-NO.                                             61620000
583300                                                                  61630000
583400     IF  FMT-CASH                                                 61640000
583500         MOVE FMT-CUSIP-NUM TO FMT-ADP-SEC-NO                     61650000
583600     ELSE                                                         61660000
583700       IF  FMT-MEMO                                               61670000
583800         CONTINUE                                                 61680000
583900       ELSE                                                       61690000
584000         IF FMT-ADP-SEC-NO = SPACES OR LOW-VALUES                 61700000
584100             MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                  61710000
584200             ADD 1 TO NUM-CUSIP-NOT-MATCHED                       61720000
584300             MOVE FMT-CUSIP-NUM              TO ERROR-VALUE       61730000
584400             MOVE 'CUSIP NUMBER NOT MATCHED' TO ERROR-MSG         61740000
584500             PERFORM O-PRINT-ERROR-RECORD                         61750000
584600         END-IF                                                   61760000
584700     END-IF.                                                      61770000
584800/                                                                 61780000
584900******************************************************************61790000
585000*** PERFORMED BY:                                              ***61800000
585100***     O-EDIT-ADP-CUSIP-NO                                    ***61810000
585200******************************************************************61820000
585300                                                                  61830000
585400 O-GET-ADP-CUSIP-NBR.                                             61840000
585500                                                                  61850000
585600     EVALUATE TRUE                                                61860000
585700         WHEN  FMT-BEARER-BOND                                    61870000
585800             PERFORM O-GET-ADP-BEARER-BOND                        61880000
585900         WHEN  FMT-OPTION                                         61890000
586000             PERFORM O-GET-ADP-OPTION                             61900000
586100         WHEN  FMT-BOND                                           61910000
586200             PERFORM O-GET-ADP-REGISTERED-BOND                    61920000
586300         WHEN  FMT-MUNI-BOND                                      61930000
586400             PERFORM O-GET-ADP-MUNI-BOND                          61940000
586500         WHEN OTHER                                               61950000
586600             PERFORM O-GET-ADP-STOCK                              61960000
586700     END-EVALUATE                                                 61970000
586800                                                                  61980000
586900     EVALUATE TRUE                                                61990000
587000         WHEN   FMT-OPTION                                        62000000
587100          AND (GETMSD-XREF-RETURN-NOT-FOUND                       62010000
587200           OR  GETMSD-XREF-RETURN-INV-CUSIP                       62020000
587300           OR  GETMSD-XREF-RETURN-KEY-IS-SEC                      62030000
587400           OR  SYMBOL-NOT-FOUND)                                  62040000
587500             MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                  62050000
587600             ADD 1 TO NUM-SYMBOL-NOT-MATCHED                      62060000
587700             MOVE FMT-OPTION-SYMBOL TO ERROR-VALUE                62070000
587800             MOVE 'SYMBOL NOT MATCHED' TO ERROR-MSG               62080000
587900             PERFORM O-PRINT-ERROR-RECORD                         62090000
588000         WHEN  GETMSD-XREF-RETURN-NOT-FOUND                       62100000
588100           OR  GETMSD-XREF-RETURN-INV-CUSIP                       62110000
588200           OR  GETMSD-XREF-RETURN-KEY-IS-SEC                      62120000
588300           OR (GETMSD-XREF-RETURN-VALID  AND                      62130000
588400               FMT-ADP-SEC-NO  NOT > ' ')                         62140000
588500             MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                  62150000
588600             ADD 1 TO NUM-CUSIP-NOT-MATCHED                       62160000
588700             MOVE FMT-CUSIP-NUM              TO ERROR-VALUE       62170000
588800             MOVE 'CUSIP NUMBER NOT MATCHED' TO ERROR-MSG         62180000
588900             PERFORM O-PRINT-ERROR-RECORD                         62190000
589000         WHEN  OTHER                                              62200000
589100             CONTINUE                                             62210000
589200     END-EVALUATE.                                                62220000
589300/                                                                 62230000
589400******************************************************************62240000
589500*** PERFORMED BY:                                              ***62250000
589600***     O-GET-ADP-CUSIP-NBR                                    ***62260000
589700******************************************************************62270000
589800                                                                  62280000
589900 O-GET-ADP-BEARER-BOND.                                           62290000
590000                                                                  62300000
590100     SET ENTER-BEARER-GET TO TRUE                                 62310000
590200     MOVE FMT-CUSIP-NUM TO CUSIP-1-9                              62320000
590300     MOVE '010' TO CUSIP-10-11-12                                 62330000
590400     MOVE  CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                    62340000
590500     PERFORM O-CALL-MSDXREF                                       62350000
590600     IF GETMSD-XREF-RETURN-VALID                                  62360000
590700         SET EXIT-BEARER-GET TO TRUE                              62370000
590800     END-IF                                                       62380000
590900                                                                  62390000
591000     IF EXIT-BEARER-GET                                           62400000
591100         CONTINUE                                                 62410000
591200     ELSE                                                         62420000
591300         MOVE '020' TO CUSIP-10-11-12                             62430000
591400         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 62440000
591500         PERFORM O-CALL-MSDXREF                                   62450000
591600         IF GETMSD-XREF-RETURN-VALID                              62460000
591700             SET EXIT-BEARER-GET TO TRUE                          62470000
591800         END-IF                                                   62480000
591900     END-IF                                                       62490000
592000                                                                  62500000
592100     IF EXIT-BEARER-GET                                           62510000
592200         CONTINUE                                                 62520000
592300     ELSE                                                         62530000
592400         MOVE '040' TO CUSIP-10-11-12                             62540000
592500         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 62550000
592600         PERFORM O-CALL-MSDXREF                                   62560000
592700         IF GETMSD-XREF-RETURN-VALID                              62570000
592800             SET EXIT-BEARER-GET TO TRUE                          62580000
592900         END-IF                                                   62590000
593000     END-IF                                                       62600000
593100                                                                  62610000
593200     IF EXIT-BEARER-GET                                           62620000
593300         CONTINUE                                                 62630000
593400     ELSE                                                         62640000
593500         MOVE '050' TO CUSIP-10-11-12                             62650000
593600         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 62660000
593700         PERFORM O-CALL-MSDXREF                                   62670000
593800         IF GETMSD-XREF-RETURN-VALID                              62680000
593900             SET EXIT-BEARER-GET TO TRUE                          62690000
594000         END-IF                                                   62700000
594100     END-IF                                                       62710000
594200                                                                  62720000
594300     IF EXIT-BEARER-GET                                           62730000
594400         CONTINUE                                                 62740000
594500     ELSE                                                         62750000
594600         MOVE '060' TO CUSIP-10-11-12                             62760000
594700         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 62770000
594800         PERFORM O-CALL-MSDXREF                                   62780000
594900         IF GETMSD-XREF-RETURN-VALID                              62790000
595000             SET EXIT-BEARER-GET TO TRUE                          62800000
595100         END-IF                                                   62810000
595200     END-IF                                                       62820000
595300                                                                  62830000
595400     IF EXIT-BEARER-GET                                           62840000
595500         CONTINUE                                                 62850000
595600     ELSE                                                         62860000
595700         MOVE '000' TO CUSIP-10-11-12                             62870000
595800         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 62880000
595900         PERFORM O-CALL-MSDXREF                                   62890000
596000         IF GETMSD-XREF-RETURN-VALID                              62900000
596100             SET EXIT-BEARER-GET TO TRUE                          62910000
596200         END-IF                                                   62920000
596300     END-IF                                                       62930000
596400                                                                  62940000
596500     IF EXIT-BEARER-GET                                           62950000
596600         CONTINUE                                                 62960000
596700     ELSE                                                         62970000
596800         MOVE '030' TO CUSIP-10-11-12                             62980000
596900         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 62990000
597000         PERFORM O-CALL-MSDXREF                                   63000000
597100     END-IF.                                                      63010000
597200/                                                                 63020000
597300******************************************************************63030000
597400*** PERFORMED BY:                                              ***63040000
597500***     O-GET-ADP-CUSIP-NBR                                    ***63050000
597600***     O-BOND-TEST-RTN                                        ***63060000
597700******************************************************************63070000
597800                                                                  63080000
597900 O-GET-ADP-REGISTERED-BOND.                                       63090000
598000                                                                  63100000
598100     SET ENTER-REGISTERED-GET TO TRUE                             63110000
598200     MOVE FMT-CUSIP-NUM TO CUSIP-1-9                              63120000
598300                                                                  63130000
598400     MOVE '060' TO CUSIP-10-11-12                                 63140000
598500     MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                     63150000
598600     PERFORM O-CALL-MSDXREF                                       63160000
598700     IF  GETMSD-XREF-RETURN-VALID                                 63170000
598800         SET EXIT-REGISTERED-GET TO TRUE                          63180000
598900     END-IF                                                       63190000
599000                                                                  63200000
599100     IF EXIT-REGISTERED-GET                                       63210000
599200         CONTINUE                                                 63220000
599300     ELSE                                                         63230000
599400         MOVE '020' TO CUSIP-10-11-12                             63240000
599500         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63250000
599600         PERFORM O-CALL-MSDXREF                                   63260000
599700         IF  GETMSD-XREF-RETURN-VALID                             63270000
599800             SET EXIT-REGISTERED-GET TO TRUE                      63280000
599900         END-IF                                                   63290000
600000     END-IF                                                       63300000
600100                                                                  63310000
600200     IF EXIT-REGISTERED-GET                                       63320000
600300         CONTINUE                                                 63330000
600400     ELSE                                                         63340000
600500         MOVE '040' TO CUSIP-10-11-12                             63350000
600600         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63360000
600700         PERFORM O-CALL-MSDXREF                                   63370000
600800         IF  GETMSD-XREF-RETURN-VALID                             63380000
600900             SET EXIT-REGISTERED-GET TO TRUE                      63390000
601000         END-IF                                                   63400000
601100     END-IF                                                       63410000
601200                                                                  63420000
601300     IF EXIT-REGISTERED-GET                                       63430000
601400         CONTINUE                                                 63440000
601500     ELSE                                                         63450000
601600         MOVE '050' TO CUSIP-10-11-12                             63460000
601700         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63470000
601800         PERFORM O-CALL-MSDXREF                                   63480000
601900         IF GETMSD-XREF-RETURN-VALID                              63490000
602000             SET EXIT-REGISTERED-GET TO TRUE                      63500000
602100         END-IF                                                   63510000
602200     END-IF                                                       63520000
602300                                                                  63530000
602400     IF EXIT-REGISTERED-GET                                       63540000
602500         CONTINUE                                                 63550000
602600     ELSE                                                         63560000
602700         MOVE '010' TO CUSIP-10-11-12                             63570000
602800         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63580000
602900         PERFORM O-CALL-MSDXREF                                   63590000
603000         IF GETMSD-XREF-RETURN-VALID                              63600000
603100             SET EXIT-REGISTERED-GET TO TRUE                      63610000
603200         END-IF                                                   63620000
603300     END-IF                                                       63630000
603400                                                                  63640000
603500     IF EXIT-REGISTERED-GET                                       63650000
603600         CONTINUE                                                 63660000
603700     ELSE                                                         63670000
603800         MOVE '000' TO CUSIP-10-11-12                             63680000
603900         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63690000
604000         PERFORM O-CALL-MSDXREF                                   63700000
604100         IF GETMSD-XREF-RETURN-VALID                              63710000
604200             SET EXIT-REGISTERED-GET TO TRUE                      63720000
604300         END-IF                                                   63730000
604400     END-IF                                                       63740000
604500                                                                  63750000
604600     IF EXIT-REGISTERED-GET                                       63760000
604700         CONTINUE                                                 63770000
604800     ELSE                                                         63780000
604900         MOVE '030' TO CUSIP-10-11-12                             63790000
605000         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 63800000
605100         PERFORM O-CALL-MSDXREF                                   63810000
605200     END-IF.                                                      63820000
605300/                                                                 63830000
605400******************************************************************63840000
605500*** PERFORMED BY:                                              ***63850000
605600***     O-GET-ADP-CUSIP-NBR                                    ***63860000
605700***     O-BOND-TEST-RTN                                        ***63870000
605800******************************************************************63880000
605900                                                                  63890000
606000 O-GET-ADP-MUNI-BOND.                                             63900000
606100                                                                  63910000
606200     SET ENTER-MUNI-GET TO TRUE                                   63920000
606300     MOVE FMT-CUSIP-NUM TO CUSIP-1-9                              63930000
606400                                                                  63940000
606500     MOVE '060' TO CUSIP-10-11-12                                 63950000
606600     MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                     63960000
606700     PERFORM O-CALL-MSDXREF                                       63970000
606800     IF  GETMSD-XREF-RETURN-VALID                                 63980000
606900         SET EXIT-MUNI-GET TO TRUE                                63990000
607000     END-IF                                                       64000000
607100                                                                  64010000
607200     IF EXIT-MUNI-GET                                             64020000
607300         CONTINUE                                                 64030000
607400     ELSE                                                         64040000
607500         MOVE '040' TO CUSIP-10-11-12                             64050000
607600         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64060000
607700         PERFORM O-CALL-MSDXREF                                   64070000
607800         IF  GETMSD-XREF-RETURN-VALID                             64080000
607900             SET EXIT-MUNI-GET TO TRUE                            64090000
608000         END-IF                                                   64100000
608100     END-IF                                                       64110000
608200                                                                  64120000
608300     IF EXIT-MUNI-GET                                             64130000
608400         CONTINUE                                                 64140000
608500     ELSE                                                         64150000
608600         MOVE '050' TO CUSIP-10-11-12                             64160000
608700         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64170000
608800         PERFORM O-CALL-MSDXREF                                   64180000
608900         IF GETMSD-XREF-RETURN-VALID                              64190000
609000             SET EXIT-MUNI-GET TO TRUE                            64200000
609100         END-IF                                                   64210000
609200     END-IF                                                       64220000
609300                                                                  64230000
609400     IF EXIT-MUNI-GET                                             64240000
609500         CONTINUE                                                 64250000
609600     ELSE                                                         64260000
609700         MOVE '010' TO CUSIP-10-11-12                             64270000
609800         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64280000
609900         PERFORM O-CALL-MSDXREF                                   64290000
610000         IF GETMSD-XREF-RETURN-VALID                              64300000
610100             SET EXIT-MUNI-GET TO TRUE                            64310000
610200         END-IF                                                   64320000
610300     END-IF                                                       64330000
610400                                                                  64340000
610500     IF EXIT-MUNI-GET                                             64350000
610600         CONTINUE                                                 64360000
610700     ELSE                                                         64370000
610800         MOVE '020' TO CUSIP-10-11-12                             64380000
610900         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64390000
611000         PERFORM O-CALL-MSDXREF                                   64400000
611100         IF GETMSD-XREF-RETURN-VALID                              64410000
611200             SET EXIT-MUNI-GET TO TRUE                            64420000
611300         END-IF                                                   64430000
611400     END-IF                                                       64440000
611500                                                                  64450000
611600     IF EXIT-MUNI-GET                                             64460000
611700         CONTINUE                                                 64470000
611800     ELSE                                                         64480000
611900         MOVE '030' TO CUSIP-10-11-12                             64490000
612000         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64500000
612100         PERFORM O-CALL-MSDXREF                                   64510000
612200         IF GETMSD-XREF-RETURN-VALID                              64520000
612300             SET EXIT-MUNI-GET TO TRUE                            64530000
612400         END-IF                                                   64540000
612500     END-IF                                                       64550000
612600                                                                  64560000
612700     IF EXIT-MUNI-GET                                             64570000
612800         CONTINUE                                                 64580000
612900     ELSE                                                         64590000
613000         MOVE '000' TO CUSIP-10-11-12                             64600000
613100         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64610000
613200         PERFORM O-CALL-MSDXREF                                   64620000
613300         IF GETMSD-XREF-RETURN-VALID                              64630000
613400             SET EXIT-MUNI-GET TO TRUE                            64640000
613500         END-IF                                                   64650000
613600     END-IF.                                                      64660000
613700/                                                                 64670000
613800******************************************************************64680000
613900*** PERFORMED BY:                                              ***64690000
614000***     O-GET-ADP-CUSIP-NBR                                    ***64700000
614100***     O-BOND-TEST-RTN                                        ***64710000
614200******************************************************************64720000
614300                                                                  64730000
614400 O-GET-ADP-STOCK.                                                 64740000
614500                                                                  64750000
614600     SET ENTER-STOCK-GET TO TRUE                                  64760000
614700     MOVE  FMT-CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                64770000
614800     PERFORM O-CALL-MSDXREF                                       64780000
614900     IF GETMSD-XREF-RETURN-VALID                                  64790000
615000         SET EXIT-STOCK-GET TO TRUE                               64800000
615100     END-IF                                                       64810000
615200                                                                  64820000
615300     IF EXIT-STOCK-GET                                            64830000
615400         CONTINUE                                                 64840000
615500     ELSE                                                         64850000
615600         IF  FMT-CUSIP-NUM1 ALPHABETIC                            64860000
615700         OR  FMT-CUSIP-NUM2 ALPHABETIC                            64870000
615800             CONTINUE                                             64880000
615900         ELSE                                                     64890000
616000             SET EXIT-STOCK-GET TO TRUE                           64900000
616100         END-IF                                                   64910000
616200     END-IF                                                       64920000
616300                                                                  64930000
616400     IF EXIT-STOCK-GET                                            64940000
616500         CONTINUE                                                 64950000
616600     ELSE                                                         64960000
616700         MOVE FMT-CUSIP-NUM TO CUSIP-1-9                          64970000
616800         MOVE '010' TO CUSIP-10-11-12                             64980000
616900         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 64990000
617000         PERFORM O-CALL-MSDXREF                                   65000000
617100         IF GETMSD-XREF-RETURN-VALID                              65010000
617200             SET EXIT-STOCK-GET TO TRUE                           65020000
617300         END-IF                                                   65030000
617400     END-IF                                                       65040000
617500                                                                  65050000
617600     IF EXIT-STOCK-GET                                            65060000
617700         CONTINUE                                                 65070000
617800     ELSE                                                         65080000
617900         MOVE '020' TO CUSIP-10-11-12                             65090000
618000         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 65100000
618100         PERFORM O-CALL-MSDXREF                                   65110000
618200         IF GETMSD-XREF-RETURN-VALID                              65120000
618300             SET EXIT-STOCK-GET TO TRUE                           65130000
618400         END-IF                                                   65140000
618500     END-IF                                                       65150000
618600                                                                  65160000
618700     IF EXIT-STOCK-GET                                            65170000
618800         CONTINUE                                                 65180000
618900     ELSE                                                         65190000
619000         MOVE '040' TO CUSIP-10-11-12                             65200000
619100         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 65210000
619200         PERFORM O-CALL-MSDXREF                                   65220000
619300         IF GETMSD-XREF-RETURN-VALID                              65230000
619400             SET EXIT-STOCK-GET TO TRUE                           65240000
619500         END-IF                                                   65250000
619600     END-IF                                                       65260000
619700                                                                  65270000
619800     IF EXIT-STOCK-GET                                            65280000
619900         CONTINUE                                                 65290000
620000     ELSE                                                         65300000
620100         MOVE '050' TO CUSIP-10-11-12                             65310000
620200         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 65320000
620300         PERFORM O-CALL-MSDXREF                                   65330000
620400         IF GETMSD-XREF-RETURN-VALID                              65340000
620500             SET EXIT-STOCK-GET TO TRUE                           65350000
620600         END-IF                                                   65360000
620700     END-IF                                                       65370000
620800                                                                  65380000
620900     IF EXIT-STOCK-GET                                            65390000
621000         CONTINUE                                                 65400000
621100     ELSE                                                         65410000
621200         MOVE '060' TO CUSIP-10-11-12                             65420000
621300         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 65430000
621400         PERFORM O-CALL-MSDXREF                                   65440000
621500         IF GETMSD-XREF-RETURN-VALID                              65450000
621600             SET EXIT-STOCK-GET TO TRUE                           65460000
621700         END-IF                                                   65470000
621800     END-IF                                                       65480000
621900                                                                  65490000
622000     IF EXIT-STOCK-GET                                            65500000
622100         CONTINUE                                                 65510000
622200     ELSE                                                         65520000
622300         MOVE '030' TO CUSIP-10-11-12                             65530000
622400         MOVE CUSIP-NUM TO GETMSD-XREF-SEARCH-KEY                 65540000
622500         PERFORM O-CALL-MSDXREF                                   65550000
622600         IF GETMSD-XREF-RETURN-VALID                              65560000
622700             SET EXIT-STOCK-GET TO TRUE                           65570000
622800         END-IF                                                   65580000
622900     END-IF.                                                      65590000
623000/                                                                 65600000
623100******************************************************************65610000
623200*** PERFORMED BY:                                              ***65620000
623300***     O-GET-ADP-CUSIP-NBR                                    ***65630000
623400******************************************************************65640000
623500                                                                  65650000
623600 O-BOND-TEST-RTN.                                                 65660000
623700     EVALUATE TRUE                                                65670000
623800         WHEN (FMT-CUSIP-NUM1 ALPHABETIC) OR                      65680000
623900              (FMT-CUSIP-NUM2 ALPHABETIC)                         65690000
624000             IF FMT-REGIST-BOND                                   65700000
624100                 IF FMT-CATEGORY = 'MB'                           65710000
624200                     PERFORM O-GET-ADP-MUNI-BOND                  65720000
624300                 ELSE                                             65730000
624400                     PERFORM O-GET-ADP-REGISTERED-BOND            65740000
624500                 END-IF                                           65750000
624600             END-IF                                               65760000
624700         WHEN OTHER                                               65770000
624800             PERFORM O-GET-ADP-STOCK                              65780000
624900     END-EVALUATE.                                                65790000
625000/                                                                 65800000
625100******************************************************************65810000
625200*** PERFORMED BY:                                              ***65820000
625300***     O-GET-ADP-CUSIP-NBR                                    ***65830000
625400******************************************************************65840000
625500                                                                  65850000
625600 O-GET-ADP-OPTION.                                                65860000
625700                                                                  65870000
625800     PERFORM O-GET-ADP-SYMBOL                                     65880000
625900                                                                  65890000
626000     DISPLAY 'WS-ADP-SYMBOL1 = ' WS-ADP-SYMBOL                    65900000
626100     IF SYMBOL-IS-FOUND                                           65910000
626200         MOVE WS-ADP-SYMBOL TO GETMSD-XREF-SEARCH-KEY             65920000
626300         PERFORM O-CALL-MSDXREF                                   65930000
626400         IF GETMSD-XREF-RETURN-VALID                              65940000
626500             CONTINUE                                             65950000
626600         ELSE                                                     65960000
626700             PERFORM O-GET-ADP-OPTION-AMEX                        65970000
626800         END-IF                                                   65980000
626900     ELSE                                                         65990000
627000         PERFORM O-GET-ADP-OPTION-AMEX                            66000000
627100     END-IF.                                                      66010000
627200/                                                                 66020000
627300******************************************************************66030000
627400*** PERFORMED BY:                                              ***66040000
627500***     O-GET-ADP-OPTION (2 PLACES)                            ***66050000
627600******************************************************************66060000
627700                                                                  66070000
627800 O-GET-ADP-OPTION-AMEX.                                           66080000
627900                                                                  66090000
628000     PERFORM O-GET-ADP-AMEX-SYMBOL                                66100000
628100     DISPLAY 'WS-ADP-SYMBOL2 = ' WS-ADP-SYMBOL                    66110000
628200                                                                  66120000
628300     IF SYMBOL-IS-FOUND                                           66130000
628400         MOVE WS-ADP-SYMBOL TO GETMSD-XREF-SEARCH-KEY             66140000
628500         PERFORM O-CALL-MSDXREF                                   66150000
628600     END-IF.                                                      66160000
628700/                                                                 66170000
628800******************************************************************66180000
628900*** PERFORMED BY:                                              ***66190000
629000***     O-GET-ADP-OPTION                                       ***66200000
629100******************************************************************66210000
629200                                                                  66220000
629300 O-GET-ADP-SYMBOL.                                                66230000
629400                                                                  66240000
629500     SET ENTER-SYMBOL-SEARCH TO TRUE                              66250000
629600     MOVE 'Y' TO SYMBOL-SW                                        66260000
629700     MOVE SPACES TO WS-ADP-SYMBOL                                 66270000
629800     MOVE +1 TO FMT-SYMBOL-SUB                                    66280000
629900     MOVE +2 TO ADP-SYMBOL-SUB                                    66290000
630000                                                                  66300000
630100     EVALUATE TRUE                                                66310000
630200         WHEN (FMT-BUY AND FMT-OPEN) OR (FMT-SELL AND FMT-CLOSE)  66320000
630300             MOVE 'Q' TO WS-ADP-SYMBOL-CHAR (1)                   66330000
630400             PERFORM O-GET-ADP-SYMBOL-SEARCH                      66340000
630500         WHEN (FMT-SELL AND FMT-OPEN) OR (FMT-BUY AND FMT-CLOSE)  66350000
630600             MOVE 'X' TO WS-ADP-SYMBOL-CHAR (1)                   66360000
630700             PERFORM O-GET-ADP-SYMBOL-SEARCH                      66370000
630800         WHEN OTHER                                               66380000
630900             MOVE 'N' TO SYMBOL-SW                                66390000
631000             SET EXIT-SYMBOL-SEARCH TO TRUE                       66400000
631100     END-EVALUATE.                                                66410000
631200/                                                                 66420000
631300******************************************************************66430000
631400*** PERFORMED BY:                                              ***66440000
631500***     O-GET-ADP-SYMBOL (2 PLACES)                            ***66450000
631600******************************************************************66460000
631700                                                                  66470000
631800 O-GET-ADP-SYMBOL-SEARCH.                                         66480000
631900     MOVE FMT-OPTION-SYMBOL TO WS-FMT-SYMBOL                      66490000
632000     PERFORM O-MOVE-SYMBOL-TO-ADP-SYMBOL                          66500000
632100         UNTIL WS-FMT-SYMBOL-CHAR (FMT-SYMBOL-SUB) = SPACES       66510000
632200         OR    FMT-SYMBOL-SUB > 6                                 66520000
632300     IF WS-ADP-SYMBOL-CHAR (2) = SPACES                           66530000
632400         MOVE 'N' TO SYMBOL-SW                                    66540000
632500         SET EXIT-SYMBOL-SEARCH TO TRUE                           66550000
632600     ELSE                                                         66560000
632700         SEARCH ALL EXP-MONTH-ENTRY                               66570000
632800             AT END                                               66580000
632900                 MOVE 'N' TO SYMBOL-SW                            66590000
633000                 SET EXIT-SYMBOL-SEARCH TO TRUE                   66600000
633100             WHEN EXP-MONTH (EXP-MONTH-IND) = FMT-OPT-EXP-MM      66610000
633200                 PERFORM O-MOVE-EXP-MONTH-TO-ADP-SYMBOL           66620000
633300         END-SEARCH                                               66630000
633400     END-IF                                                       66640000
633500                                                                  66650000
633600     IF EXIT-SYMBOL-SEARCH                                        66660000
633700         CONTINUE                                                 66670000
633800     ELSE                                                         66680000
633900         SEARCH ALL STR-PRICE-ENTRY                               66690000
634000             AT END                                               66700000
634100                 MOVE 'N' TO SYMBOL-SW                            66710000
634200                 SET EXIT-SYMBOL-SEARCH TO TRUE                   66720000
634300             WHEN STR-PRICE (STR-PRICE-IND) =                     66730000
634400                 FMT-OPT-PRICE-POS2-3                             66740000
634500                 MOVE STR-PRICE-A (STR-PRICE-IND) TO              66750000
634600                     WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)          66760000
634700         END-SEARCH                                               66770000
634800     END-IF.                                                      66780000
634900/                                                                 66790000
635000******************************************************************66800000
635100*** PERFORMED BY:                                              ***66810000
635200***     O-GET-ADP-SYMBOL-SEARCH                                ***66820000
635300******************************************************************66830000
635400                                                                  66840000
635500 O-MOVE-SYMBOL-TO-ADP-SYMBOL.                                     66850000
635600                                                                  66860000
635700     MOVE WS-FMT-SYMBOL-CHAR (FMT-SYMBOL-SUB)                     66870000
635800         TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)                   66880000
635900                                                                  66890000
636000     ADD +1 TO FMT-SYMBOL-SUB                                     66900000
636100     ADD +1 TO ADP-SYMBOL-SUB.                                    66910000
636200/                                                                 66920000
636300******************************************************************66930000
636400*** PERFORMED BY:                                              ***66940000
636500***     O-GET-ADP-SYMBOL-SEARCH                                ***66950000
636600******************************************************************66960000
636700                                                                  66970000
636800 O-MOVE-EXP-MONTH-TO-ADP-SYMBOL.                                  66980000
636900                                                                  66990000
637000     IF FMT-PUT                                                   67000000
637100         MOVE EXP-MONTH-PUT (EXP-MONTH-IND)                       67010000
637200             TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)               67020000
637300     ELSE                                                         67030000
637400         MOVE EXP-MONTH-CALL (EXP-MONTH-IND)                      67040000
637500             TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)               67050000
637600     END-IF                                                       67060000
637700                                                                  67070000
637800     ADD +1 TO ADP-SYMBOL-SUB.                                    67080000
637900/                                                                 67090000
638000******************************************************************67100000
638100*** PERFORMED BY:                                              ***67110000
638200***     O-GET-ADP-OPTION-AMEX                                  ***67120000
638300******************************************************************67130000
638400                                                                  67140000
638500 O-GET-ADP-AMEX-SYMBOL.                                           67150000
638600                                                                  67160000
638700     MOVE 'Y' TO SYMBOL-SW                                        67170000
638800     IF FMT-OPT-PRICE IS NOT NUMERIC                              67180000
638900         MOVE 'N' TO SYMBOL-SW                                    67190000
639000     ELSE                                                         67200000
639100         IF FMT-OPT-PRICE-POS1 NOT = '0'                          67210000
639200             MOVE FMT-OPT-PRICE-POS1                              67220000
639300                 TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)           67230000
639400             ADD +1 TO ADP-SYMBOL-SUB                             67240000
639500         END-IF                                                   67250000
639600         MOVE FMT-OPT-PRICE-POS2                                  67260000
639700             TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)               67270000
639800         ADD +1 TO ADP-SYMBOL-SUB                                 67280000
639900         MOVE FMT-OPT-PRICE-POS3                                  67290000
640000             TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)               67300000
640100     END-IF.                                                      67310000
640200/                                                                 67320000
640300******************************************************************67330000
640400*** PERFORMED BY:                                              ***67340000
640500***     O-GET-ADP-BEARER-BOND (7 PLACES)                       ***67350000
640600***     O-GET-ADP-REGISTERED-BOND (7 PLACES)                   ***67360000
640700***     O-GET-ADP-MUNI-BOND (7 PLACES)                         ***67370000
640800***     O-GET-ADP-STOCK (7 PLACES)                             ***67380000
640900***     O-GET-ADP-OPTION                                       ***67390000
641000***     O-GET-ADP-OPTION-AMEX                                  ***67400000
641100******************************************************************67410000
641200                                                                  67420000
641300 O-CALL-MSDXREF.                                                  67430000
641400                                                                  67440000
641500     CALL  GETXREF  USING MSD-SYM-CUSIP-XREF-RECORD.              67450000
641600                                                                  67460000
641700     EVALUATE TRUE                                                67470000
641800         WHEN  GETMSD-XREF-RETURN-VALID                           67480000
641900             MOVE MSXREF-ADP-NO TO FMT-ADP-SEC-NO                 67490000
642000                                                                  67500000
642100         WHEN  GETMSD-XREF-RETURN-NOT-FOUND                       67510000
642200           OR  GETMSD-XREF-RETURN-INV-CUSIP                       67520000
642300           OR  GETMSD-XREF-RETURN-KEY-IS-SEC                      67530000
642400             CONTINUE                                             67540000
642500                                                                  67550000
642600         WHEN  NOT GETMSD-XREF-RETURN-EOF                         67560000
642700             DISPLAY 'ZGETXREF CALL ROUTINE FAILED, RC = '        67570000
642800                      GETMSD-XREF-RETURN-CODE                     67580000
642900             CALL ABEND        USING ABEND-CODE-4000              67590000
643000         WHEN  OTHER                                              67600000
643100             CONTINUE                                             67610000
643200     END-EVALUATE.                                                67620000
643300/                                                                 67630000
643400******************************************************************67640000
643500*** PERFORMED BY:                                              ***67650000
643600***     O-GET-OPTION-OFFSET-ACT-DB                             ***67660000
643700***     O-GET-OPTION-OFFSET-ACT-CR                             ***67670000
643800******************************************************************67680000
643900                                                                  67690000
644000 O-CALL-MSD-FILE.                                                 67700000
644100                                                                  67710000
LRM020     MOVE FMT-TI-ADP-CL-NO TO GETMSD-INIT-CLIENT-PL2              67720000
644200     CALL  GETMSDC  USING GETMSD-INIT-CALLING-INFO                67730000
644300                                                                  67740000
644400     IF  GETMSD-INIT-RETURN  =  'X'                               67750000
644500         DISPLAY 'ZGETMSDC CALL ROUTINE FAILED, RC = '            67760000
644600                      GETMSD-INIT-RETURN                          67770000
644700         CALL ABEND        USING ABEND-CODE-4000                  67780000
644800     END-IF.                                                      67790000
644900/                                                                 67800000
645000******************************************************************67810000
645100*** PERFORMED BY:                                              ***67820000
645200***     O-EDIT-RETURN-SORT-FILE                                ***67830000
645300******************************************************************67840000
645400                                                                  67850000
645500 O-EDIT-CONTRA-BKR-NBR.                                           67860000
645600                                                                  67870000
645700     IF  FMT-CONTRA-BRK-NUM NOT NUMERIC                           67880000
645800         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      67890000
645900         ADD 1 TO NUM-CONTRA-BKR-NON-NUMERIC                      67900000
646000         MOVE FMT-CONTRA-BRK-NUM          TO ERROR-VALUE          67910000
646100         MOVE 'CONTRA BROKER NONNUMERIC'  TO ERROR-MSG            67920000
646200         PERFORM O-PRINT-ERROR-RECORD                             67930000
646300     END-IF.                                                      67940000
646400/                                                                 67950000
646500******************************************************************67960000
646600*** PERFORMED BY:                                              ***67970000
646700***     O-EDIT-RETURN-SORT-FILE                                ***67980000
646800******************************************************************67990000
646900                                                                  68000000
647000 O-EDIT-PRIVATE-RANGE.                                            68010000
647100                                                                  68020000
647200     PERFORM O-PRIVATE-RANGE-RTN                                  68030000
647300     IF  PRNG-FILE-SWITCH = 'Y'                                   68040000
647400         MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                      68050000
647500         ADD 1 TO NUM-INVALID-PRIVATE-RANGE                       68060000
647600         MOVE FMT-ADP-SEC-NO              TO ERROR-VALUE          68070000
647700         MOVE 'INVALID PRIVATE RANGE   '  TO ERROR-MSG            68080000
647800         PERFORM O-PRINT-ERROR-RECORD                             68090000
647900     END-IF.                                                      68100000
648000/                                                                 68110000
648100******************************************************************68120000
648200*** PERFORMED BY:                                              ***68130000
648300***     O-EDIT-RETURN-SORT-FILE                                ***68140000
648400******************************************************************68150000
648500                                                                  68160000
YH0001 O-EDIT-MFC-TRANSFER.                                             68170000
YH0001                                                                  68180000
YH0001     IF FMT-CAGE-TAG NOT > SPACES                                 68190000
YH0001        MOVE FMT-TRNFR-TYPE             TO ERROR-VALUE            68200000
YH0001        MOVE 'NO TAG EXISTS FOR MFC   ' TO ERROR-MSG              68210000
YH0001        PERFORM O-PRINT-ERROR-RECORD                              68220000
YH0001     END-IF.                                                      68230000
648000/                                                                 68240000
648100******************************************************************68250000
648600 O-EDIT-NON-CASH-TYPE.                                            68260000
648700*    PERFORM O-PROC-GETNA-FILE                                    68270000
648800*       THRU O-PROC-GETNA-FILE-EXIT.                              68280000
648900*    IF  GETNA-RETURN-FOUND  AND                                  68290000
649000*        NOT  NAPPA-SEGMENT-MISSING                               68300000
649100*      IF ((FMT-CASH-ACT OR FMT-OTHER-ACT) AND                    68310000
649200*                           NAPPA-ACCT-TYPE (1)  =  ' ') OR       68320000
649300*         (FMT-MARGIN-ACT AND NAPPA-ACCT-TYPE (2) = ' ') OR       68330000
649400*         (FMT-SHORT-ACT AND NAPPA-ACCT-TYPE (5) = ' ')           68340000
649500*        IF  B1-RECV-NON-CASH-TYP (B1-IND)  =  '1'                68350000
649600*            MOVE 'N' TO FMT-REC-IS-VALID-SWITCH                  68360000
649700*            ADD 1 TO NUM-CASH-TYPE-INVALID                       68370000
649800*            IF FMT-MARGIN-ACT                                    68380000
649900*               MOVE 'MARGIN ASSET'           TO ERROR-VALUE      68390000
650000*            ELSE                                                 68400000
650100*              IF FMT-SHORT-ACT                                   68410000
650200*                 MOVE 'SHORT ASSET'          TO ERROR-VALUE      68420000
650300*              ELSE                                               68430000
650400*                 MOVE 'CASH ASSET'           TO ERROR-VALUE      68440000
650500*              END-IF                                             68450000
650600*            END-IF                                               68460000
650700*            MOVE 'ACCOUNT TYPE NOT ON N&A  ' TO ERROR-MSG        68470000
650800*            PERFORM O-PRINT-ERROR-RECORD                         68480000
650900*        ELSE                                                     68490000
651000*          IF  B1-RECV-NON-CASH-TYP (B1-IND)  =  '2'              68500000
651100*            IF  FMT-SHORT-ACT                                    68510000
651200*                SHORT ASSETS ALWAYS BOOK AS SHORT, NO CONV       68520000
651300*                CONTINUE                                         68530000
651400*            ELSE                                                 68540000
651500*              IF  FMT-MARGIN-ACT                                 68550000
651600*                  MRGN ASSETS CONV TO CASH IF NO MRGN ON N&A     68560000
651700*                  SET  FMT-CASH-ACT          TO TRUE             68570000
651800*              ELSE                                               68580000
651900*                  CASH CONV TO MRGN IF ON N&A, ELSE NO CONV      68590000
652000*                IF  NAPPA-ACCT-TYPE (2)  NOT =  ' '              68600000
652100*                    SET FMT-MARGIN-ACT       TO TRUE             68610000
652200*                END-IF                                           68620000
652300*              END-IF                                             68630000
652400*            END-IF                                               68640000
652500*          END-IF                                                 68650000
652600*        END-IF                                                   68660000
652700*      END-IF                                                     68670000
652800*    END-IF.                                                      68680000
652900/                                                                 68690000
653000*                                                                 68700000
653100 O-PROC-GETNA-FILE.                                               68710000
653200     IF  FMT-TI-CUST-ACCOUNT (1:3) = GETNA-KEY-BRANCH3-5 AND      68720000
653300         FMT-TI-CUST-ACCOUNT (4:5) = GETNA-KEY-ACCOUNT6-10        68730000
653400       GO  TO  O-PROC-GETNA-FILE-EXIT.                            68740000
653500     INITIALIZE  GETNA-PARAMETERS.                                68750000
653600     MOVE  'R'                        TO  GETNA-REQ-FUNC.         68760000
653700     MOVE  'R'                        TO  GETNA-REQ-FILE.         68770000
653800     MOVE  'R'                        TO  GETNA-REQ-FUNC2.        68780000
653900     MOVE  'N'                        TO  GETNA-REQ-YEAREND.      68790000
654000     MOVE  PGM-NAME                   TO  GETNA-PGM-NAME.         68800000
654100     MOVE  FMT-TI-ADP-CL-NO           TO  GETNA-KEY-CLIENT.       68810000
654200     MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2.    68820000
654300     MOVE  FMT-TI-CUST-ACCOUNT (1:3)  TO  GETNA-KEY-BRANCH3-5.    68830000
654400     MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5.   68840000
654500     MOVE  FMT-TI-CUST-ACCOUNT (4:5)  TO  GETNA-KEY-ACCOUNT6-10.  68850000
654600     CALL    GETNA               USING GETNA-PARAMETERS           68860000
654700                                       GETNA-SEGMENT-INCLUDES     68870000
654800     END-CALL.                                                    68880000
654900 O-PROC-GETNA-FILE-EXIT.  EXIT.                                   68890000
655000/                                                                 68900000
655100 O-EDIT-RESTRICTED.                                               68910000
655200     MOVE 'N' TO FMT-REC-IS-VALID-SWITCH.                         68920000
655300     MOVE FMT-CUSIP-NUM          TO ERROR-VALUE.                  68930000
655400     MOVE 'RESTRICTED SECURITY      ' TO ERROR-MSG.               68940000
655500     PERFORM O-PRINT-ERROR-RECORD.                                68950000
655600/                                                                 68960000
655700/                                                                 68970000
655800******************************************************************68980000
655900*** PERFORMED BY:                                              ***68990000
656000***     INIT-CHECK-PEND-DATE-HEADER                            ***69000000
656100***     INIT-CHECK-PEND-IS-EMPTY                               ***69010000
656200***     PROCESS-PEND-FILE                                      ***69020000
656300******************************************************************69030000
656400                                                                  69040000
656500 O-READ-PEND-FILE.                                                69050000
656600                                                                  69060000
656700     READ PEND-FILE                                               69070000
656800         AT END                                                   69080000
656900             MOVE 'Y' TO END-OF-PEND-FILE-SWITCH                  69090000
657000             MOVE ALL '9' TO PEND-TI-ADP-CL-NO-X                  69100000
657100         NOT AT END                                               69110000
657200             IF PEND-HEADER-ID                                    69120000
657300                CONTINUE                                          69130000
657400             ELSE                                                 69140000
657500                ADD 1 TO NUM-PEND-RECS-IN                         69150000
657600             END-IF                                               69160000
657700     END-READ.                                                    69170000
657800                                                                  69180000
657900     IF NOT END-OF-PEND-FILE                                      69190000
658000     AND  NOT PEND-HEADER-ID                                      69200000
658100       IF  B1-SERVICE-STATUS(PEND-TI-ADP-CL-NO) NOT > '0'         69210000
658300          GO TO O-READ-PEND-FILE                                  69220000
658400     END-IF.                                                      69230000
658500/                                                                 69240000
658600 O-READ-MPND-FILE.                                                69250000
658700                                                                  69260000
658800     READ MFPEND-FILE                                             69270000
658900         AT END                                                   69280000
659000             MOVE 'Y' TO END-OF-MPND-FILE-SWITCH                  69290000
659100             MOVE ALL '9' TO MPND-TI-ADP-CL-NO-X                  69300000
659200         NOT AT END                                               69310000
659300           IF  MPND-HEADER-ID                                     69320000
659400             GO TO  O-READ-MPND-FILE                              69330000
659500           END-IF                                                 69340000
659600     END-READ.                                                    69350000
659700                                                                  69360000
659800     IF NOT END-OF-MPND-FILE                                      69370000
659900     AND  NOT MPND-HEADER-ID                                      69380000
660000       IF  B1-SERVICE-STATUS(MPND-TI-ADP-CL-NO) NOT > '0'         69390000
660100         DISPLAY 'BYPASS CLIENT MPND DATA ' MPND-TI-ADP-CL-NO-X   69400000
660200         GO TO O-READ-MPND-FILE                                   69410000
660300     END-IF.                                                      69420000
660400/                                                                 69430000
660500******************************************************************69440000
660600*** PERFORMED BY:                                              ***69450000
660700***     O-EDIT-PRIVATE-RANGE-RTN                               ***69460000
660800******************************************************************69470000
660900                                                                  69480000
661000 O-PRIVATE-RANGE-RTN.                                             69490000
661100                                                                  69500000
661200     MOVE  'N'                        TO  PRNG-FILE-SWITCH.       69510000
661300     MOVE  FMT-ADP-SEC-NO             TO  PRNGKEY.                69520000
661400     START  PRNG-FILE  KEY IS NOT < PRNGKEY.                      69530000
661500     IF  PRNG-NOTFOUND                                            69540000
661600         CONTINUE                                                 69550000
661700     ELSE                                                         69560000
661800       IF  NOT PRNG-FILE-OK                                       69570000
661900           DISPLAY 'PRNGFL START KEY ERROR, STATUS = '            69580000
662000                    PRNG-FILE-STATUS                              69590000
662100       ELSE                                                       69600000
662200         READ  PRNG-FILE  NEXT RECORD  END-READ                   69610000
662300           IF  PRNG-ENDFILE  OR  PRNG-NOTFOUND                    69620000
662400               CONTINUE                                           69630000
662500           ELSE                                                   69640000
662600             IF  NOT PRNG-FILE-OK                                 69650000
662700                 DISPLAY 'PRNGFL READ KEY ERROR, STATUS = '       69660000
662800                          PRNG-FILE-STATUS                        69670000
662900             ELSE                                                 69680000
663000               EVALUATE TRUE                                      69690000
663100                   WHEN ((FMT-ADP-SEC-NO  <  PRSECLO)             69700000
663200                              OR                                  69710000
663300                        (PRCLNT  =  '000' OR '096'))              69720000
663400                      CONTINUE                                    69730000
663500                   WHEN (FMT-TI-ADP-CL-NO = (PRCLNT OR            69740000
663600                                           PRACLNT1 OR            69750000
663700                                           PRACLNT2 OR            69760000
663800                                           PRACLNT3 OR            69770000
663900                                           PRACLNT4 OR            69780000
664000                                           PRACLNT5 OR            69790000
664100                                           PRACLNT6 OR            69800000
664200                                           PRACLNT7 ))            69810000
664300                      CONTINUE                                    69820000
664400                   WHEN OTHER                                     69830000
664500                      MOVE 'Y'  TO PRNG-FILE-SWITCH               69840000
664600               END-EVALUATE                                       69850000
664700             END-IF                                               69860000
664800           END-IF                                                 69870000
664900       END-IF                                                     69880000
665000     END-IF.                                                      69890000
665100/                                                                 69900000
665200 READ-NTWREGOP.                                                   69910000
665300***************                                                   69920000
665400                                                                  69930000
665500     MOVE SPACES                      TO  REG-OPT-RECORD-WS.      69940000
LRM050     MOVE SPACES                     TO   NTWIO-MATRIX-LEVEL      69950000
665600     MOVE ' '               TO MF-PROCESS-OPTION                  69960000
665610     MOVE ' '               TO MF-TABLE-MAINTENANCE               69970000
665700     MOVE SPACES                      TO  NTWREG-KEY-IN.          69980000
665800     MOVE FMT-TI-ADP-CL-NO-X          TO  NTWREG-KEY-IN (1:3).    69990000
665900     MOVE FMT-CUSIP-NUM               TO  NTWREG-KEY-IN (6:9).    70000000
TEST       DISPLAY 'ABOUT TO READ NTWREGOP ' FMT-TI-ADP-CL-NO-X         70010000
TEST              ' '  FMT-CUSIP-NUM                                    70020000
666000                                                                  70030000
666100     READ NTWREG-FILE               INTO  REG-OPT-RECORD-WS.      70040000
666200                                                                  70050000
666300     IF NTWREG-FILE-STATUS = '00'                                 70060000
666400      IF FMT-TI-ADP-CL-NO   = CLIENT-NO       AND                 70070000
666500        FMT-CUSIP-NUM      = CUSIP-9                              70071000
LRM050        IF DST-DIRECT                                             70072000
LRM050           DISPLAY                                                70073000
LRM050                     NTWREG-KEY-IN '   FOUND DST'                 70074000
LRM050        END-IF                                                    70075000
LRM050        IF TBL-MNT-SOURCE-SHWB                                    70076000
LRM050           SET MF-DST-SCHWABB  TO TRUE                            70077000
LRM050           DISPLAY                                                70078000
LRM050                     NTWREG-KEY-IN '   FOUND TBL SCHWABB '        70079000
LRM050        END-IF                                                    70080000
LRM003        IF ((OMNIBUS-PROCESSING                                   70090000
LRM029                               OR PNC-SURPAS-PROCESSING)          70100000
LRM002        AND B1-MFN-OMNIBUS-MULTI-PLAT-OPT (B1-IND) = '1')         70110000
LRM050        OR DST-DIRECT                                             70120000
LRM002           MOVE 'R'                 TO NTWIO-FUNCTION-CODE        70130000
LRM002           MOVE FMT-TI-ADP-CL-NO    TO NTWIO-CLIENT               70131000
LRM004           MOVE FMT-CUSIP-NUM       TO NTWIO-CUSIP-9              70132000
LRM002***        IF MS-SYMBOL > SPACES                                  70133000
LRM002***           MOVE MS-SYMBOL        TO NTWIO-SYMBOL               70134000
LRM002***        ELSE                                                   70135000
LRM002***           MOVE MS-CUSIP-NO      TO NTWIO-SYMBOL               70136000
LRM002***        END-IF                                                 70137000
LRM004           MOVE SPACES              TO NTWIO-SYMBOL               70138000
LRM002           PERFORM O-CUST-ACT-MOVE-BR-ACT                         70139000
LRM002           MOVE P2-BK-BR-ACCT-T-C   TO NTWIO-ACCT-ID              70140000
LRM004          IF NTWIO-CUSIP-9 NOT = SPACES                           70150000
LRM002           DISPLAY 'CALLING NTWIO WITH ' NTWIO-REQUEST-PARAMETERS 70160000
LRM002           CALL  BNWNTWIO  USING NTWIO-PARAMETERS                 70170000
LRM002           IF NTWIO-RETURN-OK                                     70180000
LRM004              IF NTWIO-PROCESSING-CODE NOT =                      70190000
LRM004                   PROCESSING-CODE OF REG-OPT-RECORD-WS           70200000
LRM002                 DISPLAY 'BNWNTWIO OVERRIDE PROCESS CODE FROM '   70210000
LRM004                     PROCESSING-CODE OF REG-OPT-RECORD-WS         70220000
LRM002                     ' TO ' NTWIO-PROCESSING-CODE                 70230000
LRM002                 MOVE NTWIO-PROCESSING-CODE                       70240000
LRM002                   TO PROCESSING-CODE OF REG-OPT-RECORD-WS        70250000
LRM004              END-IF                                              70260000
LRM050              IF  NTWIO-MATRIX-LEVEL = '6'                        70270000
LRM050                 DISPLAY 'NTWIO MATRIX LEVEL 6 FOUND'             70280000
LRM050              ELSE                                                70290000
LRM050                 DISPLAY 'NTWIO MATRIX LEVEL FOUND '              70300000
LRM050                      NTWIO-MATRIX-LEVEL                          70310000
LRM050              END-IF                                              70320000
LRM002           ELSE                                                   70330000
LRM002              DISPLAY 'NTWIO FAILED ' NTWIO-RETURN-CODE           70340000
LRM002           END-IF                                                 70350000
LRM004          ELSE                                                    70360000
LRM004            DISPLAY 'SKIP NTWIO CALL NO CUSIP FOR PARMS '         70370000
LRM004                        NTWIO-REQUEST-PARAMETERS                  70380000
LRM004          END-IF                                                  70390000
LRM002        END-IF                                                    70400000
LRM003        IF (OMNIBUS-PROCESSING OR DST-DIRECT                      70410000
LRM029              OR PNC-SURPAS-PROCESSING)                           70420000
LRM003           IF OMNIBUS-PROCESSING                                  70430000
666700             SET OMNIBUS-PROCESS        TO  TRUE                  70440000
666800             DISPLAY FMT-ADP-SEC-NO  ' *** OMNIBUS SECURITY **** '70450000
LRM029           ELSE                                                   70460000
LRM029           IF PNC-SURPAS-PROCESSING                               70470000
LRM029             SET PNC-OMNIBUS-PROCESS    TO  TRUE                  70480000
LRM029             DISPLAY FMT-ADP-SEC-NO  ' *** PNC/OMNI SECURITY *** '70490000
LRM029                ' NTLEV '  NTWK-LVL-3-REG-OPTION                  70500000
LRM003           ELSE                                                   70510000
LRM003             SET DST-MFE-PROCESS        TO  TRUE                  70520000
LRM003             DISPLAY FMT-ADP-SEC-NO  ' *** DST/MFE SECURITY **** '70530000
LRM003           END-IF                                                 70540000
LRM029           END-IF                                                 70550000
666900           PERFORM O-CUST-ACT-MOVE-OMNIBUS                        70560000
667000           MOVE WS-BRANCH      TO  OB-BRANCH                      70570000
667100           MOVE WS-ACCT        TO  OB-ACCT                        70580000
667200           MOVE WS-TYPE        TO  OB-TYPE                        70590000
667300           MOVE WS-CHECK-DIGIT TO  OB-CHECK                       70600000
667400           IF TBL-MNT-SOURCE-NSCC                                 70610000
667500             SET MF-NSCC-SOURCE TO TRUE                           70620000
667510             DISPLAY                                              70630000
667520                     NTWREG-KEY-IN '   FOUND NSCC SOURCE '        70640000
667600           END-IF                                                 70650000
668700        END-IF                                                    70660000
668800      END-IF                                                      70670000
668900     END-IF.                                                      70680000
669000                                                                  70690000
      /                                                                 70700000
DJ0001*********************                                             70710000
DJ0001 O-MFC-P2-CREATE.                                                 70720000
DJ0001*********************                                             70730000
DJ0001                                                                  70740000
DJ0001***--GET OTHER-BROKER NAME FOR DESCRIPTION FIELD TRLR-BRKR        70750000
DJ0001     MOVE  LOW-VALUES            TO  BROKER-KEY                   70760000
DJ0001     MOVE 'O'                    TO  BROKER-EXCHANGE              70770000
DJ0001     MOVE  FMT-CONTRA-BRK-NUM    TO  BROKER-BADGE                 70780000
DJ0001     START BROKER-FILE                                            70790000
DJ0001           KEY IS NOT < BROKER-KEY                                70800000
DJ0001     IF  BROKER-FILE-OK OR                                        70810000
DJ0001         BROKER-ENDFILE                                           70820000
DJ0001         CONTINUE                                                 70830000
DJ0001     ELSE                                                         70840000
DJ0001         DISPLAY 'BRKRFL FILE START ERROR, STATUS = '             70850000
DJ0001                  BROKER-FILE-STATUS                              70860000
DJ0001         DISPLAY 'TRYING TO READ BROKER NUMBER '                  70870000
DJ0001                  FMT-CONTRA-BRK-NUM ' FOR MFC PROCESSING'        70880000
DJ0001         CALL ABEND USING ABEND-CODE-4000                         70890000
DJ0001     END-IF                                                       70900000
DJ0001     READ BROKER-FILE NEXT                                        70910000
DJ0001     IF  BROKER-FILE-OK OR                                        70920000
DJ0001         BROKER-ENDFILE                                           70930000
DJ0001         CONTINUE                                                 70940000
DJ0001     ELSE                                                         70950000
DJ0001         DISPLAY 'BRKRFL FILE READ NEXT ERROR, STATUS = '         70960000
DJ0001                  BROKER-FILE-STATUS                              70970000
DJ0001         DISPLAY 'TRYING TO READ BROKER NUMBER '                  70980000
DJ0001                  FMT-CONTRA-BRK-NUM ' FOR MFC PROCESSING'        70990000
DJ0001         CALL ABEND USING ABEND-CODE-4000                         71000000
DJ0001     END-IF                                                       71010000
DJ0001     IF  BROKER-FILE-OK                                           71020000
DJ0001     AND BROKER-EXCHANGE = 'O'                                    71030000
DJ0001     AND BROKER-BADGE    = FMT-CONTRA-BRK-NUM                     71040000
DJ0001         MOVE BROKER-NAME        TO TRLR-BRKR                     71050000
DJ0001     ELSE                                                         71060000
DJ0001         MOVE 1 TO SUB                                            71070000
DJ0001         PERFORM UNTIL SUB > WS-CATPPL-RECORD-COUNT               71080000
DJ0001              OR FMT-CONTRA-BRK-NUM = WS-CATPPL-BROKER(SUB)       71090000
DJ0001                 ADD 1 TO SUB                                     71100000
DJ0001         END-PERFORM                                              71110000
DJ0001         IF  SUB NOT > WS-CATPPL-RECORD-COUNT                     71120000
DJ0001             MOVE WS-CATPPL-BROKER-NAME(SUB) TO TRLR-BRKR         71121000
DJ0001         ELSE                                                     71122000
DJ0001             MOVE 'NOT ON FILE ' TO TRLR-BRKR                     71123000
DJ0001         END-IF                                                   71124000
DJ0001     END-IF                                                       71125000
DJ0001                                                                  71126000
DJ0001***--COMMON FIELDS                                                71127000
DJ0001     MOVE  ' '                   TO  P2-BK-RECORD                 71128000
DJ0001     MOVE  ' '                   TO  P2-BK-TRAILER-RECORD         71129000
DJ0001     MOVE  'B'                   TO  P2-BK-TRID-X                 71129100
DJ0001     IF  B1-ACAT-MFC-BOOKING-BATCH (B1-IND) > ' '                 71129200
DJ0001         MOVE B1-ACAT-MFC-BOOKING-BATCH (B1-IND)                  71129300
DJ0001                                 TO  P2-BK-BATCH-CODE             71129400
DJ0001     ELSE                                                         71129500
DJ0001         MOVE  'NS'              TO  P2-BK-BATCH-CODE             71129600
DJ0001     END-IF.                                                      71129700
DJ0001     MOVE  FMT-TI-ADP-CL-NO      TO  P2-BK-BROKER-NBR             71129800
DJ0001     IF  B1-ACAT-MFC-BOOKING-ENTRE (B1-IND) > ' '                 71129900
DJ0001         MOVE B1-ACAT-MFC-BOOKING-ENTRE (B1-IND)                  71130000
DJ0001                                 TO  P2-BK-ENTRY-CODE             71130100
DJ0001     ELSE                                                         71130200
DJ0001         MOVE 'MFC'              TO  P2-BK-ENTRY-CODE             71130300
DJ0001     END-IF.                                                      71130400
DJ0001     MOVE  FMT-ASSET-VALUE       TO  P2-BK-AMOUNT                 71130500
DJ0001     MOVE  '000'                 TO  P2-BK-CURRENCY               71130600
DJ0001     MOVE  '00000'               TO  P2-BK-FRACTION-X             71130700
DJ0001     MOVE  P2-BK-TRID-X          TO  P2-BKT-TRID-X                71130800
DJ0001     MOVE  P2-BK-BATCH-CODE      TO  P2-BKT-BATCH-CODE            71130900
DJ0001     MOVE  P2-BK-BROKER-NBR      TO  P2-BKT-BROKER-NBR            71131000
DJ0001     MOVE  '-'                   TO  P2-BKT-HYPHEN                71131100
DJ0001                                                                  71131200
DJ0001     IF  FMT-CLNT-IS-DELIVERER                                    71131300
DJ0001***----                                                           71131400
DJ0001***----FORMAT DELIVERER CREDIT FAIL ACCOUNT                       71131500
DJ0001***----                                                           71131600
DJ0001         MOVE  P2-CREDIT-SIGN        TO  P2-BK-BUY-SELL-CODE      71131700
DJ0001         IF  B1-ACAT-MFC-DELIVERER-ACCOUNT (B1-IND) > ' '         71131800
DJ0001             MOVE B1-ACAT-MFC-DELIVERER-ACCOUNT (B1-IND)          71131900
DJ0001                                     TO  P2-BK-BR-ACCT-T          71132000
DJ0001             MOVE  'X'               TO  P2-BK-CHECK-DIGIT        71132100
DJ0001         ELSE                                                     71132200
DJ0001             MOVE  '0000000406'      TO  P2-BK-BR-ACCT-T-C        71132300
DJ0001         END-IF                                                   71132400
DJ0001         MOVE  'MFC TO   '           TO  TRLR-MSG                 71132500
DJ0001         MOVE  TRLR-MESSAGE          TO  P2-BK-DESCRIPTION        71132600
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-RECORD             71132700
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71132800
DJ0001         MOVE  P2-BK-BUY-SELL-CODE   TO  P2-BKT-BUY-SELL-CODE     71132900
DJ0001         MOVE  P2-BK-BR-ACCT-T-C     TO  P2-BKT-BR-ACCT-T-C       71133000
DJ0001         MOVE  FMT-TI-CONTROL-NUM    TO  TRLT-CNTL-NBR            71133100
DJ0001         MOVE  FMT-CONTRA-BRK-NUM    TO  TRLT-CNTRA-BKR           71133200
DJ0001         MOVE  TRLT-MESSAGE          TO  P2-BKT-DESCRIPTION       71133300
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-TRAILER-RECORD     71133400
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71133500
LRM013         IF B1-ACAT-MFC-TRAILER (B1-IND) > SPACES                 71133600
LRM013            PERFORM O-WRITE-P2-NS-TRAILER                         71133700
LRM013         END-IF                                                   71133800
DJ0001***----                                                           71133900
DJ0001***----FORMAT DELIVERER DEBIT CNS ACCOUNT                         71134000
DJ0001***----                                                           71134100
DJ0001         MOVE  P2-DEBIT-SIGN         TO  P2-BK-BUY-SELL-CODE      71134200
DJ0001         IF  B1-OFFSET-ACC-NUM (B1-IND) > ' '                     71134300
DJ0001             MOVE B1-OFFSET-ACC-NUM (B1-IND)                      71134400
DJ0001                                     TO  P2-BK-BR-ACCT-T          71134500
DJ0001             MOVE  'X'               TO  P2-BK-CHECK-DIGIT        71134600
DJ0001         ELSE                                                     71134700
DJ0001             MOVE CNS-BR-ACCT-T-C    TO  P2-BK-BR-ACCT-T-C        71134800
DJ0001         END-IF                                                   71134900
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-RECORD             71135000
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71135100
DJ0001         MOVE  P2-BK-BUY-SELL-CODE   TO  P2-BKT-BUY-SELL-CODE     71135200
DJ0001         MOVE  P2-BK-BR-ACCT-T-C     TO  P2-BKT-BR-ACCT-T-C       71135300
LRM013         MOVE  TRLT-MESSAGE          TO  P2-BKT-DESCRIPTION       71135400
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-TRAILER-RECORD     71135500
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71135600
LRM013         IF B1-ACAT-MFC-TRAILER (B1-IND) > SPACES                 71135700
LRM013            PERFORM O-WRITE-P2-NS-TRAILER                         71135800
LRM013         END-IF                                                   71135900
DJ0001     END-IF.                                                      71136000
DJ0001                                                                  71136100
DJ0001     IF  FMT-CLNT-IS-RECEIVER                                     71136200
DJ0001***----                                                           71136300
DJ0001***----FORMAT RECEIVER DEBIT  FAIL ACCOUNT                        71136400
DJ0001***----                                                           71136500
DJ0001         MOVE  P2-DEBIT-SIGN         TO  P2-BK-BUY-SELL-CODE      71136600
DJ0001         IF  B1-ACAT-MFC-RECEIVER-ACCOUNT (B1-IND) > ' '          71136700
DJ0001             MOVE B1-ACAT-MFC-RECEIVER-ACCOUNT (B1-IND)           71136800
DJ0001                                     TO  P2-BK-BR-ACCT-T          71136900
DJ0001             MOVE  'X'               TO  P2-BK-CHECK-DIGIT        71137000
DJ0001         ELSE                                                     71137100
DJ0001             MOVE  '0000000307'      TO  P2-BK-BR-ACCT-T-C        71137200
DJ0001         END-IF                                                   71137300
DJ0001         MOVE  'MFC FROM '           TO  TRLR-MSG                 71137400
DJ0001         MOVE  TRLR-MESSAGE          TO  P2-BK-DESCRIPTION        71137500
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-RECORD             71137600
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71137700
DJ0001         MOVE  P2-BK-BUY-SELL-CODE   TO  P2-BKT-BUY-SELL-CODE     71137800
DJ0001         MOVE  P2-BK-BR-ACCT-T-C     TO  P2-BKT-BR-ACCT-T-C       71137900
DJ0001         MOVE  FMT-TI-CONTROL-NUM    TO  TRLT-CNTL-NBR            71138000
DJ0001         MOVE  FMT-CONTRA-BRK-NUM    TO  TRLT-CNTRA-BKR           71138100
DJ0001         MOVE  TRLT-MESSAGE          TO  P2-BKT-DESCRIPTION       71138200
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-TRAILER-RECORD     71138300
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71138400
LRM013         IF B1-ACAT-MFC-TRAILER (B1-IND) > SPACES                 71138500
LRM013            PERFORM O-WRITE-P2-NS-TRAILER                         71138600
LRM013         END-IF                                                   71138700
DJ0001***----                                                           71138800
DJ0001***----FORMAT RECEIVER CREDIT CNS ACCOUNT                         71138900
DJ0001***----                                                           71139000
DJ0001         MOVE  P2-CREDIT-SIGN        TO  P2-BK-BUY-SELL-CODE      71139100
DJ0001         IF  B1-OFFSET-ACC-NUM (B1-IND) > ' '                     71139200
DJ0001             MOVE B1-OFFSET-ACC-NUM (B1-IND)                      71139300
DJ0001                                     TO  P2-BK-BR-ACCT-T          71139400
DJ0001             MOVE  'X'               TO  P2-BK-CHECK-DIGIT        71139500
DJ0001         ELSE                                                     71139600
DJ0001             MOVE CNS-BR-ACCT-T-C    TO  P2-BK-BR-ACCT-T-C        71139700
DJ0001         END-IF                                                   71139800
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-RECORD             71139900
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71140000
DJ0001         MOVE  P2-BK-BUY-SELL-CODE   TO  P2-BKT-BUY-SELL-CODE     71140100
DJ0001         MOVE  P2-BK-BR-ACCT-T-C     TO  P2-BKT-BR-ACCT-T-C       71140200
LRM013         MOVE  TRLT-MESSAGE          TO  P2-BKT-DESCRIPTION       71140300
DJ0001         WRITE P2BKPG-RECORD       FROM  P2-BK-TRAILER-RECORD     71140400
DJ0001         ADD 1 TO TOT-CL-P2-RECS-WRITTEN                          71140500
LRM013         IF B1-ACAT-MFC-TRAILER (B1-IND) > SPACES                 71140600
LRM013            PERFORM O-WRITE-P2-NS-TRAILER                         71140700
LRM013         END-IF                                                   71140800
DJ0001     END-IF.                                                      71140900
DJ0001                                                                  71141000
DJ0001 O-MFC-P2-CREATE-EXIT. EXIT.                                      71141100
669100     EJECT                                                        71141200
      /                                                                 71141300
YH0001*********************                                             71141400
YH0001 O-MFC-P2-CREATE-NEW.                                             71141500
YH0001*********************                                             71141600
YH0001                                                                  71141700
YH0001     MOVE FMT-ADP-SEC-NO  TO P2-BK-SECURITY-NBR.                  71141800
YH0001                                                                  71141900
YH0001     IF  FMT-NTWRK-CNTL-CD = ' '                                  71142000
YH0001         PERFORM MFC-NTWRK-CODE                                   71142100
YH0001         DISPLAY '***NETWROK NEW  = ' FMT-NTWRK-CNTL-CD           71142200
YH0001     END-IF                                                       71142300
YH0001                                                                  71142400
YH0001     IF  FMT-CLNT-IS-DELIVERER                                    71142500
YH0001        PERFORM O-BK-MEMO-CR-QUANTITY                             71142600
YH0001        IF FMT-CAGE-TAG > SPACES                                  71142700
YH0001          PERFORM O-BK-PEND-DB-VALUE                              71142800
YH0001          PERFORM O-RD-CL-CR-VALUE-CR-QUANTITY                    71142900
YH0001        ELSE                                                      71143000
YH0001          PERFORM O-BK-OFFSET-DB-VALUE                            71143100
YH0001          PERFORM O-BK-PEND-CR-BOTH                               71143200
YH0001        END-IF                                                    71143300
YH0001     ELSE                                                         71143400
YH0001       PERFORM O-BK-MEMO-DB-QUANTITY                              71143500
YH0001       IF FMT-CAGE-TAG > SPACES                                   71143600
YH0001          PERFORM O-BK-PEND-CR-VALUE                              71143700
YH0001          PERFORM O-RD-CL-DB-VALUE-DB-QUANTITY                    71143800
YH0001       ELSE                                                       71143900
YH0001          PERFORM O-BK-OFFSET-CR-VALUE                            71144000
YH0001          PERFORM O-BK-PEND-DB-BOTH                               71144100
YH0001       END-IF                                                     71144200
YH0001     END-IF.                                                      71144300
YH0001                                                                  71144400
YH0001 MFC-NTWRK-CODE.                                                  71144500
                                                                        71144600
           MOVE B1-NTWRK-CNTL-CD (B1-IND)  TO FMT-NTWRK-CNTL-CD         71144700
                                                                        71144800
           IF NTWREG-FILE-STATUS = '00'                                 71144900
             IF REG-OP-HOUSE-ACCT  > SPACES                             71145000
                MOVE '0'                      TO FMT-NTWRK-CNTL-CD      71145100
             END-IF                                                     71145200
                                                                        71145300
             IF (OMNIBUS-PROCESS    OR DST-MFE-PROCESS                  71145400
LRM029                  OR PNC-OMNIBUS-PROCESS)                         71145500
               MOVE '0'                      TO FMT-NTWRK-CNTL-CD       71145600
                                                                        71145700
               IF DST-MFE-PROCESS                                       71145800
                AND  B1-DST-OFFSET (B1-IND)    = 'Y'                    71145900
                 MOVE '3'                   TO  FMT-NTWRK-CNTL-CD       71146000
               ELSE                                                     71147000
                 IF MF-NSCC-SOURCE                                      71148000
                  AND  B1-NS-BRCH-OFFSET (B1-IND)    = 'Y'              71149000
                  MOVE '3'                   TO  FMT-NTWRK-CNTL-CD      71150000
LRM029           ELSE                                                   71160000
LRM029             IF PNC-OMNIBUS-PROCESS                               71170000
LRM029              AND B1-PNC-SURPAS-OFFSET (B1-IND) > SPACES          71180000
LRM029              MOVE '3'                 TO  FMT-NTWRK-CNTL-CD      71190000
LRM029             END-IF                                               71200000
               END-IF                                                   71210000
             END-IF                                                     71220000
YH0001     END-IF.                                                      71230000
                                                                        71240000
669100     EJECT                                                        71250000
LRM019 PROCESS-POST-SETTLE-FUNDSERV.                                    71260000
LRM019     READ POST-SETTLE-FILE                                        71270000
LRM019        AT END SET POST-SETTLE-EOF TO TRUE                        71280000
LRM019     END-READ.                                                    71290000
LRM019     IF NOT POST-SETTLE-EOF                                       71300000
LRM019        IF POST-HEADER-ID                                         71310000
LRM019           DISPLAY 'FOUND POST SETTLE HEADER ' POST-BOOK-DATE     71320000
LRM019        ELSE                                                      71330000
LRM019        IF POST-TI-RECORD-ID                                      71340000
LRM019           MOVE POST-TI-RECORD TO FMT-TI-RECORD                   71350000
LRM019        ELSE                                                      71360000
LRM019        IF POST-AT-RECORD-ID                                      71370000
LRM019           IF POST-AT-CUST-ACCOUNT = FMT-TI-CUST-ACCOUNT          71380000
LRM019              SET B1-IND TO FMT-TI-ADP-CL-NO                      71390000
LRM019              MOVE POST-AT-RECORD TO FMT-AT-RECORD                71400000
LRM019              PERFORM O-FORMAT-T3RDFL-RECORD                      71410000
LRM019              ADD +1  TO TOT-CAGE-FAIL-REC                        71420000
LRM019           ELSE                                                   71430000
LRM019              DISPLAY 'PROBLEM READING POST SETTLE FILE'          71431000
LRM019                      ' EXPECTED TI AND AT MISMATCHED'            71432000
LRM019              DISPLAY ' TI ' FMT-TI-ADP-CL-NO                     71433000
LRM019                         ' ' FMT-TI-CUST-ACCOUNT                  71434000
LRM019                      ' AT ' POST-TI-ADP-CL-NO                    71435000
LRM019                         ' ' POST-TI-CUST-ACCOUNT                 71436000
LRM019           END-IF                                                 71437000
LRM019     END-IF.                                                      71438000
                                                                        71439000
669200******************************************************************71440000
669300*** PERFORMED BY:                                              ***71450000
669400***     O-EDIT-BR-ACCT                                         ***71460000
669500***     O-EDIT-SETTLE-DATE                                     ***71470000
669600***     O-EDIT-STL-IND (3 TIMES)                               ***71480000
669700***     O-EDIT-WHEN-ISSUE                                      ***71490000
669800***     O-EDIT-FRACT-QUANT (2 TIMES)                           ***71500000
669900***     O-GET-ADP-CUSIP-NBR (2 TIMES)                          ***71510000
670000***     O-EDIT-CONTRA-BKR-NBR                                  ***71520000
670100******************************************************************71530000
670200                                                                  71540000
670300 O-PRINT-ERROR-RECORD.                                            71550000
670400                                                                  71560000
670500     IF PARM-CAGE-RUN                                             71570000
670600     AND THIS-RECORD-WAS-NOT-PRINTED                              71580000
670700     AND (FMT-SETTL-DATE  =  WS-TRADE-PLUS-2                      71590000
670800      OR FMT-TRNFR-TYPE  NOT = 'FUL')                             71600000
670900         PERFORM O-PRINT-DETAIL-LINE-1                            71610000
671000         MOVE ZERO  TO DL-2-CTL                                   71620000
671100         MOVE FMT-TI-RECORD TO ERROR-WORK-LINE                    71630000
671200         MOVE ERROR-WORK1  TO DETAIL1-1-100                       71640000
671300         MOVE ERROR-WORK2  TO DETAIL1-101-133                     71650000
671400                                                                  71660000
671500         MOVE FMT-AT-RECORD TO ERROR-WORK-LINE                    71670000
671600         MOVE ERROR-WORK1  TO DETAIL2-1-100                       71680000
671700         MOVE ERROR-WORK2  TO DETAIL2-101-133                     71690000
671800                                                                  71700000
671900*****    MOVE THIRD-RECORD TO ERROR-WORK-LINE                     71710000
672000         MOVE SPACES       TO ERROR-WORK-LINE                     71720000
672100         MOVE ERROR-WORK1  TO DETAIL3-1-100                       71730000
672200         MOVE ERROR-WORK2  TO DETAIL3-101-133                     71740000
672300                                                                  71750000
672400         DISPLAY DET-ERR-1A                                       71760000
672500         DISPLAY DET-DATA-1A                                      71770000
672600         DISPLAY DET-ERR-1B                                       71780000
672700         DISPLAY DET-DATA-1B                                      71790000
672800                                                                  71800000
672900         DISPLAY DET-ERR-2A                                       71810000
673000         DISPLAY DET-DATA-2A                                      71820000
673100         DISPLAY DET-ERR-2B                                       71830000
673200         DISPLAY DET-DATA-2B                                      71840000
673300                                                                  71850000
673400*        DISPLAY DET-ERR-3A                                       71860000
673500*        DISPLAY DET-DATA-3A                                      71870000
673600*        DISPLAY DET-ERR-3B                                       71880000
673700*        DISPLAY DET-DATA-3B                                      71890000
673800                                                                  71900000
673900                                                                  71910000
674000     ELSE                                                         71920000
674100         MOVE SPACE TO DL-2-CTL                                   71930000
674200     END-IF.                                                      71940000
674300                                                                  71950000
674400     IF PARM-CAGE-RUN                                             71960000
674500     AND (FMT-SETTL-DATE  =  WS-TRADE-PLUS-2                      71970000
674600      OR FMT-TRNFR-TYPE  NOT = 'FUL')                             71980000
YH0001         PERFORM O-PRINT-DETAIL-LINE-2                            71990000
674200     END-IF.                                                      72000000
674800/                                                                 72010000
674900******************************************************************72020000
675000*** PERFORMED BY:                                              ***72030000
675100***     O-PRINT-ERROR-RECORD                                   ***72040000
675200******************************************************************72050000
675300                                                                  72060000
675400 O-PRINT-DETAIL-LINE-1.                                           72070000
675500                                                                  72080000
675600     MOVE 'Y' TO THIS-RECORD-PRINTED-SWITCH                       72090000
675700     MOVE FMT-TI-ADP-CL-NO TO DL-CLIENT-NO                        72100000
675800     MOVE FMT-TI-CUST-ACCOUNT (1:3) TO DL-BRANCH                  72110000
LRM024                                       CUST-BRANCH                72120000
675900     MOVE FMT-TI-CUST-ACCOUNT (4:5) TO DL-ACCOUNT                 72130000
LRM024                                       CUST-ACCT                  72140000
LRM024     IF FMT-CASH-MGN-IND = 'C'                                    72150000
LRM024        MOVE '1' TO DL-ACCOUNT-TYPE                               72160000
LRM024     ELSE                                                         72170000
LRM024     IF FMT-CASH-MGN-IND = 'M'                                    72180000
LRM024        MOVE '2' TO DL-ACCOUNT-TYPE                               72190000
LRM024     ELSE                                                         72200000
LRM024     IF FMT-CASH-MGN-IND = 'S'                                    72210000
LRM024        MOVE '5' TO DL-ACCOUNT-TYPE                               72220000
LRM024     ELSE                                                         72230000
LRM024        MOVE ' ' TO DL-ACCOUNT-TYPE                               72240000
LRM024                    DL-ACCOUNT-CKDGT                              72250000
LRM024     END-IF.                                                      72260000
LRM024     IF DL-ACCOUNT-TYPE > ' '                                     72270000
LRM024        MOVE DL-ACCOUNT-TYPE TO CUST-TYPE                         72280000
LRM024         CALL  CKDIGIT  USING                                     72290000
LRM024                        CUST-BR-ACCT-TYPE                         72300000
LRM024                        LENGTH-KEY                                72310000
LRM024                        CUST-CHECK-DIGIT                          72320000
LRM024         END-CALL                                                 72330000
LRM024         MOVE CUST-CHECK-DIGIT TO  DL-ACCOUNT-CKDGT               72340000
LRM024     END-IF.                                                      72350000
676000     MOVE FMT-CUSIP-NUM TO DL-CUSIP                               72360000
676100     MOVE FMT-TI-CONTROL-NUM(5 : 3) TO DL-CONTROL-NBR             72370000
676200     MOVE '-'                TO DL-CONTROL-NBR(4 : 1)             72380000
676300     MOVE FMT-TI-CONTROL-NUM(8 : 7) TO DL-CONTROL-NBR (5 : 7)     72390000
676500     MOVE ' '              TO DL-STK-BND                          72400000
676600                                                                  72410000
676800     MOVE FMT-SEC-D-1     TO DL-DESCRIPTION                       72420000
676900     MOVE FMT-SEC-D-2     TO DL-DESCRIPTION-2                     72430000
677300     MOVE FMT-SETTL-DATE  TO DL-SETTLE-DATE.                      72440000
677400                                                                  72450000
677500     MOVE DETAIL-LINE-1 TO PW-LINE                                72460000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    72470000
YH0001       ADD    1            TO MFC-MAX                             72480000
YH0001                                                                  72490000
YH0001       PERFORM O-MFC-TABLE-OVERFLOW                               72500000
YH0001       MOVE DETAIL-LINE-1  TO MFC-ERR-LINE1 (MFC-MAX)             72510000
677800       MOVE SPACE          TO MFC-ERR-LINE1A (MFC-MAX)            72520000
677700       IF FMT-SEC-D-2 NOT EQUAL SPACES                            72530000
677800         MOVE DETAIL-LINE-1A TO MFC-ERR-LINE1A (MFC-MAX)          72540000
             END-IF                                                     72550000
YH0001     ELSE                                                         72560000
677600       PERFORM O-PRINT-LINE                                       72570000
677700       IF FMT-SEC-D-2 NOT EQUAL SPACES                            72580000
677800         MOVE DETAIL-LINE-1A TO PW-LINE                           72590000
677900         PERFORM O-PRINT-LINE                                     72600000
             END-IF                                                     72610000
678000     END-IF.                                                      72620000
                                                                        72630000
LRM024     MOVE FMT-AT-CONTRA-BRK-NUM TO  DL-3-CONTRA                   72640000
LRM024     MOVE FMT-STTLM-LCTN-CD     TO  DL-3-SLOC                     72650000
LRM024     MOVE FMT-STTLM-RSN-CD      TO  DL-3-SLOC-RSN                 72660000
LRM024     MOVE FMT-ISO-CRNCY-CD      TO  DL-3-ISO-CRNCY-CD             72670000
LRM024     MOVE FMT-ASSET-QTY-DEC     TO  DL-3-QTY                      72680000
LRM024     MOVE FMT-ASSET-AMT-DEC     TO  DL-3-AMT                      72690000
                                                                        72700000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    72710000
             MOVE DETAIL-LINE-3  TO MFC-ERR-LINE3 (MFC-MAX)             72720000
YH0001       MOVE SPACES         TO MFC-ERR-LINE4 (MFC-MAX)             72730000
YH0001                              MFC-ERR-LINE5 (MFC-MAX)             72740000
           ELSE                                                         72750000
             MOVE DETAIL-LINE-3  TO PW-LINE                             72760000
             PERFORM O-PRINT-LINE                                       72770000
           END-IF.                                                      72780000
LRM024                                                                  72790000
                                                                        72800000
LRM024     IF FMT-TI-COMMENT NOT = SPACES                               72810000
LRM024        MOVE 'TI'               TO  DL-4-RECORD-TYPE              72820000
LRM024        MOVE FMT-TI-COMMENT     TO  DL-4-COMMENT                  72830000
YH0001        IF FMT-TRNFR-TYPE = 'MFC'                                 72840000
                MOVE DETAIL-LINE-4  TO MFC-ERR-LINE4 (MFC-MAX)          72850000
              ELSE                                                      72860000
                MOVE DETAIL-LINE-4  TO PW-LINE                          72870000
                PERFORM O-PRINT-LINE                                    72880000
              END-IF                                                    72890000
           END-IF.                                                      72900000
                                                                        72910000
LRM024     IF FMT-ASSET-COMMENT NOT = SPACES                            72920000
LRM024        MOVE 'AT'               TO  DL-4-RECORD-TYPE              72930000
LRM024        MOVE FMT-ASSET-COMMENT  TO  DL-4-COMMENT                  72940000
YH0001        IF FMT-TRNFR-TYPE = 'MFC'                                 72950000
                MOVE DETAIL-LINE-4  TO MFC-ERR-LINE5 (MFC-MAX)          72960000
              ELSE                                                      72970000
                MOVE DETAIL-LINE-4  TO PW-LINE                          72980000
                PERFORM O-PRINT-LINE                                    72990000
              END-IF                                                    73000000
           END-IF.                                                      73010000
679400/                                                                 73020000
678100/                                                                 73030000
YH0001 O-MFC-TABLE-OVERFLOW.                                            73040000
           IF MFC-MAX > 450  AND                                        73050000
              (INFSND-MSG-SEND-SW = SPACE )                             73060000
              MOVE 'MFC ERROR TBL'      TO PASS-TABLE-NAME              73070000
              MOVE 450                 TO PASS-COUNTER                  73080000
              MOVE PASS-MSG           TO PASS-MESSAGE                   73090000
              CALL INFSND  USING PASS-DATA                              73100000
              SET INFSND-MSG-SEND-YES TO TRUE                           73110000
           END-IF                                                       73120000
                                                                        73130000
           IF  MFC-MAX > 500                                            73140000
               DISPLAY '  CAT650 - MFC ERROR TABLE DROP OVER 500 **'    73150000
               MOVE 500    TO MFC-MAX                                   73160000
               DISPLAY  MFC-ERR-LINE1 (MFC-MAX)                         73170000
               DISPLAY  MFC-ERR-LINE2 (MFC-MAX)                         73180000
                                                                        73190000
           END-IF.                                                      73200000
678200******************************************************************73210000
678300*** PERFORMED BY:                                              ***73220000
678400***     O-PRINT-ERROR-RECORD                                   ***73230000
678500******************************************************************73240000
678600                                                                  73250000
678700 O-PRINT-DETAIL-LINE-2.                                           73260000
678800                                                                  73270000
678900     MOVE ERROR-VALUE   TO DL-ERROR-VALUE                         73280000
679000     MOVE ERROR-MSG     TO DL-ERROR-MSG                           73290000
679100                                                                  73300000
679200     MOVE DETAIL-LINE-2  TO PW-LINE                               73310000
YH0001     IF FMT-TRNFR-TYPE = 'MFC'                                    73320000
             MOVE DETAIL-LINE-2  TO MFC-ERR-LINE2 (MFC-MAX)             73330000
           ELSE                                                         73340000
             MOVE DETAIL-LINE-2  TO PW-LINE                             73350000
             PERFORM O-PRINT-LINE                                       73360000
           END-IF.                                                      73370000
679500******************************************************************73380000
679600*** PERFORMED BY:                                              ***73390000
679700***     O-CLIENT-BREAK                                         ***73400000
679800******************************************************************73410000
679900                                                                  73420000
680000 O-PRINT-CLIENT-TOTALS.                                           73430000
680100                                                                  73440000
680200     ADD 1 TO PC-PAGE-CNT                                         73450000
680300     MOVE PC-PAGE-CNT TO TTL-PAGE                                 73460000
680400     MOVE TOTALS-TITLE-LINE TO PW-LINE                            73470000
680500     PERFORM O-P-WRITE-LINE                                       73480000
680600                                                                  73490000
680700     MOVE CLIENT-P2-COL-HEADER  TO PW-LINE                        73500000
680800     PERFORM O-PRINT-LINE                                         73510000
680900     MOVE CLIENT-P2-TOTAL-LINE-LINE TO PW-LINE                    73520000
681000     PERFORM O-PRINT-LINE                                         73530000
681100     MOVE SPACES TO PW-LINE                                       73540000
681200     PERFORM O-PRINT-LINE                                         73550000
681300                                                                  73560000
681400     MOVE 'CUSTOMER'              TO  CTL-P2-DEST-LIT             73570000
681500     MOVE TOT-CL-BK-CUST-DB-VALUE TO  CTL-P2-DB-VALUE             73580000
681600     MOVE TOT-CL-BK-CUST-CR-VALUE TO  CTL-P2-CR-VALUE             73590000
681700     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        73600000
681800        MOVE  TOT-CL-BK-CUST-DB-QTY  TO  CTL-P2-DB-QTY-FS         73610000
681900        MOVE  TOT-CL-BK-CUST-CR-QTY  TO  CTL-P2-CR-QTY-FS         73620000
682000     ELSE                                                         73630000
682100        MOVE  TOT-CL-BK-CUST-DB-QTY  TO  CTL-P2-DB-QTY            73640000
682200        MOVE  TOT-CL-BK-CUST-CR-QTY  TO  CTL-P2-CR-QTY            73650000
682300     END-IF                                                       73660000
682400     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         73670000
682500     PERFORM O-PRINT-LINE                                         73680000
682600                                                                  73690000
682700     MOVE '  CNS   '              TO  CTL-P2-DEST-LIT             73700000
682800                                                                  73710000
682900     MOVE CNS-BRANCH              TO  WORK-P2-BRANCH              73720000
683000     MOVE CNS-ACCOUNT             TO  WORK-P2-ACCOUNT             73730000
683100     MOVE CNS-TYPE                TO  WORK-P2-TYPE                73740000
683200     MOVE CNS-CHECK-DIGIT         TO  WORK-P2-CHECK-DIGIT         73750000
683300     MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT             73760000
683400                                                                  73770000
683500     MOVE ZEROS                   TO  CTL-P2-DB-VALUE             73780000
683600     MOVE ZEROS                   TO  CTL-P2-CR-VALUE             73790000
683700     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        73800000
683800        MOVE  TOT-CL-BK-CNS-DB-QTY  TO  CTL-P2-DB-QTY-FS          73810000
683900        MOVE  TOT-CL-BK-CNS-CR-QTY  TO  CTL-P2-CR-QTY-FS          73820000
684000     ELSE                                                         73830000
684100        MOVE  TOT-CL-BK-CNS-DB-QTY  TO  CTL-P2-DB-QTY             73840000
684200        MOVE  TOT-CL-BK-CNS-CR-QTY  TO  CTL-P2-CR-QTY             73850000
684300     END-IF                                                       73860000
684400     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         73870000
684500     PERFORM O-PRINT-LINE                                         73880000
684600                                                                  73890000
684700     MOVE 'OFFSET  '              TO  CTL-P2-DEST-LIT             73900000
684800                                                                  73910000
684900     MOVE ALT-OFFSET-BRANCH       TO  WORK-P2-BRANCH              73920000
685000     MOVE ALT-OFFSET-ACCOUNT      TO  WORK-P2-ACCOUNT             73930000
685100     MOVE ALT-OFFSET-TYPE         TO  WORK-P2-TYPE                73940000
685200     MOVE ALT-OFFSET-CHECK-DIGIT  TO  WORK-P2-CHECK-DIGIT         73950000
685300     MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT             73960000
685400                                                                  73970000
685500     MOVE TOT-CL-OFFSET-DB-VALUE  TO  CTL-P2-DB-VALUE             73980000
685600     MOVE TOT-CL-OFFSET-CR-VALUE  TO  CTL-P2-CR-VALUE             73990000
685700     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74000000
685800        MOVE  ZEROS                 TO  CTL-P2-DB-QTY-FS          74010000
685900        MOVE  ZEROS                 TO  CTL-P2-CR-QTY-FS          74020000
686000     ELSE                                                         74030000
686100        MOVE  ZEROS                 TO  CTL-P2-DB-QTY             74040000
686200        MOVE  ZEROS                 TO  CTL-P2-CR-QTY             74050000
686300     END-IF                                                       74060000
686400     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         74070000
686500     PERFORM O-PRINT-LINE                                         74080000
686600                                                                  74090000
686700     IF B1-OFFSET-AMT-BYPASS (B1-IND) = '1'                       74100000
686800       MOVE '(BYPASSED)'              TO  CTL-P2-CNS-ACCT         74110000
686900       MOVE TOT-CL-OFFSET-BYP-DB-VALUE  TO  CTL-P2-DB-VALUE       74120000
687000       MOVE TOT-CL-OFFSET-BYP-CR-VALUE  TO  CTL-P2-CR-VALUE       74130000
687100       MOVE ZEROS                   TO  CTL-P2-DB-QTY             74140000
687200       MOVE ZEROS                   TO  CTL-P2-CR-QTY             74150000
687300       MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                       74160000
687400       PERFORM O-PRINT-LINE                                       74170000
687500     END-IF                                                       74180000
687600                                                                  74190000
687700     MOVE SPACES                  TO  CTL-P2-CNS-ACCT             74200000
687800     MOVE 'OPTIONS '             TO CTL-P2-DEST-LIT               74210000
687900     MOVE ZERO                   TO CTL-P2-DB-VALUE               74220000
688000     MOVE ZERO                   TO CTL-P2-CR-VALUE               74230000
688100     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74240000
688200        MOVE  TOT-CL-BK-OPTION-DB-QTY  TO  CTL-P2-DB-QTY-FS       74250000
688300        MOVE  TOT-CL-BK-OPTION-CR-QTY  TO  CTL-P2-CR-QTY-FS       74260000
688400     ELSE                                                         74270000
688500        MOVE  TOT-CL-BK-OPTION-DB-QTY  TO  CTL-P2-DB-QTY          74280000
688600        MOVE  TOT-CL-BK-OPTION-CR-QTY  TO  CTL-P2-CR-QTY          74290000
688700     END-IF                                                       74300000
688800     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         74310000
688900     PERFORM O-PRINT-LINE                                         74320000
689000                                                                  74330000
689100     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               74340000
689200     MOVE WS-CBOE-OFFSET-ACCOUNT TO CTL-P2-CNS-ACCT               74350000
689300     MOVE ZERO                   TO CTL-P2-DB-VALUE               74360000
689400     MOVE ZERO                   TO CTL-P2-CR-VALUE               74370000
689500     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74380000
689600        MOVE  TOT-CL-OPT-CBOE-DB-QTY  TO  CTL-P2-DB-QTY-FS        74390000
689700        MOVE  TOT-CL-OPT-CBOE-CR-QTY  TO  CTL-P2-CR-QTY-FS        74400000
689800     ELSE                                                         74410000
689900        MOVE  TOT-CL-OPT-CBOE-DB-QTY  TO  CTL-P2-DB-QTY           74420000
690000        MOVE  TOT-CL-OPT-CBOE-CR-QTY  TO  CTL-P2-CR-QTY           74430000
690100     END-IF                                                       74440000
690200     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         74450000
690300     PERFORM O-PRINT-LINE                                         74460000
690400                                                                  74470000
690500     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               74480000
690600     MOVE WS-AMEX-NYSE-OFFSET-ACCOUNT TO CTL-P2-CNS-ACCT          74490000
690700     MOVE ZERO                   TO CTL-P2-DB-VALUE               74500000
690800     MOVE ZERO                   TO CTL-P2-CR-VALUE               74510000
690900     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74520000
691000        MOVE  TOT-CL-AMEX-NYSE-DB-QTY  TO  CTL-P2-DB-QTY-FS       74530000
691100        MOVE  TOT-CL-AMEX-NYSE-CR-QTY  TO  CTL-P2-CR-QTY-FS       74540000
691200     ELSE                                                         74550000
691300        MOVE  TOT-CL-AMEX-NYSE-DB-QTY  TO  CTL-P2-DB-QTY          74560000
691400        MOVE  TOT-CL-AMEX-NYSE-CR-QTY  TO  CTL-P2-CR-QTY          74570000
691500     END-IF                                                       74580000
691600     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         74590000
691700     PERFORM O-PRINT-LINE                                         74600000
691800                                                                  74610000
691900     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               74620000
692000     MOVE WS-PBW-OFFSET-ACCOUNT  TO CTL-P2-CNS-ACCT               74630000
692100     MOVE ZERO                   TO CTL-P2-DB-VALUE               74640000
692200     MOVE ZERO                   TO CTL-P2-CR-VALUE               74650000
692300     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74660000
692400        MOVE  TOT-CL-OPT-PBW-DB-QTY  TO  CTL-P2-DB-QTY-FS         74670000
692500        MOVE  TOT-CL-OPT-PBW-CR-QTY  TO  CTL-P2-CR-QTY-FS         74680000
692600     ELSE                                                         74690000
692700        MOVE  TOT-CL-OPT-PBW-DB-QTY  TO  CTL-P2-DB-QTY            74700000
692800        MOVE  TOT-CL-OPT-PBW-CR-QTY  TO  CTL-P2-CR-QTY            74710000
692900     END-IF                                                       74720000
693000     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         74730000
693100     PERFORM O-PRINT-LINE                                         74740000
693200                                                                  74750000
693300     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               74760000
693400     MOVE WS-PSE-OFFSET-ACCOUNT  TO CTL-P2-CNS-ACCT               74770000
693500     MOVE ZERO                   TO CTL-P2-DB-VALUE               74780000
693600     MOVE ZERO                   TO CTL-P2-CR-VALUE               74790000
693700     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74800000
693800        MOVE  TOT-CL-OPT-PSE-DB-QTY  TO  CTL-P2-DB-QTY-FS         74810000
693900        MOVE  TOT-CL-OPT-PSE-CR-QTY  TO  CTL-P2-CR-QTY-FS         74820000
694000     ELSE                                                         74830000
694100        MOVE  TOT-CL-OPT-PSE-DB-QTY  TO  CTL-P2-DB-QTY            74840000
694200        MOVE  TOT-CL-OPT-PSE-CR-QTY  TO  CTL-P2-CR-QTY            74850000
694300     END-IF                                                       74860000
694400     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         74870000
694500     PERFORM O-PRINT-LINE                                         74880000
694600                                                                  74890000
694700     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               74900000
694800     MOVE WS-DFLT-OFFSET-ACCOUNT TO CTL-P2-CNS-ACCT               74910000
694900     MOVE ZERO                   TO CTL-P2-DB-VALUE               74920000
695000     MOVE ZERO                   TO CTL-P2-CR-VALUE               74930000
695100     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        74940000
695200        MOVE  TOT-CL-OPT-DFLT-DB-QTY  TO  CTL-P2-DB-QTY-FS        74950000
695300        MOVE  TOT-CL-OPT-DFLT-CR-QTY  TO  CTL-P2-CR-QTY-FS        74960000
695400     ELSE                                                         74970000
695500        MOVE  TOT-CL-OPT-DFLT-DB-QTY  TO  CTL-P2-DB-QTY           74980000
695600        MOVE  TOT-CL-OPT-DFLT-CR-QTY  TO  CTL-P2-CR-QTY           74990000
695700     END-IF                                                       75000000
695800     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         75010000
695900     PERFORM O-PRINT-LINE                                         75020000
696000                                                                  75030000
696100     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        75040000
696200      MOVE ' FUNDSERV'             TO  PW-LINE                    75050000
696300      PERFORM O-PRINT-LINE                                        75060000
696400                                                                  75070000
696500      MOVE 'N1 MEMO'               TO  CTL-P2-DEST-LIT            75080000
696600      MOVE MEMO-ACCOUNT (1) (1:3)  TO  WORK-P2-BRANCH             75090000
696700      MOVE MEMO-ACCOUNT (1) (4:5)  TO  WORK-P2-ACCOUNT            75100000
696800      MOVE MEMO-ACCOUNT (1) (9:1)  TO  WORK-P2-TYPE               75110000
696900      MOVE MEMO-ACCOUNT (1) (10:1) TO  WORK-P2-CHECK-DIGIT        75120000
697000      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75130000
697100      MOVE ZEROS                   TO  CTL-P2-DB-VALUE            75140000
697200      MOVE ZEROS                   TO  CTL-P2-CR-VALUE            75150000
697300      MOVE TOT-N1-MEMO-DB-QTY      TO  CTL-P2-DB-QTY-FS           75160000
697400      MOVE TOT-N1-MEMO-CR-QTY      TO  CTL-P2-CR-QTY-FS           75170000
697500      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75180000
697600      PERFORM O-PRINT-LINE                                        75190000
697700                                                                  75200000
697800      MOVE 'N2 MEMO'               TO  CTL-P2-DEST-LIT            75210000
697900      MOVE MEMO-ACCOUNT (2) (1:3)  TO  WORK-P2-BRANCH             75220000
698000      MOVE MEMO-ACCOUNT (2) (4:5)  TO  WORK-P2-ACCOUNT            75230000
698100      MOVE MEMO-ACCOUNT (2) (9:1)  TO  WORK-P2-TYPE               75240000
698200      MOVE MEMO-ACCOUNT (2) (10:1) TO  WORK-P2-CHECK-DIGIT        75250000
698300      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75260000
698400      MOVE ZEROS                   TO  CTL-P2-DB-VALUE            75270000
698500      MOVE ZEROS                   TO  CTL-P2-CR-VALUE            75280000
698600      MOVE TOT-N2-MEMO-DB-QTY      TO  CTL-P2-DB-QTY-FS           75290000
698700      MOVE TOT-N2-MEMO-CR-QTY      TO  CTL-P2-CR-QTY-FS           75300000
698800      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75310000
698900      PERFORM O-PRINT-LINE                                        75320000
699000                                                                  75330000
699100      MOVE 'N3 MEMO'               TO  CTL-P2-DEST-LIT            75340000
699200      MOVE MEMO-ACCOUNT (3) (1:3)  TO  WORK-P2-BRANCH             75350000
699300      MOVE MEMO-ACCOUNT (3) (4:5)  TO  WORK-P2-ACCOUNT            75360000
699400      MOVE MEMO-ACCOUNT (3) (9:1)  TO  WORK-P2-TYPE               75370000
699500      MOVE MEMO-ACCOUNT (3) (10:1) TO  WORK-P2-CHECK-DIGIT        75380000
699600      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75390000
699700      MOVE ZEROS                   TO  CTL-P2-DB-VALUE            75400000
699800      MOVE ZEROS                   TO  CTL-P2-CR-VALUE            75410000
699900      MOVE TOT-N3-MEMO-DB-QTY      TO  CTL-P2-DB-QTY-FS           75420000
700000      MOVE TOT-N3-MEMO-CR-QTY      TO  CTL-P2-CR-QTY-FS           75430000
700100      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75440000
700200      PERFORM O-PRINT-LINE                                        75450000
700300                                                                  75460000
700400      MOVE 'N4 MEMO'               TO  CTL-P2-DEST-LIT            75470000
700500      MOVE MEMO-ACCOUNT (4) (1:3)  TO  WORK-P2-BRANCH             75480000
700600      MOVE MEMO-ACCOUNT (4) (4:5)  TO  WORK-P2-ACCOUNT            75490000
700700      MOVE MEMO-ACCOUNT (4) (9:1)  TO  WORK-P2-TYPE               75500000
700800      MOVE MEMO-ACCOUNT (4) (10:1) TO  WORK-P2-CHECK-DIGIT        75510000
700900      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75520000
701000      MOVE ZEROS                   TO  CTL-P2-DB-VALUE            75530000
701100      MOVE ZEROS                   TO  CTL-P2-CR-VALUE            75540000
701200      MOVE TOT-N4-MEMO-DB-QTY      TO  CTL-P2-DB-QTY-FS           75550000
701300      MOVE TOT-N4-MEMO-CR-QTY      TO  CTL-P2-CR-QTY-FS           75560000
701400      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75570000
701500      PERFORM O-PRINT-LINE                                        75580000
701600                                                                  75590000
LRM050      MOVE 'N6 MEMO'               TO  CTL-P2-DEST-LIT            75600000
LRM050      MOVE MEMO-ACCOUNT (6) (1:3)  TO  WORK-P2-BRANCH             75610000
LRM050      MOVE MEMO-ACCOUNT (6) (4:5)  TO  WORK-P2-ACCOUNT            75620000
LRM050      MOVE MEMO-ACCOUNT (6) (9:1)  TO  WORK-P2-TYPE               75630000
LRM050      MOVE MEMO-ACCOUNT (6) (10:1) TO  WORK-P2-CHECK-DIGIT        75640000
LRM050      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75650000
LRM050      MOVE ZEROS                   TO  CTL-P2-DB-VALUE            75660000
LRM050      MOVE ZEROS                   TO  CTL-P2-CR-VALUE            75661000
LRM050      MOVE TOT-N6-MEMO-DB-QTY      TO  CTL-P2-DB-QTY-FS           75662000
LRM050      MOVE TOT-N6-MEMO-CR-QTY      TO  CTL-P2-CR-QTY-FS           75663000
LRM050      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75664000
LRM050      PERFORM O-PRINT-LINE                                        75665000
LRM050                                                                  75666000
701700      MOVE 'LEVEL 0'               TO  CTL-P2-DEST-LIT            75667000
701800      MOVE SPACES                  TO  CTL-P2-CNS-ACCT            75668000
701900      MOVE ZEROS                   TO  CTL-P2-DB-VALUE            75669000
702000      MOVE ZEROS                   TO  CTL-P2-CR-VALUE            75669100
702100      MOVE TOT-N0-MEMO-DB-QTY      TO  CTL-P2-DB-QTY-FS           75669200
702200      MOVE TOT-N0-MEMO-CR-QTY      TO  CTL-P2-CR-QTY-FS           75669300
702300      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75669400
702400      PERFORM O-PRINT-LINE                                        75669500
702500                                                                  75669600
702600      MOVE 'PND/REC'               TO  CTL-P2-DEST-LIT            75669700
702700      MOVE B1-RCV-PEND-STL-ACCT(B1-IND) (1:3) TO  WORK-P2-BRANCH  75669800
702800      MOVE B1-RCV-PEND-STL-ACCT(B1-IND) (4:5) TO  WORK-P2-ACCOUNT 75669900
702900      MOVE '1'                            TO  WORK-P2-TYPE        75670000
703000      MOVE 'X' TO WORK-P2-ACCOUNT-AREA(14:1)                      75680000
703100      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75690000
703200      MOVE TOT-CL-PEND-REC-DB-VALUE TO  CTL-P2-DB-VALUE           75700000
703300      MOVE TOT-CL-PEND-REC-CR-VALUE TO  CTL-P2-CR-VALUE           75710000
703400      MOVE TOT-CL-PEND-REC-DB-QTY   TO  CTL-P2-DB-QTY-FS          75720000
703500      MOVE TOT-CL-PEND-REC-CR-QTY   TO  CTL-P2-CR-QTY-FS          75730000
703600      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75740000
703700      PERFORM O-PRINT-LINE                                        75750000
703800                                                                  75760000
703900      MOVE 'PND/DEL'               TO  CTL-P2-DEST-LIT            75770000
704000      MOVE B1-DEL-PEND-STL-ACCT(B1-IND) (1:3) TO  WORK-P2-BRANCH  75780000
704100      MOVE B1-DEL-PEND-STL-ACCT(B1-IND) (4:5) TO  WORK-P2-ACCOUNT 75790000
704200      MOVE '2'                            TO  WORK-P2-TYPE        75800000
704300      MOVE 'X' TO WORK-P2-ACCOUNT-AREA(14:1)                      75810000
704400      MOVE WORK-P2-ACCOUNT-AREA    TO  CTL-P2-CNS-ACCT            75820000
704500      MOVE TOT-CL-PEND-DEL-DB-VALUE TO  CTL-P2-DB-VALUE           75830000
704600      MOVE TOT-CL-PEND-DEL-CR-VALUE TO  CTL-P2-CR-VALUE           75840000
704700      MOVE TOT-CL-PEND-DEL-DB-QTY   TO  CTL-P2-DB-QTY-FS          75850000
704800      MOVE TOT-CL-PEND-DEL-CR-QTY   TO  CTL-P2-CR-QTY-FS          75860000
704900      MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                        75870000
705000      PERFORM O-PRINT-LINE                                        75880000
705100                                                                  75890000
705200     END-IF                                                       75900000
705300                                                                  75910000
705400     MOVE SPACES TO CTL-P2-CNS-ACCT                               75920000
705500     MOVE CLIENT-P2-TOTAL-LINE-LINE TO PW-LINE                    75930000
705600     PERFORM O-PRINT-LINE                                         75940000
705700                                                                  75950000
705800     MOVE '  BK    '              TO  CTL-P2-DEST-LIT             75960000
705900     MOVE TOT-CL-BK-DB-VALUE      TO  CTL-P2-DB-VALUE             75970000
706000     MOVE TOT-CL-BK-CR-VALUE      TO  CTL-P2-CR-VALUE             75980000
706100     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        75990000
706200        MOVE  TOT-CL-BK-DB-QTY  TO  CTL-P2-DB-QTY-FS              76000000
706300        MOVE  TOT-CL-BK-CR-QTY  TO  CTL-P2-CR-QTY-FS              76010000
706400     ELSE                                                         76020000
706500        MOVE  TOT-CL-BK-DB-QTY  TO  CTL-P2-DB-QTY                 76030000
706600        MOVE  TOT-CL-BK-CR-QTY  TO  CTL-P2-CR-QTY                 76040000
706700     END-IF                                                       76050000
706800     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         76060000
706900     PERFORM O-PRINT-LINE                                         76070000
707000                                                                  76080000
707100     MOVE ' FAILS  '              TO  CTL-P2-DEST-LIT             76090000
707200     MOVE TOT-CL-RD-CL-DB-VALUE   TO  CTL-P2-DB-VALUE             76100000
707300     MOVE TOT-CL-RD-CL-CR-VALUE   TO  CTL-P2-CR-VALUE             76110000
707400     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        76120000
707500        MOVE  TOT-CL-RD-CL-DB-QTY  TO  CTL-P2-DB-QTY-FS           76130000
707600        MOVE  TOT-CL-RD-CL-CR-QTY  TO  CTL-P2-CR-QTY-FS           76140000
707700     ELSE                                                         76150000
707800        MOVE  TOT-CL-RD-CL-DB-QTY  TO  CTL-P2-DB-QTY              76160000
707900        MOVE  TOT-CL-RD-CL-CR-QTY  TO  CTL-P2-CR-QTY              76170000
708000     END-IF                                                       76180000
708100     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         76190000
708200     PERFORM O-PRINT-LINE                                         76200000
708300                                                                  76210000
708400     MOVE CLIENT-P2-TOTAL-LINE-LINE TO PW-LINE                    76220000
708500     PERFORM O-PRINT-LINE                                         76230000
708600                                                                  76240000
708700     MOVE ' TOTAL  '              TO  CTL-P2-DEST-LIT             76250000
708800     MOVE TOT-CL-DB-VALUE         TO  CTL-P2-DB-VALUE             76260000
708900     MOVE TOT-CL-CR-VALUE         TO  CTL-P2-CR-VALUE             76270000
709000     IF B1-FUND-SERV-CLIENT (B1-IND) = '1'                        76280000
709100        MOVE  TOT-CL-DB-QTY  TO  CTL-P2-DB-QTY-FS                 76290000
709200        MOVE  TOT-CL-CR-QTY  TO  CTL-P2-CR-QTY-FS                 76300000
709300     ELSE                                                         76310000
709400        MOVE  TOT-CL-DB-QTY  TO  CTL-P2-DB-QTY                    76320000
709500        MOVE  TOT-CL-CR-QTY  TO  CTL-P2-CR-QTY                    76330000
709600     END-IF                                                       76340000
709700     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         76350000
709800     PERFORM O-PRINT-LINE                                         76360000
709900                                                                  76370000
710000     MOVE CLIENT-REC-COL-HEADER TO PW-LINE                        76380000
710100     PERFORM O-PRINT-LINE                                         76390000
710200     PERFORM O-COMPUTE-CLIENT-TOTALS.                             76400000
710300/                                                                 76410000
710400******************************************************************76420000
710500*** PERFORMED BY:                                              ***76430000
710600***     O-PRINT-CLIENT-TOTALS                                  ***76440000
710700******************************************************************76450000
710800                                                                  76460000
710900 O-COMPUTE-CLIENT-TOTALS.                                         76470000
711000                                                                  76480000
711100     MOVE 'VALID RECS IN'  TO CTL-REC-LITERAL                     76490000
711200     MOVE TOT-CL-VALID-SORT-RECS TO CTL-REC-TOT-ACAT              76500000
711300     MOVE TOT-CL-PEND-READ       TO CTL-REC-TOT-PEND              76510000
711400                                                                  76520000
711500     COMPUTE TEMP-TOTAL = TOT-CL-VALID-SORT-RECS                  76530000
711600                        + TOT-CL-PEND-READ                        76540000
711700     END-COMPUTE                                                  76550000
711800     MOVE TEMP-TOTAL       TO CTL-REC-TOT-TOT                     76560000
711900                                                                  76570000
712000     MOVE CLIENT-REC-TOTAL-LINE TO PW-LINE                        76580000
712100     PERFORM O-PRINT-LINE                                         76590000
712200                                                                  76600000
712300     MOVE 'NEW PEND WRITTEN'  TO CTL-REC-LITERAL                  76610000
712400     MOVE CLIENT-REC-TOTAL-LINE TO PW-LINE                        76620000
712500     PERFORM O-PRINT-LINE                                         76630000
712600                                                                  76640000
712700     MOVE 'SELECTED FOR P2'      TO CTL-REC-LITERAL               76650000
712800     MOVE TOT-CL-ACAT-SELECTED-FOR-P2 TO CTL-REC-TOT-ACAT         76660000
712900     MOVE TOT-CL-PEND-SELECTED-FOR-P2 TO CTL-REC-TOT-PEND         76670000
713000     MOVE TOT-CL-SELECTED-FOR-P2 TO CTL-REC-TOT-TOT               76680000
713100     MOVE CLIENT-REC-TOTAL-LINE  TO PW-LINE                       76690000
713200     PERFORM O-PRINT-LINE                                         76700000
713300                                                                  76710000
713400     MOVE ' TOTAL OUT     '      TO CTL-REC-LITERAL               76720000
713500     COMPUTE TEMP-TOTAL =                                         76730000
713600                          TOT-CL-ACAT-SELECTED-FOR-P2             76740000
713700     END-COMPUTE                                                  76750000
713800     MOVE TEMP-TOTAL       TO CTL-REC-TOT-ACAT                    76760000
713900     COMPUTE TEMP-TOTAL =                                         76770000
714000                          TOT-CL-PEND-SELECTED-FOR-P2             76780000
714100     END-COMPUTE                                                  76790000
714200     MOVE TEMP-TOTAL       TO CTL-REC-TOT-PEND                    76800000
714300     COMPUTE TEMP-TOTAL =                                         76810000
714400                          TOT-CL-SELECTED-FOR-P2                  76820000
714500     END-COMPUTE                                                  76830000
714600     MOVE TEMP-TOTAL       TO CTL-REC-TOT-TOT                     76840000
714700     MOVE CLIENT-REC-TOTAL-LINE TO PW-LINE                        76850000
714800     PERFORM O-PRINT-LINE                                         76860000
714900                                                                  76870000
715000     MOVE '0' TO PW-CTL                                           76880000
715100     MOVE TOT-CL-ACCOUNTS       TO CTL-ACCOUNTS                   76890000
715200     MOVE TOT-CL-ASSETS         TO CTL-ASSETS                     76900000
715300     MOVE CLIENT-TOTAL-LINE     TO PW-LINE                        76910000
715400     PERFORM O-PRINT-LINE                                         76920000
715500                                                                  76930000
715600     IF  B1-FUND-SERV-CLIENT (B1-IND)  =  '1'                     76940000
715700       MOVE '0' TO PW-CTL                                         76950000
715800       MOVE TOT-CL-FS-DELV        TO CTL-FS-DELV                  76960000
715900       MOVE TOT-CL-FS-RECV        TO CTL-FS-RECV                  76970000
716000       MOVE FUND-SERV-TOTAL-LINE  TO PW-LINE                      76980000
716100       PERFORM O-PRINT-LINE                                       76990000
716200     END-IF                                                       77000000
716300                                                                  77010000
716400     MOVE 999 TO PC-LINE-CNT                                      77020000
716500     MOVE ZEROS TO PC-PAGE-CNT.                                   77030000
716600/                                                                 77040000
716700******************************************************************77050000
716800*** PERFORMED BY:                                              ***77060000
716900***     O-PRINT-DETAIL-LINE-1 (2 TIMES)                        ***77070000
717000***     O-PRINT-DETAIL-LINE-2                                  ***77080000
717100***     O-PRINT-CLIENT-TOTALS (18 TIMES)                       ***77090000
717200***     O-COMPUTE-CLIENT-TOTALS (5 TIMES)                      ***77100000
717300***     E-PRINT-FINAL-TOTALS (16 TIMES)                        ***77110000
717400***     E-COMPUTE-FINAL-TOTALS (4 TIMES)                       ***77120000
717500******************************************************************77130000
717600                                                                  77140000
717700 O-PRINT-LINE.                                                    77150000
717800                                                                  77160000
717900     IF  PC-LINE-CNT > PC-MAX-LINES                               77170000
718000         PERFORM O-PRINT-HEADERS                                  77180000
718100     END-IF                                                       77190000
718200                                                                  77200000
718300     PERFORM O-P-WRITE-LINE.                                      77210000
718400/                                                                 77220000
718500******************************************************************77230000
718600*** PERFORMED BY:                                              ***77240000
718700***     O-PRINT-LINE                                           ***77250000
718800******************************************************************77260000
718900                                                                  77270000
719000 O-PRINT-HEADERS.                                                 77280000
719100                                                                  77290000
719200     MOVE PW-LINE TO HOLD-PW-LINE                                 77300000
719300     ADD 1 TO PC-PAGE-CNT                                         77310000
719400     MOVE PC-PAGE-CNT TO T-PAGE                                   77320000
719500     MOVE TITLE-LINE1 TO PW-LINE                                  77330000
719600     PERFORM O-P-WRITE-LINE                                       77340000
719700     MOVE SPACE       TO PW-LINE                                  77350000
719800     PERFORM O-P-WRITE-LINE                                       77360000
719900     MOVE HDG1        TO PW-LINE                                  77370000
720000     PERFORM O-P-WRITE-LINE                                       77380000
720100     MOVE HDG2        TO PW-LINE                                  77390000
720200     PERFORM O-P-WRITE-LINE                                       77400000
720300     MOVE SPACE       TO PW-LINE                                  77410000
720400     PERFORM O-P-WRITE-LINE                                       77420000
720500     MOVE HOLD-PW-LINE TO PW-LINE                                 77430000
720600     MOVE '0' TO PW-CTL.                                          77440000
720700/                                                                 77450000
720800******************************************************************77460000
720900*** PERFORMED BY:                                              ***77470000
721000***     O-PRINT-CLIENT-TOTALS                                  ***77480000
721100***     O-PRINT-LINE                                           ***77490000
721200***     O-PRINT-HEADERS (5 TIMES)                              ***77500000
721300***     E-PRINT-FINAL-TOTALS                                   ***77510000
721400***     E-COMPUTE-FINAL-TOTALS                                 ***77520000
721500******************************************************************77530000
721600                                                                  77540000
721700 O-P-WRITE-LINE.                                                  77550000
721800                                                                  77560000
721900****ALTERNATE CODE TO CPRTRTN.  REFORMATS CODE WITHOUT LABELS.*** 77570000
722000****ALTERNATE COBOL PRINT ROUTINE                             *** 77580000
722100****CPRTALT                                                   *** 77590000
722200     EVALUATE PW-CTL                                              77600000
722300         WHEN ' '                                                 77610000
722400             ADD 1 TO PC-LINE-CNT                                 77620000
722500         WHEN '0'                                                 77630000
722600             ADD 2 TO PC-LINE-CNT                                 77640000
722700         WHEN '-'                                                 77650000
722800             ADD 3 TO PC-LINE-CNT                                 77660000
722900         WHEN '1'                                                 77670000
723000             MOVE 1 TO PC-LINE-CNT                                77680000
723100         WHEN OTHER                                               77690000
723200             DISPLAY '***INVALID PRINT CONTROL CHARACTER '        77700000
723300                 QUOTE PW-CTL QUOTE ' - SKIP 1 LINE ASSUMED ***'  77710000
723400             MOVE SPACE TO PW-CTL                                 77720000
723500             ADD 1 TO PC-LINE-CNT                                 77730000
723600     END-EVALUATE                                                 77740000
723700     WRITE XSTLPI-RECORD  FROM PRINT-WORK                         77750000
723800     MOVE SPACES TO PW-LINE.                                      77760000
723900                                                                  77770000
724000/                                                                 77780000
724100****************                                                  77790000
724200 ENDJOB-ROUTINE  SECTION.                                         77800000
724300****************                                                  77810000
724400                                                                  77820000
724500     DISPLAY ' '.                                                 77830000
724600     DISPLAY '*** ' PGM-NAME ' BEGINNING END-JOB ROUTINE ***'.    77840000
724700                                                                  77850000
724800     PERFORM  E-PRINT-FINAL-TOTALS.                               77860000
724900                                                                  77870000
725000     PERFORM  E-COMPUTE-FINAL-TOTALS.                             77880000
725100                                                                  77890000
725200     PERFORM  E-DISPLAY-COUNTERS                                  77900000
725300              VARYING CNTR-X                                      77910000
725400              FROM 1 BY 1                                         77920000
725500       UNTIL  CNTR-X IS GREATER THAN NUM-CNTRS.                   77930000
725600                                                                  77940000
725700     PERFORM  E-WRITE-OUTPUT-TRLS.                                77950000
725800                                                                  77960000
725900     PERFORM  E-CLOSE-FILES.                                      77970000
726000                                                                  77980000
726100     MOVE  +0                         TO  RETURN-CODE.            77990000
726200     DISPLAY '*** ' PGM-NAME ' COMPLETED END-JOB ROUTINE ***'.    78000000
726300                                                                  78010000
726400**********************                                            78020000
726500 ENDJOB-ROUTINE-EXIT.  EXIT.                                      78030000
726600**********************                                            78040000
726700                                                                  78050000
726800 E-PRINT-FINAL-TOTALS.                                            78060000
726900                                                                  78070000
727000** ALWAYS PRINT OUT TOTALS FOR ALL CLIENTS **                     78080000
727100     MOVE  0 TO PW-CL                                             78090000
727200     MOVE 'ALL' TO TL-CLIENT-NUMBER                               78100000
727300     MOVE 'ALL' TO TTL-CLIENT-NUMBER                              78110000
727400     ADD 1 TO PC-PAGE-CNT                                         78120000
727500     MOVE PC-PAGE-CNT TO TTL-PAGE                                 78130000
727600     MOVE TOTALS-TITLE-LINE TO PW-LINE                            78140000
727700     PERFORM O-P-WRITE-LINE                                       78150000
727800                                                                  78160000
727900     MOVE CLIENT-P2-COL-HEADER  TO PW-LINE                        78170000
728000     PERFORM O-PRINT-LINE                                         78180000
728100                                                                  78190000
728200     MOVE 'CUSTOMER'           TO  CTL-P2-DEST-LIT                78200000
728300     MOVE TOT-BK-CUST-DB-VALUE TO  CTL-P2-DB-VALUE                78210000
728400     MOVE TOT-BK-CUST-CR-VALUE TO  CTL-P2-CR-VALUE                78220000
728500     MOVE TOT-BK-CUST-DB-QTY   TO  CTL-P2-DB-QTY                  78230000
728600     MOVE TOT-BK-CUST-CR-QTY   TO  CTL-P2-CR-QTY                  78240000
728700     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78250000
728800     PERFORM O-PRINT-LINE                                         78260000
728900                                                                  78270000
729000     MOVE '  CNS   '           TO  CTL-P2-DEST-LIT                78280000
729100     MOVE ZEROS                TO  CTL-P2-DB-VALUE                78290000
729200     MOVE ZEROS                TO  CTL-P2-CR-VALUE                78300000
729300     MOVE TOT-BK-CNS-DB-QTY    TO  CTL-P2-DB-QTY                  78310000
729400     MOVE TOT-BK-CNS-CR-QTY    TO  CTL-P2-CR-QTY                  78320000
729500     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78330000
729600     PERFORM O-PRINT-LINE                                         78340000
729700                                                                  78350000
729800     MOVE 'OFFSET  '           TO  CTL-P2-DEST-LIT                78360000
729900     MOVE TOT-OFFSET-DB-VALUE  TO  CTL-P2-DB-VALUE                78370000
730000     MOVE TOT-OFFSET-CR-VALUE  TO  CTL-P2-CR-VALUE                78380000
730100     MOVE ZEROS                TO  CTL-P2-DB-QTY                  78390000
730200     MOVE ZEROS                TO  CTL-P2-CR-QTY                  78400000
730300     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78410000
730400     PERFORM O-PRINT-LINE                                         78420000
730500                                                                  78430000
730600     MOVE '(BYPASSED)'             TO CTL-P2-CNS-ACCT             78440000
730700     MOVE TOT-OFFSET-BYP-DB-VALUE  TO  CTL-P2-DB-VALUE            78450000
730800     MOVE TOT-OFFSET-BYP-CR-VALUE  TO  CTL-P2-CR-VALUE            78460000
730900     MOVE ZEROS                TO  CTL-P2-DB-QTY                  78470000
731000     MOVE ZEROS                TO  CTL-P2-CR-QTY                  78480000
731100     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78490000
731200     PERFORM O-PRINT-LINE                                         78500000
731300                                                                  78510000
731400     MOVE SPACES                   TO CTL-P2-CNS-ACCT             78520000
731500     MOVE 'OPTIONS '             TO CTL-P2-DEST-LIT               78530000
731600     MOVE ZERO                   TO CTL-P2-DB-VALUE               78540000
731700     MOVE ZERO                   TO CTL-P2-CR-VALUE               78550000
731800     MOVE TOT-BK-OPTION-DB-QTY   TO CTL-P2-DB-QTY                 78560000
731900     MOVE TOT-BK-OPTION-CR-QTY   TO CTL-P2-CR-QTY                 78570000
732000     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78580000
732100     PERFORM O-PRINT-LINE                                         78590000
732200                                                                  78600000
732300     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               78610000
732400     MOVE WS-CBOE-OFFSET-ACCOUNT TO CTL-P2-CNS-ACCT               78620000
732500     MOVE ZERO                   TO CTL-P2-DB-VALUE               78630000
732600     MOVE ZERO                   TO CTL-P2-CR-VALUE               78640000
732700     MOVE TOT-OPT-CBOE-DB-QTY    TO CTL-P2-DB-QTY                 78650000
732800     MOVE TOT-OPT-CBOE-CR-QTY    TO CTL-P2-CR-QTY                 78660000
732900     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78670000
733000     PERFORM O-PRINT-LINE                                         78680000
733100                                                                  78690000
733200     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               78700000
733300     MOVE WS-AMEX-NYSE-OFFSET-ACCOUNT TO CTL-P2-CNS-ACCT          78710000
733400     MOVE ZERO                   TO CTL-P2-DB-VALUE               78720000
733500     MOVE ZERO                   TO CTL-P2-CR-VALUE               78730000
733600     MOVE TOT-AMEX-NYSE-DB-QTY   TO CTL-P2-DB-QTY                 78740000
733700     MOVE TOT-AMEX-NYSE-CR-QTY   TO CTL-P2-CR-QTY                 78750000
733800     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         78760000
733900     PERFORM O-PRINT-LINE                                         78770000
734000                                                                  78780000
734100     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               78790000
734200     MOVE WS-PBW-OFFSET-ACCOUNT  TO CTL-P2-CNS-ACCT               78800000
734300     MOVE ZERO                   TO CTL-P2-DB-VALUE               78810000
734400     MOVE ZERO                   TO CTL-P2-CR-VALUE               78820000
734500     MOVE TOT-OPT-PBW-DB-QTY     TO CTL-P2-DB-QTY                 78830000
734600     MOVE TOT-OPT-PBW-CR-QTY     TO CTL-P2-CR-QTY                 78840000
734700     MOVE CLIENT-P2-TOTAL-LINE   TO PW-LINE                       78850000
734800     PERFORM O-PRINT-LINE                                         78860000
734900                                                                  78870000
735000     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               78880000
735100     MOVE WS-PSE-OFFSET-ACCOUNT  TO CTL-P2-CNS-ACCT               78890000
735200     MOVE ZERO                   TO CTL-P2-DB-VALUE               78900000
735300     MOVE ZERO                   TO CTL-P2-CR-VALUE               78910000
735400     MOVE TOT-OPT-PSE-DB-QTY     TO CTL-P2-DB-QTY                 78920000
735500     MOVE TOT-OPT-PSE-CR-QTY     TO CTL-P2-CR-QTY                 78930000
735600     MOVE CLIENT-P2-TOTAL-LINE   TO PW-LINE                       78940000
735700     PERFORM O-PRINT-LINE                                         78950000
735800                                                                  78960000
735900     MOVE 'OFFSET  '             TO CTL-P2-DEST-LIT               78970000
736000     MOVE WS-DFLT-OFFSET-ACCOUNT TO CTL-P2-CNS-ACCT               78980000
736100     MOVE ZERO                   TO CTL-P2-DB-VALUE               78990000
736200     MOVE ZERO                   TO CTL-P2-CR-VALUE               79000000
736300     MOVE TOT-OPT-DFLT-DB-QTY    TO CTL-P2-DB-QTY                 79010000
736400     MOVE TOT-OPT-DFLT-CR-QTY    TO CTL-P2-CR-QTY                 79020000
736500     MOVE CLIENT-P2-TOTAL-LINE   TO PW-LINE                       79030000
736600     PERFORM O-PRINT-LINE                                         79040000
736700     MOVE SPACES                 TO CTL-P2-CNS-ACCT               79050000
736800                                                                  79060000
736900     MOVE CLIENT-P2-TOTAL-LINE-LINE TO PW-LINE                    79070000
737000     PERFORM O-PRINT-LINE                                         79080000
737100                                                                  79090000
737200     MOVE '  BK    '             TO  CTL-P2-DEST-LIT              79100000
737300     MOVE TOT-BK-DB-VALUE        TO  CTL-P2-DB-VALUE              79110000
737400     MOVE TOT-BK-CR-VALUE        TO  CTL-P2-CR-VALUE              79120000
737500     MOVE TOT-BK-DB-QTY          TO  CTL-P2-DB-QTY                79130000
737600     MOVE TOT-BK-CR-QTY          TO  CTL-P2-CR-QTY                79140000
737700     MOVE CLIENT-P2-TOTAL-LINE   TO PW-LINE                       79150000
737800     PERFORM O-PRINT-LINE                                         79160000
737900                                                                  79170000
738000     MOVE ' FAILS  '           TO  CTL-P2-DEST-LIT                79180000
738100     MOVE TOT-RD-CL-DB-VALUE   TO  CTL-P2-DB-VALUE                79190000
738200     MOVE TOT-RD-CL-CR-VALUE   TO  CTL-P2-CR-VALUE                79200000
738300     MOVE TOT-RD-CL-DB-QTY     TO  CTL-P2-DB-QTY                  79210000
738400     MOVE TOT-RD-CL-CR-QTY     TO  CTL-P2-CR-QTY                  79220000
738500     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         79230000
738600     PERFORM O-PRINT-LINE                                         79240000
738700                                                                  79250000
738800     MOVE CLIENT-P2-TOTAL-LINE-LINE TO PW-LINE                    79260000
738900     PERFORM O-PRINT-LINE                                         79270000
739000                                                                  79280000
739100     MOVE ' TOTAL  '           TO  CTL-P2-DEST-LIT                79290000
739200     MOVE TOT-DB-VALUE         TO  CTL-P2-DB-VALUE                79300000
739300     MOVE TOT-CR-VALUE         TO  CTL-P2-CR-VALUE                79310000
739400     MOVE TOT-DB-QTY           TO  CTL-P2-DB-QTY                  79320000
739500     MOVE TOT-CR-QTY           TO  CTL-P2-CR-QTY                  79330000
739600     MOVE CLIENT-P2-TOTAL-LINE TO PW-LINE                         79340000
739700     PERFORM O-PRINT-LINE                                         79350000
739800                                                                  79360000
739900     MOVE CLIENT-REC-COL-HEADER TO PW-LINE                        79370000
740000     PERFORM O-PRINT-LINE.                                        79380000
740100                                                                  79390000
740200/                                                                 79400000
740300 E-COMPUTE-FINAL-TOTALS.                                          79410000
740400                                                                  79420000
740500     MOVE 'VALID RECS IN'     TO CTL-REC-LITERAL                  79430000
740600     MOVE TOT-VALID-SORT-RECS TO CTL-REC-TOT-ACAT                 79440000
740700     MOVE TOT-PEND-READ       TO CTL-REC-TOT-PEND                 79450000
740800                                                                  79460000
740900     COMPUTE TEMP-TOTAL = TOT-VALID-SORT-RECS                     79470000
741000                        + TOT-PEND-READ                           79480000
741100     END-COMPUTE                                                  79490000
741200     MOVE TEMP-TOTAL                TO CTL-REC-TOT-TOT            79500000
741300                                                                  79510000
741400     MOVE CLIENT-REC-TOTAL-LINE     TO PW-LINE                    79520000
741500     PERFORM O-PRINT-LINE                                         79530000
741600                                                                  79540000
741700     MOVE 'NEW PEND WRITTEN'        TO CTL-REC-LITERAL            79550000
741800     MOVE ZERO                      TO CTL-REC-TOT-ACAT           79560000
741900     MOVE ZERO                      TO CTL-REC-TOT-PEND           79570000
742000     MOVE ZERO                      TO CTL-REC-TOT-TOT            79580000
742100     MOVE CLIENT-REC-TOTAL-LINE     TO PW-LINE                    79590000
742200     PERFORM O-PRINT-LINE                                         79600000
742300                                                                  79610000
742400     MOVE 'SELECTED FOR P2'         TO CTL-REC-LITERAL            79620000
742500     MOVE TOT-ACAT-SELECTED-FOR-P2  TO CTL-REC-TOT-ACAT           79630000
742600     MOVE TOT-PEND-SELECTED-FOR-P2  TO CTL-REC-TOT-PEND           79640000
742700     MOVE TOT-SELECTED-FOR-P2       TO CTL-REC-TOT-TOT            79650000
742800     MOVE CLIENT-REC-TOTAL-LINE     TO PW-LINE                    79660000
742900     PERFORM O-PRINT-LINE                                         79670000
743000                                                                  79680000
743100     MOVE ' TOTAL OUT     '         TO CTL-REC-LITERAL            79690000
743200     COMPUTE TEMP-TOTAL =                                         79700000
743300                          TOT-ACAT-SELECTED-FOR-P2                79710000
743400     END-COMPUTE                                                  79720000
743500     MOVE TEMP-TOTAL       TO CTL-REC-TOT-ACAT                    79730000
743600                                                                  79740000
743700     COMPUTE TEMP-TOTAL =                                         79750000
743800                          TOT-PEND-SELECTED-FOR-P2                79760000
743900     END-COMPUTE                                                  79770000
744000     MOVE TEMP-TOTAL       TO CTL-REC-TOT-PEND                    79780000
744100                                                                  79790000
744200     COMPUTE TEMP-TOTAL =                                         79800000
744300                          TOT-SELECTED-FOR-P2                     79810000
744400     END-COMPUTE                                                  79820000
744500     MOVE TEMP-TOTAL       TO CTL-REC-TOT-TOT                     79830000
744600                                                                  79840000
744700     MOVE CLIENT-REC-TOTAL-LINE TO PW-LINE                        79850000
744800     PERFORM O-PRINT-LINE                                         79860000
744900                                                                  79870000
745000     MOVE NUM-OF-CLIENTS   TO TOT-CLIENTS                         79880000
745100     MOVE FDL-TOT-ACTS     TO TOT-ACTS                            79890000
745200     MOVE FDL-TOT-ASSETS   TO TOT-ASSETS                          79900000
745300     MOVE '-' TO PW-CTL                                           79910000
745400     MOVE FINAL-TOTAL-LINE TO PW-LINE                             79920000
745500     PERFORM O-P-WRITE-LINE.                                      79930000
745600                                                                  79940000
745700     IF  TOT-DB-VALUE  NOT =  TOT-CR-VALUE                        79950000
745800         DISPLAY  'TOTAL FILE DR/CR AMOUNTS DO NOT AGREE'         79960000
745900*        CALL  ABEND                USING ABEND-CODE-2000         79970000
746000     END-IF.                                                      79980000
746100                                                                  79990000
746200     IF  TOT-DB-QTY    NOT =  TOT-CR-QTY                          80000000
746300         DISPLAY  'TOTAL FILE DR/CR QUANTITIES DO NOT AGREE'      80010000
746400*        CALL  ABEND                USING ABEND-CODE-2000         80020000
746500     END-IF.                                                      80030000
746600/                                                                 80040000
746700 E-DISPLAY-COUNTERS.                                              80050000
746800                                                                  80060000
746900     EVALUATE CNTR-TYPE (CNTR-X)                                  80070000
747000         WHEN 'N'                                                 80080000
747100             MOVE CNTR-RECS (CNTR-X) TO CNTR-MASK-RECS            80090000
747200         WHEN 'M'                                                 80100000
747300             MOVE CNTR-RECS-MONEY (CNTR-X) TO CNTR-MASK-MONEY     80110000
747400         WHEN 'S'                                                 80120000
747500             MOVE CNTR-RECS-SHARE (CNTR-X) TO CNTR-MASK-SHARE     80130000
747600         WHEN OTHER                                               80140000
747700             MOVE SPACES TO CNTR-MASK                             80150000
747800     END-EVALUATE                                                 80160000
747900                                                                  80170000
748000     DISPLAY CNTR-DESC (CNTR-X) CNTR-MASK.                        80180000
748100/                                                                 80190000
748200**********************                                            80200000
748300 E-WRITE-OUTPUT-TRLS.                                             80210000
748400**********************                                            80220000
748500                                                                  80230000
748600** ALWAYS WRITE OUT P2BKPG TRAILER RECORD **                      80240000
748700                                                                  80250000
748800     MOVE  SPACES                     TO  P2BKPG-RECORD.          80260000
748900     MOVE  'REC-CNT='                 TO  P2BKPG-RECORD (1:8).    80270000
749000     MOVE  TOT-P2-RECS-WRITTEN        TO  P2BKPG-RECS.            80280000
749100     MOVE  P2BKPG-RECS                TO  P2BKPG-RECORD (9:11).   80290000
749200     WRITE  P2BKPG-RECORD.                                        80300000
749300     IF  NOT  P2BKPG-FILE-OK                                      80310000
749400         DISPLAY  'P2BKPG FILE WRITE TRAILER ERROR, STATUS = '    80320000
749500                   P2BKPG-FILE-STATUS                             80330000
749600         CALL  ABEND                USING ABEND-CODE-4000         80340000
749700     END-IF.                                                      80350000
749800                                                                  80360000
749900/                                                                 80370000
750000****************                                                  80380000
750100 E-CLOSE-FILES.                                                   80390000
750200****************                                                  80400000
750300                                                                  80410000
750400                                                                  80420000
750500** CLOSE OUT THE XBILL FILE **                                    80430000
750600                                                                  80440000
750700     IF PARM-BOOK-RUN                                             80450000
750800        MOVE  'END'                      TO  XBILL-END            80460000
750900        CALL   ZXBILL                  USING XBILL-LIST           80470000
751000        IF  XBILL-RC  NOT =  ' '                                  80480000
751100          DISPLAY 'ZXBILL CLOSE ROUTINE FAILED, RC = ' XBILL-RC   80490000
751200     END-IF.                                                      80500000
751300                                                                  80510000
751400** CLOSE ALL INPUT AND OUTPUT FILES **                            80520000
751500                                                                  80530000
751600     CLOSE  NTWREG-FILE.                                          80540000
751700     CLOSE  PEND-FILE.                                            80550000
751800     IF  NOT  PEND-FILE-OK                                        80560000
751900         DISPLAY  'OLDPEND FILE CLOSE ERROR, STATUS = '           80570000
752000                   PEND-FILE-STATUS                               80580000
752100     END-IF.                                                      80590000
752200                                                                  80600000
752300     CLOSE  MEMO-FILE.                                            80610000
752400     IF  NOT  MEMO-FILE-OK                                        80620000
752500         DISPLAY  'MEMO FILE CLOSE ERROR, STATUS = '              80630000
752600                   MEMO-FILE-STATUS                               80640000
752700     END-IF.                                                      80650000
752800                                                                  80660000
752900     CLOSE  PRNG-FILE.                                            80670000
753000     IF  NOT  PRNG-FILE-OK                                        80680000
753100         DISPLAY  'PRNG FILE CLOSE ERROR, STATUS = '              80690000
753200                   PRNG-FILE-STATUS                               80700000
753300     END-IF.                                                      80710000
753400                                                                  80720000
753500     CLOSE  BROKER-FILE.                                          80730000
753600     IF  NOT  PRNG-FILE-OK                                        80740000
753700         DISPLAY  'BROKER FILE CLOSE ERROR, STATUS = '            80750000
753800                   BROKER-FILE-STATUS                             80760000
753900     END-IF.                                                      80770000
754000     CLOSE  ACATS-PARTICIPANT-FILE.                               80780000
LRM012     CLOSE  POST-SETTLE-FILE.                                     80790000
LRM052     CLOSE  ACATS-STP-FILE                                        80791001
754100                                                                  80800000
754200     CLOSE  P2BKPG-FILE.                                          80810000
754300     IF  NOT  P2BKPG-FILE-OK                                      80820000
754400         DISPLAY  'P2BKPG FILE CLOSE ERROR, STATUS = '            80830000
754500                   P2BKPG-FILE-STATUS                             80840000
754600     END-IF.                                                      80850000
754700                                                                  80860000
754800     CLOSE  T3RDFL-FILE.                                          80870000
754900     IF  NOT  T3RDFL-FILE-OK                                      80880000
755000         DISPLAY  'T3RDFL FILE CLOSE ERROR, STATUS = '            80890000
755100                   T3RDFL-FILE-STATUS                             80900000
755200     END-IF.                                                      80910000
755300                                                                  80920000
755400     CLOSE  CAG2FL-FILE.                                          80930000
755500     IF  NOT  CAG2FL-FILE-OK                                      80940000
755600         DISPLAY  'CAG2FL FILE CLOSE ERROR, STATUS = '            80950000
755700                   CAG2FL-FILE-STATUS                             80960000
755800     END-IF.                                                      80970000
755900                                                                  80980000
756000     CLOSE CAGE-CAT13-FILE.                                       80990000
756100                                                                  81000000
756200     CLOSE  XSTLPI-FILE.                                          81010000
756300     IF  NOT  XSTLPI-FILE-OK                                      81020000
756400         DISPLAY  'XSTLPI FILE CLOSE ERROR, STATUS = '            81030000
756500                   XSTLPI-FILE-STATUS                             81040000
756600     END-IF.                                                      81050000
756700                                                                  81060000
756800     IF  PEND-FILE-OK AND                                         81070000
756900         MEMO-FILE-OK     AND                                     81080000
757000         PRNG-FILE-OK     AND                                     81090000
757100         P2BKPG-FILE-OK   AND                                     81100000
757200         T3RDFL-FILE-OK   AND                                     81110000
757300         CAG2FL-FILE-OK   AND                                     81120000
757400         XSTLPI-FILE-OK   CONTINUE                                81130000
757500     ELSE                                                         81140000
757600         CALL ABEND                 USING ABEND-CODE-4000         81150000
757700     END-IF.                                                      81160000
LRM009     CLOSE FUNDSERV-EXTR-FILE.                                    81170000
LRM014     CLOSE ROLLOVER-866-EXTR.                                     81180000
LRM022     CLOSE TYPE2-CASH-EXTR.                                       81190000
