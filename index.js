// load required modules
const express = require('express');
const cors = require('cors');

const dotenv = require('dotenv');

// config
dotenv.config();
const app = express();
const port = 8000;

app.use(cors({
    origin: 'http://localhost:5173',
    credentials: true
}));
app.use(express.json());

app.get("/", (req, res) => {
    res.send("HopeKCC Git Test API");
    console.log(req);
});

app.get("/updatePage/:userid", (req, res)=>{
    const user = req.params.userid;
    
})

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});