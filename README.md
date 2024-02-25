# RealEstate App README

Welcome to the RealEstate app! This app is designed to help manage and organize real estate-related data, specifically focused on customers, agents, properties, and appointments. This README file provides an overview of the app's functionality and guides you on how to set up and use the app.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Database Schema](#database-schema)
- [Database Structure](#database-structure)
- [CRUD Operations](#crud-operations)
- [Technologies Used](#technologies-used)
- [Conclusion](#conclusion)

## Requirements

To run the RealEstate app, you need to have the following software installed on your system:

- Xcode (version 12 or higher)
- Postico 2 (for managing the PostgreSQL database)
- PostgreSQL (as the database management system)
- Postman (for testing the API endpoints)

## Installation

Follow the steps below to set up and run the RealEstate app:

1. Clone the repository to your local machine:

```bash
git clone https://github.com/Sahar-Yousef/RealEstate.git
```

2. Open the project in Xcode.

3. Configure the database connection settings in the app's configuration file.

4. Set up the database:

   - Create a new database in PostgreSQL.
   - Use Postico 2 or any other preferred tool to import the provided database schema.

5. Build and run the app in Xcode.

The app will be available at `http://localhost:8080`.

## Database Schema
https://github.com/Sahar-Yousef/RealEstate/blob/main/Screenshot.png

## Database Structure

The RealEstate app uses a PostgreSQL database with the following four tables:

1. **Customer**: Stores information about the customers.
   - Columns: `Customer ID (PK)`, `Name`, `Contact`

2. **Agent**: Stores information about the agents.
   - Columns: `Agent ID (PK)`, `Name`, `Contact`

3. **Properties**: Stores information about the properties.
   - Columns: `Property ID (PK)`, `Type`, `Size`, `City`, `Address`, `Owner`, `AgentID (FK)`, `Price`, `Description`, `Image`, `PropertyStatus`

4. **Appointment**: Stores information about the appointments.
   - Columns: `Appointment ID (PK)`, `Date`, `Time`, `Appointment Status`, `Property ID (FK)`, `Customer ID (FK)`

## CRUD Operations

The RealEstate app provides full CRUD (Create, Read, Update, Delete) functionality for each table.

- **Customer**:
  - Create a new customer: `POST /api/customers`
  - Read all customers: `GET /api/customers`
  - Read a specific customer: `GET /api/customers/:id`
  - Update a customer: `PUT /api/customers/:id`
  - Delete a customer: `DELETE /api/customers/:id`

- **Agent**:
  - Create a new agent: `POST /api/agents`
  - Read all agents: `GET /api/agents`
  - Read a specific agent: `GET /api/agents/:id`
  - Update an agent: `PUT /api/agents/:id`
  - Delete an agent: `DELETE /api/agents/:id`

- **Properties**:
  - Create a new property: `POST /api/properties`
  - Read all properties: `GET /api/properties`
  - Read a specific property: `GET /api/properties/:id`
  - Update a property: `PUT /api/properties/:id`
  - Delete a property: `DELETE /api/properties/:id`

- **Appointment**:
  - Create a new appointment: `POST /api/appointments`
  - Read all appointments: `GET /api/appointments`
  - Read a specific appointment: `GET /api/appointments/:id`
  - Update an appointment: `PUT /api/appointments/:id`
  - Delete an appointment: `DELETE /api/appointments/:id`

## Technologies Used

The RealEstate app is developed using the following technologies:

- Swift: The programming language used for iOS app development.
- Vapor: A server-side Swift web framework used for building the backend API.
- Xcode: The integrated development environment (IDE) used for iOS app development.
- Postico 2: A PostgreSQL client for Mac used for managing the PostgreSQL database.
- PostgreSQL: The PostgreSQL database management system.
- Postman: A tool for testing and documenting APIs.

## Conclusion

Congratulations! You have successfully set up and familiarized yourself with the RealEstate app. You can now start using the provided CRUD operations to manage customers, agents, properties, and appointments. If you have any questions or encounter any issues, please refer to the app's documentation or reach out to the app's developer for support. Happy real estate management!
