-- CreateTable
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Categories" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Terms" (
    "id" SERIAL NOT NULL,
    "number" TEXT NOT NULL,

    CONSTRAINT "Terms_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Teachers" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Teachers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Disciplines" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "termId" INTEGER NOT NULL,

    CONSTRAINT "Disciplines_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TeachersDisciplines" (
    "id" SERIAL NOT NULL,
    "teacherId" INTEGER NOT NULL,

    CONSTRAINT "TeachersDisciplines_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tests" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "pdfUrl" TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL,
    "teacherDisciplineId" INTEGER NOT NULL,

    CONSTRAINT "Tests_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Categories_name_key" ON "Categories"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Terms_number_key" ON "Terms"("number");

-- CreateIndex
CREATE UNIQUE INDEX "Teachers_name_key" ON "Teachers"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Disciplines_name_key" ON "Disciplines"("name");

-- AddForeignKey
ALTER TABLE "Disciplines" ADD CONSTRAINT "Disciplines_termId_fkey" FOREIGN KEY ("termId") REFERENCES "Terms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TeachersDisciplines" ADD CONSTRAINT "TeachersDisciplines_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES "Teachers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tests" ADD CONSTRAINT "Tests_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tests" ADD CONSTRAINT "Tests_teacherDisciplineId_fkey" FOREIGN KEY ("teacherDisciplineId") REFERENCES "TeachersDisciplines"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
