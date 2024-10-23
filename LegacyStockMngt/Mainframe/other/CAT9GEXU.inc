cd 080\out                                                                      
type a                                                                          
LOCSITE RECFM=FB LRECL=2000 BLKSIZE=0                                           
LOCSITE CYL PRI=20 SEC=20                                                       
LOCSITE STORCLAS=GDSBATCH                                                       
GET ACSNSCCInput_080_05.DAT 'BUUU.C080.INPACAT.ASCENDIS(+1)' (replace           
QUIT                                                                            
