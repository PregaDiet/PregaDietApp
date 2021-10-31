import os
import sqlite3

setup_required = False

files = os.listdir()
if 'aasha_database.db' not in files:
    setup_required = True    

conn = sqlite3.connect("aasha_database.db", check_same_thread=False)
curr = conn.cursor()


def add_aasha(name, phone, region):
    with conn:
        curr.execute("INSERT INTO aasha VALUES (:name, :phone, :region)", {'name': name, 'phone': phone, 'region': region})


def setup():
    curr.execute(
        """
        CREATE TABLE aasha (
            name TEXT,
            phone TEXT,
            region TEXT
        )
        """
    )
    conn.commit()

    add_aasha('Veena', '9813680659', 'mumbai')
    add_aasha('Mamwati', '9813108480', 'delhi')
    add_aasha('Savita', '967168700', 'bangalore')
    add_aasha('Fatima', '8813758218','hyderabad')
    add_aasha('Vimlesh', '9416736106', 'chennai')
    add_aasha('Rekha', '9810013824', 'kolkata')
    add_aasha('Rajbala', '9813434345', 'surat')
    add_aasha('Sudha', '9816105676', 'jaipur')
    add_aasha('Suresh', '9811557015', 'kanpur')
    add_aasha('laxmi', '9813116852', 'nagpur')
    add_aasha('Sunita', '9812914121', 'indore')
    add_aasha('Savitri', '9255887200', 'bhopal')



def get_data(curr, region):
    curr.execute("SELECT name, phone FROM aasha WHERE region=:region", {'region': region})
    return curr.fetchone()


if setup_required:
    setup()

conn.close()
