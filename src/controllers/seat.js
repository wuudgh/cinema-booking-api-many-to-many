const prisma = require("../utils/prisma");

const createSeats = async (req, res) => {
  const { screenId } = req.body;
  const createSeats = await prisma.seat.create({
    data: {
      screenId,
    },
  });
  res.json({ data: createSeats });
};

module.exports = { createSeats };
