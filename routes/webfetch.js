const express = require('express');
const router = express.Router();

const {switchBranch, resetBranch} = require('../utilities/gitfetch');

router.get("/update/:userid", async (req, res)=>{
    const user = req.params.userid;
    const web_path = "team-os";       // PLACEHOLDER, add classroom param later. don't add leading or trailing slashes
    try{
        await switchBranch(user, web_path);
        res.send("updatePage API success")
    }
    catch (err){
        res.status(500).send(`UpdatePage API failed with error: ${err}`);
    } 
});

router.get("/reset/:userid", async (req, res)=>{
    const user = req.params.userid;
    const web_path = "team-os";       // PLACEHOLDER, add classroom param later. don't add leading or trailing slashes
    try{
        await resetBranch(user, web_path);
        res.send("reset API success")
    }
    catch (err){
        res.status(500).send(`Reset API failed with error: ${err}`);
    } 
});

module.exports = router;