UseSQLiteDatabase()

If OpenDatabase(0, "SQLite", "F:\MAGANG ALFA DATABASE\sqlite\PureBasic.sqlite")
  Debug "Connected to the SQLite database"
  
  ; Lakukan query dan operasi lainnya di sini
  
  CloseDatabase(0)
Else
  Debug "Failed to connect to the SQLite database"
EndIf
; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 3
; EnableXP
; DPIAware