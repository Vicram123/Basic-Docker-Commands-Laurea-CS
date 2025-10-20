const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

// Simple in-memory database
let products = [
    { id: 1, name: 'Laptop', price: 999.99, category: 'Electronics' },
    { id: 2, name: 'Book', price: 29.99, category: 'Education' },
    { id: 3, name: 'Coffee Mug', price: 12.99, category: 'Home' }
];

let orders = [];

// Routes
app.get('/', (req, res) => {
    res.json({
        message: 'Welcome to Docker Lab API',
        version: '1.0.0',
        timestamp: new Date().toISOString()
    });
});

app.get('/health', (req, res) => {
    res.json({ 
        status: 'healthy',
        service: 'Docker Lab API',
        uptime: process.uptime()
    });
});

app.get('/products', (req, res) => {
    res.json({
        success: true,
        data: products,
        count: products.length
    });
});

app.post('/orders', (req, res) => {
    const { productId, quantity } = req.body;
    const product = products.find(p => p.id === productId);
    
    if (!product) {
        return res.status(404).json({ success: false, error: 'Product not found' });
    }

    const order = {
        id: orders.length + 1,
        product: product.name,
        quantity,
        total: product.price * quantity,
        timestamp: new Date().toISOString()
    };

    orders.push(order);
    res.status(201).json({ success: true, data: order });
});

app.get('/orders', (req, res) => {
    res.json({
        success: true,
        data: orders,
        total: orders.reduce((sum, order) => sum + order.total, 0)
    });
});

app.listen(port, '0.0.0.0', () => {
    console.log(`API server running on port ${port}`);
    console.log(`Health check available at http://localhost:${port}/health`);
});