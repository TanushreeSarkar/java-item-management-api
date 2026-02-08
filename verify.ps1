
Write-Host "Starting Maven build..."
mvn clean install -DskipTests

if ($LASTEXITCODE -ne 0) {
    Write-Error "Maven build failed."
    exit 1
}

Write-Host "Build successful. Starting application in background..."
$process = Start-Process -FilePath "mvn" -ArgumentList "spring-boot:run" -PassThru -NoNewWindow

# Wait for the application to start
Write-Host "Waiting for application to start..."
Start-Sleep -Seconds 20

# Test Add Product
Write-Host "Testing Add Product..."
$postResponse = Invoke-RestMethod -Uri "http://localhost:8080/api/products" -Method Post -ContentType "application/json" -Body '{"name": "Test Item", "description": "A test item", "price": 99.99}'
Write-Host "Added Product: $($postResponse | ConvertTo-Json -Depth 2)"

# Test Get Product
$id = $postResponse.id
if ($id) {
    Write-Host "Testing Get Product (ID: $id)..."
    $getResponse = Invoke-RestMethod -Uri "http://localhost:8080/api/products/$id" -Method Get
    Write-Host "Retrieved Product: $($getResponse | ConvertTo-Json -Depth 2)"
} else {
    Write-Error "Failed to get ID from POST response."
}

# Test Get Product with invalid ID
Write-Host "Testing Get Product (Invalid ID: 9999)..."
try {
    Invoke-RestMethod -Uri "http://localhost:8080/api/products/9999" -Method Get
} catch {
    Write-Host "Caught expected error: $_"
}

# Stop the application
Write-Host "Stopping application..."
Stop-Process -Id $process.Id -Force
Write-Host "Application stopped."
