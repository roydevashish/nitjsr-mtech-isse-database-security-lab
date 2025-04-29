-- Create a parameter file named customer_imp.par with the following contents and place it in the c:\export folder:
userid=OT@pdborcl/tiger
directory=ot_external
dumpfile=customer_exp%U.dmp
logfile=customer_imp.log
remap_table=ot.customers:customers_bk

-- Use the impdp command to invoke the Data Pump Import tool with the parameter file customer_imp.par:
cd C:/export
impdp parfile=customer_imp.par

-- verify the contents of the customers_bk table:
SELECT * FROM customers_bk;