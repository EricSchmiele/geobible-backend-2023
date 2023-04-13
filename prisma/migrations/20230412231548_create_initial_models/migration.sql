-- CreateTable
CREATE TABLE "Verse" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "book" TEXT NOT NULL,
    "chapter" INTEGER NOT NULL,
    "number" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Location" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "mainName" TEXT NOT NULL,
    "latitude" INTEGER NOT NULL,
    "longitude" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "LocationName" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "locationId" TEXT NOT NULL,
    CONSTRAINT "LocationName_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "Location" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "VerseLocation" (
    "verseId" TEXT NOT NULL,
    "locationId" TEXT NOT NULL,

    PRIMARY KEY ("verseId", "locationId"),
    CONSTRAINT "VerseLocation_verseId_fkey" FOREIGN KEY ("verseId") REFERENCES "Verse" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "VerseLocation_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "Location" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
