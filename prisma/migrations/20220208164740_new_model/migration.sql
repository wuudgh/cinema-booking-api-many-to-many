/*
  Warnings:

  - You are about to drop the column `customerId` on the `Seat` table. All the data in the column will be lost.
  - You are about to drop the column `screeningId` on the `Seat` table. All the data in the column will be lost.
  - You are about to drop the column `ticketId` on the `Seat` table. All the data in the column will be lost.
  - You are about to drop the `seatsOnTickets` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `screenId` to the `Seat` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "seatsOnTickets" DROP CONSTRAINT "seatsOnTickets_seatId_fkey";

-- DropForeignKey
ALTER TABLE "seatsOnTickets" DROP CONSTRAINT "seatsOnTickets_ticketId_fkey";

-- AlterTable
ALTER TABLE "Seat" DROP COLUMN "customerId",
DROP COLUMN "screeningId",
DROP COLUMN "ticketId",
ADD COLUMN     "screenId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "seatsOnTickets";

-- CreateTable
CREATE TABLE "_SeatToTicket" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_SeatToTicket_AB_unique" ON "_SeatToTicket"("A", "B");

-- CreateIndex
CREATE INDEX "_SeatToTicket_B_index" ON "_SeatToTicket"("B");

-- AddForeignKey
ALTER TABLE "Seat" ADD CONSTRAINT "Seat_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "Screen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SeatToTicket" ADD FOREIGN KEY ("A") REFERENCES "Seat"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SeatToTicket" ADD FOREIGN KEY ("B") REFERENCES "Ticket"("id") ON DELETE CASCADE ON UPDATE CASCADE;
