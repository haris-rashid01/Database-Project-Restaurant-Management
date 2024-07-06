const express = require('express');
const cors = require('cors');
const { Client } = require('pg');

const PORT = 4000;
const app = express();
const client = new Client({
    user: 'postgres',
    host: 'localhost',
    database: 'RestaurantManagementSystem',
    password: 'postgre.exe',
    port: 5432,
});

client.connect().then(() => {
    console.log('Connected to Database.');
}).catch((err) => {
    console.log('Error Connecting Database:', err);
});

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

let customerId;
let orderId;
let billId;
let waiterId;
let cookId;

async function generateIDs() {
    try {
        customerId = await generateUniqueID('C', 'Customers', 'Customer_Id');
        orderId = await generateUniqueID('O', 'Orders', 'Order_Id');
        billId = await generateUniqueID('B', 'Bill', 'Bill_No');
        waiterId = await generateUniqueID('W', 'Waiter_Info', 'Waiter_Id');
        cookId = await generateUniqueID('K', 'Cook_Info', 'Cook_Id');
    } catch (error) {
        console.error('Error generating IDs:', error);
    }
}

app.get('/generateIDs', async (req, res) => {
    try {
        await generateIDs();
        res.send('IDs generated successfully.');
    } catch (error) {
        console.error('Error generating IDs:', error);
        res.status(500).send('Internal Server Error');
    }
});

app.get('/receiptData', async (req, res) => {
    try {
        const customerQuery = `SELECT * FROM Customers WHERE Customer_Id = $1`;
        const customerRes = await client.query(customerQuery, [customerId]);

        const orderQuery = `SELECT * FROM Orders WHERE Order_Id = $1`;
        const orderRes = await client.query(orderQuery, [orderId]);

        const billQuery = `SELECT * FROM Bill WHERE Bill_No = $1`;
        const billRes = await client.query(billQuery, [billId]);

        const waiterQuery = `SELECT * FROM Waiter_Info WHERE Waiter_Id = $1`;
        const waiterRes = await client.query(waiterQuery, [waiterId]);

        const cookQuery = `SELECT * FROM Cook_Info WHERE Cook_Id = $1`;
        const cookRes = await client.query(cookQuery, [cookId]);

        const responseData = {
            customer: customerRes.rows,
            order: orderRes.rows,
            bill: billRes.rows,
            waiter: waiterRes.rows,
            cook: cookRes.rows
        };
        res.json(responseData);
    } catch (error) {
        console.error('Error Fetching Data:', error);
        res.status(500).send('Internal Server Error');
    }
});

app.get('/staff', async (req, res) => {
    try {
        const query = `SELECT * FROM Staff`;
        const result = await client.query(query);
        res.json({ staff: result.rows });
    } catch (error) {
        console.error('Error Fetching Staff Data:', error);
        res.status(500).send('Internal Server Error');
    }
});

app.post('/submitReview', async (req, res) => {
    try {
        const { rating, review } = req.body;
        const query = `INSERT INTO Rating (Rating_Id, Rating, Review) VALUES ($1, $2, $3)`;
        const values = [ratingId, rating, review];
        await client.query(query, values);
        res.send('Review submitted successfully.');
    } catch (err) {
        console.error('Error inserting data:', err);
        res.status(500).send('Error inserting data.');
    }
});

app.post('/submitOrder', async (req, res) => {
    try {
        const { customerId, noOfItems, descriptions } = req.body;
        const query = `INSERT INTO Orders (Order_Id, Customer_Id, No_of_Items, Descriptions, Created_At, Order_Status) VALUES ($1, $2, $3, $4, NOW(), 'Pending')`;
        const values = [orderId, customerId, noOfItems, descriptions];
        await client.query(query, values);
        res.send('Order submitted successfully.');
    } catch (err) {
        console.error('Error inserting data:', err);
        res.status(500).send('Error inserting data.');
    }
});

app.post('/submitCustomer', async (req, res) => {
    try {
        const { fname, lname, phone, email, restaurantId } = req.body;
        const query = `INSERT INTO Customers (Customer_Id, Restaurant_Id, Customer_Fname, Customer_Lname, Customer_Phone, Email_Id) VALUES ($1, $2, $3, $4, $5, $6)`;
        const values = [customerId, restaurantId, fname, lname, phone, email];
        await client.query(query, values);
        res.send('Customer submitted successfully.');
    } catch (error) {
        console.error('Error inserting data:', error);
        res.status(500).send('Error inserting data.');
    }
});

async function generateUniqueID(prefix, tableName, columnName) {
    const idLength = 4;
    let id;
    do {
        const randomDigits = Math.floor(Math.random() * 1000);
        id = prefix + randomDigits.toString().padStart(3, '0');
    } while (!(await isIDUnique(tableName, columnName, id)));
    return id;
}

async function isIDUnique(tableName, columnName, id) {
    try {
        const query = `SELECT EXISTS (SELECT 1 FROM ${tableName} WHERE ${columnName} = $1) AS exists`;
        const result = await client.query(query, [id]);
        return !result.rows[0].exists;
    } catch (error) {
        console.error(`Error checking ${columnName} uniqueness:`, error);
        throw error;
    }
}

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
