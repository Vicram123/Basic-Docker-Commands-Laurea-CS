#!/bin/bash
echo "================================================================================"
echo "EXERCISE 2: Container Management"
echo "================================================================================"
echo "Points: 2.5"
echo ""

echo "🚀 1. Starting Nginx container in background..."
docker run -d --name web-server -p 8080:80 nginx:alpine
sleep 3
echo ""

echo "📊 2. Checking running containers..."
docker ps
echo ""

echo "📝 3. Viewing container logs..."
docker logs web-server --tail 5
echo ""

echo "🔍 4. Inspecting container details..."
docker inspect web-server | grep -A 5 "NetworkSettings"
echo ""

echo "💻 5. Executing command inside container..."
docker exec web-server nginx -v
echo ""

echo "📊 6. Checking container resource usage..."
docker stats web-server --no-stream
echo ""

echo "🛑 7. Stopping and removing container..."
docker stop web-server
docker rm web-server
echo ""

echo "✅ Exercise 2 Completed - 5/10 points total"
echo "================================================================================"