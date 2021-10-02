-- Create Database CREATE SCHEMA car_dealer

-- Sales Transaction table
CREATE TABLE car_dealer.transactions (
	"transaction_id" integer NOT NULL,
	"customer_id" integer NOT NULL,
	"car_serial_number" text NOT NULL,
	"datetime" timestamp NOT NULL,
	"salesperson_id" integer NOT NULL,
	PRIMARY KEY ("transaction_id"),
	FOREIGN KEY ("customer_id") REFERENCES "car_dealer"."customers" ("id"),
	FOREIGN KEY ("car_serial_number") REFERENCES "car_dealer"."list_of_cars" ("serial_number"),
	FOREIGN KEY ("salesperson_id") REFERENCES "car_dealer"."salesperson" ("id"))

-- Car list table
CREATE TABLE car_dealer.list_of_cars (
	"manufacturer" text NOT NULL,
	"model_name" text NOT NULL,
	"serial_number" text NOT NULL,
	"weight" numeric NOT NULL,
	"price" numeric NOT NULL,
	PRIMARY KEY ("serial_number"))

-- Customer details table
CREATE TABLE car_dealer.customers (
	"id" integer NOT NULL,
	"name" text NOT NULL,
	"phone" text NOT NULL,
	PRIMARY KEY ("id"))
    
-- Salesperson details table
CREATE TABLE car_dealer.salesperson (
	"id" integer NOT NULL,
	"name" text NOT NULL,
	"phone" text NOT NULL,
	PRIMARY KEY ("id"))