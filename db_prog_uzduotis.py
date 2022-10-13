import sqlite3

connector = sqlite3.connect('data/dzidzi.db')
cursor = connector.cursor()

with connector:
    while True:
        automobilis = input("Iveskite duomenis apie auto arba ! kad iseiti: ")
        if automobilis == "!":
            break
        elif print("---Naujas automobilis---"):
            nauja_marke = input("Marke: ")
            naujas_modelis = input("Modelis: ")
            nauja_spalva = input("Spalva: ")
            pagaminimo_metai = input("Pagaminimo metai: ")
            kaina = ("Kaina: ")
            cursor.execute('INSERT INTO masinos (marke, modelis, spalva, pagaminimo_metai, kaina) VALUES (?, ?, ?, ?, ?);', 
            (nauja_marke, naujas_modelis, nauja_spalva, pagaminimo_metai, kaina))
            connector.commit()
        
