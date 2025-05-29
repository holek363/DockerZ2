const express = require('express');
const axios = require('axios');
const path = require('path');

const app = express();
const PORT = 3000;
const AUTHOR = "Jakub H";

console.log(`Start: ${new Date().toISOString()}`);
console.log(`Autor: ${AUTHOR}`);
console.log(`Nasłuch na porcie: ${PORT}`);

app.use(express.static('public'));
app.use(express.json());
const API_KEY = '93d2ac54ebbb961a4bdada7c7ec5fdc4';
app.post('/weather', async (req, res) => {
    const { country, city } = req.body;
    try {
        const response = await axios.get(
            `https://api.openweathermap.org/data/2.5/weather?q=${city},${country}&appid=${API_KEY}&units=metric&lang=pl`
        );
        res.json(response.data);
    } catch (error) {
        res.status(500).json({ error: 'Nie udało się pobrać danych pogodowych.' });
    }
});
app.listen(PORT);
