-- Create database
CREATE DATABASE TestDB;

-- Use database
--USE TestDB;

-- Create table
CREATE TABLE Users (
    ID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100),
    Email NVARCHAR(100)
);

-- Insert sample data
INSERT INTO Users (Name, Email)
VALUES ('Alice', 'alice@example.com'), ('Bob', 'bob@example.com');
