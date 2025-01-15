/*
  Warnings:

  - You are about to drop the column `IdFuncionario` on the `Consulta` table. All the data in the column will be lost.
  - You are about to drop the column `IdPaciente` on the `Consulta` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[Cpf]` on the table `Funcionario` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[Cpf]` on the table `Paciente` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `CpfFuncionario` to the `Consulta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `CpfPaciente` to the `Consulta` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Consulta" DROP CONSTRAINT "Consulta_IdFuncionario_fkey";

-- DropForeignKey
ALTER TABLE "Consulta" DROP CONSTRAINT "Consulta_IdPaciente_fkey";

-- AlterTable
ALTER TABLE "Consulta" DROP COLUMN "IdFuncionario",
DROP COLUMN "IdPaciente",
ADD COLUMN     "CpfFuncionario" INTEGER NOT NULL,
ADD COLUMN     "CpfPaciente" INTEGER NOT NULL,
ALTER COLUMN "Data" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Funcionario" ALTER COLUMN "DataAdmissao" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Paciente" ALTER COLUMN "DataNascimento" SET DATA TYPE TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Funcionario_Cpf_key" ON "Funcionario"("Cpf");

-- CreateIndex
CREATE UNIQUE INDEX "Paciente_Cpf_key" ON "Paciente"("Cpf");

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_CpfFuncionario_fkey" FOREIGN KEY ("CpfFuncionario") REFERENCES "Funcionario"("Cpf") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_CpfPaciente_fkey" FOREIGN KEY ("CpfPaciente") REFERENCES "Paciente"("Cpf") ON DELETE CASCADE ON UPDATE CASCADE;
