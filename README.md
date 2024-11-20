# Car Rental Database System

This project implements a distributed database for a car rental company with a simple user interface for data management. The system supports multiple locations and allows monitoring and managing rentals.

## Objective and Scope
The project aims to create a distributed database enabling car rental data management. Key features include:
- Two nodes (Wrocław and Warsaw) representing rental branches.
- Data fragmentation and replication between nodes.
- A simple GUI for adding new records to the database and monitoring data.

## Architecture
The database is based on Oracle 23c AI Free Edition, hosted on two virtual machines in the OpenStack cloud:
- **Horizontal fragmentation** for car tables (creating a separate technical details table).
- **Replication** for shared tables (e.g., cooperation points).
- **Indexing and transactions** for optimization and data consistency.

Diagrams of the database schema and network architecture are available in the `diagrams` folder.

## Features
- **Data management** for customers, cars, rentals, and employees.
- **Views** for synchronizing data between nodes.
- Real-time data processing via streaming technology.

## Requirements
- **Python 3.8+**
- **Flask**
- **cx_Oracle**
- Virtual machines in the OpenStack cloud with Rocky Linux 9.
- SQL Developer for database management.

## Launch Instructions
1. Set up the virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate
   pip install Flask cx_Oracle
2. Run the application:
   ```bash
   python app.py
3. Retrieve the local IP address from the terminal and open it in a browser.

## Project Structure
- Frontend: Forms for managing records (HTML/CSS).
- Backend: API for database communication.
- SQL Commands: SQL scripts for creating and managing the database structure.

## Key Functionalities
- Cooperation Points Table: Shared between nodes.
- Data Replication: Synchronizes data across locations.
- Views and Data Refreshing: Ensures data consistency throughout the system.

## Issues and Limitations
- GUI does not support client record deletion due to SQL permission restrictions.
- Sharding functionality unavailable in the free version of Oracle 23c.
