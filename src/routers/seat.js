const express = require("express");
const { createSeat } = require("../controllers/seat");

const router = express.Router();

router.post("/", createSeat);

module.exports = router;
