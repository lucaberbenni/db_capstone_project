import mysql.connector as connector

# Establishing a connection to the MySQL database using the 'connect' method.
# The required parameters are the username, password, and database name.
connection = connector.connect(
    user = "root", 
    password = "root", 
    db = "LittleLemonDB"
)

# Creating a cursor object using the 'cursor' method of the connection object.
# The cursor is used to execute SQL queries and fetch results.
cursor = connection.cursor()

# Executing an SQL query to show all the tables in the database.
cursor.execute(
    "SHOW TABLES"
)

# Fetching all the results of the query and storing them in the 'results' variable.
results = cursor.fetchall()

print("\nTables names:\n")
for i in results:
    print(i)

# Defining a multi-line SQL query string.
# This query performs an INNER JOIN between the 'CustomerDetails' and 'Orders' tables,
# selecting the name, contact, and total cost for orders greater than $60.
join_query = """
SELECT
CustomerDetails.Name AS Name, 
CustomerDetails.Contact AS Contact, 
Orders.TotalCost AS TotalCost

FROM 
CustomerDetails

INNER JOIN 
Orders 
ON 
Orders.CustomerID = CustomerDetails.CustomerID

WHERE
Orders.TotalCost > 60;
"""

# Executing the join query.
# Fetching all the results of the query and storing them in the 'results' variable.
cursor.execute(join_query)
results = cursor.fetchall()

print("\nName and contact details for every customer that has placed an order greater than $60:\n")
print(cursor.column_names)
for i in results:
    print(i)

cursor.close()
connection.close()