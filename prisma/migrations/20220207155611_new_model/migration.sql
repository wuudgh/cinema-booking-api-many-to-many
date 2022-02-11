-- CreateTable
CREATE TABLE "Seat" (
    "id" SERIAL NOT NULL,
    "ticketId" INTEGER NOT NULL,
    "screeningId" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Seat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "seatsOnTickets" (
    "ticketId" INTEGER NOT NULL,
    "seatId" INTEGER NOT NULL,
    "assingneAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "assingnedBy" TEXT NOT NULL,

    CONSTRAINT "seatsOnTickets_pkey" PRIMARY KEY ("ticketId","seatId")
);

-- AddForeignKey
ALTER TABLE "seatsOnTickets" ADD CONSTRAINT "seatsOnTickets_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES "Ticket"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "seatsOnTickets" ADD CONSTRAINT "seatsOnTickets_seatId_fkey" FOREIGN KEY ("seatId") REFERENCES "Seat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
