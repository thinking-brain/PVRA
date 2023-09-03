# Artisanal clothes sales point (PVRA)

This web application manages the process of creation, purchases and sales of artisanal clothes.

## Features

- User management.
- Management of raw materials and products
- Management of employees.
- Management of purchases of raw materials and products.
- Process of clothes confection. Raw materials movements depend on the product created.
- Sales management.
- Other expenses management.
- Output several reports with the process data.

## Technical requirements

- .Net Framework 4.5
- Microsoft SQL server

## Install

- Create a database called "pvra" in your SQL server.
- Run in the database the script [CreateDatabaseStructure.sql](data/CreateDatabaseStructure.sql) to create the database tables.
- Run in the database the script [BasicData.sql](data/BasicData.sql) to add initial data to the database.
- Run in the database the script [CreateTriggers.sql](data/CreateTriggers.sql) to add initial data to the database.
- The administrator credentials are USER: `admin`, PASSWORD: `admin123*`
