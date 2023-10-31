import mysql.connector as connector

connection = connector.connect(
    user = "root", 
    password = "root", 
    db = "LittleLemonDB"
)

cursor = connection.cursor()
cursor.execute(
    "SHOW TABLES"
)
results = cursor.fetchall()
print("Tables names:\n")
for i in results:
    print(i)

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

cursor.execute(join_query)
results = cursor.fetchall()

print("\nName and contact details for every customer that has placed an order greater than $60.\n")
print(cursor.column_names)
for i in results:
    print(i)
