# E-Commerce Product Management REST API

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![Maven](https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white)
![RESTful](https://img.shields.io/badge/RESTful-API-009688?style=for-the-badge)

Clean, lightweight **Spring Boot REST API** for managing e-commerce products — created as a sample task for freelance Java developer evaluation.

### Highlights
- Layered architecture (Controller → Service → In-memory Repository)
- Input validation with Jakarta Bean Validation
- Proper HTTP status codes & consistent JSON error responses
- In-memory storage (ArrayList) — no database setup needed
- Maven Wrapper included (runs without global Maven install)
- Professional, recruiter-friendly documentation

## Table of Contents

- [Features](#features)
- [Technologies](#technologies)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [API Endpoints](#api-endpoints)
- [Request & Response Examples](#request--response-examples)
- [Validation Rules](#validation-rules)
- [Error Handling](#error-handling)
- [Project Structure](#project-structure)
- [Deployment (Quick & Free Demo)](#deployment-quick--free-demo)
- [Submitted by](#submitted-by)

## Features

- Create product (`POST /api/products`)
- Get single product by ID (`GET /api/products/{id}`)
- List all products (`GET /api/products`) — bonus endpoint
- Automatic validation on name & price
- Clear, structured error messages
- No external dependencies beyond Spring Boot

## Technologies

- Java 17+
- Spring Boot 3.x
- Spring Web
- Jakarta Bean Validation
- Lombok (optional – reduces boilerplate)
- Maven (with wrapper)

## Prerequisites

- Java 17 or higher
- Git (optional)
- curl / Postman / Insomnia (for testing)

## Quick Start

```bash
# 1. Navigate to project folder
cd your-project-folder

# 2. Run with included Maven Wrapper
./mvnw clean spring-boot:run

# Windows users:
# mvnw.cmd clean spring-boot:run
```
Application starts at: **http://localhost:8080**  
API base path: **/api/products**

## API Endpoints

| Method | Endpoint              | Description                  | Success | Common Errors |
|--------|-----------------------|------------------------------|---------|---------------|
| POST   | `/api/products`       | Create a new product         | 201     | 400           |
| GET    | `/api/products/{id}`  | Get product by ID            | 200     | 404           |
| GET    | `/api/products`       | Get all products             | 200     | —             |

## Request & Response Examples

### Create a Product

```bash
curl -i -X POST http://localhost:8080/api/products \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Wireless Earbuds",
    "description": "True wireless earbuds with ANC & 28h battery",
    "price": 89.99
  }'
```
201 Created
```bash
JSON{
  "id": 1,
  "name": "Wireless Earbuds",
  "description": "True wireless earbuds with ANC & 28h battery",
  "price": 89.99
}
```
Get Product by ID
```bash
curl http://localhost:8080/api/products/1
```
200 OK example response
```bash
JSON{
  "id": 1,
  "name": "Wireless Earbuds",
  "description": "True wireless earbuds with ANC & 28h battery",
  "price": 89.99
}
```
Get All Products
```bash
curl http://localhost:8080/api/products
```
Validation Rules
FieldConstraintError Message on FailurenameNot blank, min 2 chars"Product name is required"pricePositive (> 0)"Price must be greater than zero"descriptionOptional—
Error Handling

Validation error example (400 Bad Request)
```bash
JSON{
  "timestamp": "2026-02-08T22:45:12Z",
  "status": 400,
  "error": "Validation failed",
  "details": {
    "name": "Product name is required",
    "price": "Price must be greater than zero"
  }
}
```
Not found example (404)
```bash
JSON{
  "timestamp": "2026-02-08T22:45:12Z",
  "status": 404,
  "error": "Not Found",
  "message": "Product not found with id: 999"
}
```
Project Structure
```bash
├── src/
│   ├── main/
│   │   ├── java/com/example/ecommerce/
│   │   │   ├── controller/
│   │   │   ├── model/
│   │   │   ├── service/
│   │   │   ├── repository/
│   │   │   └── EcommerceApplication.java
│   │   └── resources/
│   │       └── application.properties
│   └── test/
├── .mvn/
├── mvnw
├── mvnw.cmd
├── pom.xml
└── README.md
```
Submitted by
Tanushree Sarkar
Freelance Java Developer Sample Task
February 2026
