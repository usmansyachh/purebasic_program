UsePostgreSQLDatabase()

  ; You should have a server running on localhost
Procedure Connect()
  If OpenDatabase(0, "host=192.168.144.129 dbname=my_database user=my_user password=my_password port=5432", "my_user", "my_password")
    Debug "Connected to the database" 
  Else
    Debug "Connection failed: " + DatabaseError()
  EndIf
EndProcedure

Connect()
; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 11
; Folding = -
; EnableXP
; DPIAware