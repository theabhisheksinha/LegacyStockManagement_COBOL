  INCLUDE COND=((28,1,EQ,C'3',AND,41,3,EQ,C'ACT'),OR,                   00001   
                (28,1,EQ,C'6',AND,41,3,EQ,C'ACT'),OR,                   00001   
                (14,5,EQ,C'DATE=')),FORMAT=CH                                   
  SORT FIELDS=(14,3,A,28,1,A,36,5,A,2,10,A),FORMAT=CH                           
  END                                                                   00002   
