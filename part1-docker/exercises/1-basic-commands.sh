#!/bin/bash
echo "================================================================================"
echo "EXERCISE 1: Basic Docker Commands"
echo "================================================================================"
echo "Points: 2.5"
echo ""

echo "📋 1. Checking Docker installation..."
docker --version
echo ""

echo "📊 2. Docker system information..."
docker info | grep -E "Containers|Images|Server Version"
echo ""

echo "🌍 3. Running hello-world container..."
docker run --rm hello-world
echo ""

echo "📦 4. Pulling Nginx image..."
docker pull nginx:alpine
echo ""

echo "📋 5. Listing Docker images..."
docker images
echo ""

echo "✅ Exercise 1 Completed - 2.5/10 points"
echo "================================================================================"