/*
  Warnings:

  - You are about to drop the column `timeStamp` on the `Expenses` table. All the data in the column will be lost.
  - You are about to drop the column `timeStamp` on the `Purchases` table. All the data in the column will be lost.
  - The primary key for the `SalesSummary` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `salesSummary` on the `SalesSummary` table. All the data in the column will be lost.
  - You are about to drop the `PurchasesSummary` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `timestamp` to the `Expenses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `timestamp` to the `Purchases` table without a default value. This is not possible if the table is not empty.
  - Added the required column `salesSummaryId` to the `SalesSummary` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Expenses" DROP COLUMN "timeStamp",
ADD COLUMN     "timestamp" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Purchases" DROP COLUMN "timeStamp",
ADD COLUMN     "timestamp" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "SalesSummary" DROP CONSTRAINT "SalesSummary_pkey",
DROP COLUMN "salesSummary",
ADD COLUMN     "salesSummaryId" TEXT NOT NULL,
ADD CONSTRAINT "SalesSummary_pkey" PRIMARY KEY ("salesSummaryId");

-- DropTable
DROP TABLE "PurchasesSummary";

-- CreateTable
CREATE TABLE "PurchaseSummary" (
    "purchaseSummaryId" TEXT NOT NULL,
    "totalPurchased" DOUBLE PRECISION NOT NULL,
    "changePercentage" DOUBLE PRECISION,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PurchaseSummary_pkey" PRIMARY KEY ("purchaseSummaryId")
);
