import sqlite3
#making db conncections 
db_conc=sqlite3.connect('test.db')
db=db_conc.cursor()

print("Database connection started")

db.execute('''CREATE TABLE STUDENTS
           (rollno real not null,
            name text not null,
            phoneno real not null,
            grade char(2) not null);''')

db_conc.commit()
print("Database table made")
#inserting dummy values
db.execute("INSERT INTO STUDENTS VALUES (001,'aaa',9000000000,'A');")
db.execute("INSERT INTO STUDENTS VALUES (002,'aab',9000000001,'EX');")
db.execute("INSERT INTO STUDENTS VALUES (003,'aac',9000000002,'B');")
db.execute("INSERT INTO STUDENTS VALUES (007,'aag',9000000006,'EX');")
db.execute("INSERT INTO STUDENTS VALUES (004,'aad',9000000003,'EX');")
db.execute("INSERT INTO STUDENTS VALUES (005,'aae',9000000004,'A');")
db.execute("INSERT INTO STUDENTS VALUES (006,'aaf',9000000005,'C');")
db.execute("INSERT INTO STUDENTS VALUES (007,'aag',9000000006,'EX');")
db.execute("INSERT INTO STUDENTS VALUES (008,'aah',9000000007,'B');")
db.execute("INSERT INTO STUDENTS VALUES (009,'aai',9000000008,'EX');")
db.execute("INSERT INTO STUDENTS VALUES (010,'aaj',9000000009,'A');")
db.execute("INSERT INTO STUDENTS VALUES (011,'aah',9000000010,'A');")
db.execute("INSERT INTO STUDENTS VALUES (012,'aal',9000000011,'EX');")
db.execute("INSERT INTO STUDENTS VALUES (013,'aam',9000000012,'A');")
db.execute("INSERT INTO STUDENTS VALUES (011,'aah',9000000010,'A');")

# printing
db_conc.commit()
db.execute("SELECT * FROM STUDENTS")
data= db.fetchall()
for item in data:
    print(f"{item}")

# Deleting multiple same record 
db.execute("DELETE FROM students WHERE rollno NOT IN (SELECT MIN(rollno) FROM students GROUP BY name)")
db_conc.commit()

# Print the database after deleting duplicates
print("\nDatabase after deleting duplicate records:")
db.execute("SELECT * FROM students ORDER BY rollno")
for row in db.fetchall():
    print(row)

# Sorting by asending order
db.execute("SELECT * FROM STUDENTS ORDER BY rollno ASC")
print("The students by order of their roll no are:\n")
# printing
data= db.fetchall()
for item in data:
    print(f"{item}")

# counting number of EX
db.execute("SELECT COUNT(grade) FROM STUDENTS WHERE grade='EX'; ")
# printing
print(f'The number of students with EX are {db.fetchall()[0][0]}')

# Adding new column
db.execute("ALTER TABLE STUDENTS ADD city TEXT; ")

# printing after adding
db_conc.commit()
db.execute("SELECT * FROM STUDENTS")
print("The table after new column")
data= db.fetchall()
for item in data:
    print(f"{item}")

# Updating new column data
db.execute("UPDATE STUDENTS SET city='KOLKATA';")

# printing
db.execute("SELECT * FROM STUDENTS")
print("The table after alteration")
data= db.fetchall()
for item in data:
    print(f"{item}")

# Updating particular record
db.execute("UPDATE STUDENTS SET city='B14/221, Kalyani.' WHERE rollno='1' ;") 

# printing
db.execute("SELECT * FROM STUDENTS")
print("The table after alteration of 1st")
data= db.fetchall()
for item in data:
    print(f"{item}")