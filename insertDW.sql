
INSERT INTO factsales(Quantity,Sales,C_ID,S_ID,ST_ID,P_ID,D_ID,T_ID)
Select QUANTITY,SALE,CUSTOMER_ID,SUPPLIER_ID,STORE_ID,PRODUCT_ID,TIME_ID,TRANSACTION_ID
FROM transformed;




INSERT INTO dimcustomer(CID,Cname)
Select DISTINCT CUSTOMER_ID,CUSTOMER_NAME
FROM transformed;

INSERT INTO dimproduct(PID,Pname,price)
Select DISTINCT PRODUCT_ID,PRODUCT_NAME,PRICE
FROM transformed;

INSERT INTO dimstore(STID,STname)
Select DISTINCT STORE_ID,STORE_NAME
FROM transformed;

INSERT INTO dimsupplier(SID,Sname)
Select DISTINCT SUPPLIER_ID,SUPPLIER_NAME
FROM transformed;

INSERT INTO dimdate(T_Date,T_Quarter,T_Month,T_Year)
Select 
		DAY(T_DATE),
        QUARTER(T_DATE),
        MONTH(T_DATE),
        YEAR(T_DATE)
FROM transformed;

INSERT INTO factsales(Quantity,Sales,C_ID,S_ID,ST_ID,P_ID,D_ID,T_ID)
Select T.QUANTITY,T.SALE,C.CID,S.SID,ST.STID,P.PID,D.DID,T.TRANSACTION_ID
FROM transformed T, dimproduct P, dimcustomer C ,dimsupplier S, dimstore ST, dimdate D
WHERE T.PRODUCT_ID=P.PID AND T.SUPPLIER_ID= S.SID AND T.STORE_ID=ST.STID AND T.CUSTOMER_ID=C.CID;