/*
  Warnings:

  - The primary key for the `Paciente` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `cpf` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `dataNascimento` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `endereco` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `historico` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `sexo` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `telefone` on the `Paciente` table. All the data in the column will be lost.
  - Added the required column `Cpf` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `DataNascimento` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Endereco` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Historico` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Nome` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Sexo` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Telefone` to the `Paciente` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Consulta" DROP CONSTRAINT "Consulta_idPaciente_fkey";

-- AlterTable
ALTER TABLE "Paciente" DROP CONSTRAINT "Paciente_pkey",
DROP COLUMN "cpf",
DROP COLUMN "dataNascimento",
DROP COLUMN "endereco",
DROP COLUMN "historico",
DROP COLUMN "id",
DROP COLUMN "nome",
DROP COLUMN "sexo",
DROP COLUMN "telefone",
ADD COLUMN     "Cpf" INTEGER NOT NULL,
ADD COLUMN     "DataNascimento" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "Endereco" TEXT NOT NULL,
ADD COLUMN     "Historico" TEXT NOT NULL,
ADD COLUMN     "Id" SERIAL NOT NULL,
ADD COLUMN     "Nome" TEXT NOT NULL,
ADD COLUMN     "Sexo" TEXT NOT NULL,
ADD COLUMN     "Telefone" INTEGER NOT NULL,
ADD CONSTRAINT "Paciente_pkey" PRIMARY KEY ("Id");

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_idPaciente_fkey" FOREIGN KEY ("idPaciente") REFERENCES "Paciente"("Id") ON DELETE CASCADE ON UPDATE CASCADE;
