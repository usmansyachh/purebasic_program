UseSQLiteDatabase() ;Syntax untuk pakai sqlite

;==============================================================================================================================
;CREATE TABLE
Procedure create()
 Filename$ = OpenFileRequester("sqlite", "PureBasic.sqlite", "*.sqlite|*.sqlite", 0) ;Open dan Buat Sqlite  

If OpenDatabase(0, Filename$, "", "")
    PrintN ("Connected to PureBasic.sqlite")
    If DatabaseUpdate(0, "CREATE TABLE purebasic (name VARCHAR(50) PRIMARY KEY, asal VARCHAR(50),age VARCHAR(10));") ;Membuat Tabel
      PrintN ("Table created")
    EndIf
  EndIf
EndProcedure

;==============================================================================================================================
;INSERT
Procedure insert()
  Filename$ = OpenFileRequester("sqlite", "PureBasic.sqlite", "*.sqlite|*.sqlite", 0) ;Open dan Buat Sqlite  
  
If OpenDatabase(0, Filename$, "", "")
    PrintN ("Connected to PureBasic.sqlite")

    Print("Masukkan nama: ")
    name$ = Input() ;mengambil input nama
    Print("Masukkan asal: ")
    asal$ = Input() ;mengambil input asal
    Print("Masukkan usia: ")
    age$ = Input() ;mengambil input usia
    PrintN("")
    
    ; Query SQL untuk memasukkan data ke dalam tabel
    InsertQuery$ = "INSERT INTO purebasic (name, asal, age) VALUES ('" + name$ + "', '" + asal$ + "', '" + age$ + "');" ;Insert ke tabel purebasic
    
    ; Melakukan eksekusi query
    If DatabaseUpdate(0, InsertQuery$)
      PrintN ("Data Berhasil di Insert")
    Else
      PrintN ("Data Gagal di Insert: " + DatabaseError())
    EndIf
    
    ; Tutup koneksi ke database
    CloseDatabase(0)
    
  Else
    PrintN("Failed to connect to PureBasic.sqlite")
  EndIf
  
  MessageRequester("Insert Data", "Data Berhasil di Insert.")
EndProcedure

;================================================================================================================================
;BACA
Procedure baca()
Filename$ = OpenFileRequester("sqlite", "PureBasic.sqlite", "*.sqlite|*.sqlite", 0) ;Open dan Buat Sqlite  
  
If OpenDatabase(0, Filename$, "", "")
    PrintN ("Connected to PureBasic.sqlite")
      
    If DatabaseQuery(0, "SELECT * FROM purebasic") ;Fungsi Read
      While NextDatabaseRow(0) ; Perulangan untuk menampilkan data
        PrintN (GetDatabaseString(0, 0) + " " + GetDatabaseString(0, 1) + " " + GetDatabaseString(0, 2))  ; Perulangan untuk menampilkan data           
      Wend
      
      FinishDatabaseQuery(0)
      CloseDatabase(0)
      
    EndIf
  EndIf
  
  MessageRequester("Baca Data", "Data Berhasil di Baca.")
EndProcedure

;================================================================================================================================
;UPDATE
Procedure update()
  Filename$ = OpenFileRequester("sqlite", "PureBasic.sqlite", "*.sqlite|*.sqlite", 0)
    If OpenDatabase(0, Filename$, "", "")
      PrintN ("Connected to PureBasic.sqlite")
      
      Print("Masukkan nama yang akan diupdate: ")
      searchName$ = Input() ;Mengambil input nama yang akan di update
      
      Print("Masukkan asal: ")
      asal$ = Input() ;mengambil input asal
      Print("Masukkan usia: ")
      age$ = Input() ;mengambil input usia
      PrintN("")
      
      ; Query SQL untuk memasukkan data ke dalam tabel
      UpdateQuery$ = "UPDATE purebasic SET asal='" + asal$ + "', age='" + age$ + "' WHERE name='" + searchName$ + "';" ;nama yang dipilih akan terupdate dan akan disuruh menginputkan asal dan age
  
      
      ; Melakukan eksekusi query
      If DatabaseUpdate(0, UpdateQuery$)
        PrintN ("Data Berhasil di Update")
      Else
        Debug "Data Gagal di Update" + DatabaseError()
      EndIf
      
      ; Tutup koneksi ke database
      CloseDatabase(0)
      
    Else
      Debug "Failed to connect to PureBasic.sqlite"
    EndIf
    
    MessageRequester("Update Data", "Data Berhasil di Update.")
EndProcedure

;================================================================================================================================
;HAPUS
Procedure del()
  Filename$ = OpenFileRequester("sqlite", "PureBasic.sqlite", "*.sqlite|*.sqlite", 0)
  If OpenDatabase(0, Filename$, "", "")
      PrintN ("Connected to PureBasic.sqlite")
      
      Print("Masukkan nama yang akan dihapus: ")
      searchNama$ = Input()
      
      ; Query SQL untuk memasukkan data ke dalam tabel
      DeleteQuery$ = "DELETE FROM purebasic WHERE name ='" + searchNama$ + "';" ;Fungsi Delete Query
      
      ; Melakukan eksekusi query
      If DatabaseUpdate(0, DeleteQuery$)
        PrintN ("Data Berhasil di Hapus")
        PrintN (" ")
        PrintN ("Data Terbaru")
        PrintN ("------------")
    
            If DatabaseQuery(0, "SELECT * FROM purebasic")
              While NextDatabaseRow(0) ; Loop for each records
                PrintN (GetDatabaseString(0, 0) + " " + GetDatabaseString(0, 1) + " " + GetDatabaseString(0, 2))  ; Menampilkan Data           
              Wend
            EndIf

      Else
        PrintN ("Data Gagal di Hapus: " + DatabaseError())
      EndIf
      
      ; Tutup koneksi ke database
      CloseDatabase(0)
      
    Else
      PrintN ("Failed to connect to PureBasic.sqlite")
    EndIf
    
    MessageRequester("Hapus Data", "Data Delete process complete.")
EndProcedure

; Fungsi untuk menampilkan menu
Procedure ShowMenu()
    OpenConsole()
    Repeat
        PrintN("=======================")
        PrintN("| Menu SQlite Console |")
        PrintN("=======================")
        PrintN("1. Create Table Sqlite")
        PrintN("2. Insert Data Sqlite")
        PrintN("3. Baca Data Sqlite")
        PrintN("4. Update Data Sqlite")
        PrintN("5. Hapus Data Sqlite")
        PrintN("6. Keluar")
        
        PrintN(#CRLF$ + "Pilih menu (1-6): ")
        choice$ = Input()
    
        Select choice$
            Case "1"
                create()
                PrintN("")
            Case "2"
                insert()
                PrintN("")
            Case "3"
                baca()
                PrintN("")
            Case "4"
                update()
                PrintN("")
            Case "5"
                del()
                PrintN("")
            Case "6"
                Print("Keluar dari program")
                CloseConsole () ;pilih 6 langsung exit
        EndSelect
    Until choice$ = "6"
EndProcedure

; Mulai program
ShowMenu()
; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 70
; FirstLine = 38
; Folding = --
; EnableXP
; DPIAware
; Executable = ..\Users\user\Downloads\cek.exe
; DisableDebugger