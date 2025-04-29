-- Create a new directory object ot_external that maps to the c:\export folder:
CREATE DIRECTORY ot_external AS 'C:\export';

-- Create a parameter file named customer.par with the following contents and place the file in the C:\export directory:
userid=OT@pdborcl/tiger
directory=ot_external
dumpfile=customer_exp%U.dmp
logfile=customer_exp.log
filesize=50K
tables=customers

-- Invoke the Data Pump Export program at C:\export to export the customers table to the dump files:
cd C:/export
expdp parfile=customer.par

-- Export all objects in the OT schema to the dump files by creating a new parameter file C:/export/ot.par with the following contents:
userid=OT@pdborcl/tiger
directory=ot_external
dumpfile=ot_exp%U.dmp
logfile=ot_exp.log
filesize=50K
schemas=ot

-- Invoke the Data Pump Export program at C:\export to export the customers table to the dump files:
cd C:/export
expdp parfile=ot.par