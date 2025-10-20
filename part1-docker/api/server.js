const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

// Enable CORS for all routes
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    next();
});

// Product database
const products = [
    { 
        id: 1, 
        name: 'Laptop', 
        price: 999.99, 
        category: 'Electronics',
        description: 'High-performance laptop for development',
        image: '💻'
    },
    { 
        id: 2, 
        name: 'Smartphone', 
        price: 699.99, 
        category: 'Electronics',
        description: 'Latest smartphone with advanced features',
        image: '📱'
    },
    { 
        id: 3, 
        name: 'Headphones', 
        price: 149.99, 
        category: 'Audio',
        description: 'Noise-cancelling wireless headphones',
        image: '🎧'
    },
    { 
        id: 4, 
        name: 'Coffee Mug', 
        price: 12.99, 
        category: 'Home',
        description: 'Programmer\'s favorite coffee mug',
        image: '☕'
    },
    { 
        id: 5, 
        name: 'Docker Guide', 
        price: 29.99, 
        category: 'Books',
        description: 'Complete Docker and containerization guide',
        image: '📚'
    },
    { 
        id: 6, 
        name: 'Backpack', 
        price: 49.99, 
        category: 'Accessories',
        description: 'Durable backpack for developers',
        image: '🎒'
    }
];

let orders = [];

// Routes
app.get('/', (req, res) => {
    res.json({
        message: 'Welcome to Docker Lab API',
        version: '1.0.0',
        endpoints: {
            products: '/products',
            health: '/health',
            orders: '/orders'
        },
        timestamp: new Date().toISOString()
    });
});

app.get('/health', (req, res) => {
    res.json({ 
        status: 'healthy',
        service: 'Docker Lab API',
        uptime: process.uptime(),
        productsCount: products.length
    });
});

app.get('/products', (req, res) => {
    res.json({
        success: true,
        data: products,
        count: products.length,
        timestamp: new Date().toISOString()
    });
});

app.get('/products/:id', (req, res) => {
    const productId = parseInt(req.params.id);
    const product = products.find(p => p.id === productId);
    
    if (!product) {
        return res.status(404).json({ 
            success: false, 
            error: 'Product not found' 
        });
    }

    res.json({
        success: true,
        data: product
    });
});

app.post('/orders', (req, res) => {
    const { productId, quantity = 1 } = req.body;
    const product = products.find(p => p.id === productId);
    
    if (!product) {
        return res.status(404).json({ 
            success: false, 
            error: 'Product not found' 
        });
    }

    const order = {
        id: orders.length + 1,
        productId: product.id,
        productName: product.name,
        quantity: quantity,
        unitPrice: product.price,
        total: product.price * quantity,
        timestamp: new Date().toISOString()
    };

    orders.push(order);
    res.status(201).json({ 
        success: true, 
        message: 'Order created successfully',
        data: order 
    });
});

app.get('/orders', (req, res) => {
    res.json({
        success: true,
        data: orders,
        totalOrders: orders.length,
        totalRevenue: orders.reduce((sum, order) => sum + order.total, 0)
    });
});

app.listen(port, '0.0.0.0', () => {
    console.log(`API server running on port ${port}`);
    console.log(`Health check: http://localhost:${port}/health`);
    console.log(`Products: http://localhost:${port}/products`);
    console.log(`Total products: ${products.length}`);
});