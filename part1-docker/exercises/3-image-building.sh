#!/bin/bash
echo "================================================================================"
echo "EXERCISE 3: Image Building with Dockerfile"
echo "================================================================================"
echo "Points: 2.5"
echo ""

echo "📦 1. Building custom Docker image..."
docker build -t my-custom-app:v1.0 -t my-custom-app:latest .
echo ""

echo "📋 2. Verifying image creation..."
docker images | grep my-custom-app
echo ""

echo "🚀 3. Running custom application..."
docker run -d --name my-app -p 8081:80 my-custom-app
sleep 5
echo ""

echo "🌐 4. Testing application accessibility..."
curl -s http://localhost:8081 | grep -o "<title>.*</title>"
echo ""

echo "🔍 5. Checking container status and health..."
docker ps --filter "name=my-app" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo ""

echo "📊 6. Viewing image history..."
docker history my-custom-app:latest
echo ""

echo "🏷️  7. Tagging and pushing practice..."
docker tag my-custom-app:latest my-custom-app:exercise3
docker images | grep my-custom-app
echo ""

echo "🧹 8. Cleaning up..."
docker stop my-app
docker rm my-app
echo ""

echo "✅ Exercise 3 Completed - 7.5/10 points total"
echo "================================================================================"c