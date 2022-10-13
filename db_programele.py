import sqlite3

connector = sqlite3.connect("data/zmones.db")
cursor = connector.cursor()

with connector:
    while True:
        vardas = input("Iveskite varda arba ! kad iseiti arba . kad ivesti nauja: ")
        if vardas.casefold() == "!":
            break
        elif vardas == ".":
            print("---Naujas draugelis---")
            naujas_vardas = input("Vardas: ")
            nauja_pavarde = input("Pavarde: ")
            naujas_email = input("E-mail: ")
            cursor.execute('INSERT INTO draugai (first_name, last_name, email) VALUES (?, ?, ?)', 
                (naujas_vardas, nauja_pavarde, naujas_email))
            connector.commit()
        else:
            select_query = 'SELECT * FROM draugai WHERE first_name LIKE ?'
            # print(f'.... vykdome {select_query}....')
            cursor.execute(select_query, (vardas))
            rezultatas = cursor.fetchall()
            if rezultatas:
                print('Radau tokius draugelius:')
                for draugas in rezultatas:
                    print(f'- {draugas[0]} {draugas[1]} {draugas[2]}')
            else:
                print('Tokio draugelio nera')
    print('Bye!')