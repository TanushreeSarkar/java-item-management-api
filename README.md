# Simple E-commerce Backend

A simple Spring Boot application for managing e-commerce products.

## Prerequisites
- Java 17 or higher
- Maven (optional, wrapper included in standard projects, but here we assume `mvn` is installed or use global maven)

## Running the Application
To run the application, navigate to the project root and execute:

```bash
mvn spring-boot:run
```

The application will start on `http://localhost:8080`.

## API Endpoints

### 1. Add a Product
**Endpoint:** `POST /api/products`
**Body:**
```json
{
  "name": "Laptop",
  "description": "High-end gaming laptop",
  "price": 1200.50
}
```

### 2. Get a Product by ID
**Endpoint:** `GET /api/products/{id}`

### 3. Get All Products
**Endpoint:** `GET /api/products`

## Validation
- `name`: Cannot be blank.
- `price`: Must be greater than 0.

## Example Usage with Curl

```bash
# Add a product
curl -X POST http://localhost:8080/api/products -H "Content-Type: application/json" -d '{"name": "Phone", "description": "Smart phone", "price": 699.99}'

## Deployment (Simple & Fast)
To deploy this application "correctly" and simply without Docker:

1.  **Build the JAR file**:
    ```bash
    ./mvnw clean package
    ```
2.  **Run the JAR**:
    Copy the generated jar file (`target/ecommerce-0.0.1-SNAPSHOT.jar`) to your server and run:
    ```bash
    java -jar ecommerce-0.0.1-SNAPSHOT.jar
    ```

You need a server/environment with **Java 17+ installed** (e.g., a VPS, standard cloud VM, or a Java-native host).

## Error Handling
The API returns standard JSON error responses:
- **404 Not Found**: When a resource (e.g., Product ID) is not found.
- **400 Bad Request**: When input validation fails (e.g., missing name, invalid price).
- **500 Internal Server Error**: For unexpected server errors.

Example Error Response:
```json
{
  "price": "must be greater than 0",
  "name": "must not be blank"
}
```
