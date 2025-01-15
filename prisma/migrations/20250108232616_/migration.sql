/*
  Warnings:

  - The primary key for the `Consulta` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `data` on the `Consulta` table. All the data in the column will be lost.
  - You are about to drop the column `horario` on the `Consulta` table. All the data in the column will be lost.
  - You are about to drop the column `idConsulta` on the `Consulta` table. All the data in the column will be lost.
  - You are about to drop the column `idFuncionario` on the `Consulta` table. All the data in the column will be lost.
  - You are about to drop the column `idPaciente` on the `Consulta` table. All the data in the column will be lost.
  - You are about to drop the column `procedimento` on the `Consulta` table. All the data in the column will be lost.
  - You are about to drop the column `valor` on the `Consulta` table. All the data in the column will be lost.
  - The primary key for the `Funcionario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `cargo` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `cpf` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `dataAdmissao` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `endereco` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `salario` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `sexo` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `telefone` on the `Funcionario` table. All the data in the column will be lost.
  - Added the required column `Data` to the `Consulta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Horario` to the `Consulta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `IdFuncionario` to the `Consulta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `IdPaciente` to the `Consulta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Procedimento` to the `Consulta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Valor` to the `Consulta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Cargo` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Cpf` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `DataAdmissao` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Endereco` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Nome` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Salario` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Sexo` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Telefone` to the `Funcionario` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Consulta" DROP CONSTRAINT "Consulta_idFuncionario_fkey";

-- DropForeignKey
ALTER TABLE "Consulta" DROP CONSTRAINT "Consulta_idPaciente_fkey";

-- AlterTable
ALTER TABLE "Consulta" DROP CONSTRAINT "Consulta_pkey",
DROP COLUMN "data",
DROP COLUMN "horario",
DROP COLUMN "idConsulta",
DROP COLUMN "idFuncionario",
DROP COLUMN "idPaciente",
DROP COLUMN "procedimento",
DROP COLUMN "valor",
ADD COLUMN     "Data" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "Horario" TEXT NOT NULL,
ADD COLUMN     "IdConsulta" SERIAL NOT NULL,
ADD COLUMN     "IdFuncionario" INTEGER NOT NULL,
ADD COLUMN     "IdPaciente" INTEGER NOT NULL,
ADD COLUMN     "Procedimento" TEXT NOT NULL,
ADD COLUMN     "Valor" DOUBLE PRECISION NOT NULL,
ADD CONSTRAINT "Consulta_pkey" PRIMARY KEY ("IdConsulta");

-- AlterTable
ALTER TABLE "Funcionario" DROP CONSTRAINT "Funcionario_pkey",
DROP COLUMN "cargo",
DROP COLUMN "cpf",
DROP COLUMN "dataAdmissao",
DROP COLUMN "endereco",
DROP COLUMN "id",
DROP COLUMN "nome",
DROP COLUMN "salario",
DROP COLUMN "sexo",
DROP COLUMN "telefone",
ADD COLUMN     "Cargo" TEXT NOT NULL,
ADD COLUMN     "Cpf" INTEGER NOT NULL,
ADD COLUMN     "DataAdmissao" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "Endereco" TEXT NOT NULL,
ADD COLUMN     "Id" SERIAL NOT NULL,
ADD COLUMN     "Nome" TEXT NOT NULL,
ADD COLUMN     "Salario" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "Sexo" TEXT NOT NULL,
ADD COLUMN     "Telefone" INTEGER NOT NULL,
ADD CONSTRAINT "Funcionario_pkey" PRIMARY KEY ("Id");

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_IdFuncionario_fkey" FOREIGN KEY ("IdFuncionario") REFERENCES "Funcionario"("Id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_IdPaciente_fkey" FOREIGN KEY ("IdPaciente") REFERENCES "Paciente"("Id") ON DELETE CASCADE ON UPDATE CASCADE;
