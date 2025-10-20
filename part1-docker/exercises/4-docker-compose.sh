#!/bin/bash
echo "================================================================================"
echo "EXERCISE 4: Docker Compose - Multi-container Application"
echo "================================================================================"
echo "Points: 2.5"
echo ""

echo "🚀 1. Starting multi-container application..."
docker-compose up -d
sleep 15
echo ""

echo "📊 2. Checking all services status..."
docker-compose ps
echo ""

echo "🔍 3. Viewing service logs..."
docker-compose logs --tail=3
echo ""

echo "🌐 4. Testing web service..."
curl -s http://localhost:8080 | grep -o "<title>.*</title>"
echo ""

echo "🔌 5. Testing API service..."
curl -s http://localhost:3000/health
echo ""
curl -s http://localhost:3000/products | jq -r '.message' 2>/dev/null || curl -s http://localhost:3000/products
echo ""

echo "🗄️  6. Testing database connection..."
docker-compose exec database mysql -u root -plabpassword -e "SHOW DATABASES;" | grep labdb
echo ""

echo "🔨 7. Testing Redis connection..."
docker-compose exec redis redis-cli ping
echo ""

echo "📈 8. Checking resource usage..."
docker-compose stats --no-stream
echo ""

echo "🛑 9. Stopping application..."
docker-compose down
echo ""

echo "🧹 10. Cleaning up volumes..."
docker volume prune -f
echo ""

echo "✅ Exercise 4 Completed - 10/10 points total"
echo ""
echo "🎉 CONGRATULATIONS! You've completed all Docker exercises!"
echo "================================================================================"