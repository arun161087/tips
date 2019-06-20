#############################################################################
# Author: Arun Kumar Singh
# Purpose: Password update via wlst in weblogic data sources (Dev and Prod both)
# Version: 0.2
# Howto: 
# File need to be run after sourcing setDomainEnv.sh in weblogic environment. 
# java weblogic.WLST changepass.py
#############################################################################

print("Password Change activity Started. Please make sure all backups have been taken")
connect('weblogic','password_For_weblogic','t3://localhost:7001')
print("Connected to Admin Server")
cd('Servers/AdminServer')
edit()
startEdit()
cd('JDBCSystemResources')
print("Finding the list of datasources")
dataSources=cmo.getJDBCSystemResources()
for dataS in dataSources:
  WDSName=dataS.getName();
  print  'Changing Password & UserName for DataSource ', WDSName
  cd('/JDBCSystemResources/'+WDSName+'/JDBCResource/'+WDSName+'/JDBCDriverParams/'+WDSName)
  print('/JDBCSystemResources/'+WDSName+'/JDBCResource/'+WDSName+'/JDBCDriverParams/'+WDSName)
  print("")
  print ("Encrypting the password for Data Source")
  encryptedPass = encrypt('password')
  print("Encrypted Password value", encryptedPass)
  set('PasswordEncrypted',encryptedPass)
  print("")
  print("Password has been changed for data source: ", WDSName)

print("Activity finished, please verify the passwords.")
save()
activate()
