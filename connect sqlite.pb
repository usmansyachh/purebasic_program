UseSQLiteDatabase()

;CREATE TABLE
Procedure create()
Filename$ = OpenFileRequester("sqlite", "belajar.sqlite", "*.sqlite|*.sqlite", 0) ;membuka file
If OpenDatabase(0, Filename$, "", "")
    Debug "Connected to PureBasic.sqlite"
    If DatabaseUpdate(0, "CREATE TABLE usman (id VARCHAR(10),name VARCHAR(50),age VARCHAR(10));")
      Debug "Table created"
    EndIf
  EndIf
EndProcedure  
;======================================================================================================
 
;INSERT
Procedure Insert()
  Filename$ = OpenFileRequester("sqlite", "belajar.sqlite", "*.sqlite|*.sqlite", 0) ;membuka file
  If OpenDatabase(0, Filename$, "", "") ;jika berhasil dibuka muncul
    Debug "Connected to PureBasic.sqlite" 
    
    ; Data yang akan dimasukkan ke dalam tabel
    id$ = "6"
    name$ = "rawrrr"
    age$ = "1"
    
    ; Query SQL untuk memasukkan data ke dalam tabel
    InsertQuery$ = "INSERT INTO coba (id, name, age) VALUES ('" + id$ + "', '" + name$ + "', '" + age$ + "');"
    
    ; Melakukan eksekusi query
    If DatabaseUpdate(0, InsertQuery$)
      Debug "Data inserted successfully"
    Else
      Debug "Error inserting data: " + DatabaseError()
    EndIf
    
    ; Tutup koneksi ke database
    CloseDatabase(0)
    
  Else
    Debug "Failed to connect to PureBasic.sqlite"
  EndIf
EndProcedure  
  
  MessageRequester("Insert Data", "Data insertion process complete.")
;======================================================================================================  
  
;BACA
Procedure baca()
  Filename$ = OpenFileRequester("sqlite", "belajar.sqlite", "*.sqlite|*.sqlite", 0)
  If OpenDatabase(0, Filename$, "", "") ;0 = variabel
    Debug "Connected to PureBasic.sqlite"
      
    If DatabaseQuery(0, "SELECT * FROM coba")
      While NextDatabaseRow(0) ; Loop for each records
        Debug GetDatabaseString(0, 0) + " " + GetDatabaseString(0, 1) + " " + GetDatabaseString(0, 2)  ; Display the content of the first field           
      Wend
      
      FinishDatabaseQuery(0)
      CloseDatabase(0)
      ; ...
    EndIf
  EndIf
  EndProcedure

;======================================================================================================

;DELETE
Procedure del()
  Filename$ = OpenFileRequester("sqlite", "belajar.sqlite", "*.sqlite|*.sqlite", 0)
  If OpenDatabase(0, Filename$, "", "")
      Debug "Connected to PureBasic.sqlite"
      
      ; Query SQL untuk memasukkan data ke dalam tabel
      InsertQuery$ = "DELETE FROM coba WHERE id = 6"
      
      ; Melakukan eksekusi query
      If DatabaseUpdate(0, InsertQuery$)
        Debug "Data Delete successfully"
      Else
        Debug "Error inserting data: " + DatabaseError()
      EndIf
      
      ; Tutup koneksi ke database
      CloseDatabase(0)
      
    Else
      Debug "Failed to connect to PureBasic.sqlite"
    EndIf
    
    MessageRequester("Hapus Data", "Data Delete process complete.")
  EndProcedure
  
;======================================================================================================
  
;UPDATE
Procedure update()
  Filename$ = OpenFileRequester("sqlite", "belajar.sqlite", "*.sqlite|*.sqlite", 0)
    If OpenDatabase(0, Filename$, "", "")
      Debug "Connected to PureBasic.sqlite"
      
      ; Query SQL untuk memasukkan data ke dalam tabel
      InsertQuery$ = "UPDATE coba SET name = 'haha', age = 5 WHERE id = 2"
      
      ; Melakukan eksekusi query
      If DatabaseUpdate(0, InsertQuery$)
        Debug "Data Update successfully"
      Else
        Debug "Error inserting data: " + DatabaseError()
      EndIf
      
      ; Tutup koneksi ke database
      CloseDatabase(0)
      
    Else
      Debug "Failed to connect to PureBasic.sqlite"
    EndIf
    
    MessageRequester("Update Data", "Data Update process complete.")
EndProcedure

;====================================================================================================== Panggil

baca()

; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 110
; FirstLine = 89
; Folding = -
; Markers = 44
; EnableXP
; DPIAware