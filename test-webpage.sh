#!/bin/bash
echo "🌐 TESTING WEBPAGE ACCESS"
echo "========================="

echo "1. Testing local connection..."
if curl -s http://localhost:8080 > /dev/null; then
    echo "   ✅ Web service is responding locally"
else
    echo "   ❌ Web service not responding"
fi

echo ""
echo "2. Your accessible URLs:"
echo "   📱 Webpage: https://${CODESPACE_NAME}-8080.githubpreview.dev"
echo "   🔗 API:      https://${CODESPACE_NAME}-3000.githubpreview.dev"

echo ""
echo "3. Quick content preview:"
curl -s http://localhost:8080 | grep -E "(title|h1|Success)" | head -5

echo ""
echo "4. Instructions:"
echo "   - Open: https://${CODESPACE_NAME}-8080.githubpreview.dev"
echo "   - Or click the globe icon 🌐 next to port 8080 in 'Ports' tab"
