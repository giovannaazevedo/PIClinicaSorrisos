/*
  Warnings:

  - The primary key for the `Funcionario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Cargo` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `Cpf` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `Data_admissao` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `Endereço` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `Id` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `Nome` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `Salario` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `Sexo` on the `Funcionario` table. All the data in the column will be lost.
  - You are about to drop the column `Telefone` on the `Funcionario` table. All the data in the column will be lost.
  - The primary key for the `Paciente` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Cpf` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `Data_nascimento` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `Endereço` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `Historico` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `Id` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `Nome` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `Sexo` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `Telefone` on the `Paciente` table. All the data in the column will be lost.
  - Added the required column `cargo` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cpf` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dataAdmissao` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `endereco` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `salario` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sexo` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `telefone` to the `Funcionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cpf` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dataNascimento` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `endereco` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `historico` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sexo` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `telefone` to the `Paciente` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Funcionario" DROP CONSTRAINT "Funcionario_pkey",
DROP COLUMN "Cargo",
DROP COLUMN "Cpf",
DROP COLUMN "Data_admissao",
DROP COLUMN "Endereço",
DROP COLUMN "Id",
DROP COLUMN "Nome",
DROP COLUMN "Salario",
DROP COLUMN "Sexo",
DROP COLUMN "Telefone",
ADD COLUMN     "cargo" TEXT NOT NULL,
ADD COLUMN     "cpf" INTEGER NOT NULL,
ADD COLUMN     "dataAdmissao" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "endereco" TEXT NOT NULL,
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "nome" TEXT NOT NULL,
ADD COLUMN     "salario" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "sexo" TEXT NOT NULL,
ADD COLUMN     "telefone" INTEGER NOT NULL,
ADD CONSTRAINT "Funcionario_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Paciente" DROP CONSTRAINT "Paciente_pkey",
DROP COLUMN "Cpf",
DROP COLUMN "Data_nascimento",
DROP COLUMN "Endereço",
DROP COLUMN "Historico",
DROP COLUMN "Id",
DROP COLUMN "Nome",
DROP COLUMN "Sexo",
DROP COLUMN "Telefone",
ADD COLUMN     "cpf" INTEGER NOT NULL,
ADD COLUMN     "dataNascimento" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "endereco" TEXT NOT NULL,
ADD COLUMN     "historico" TEXT NOT NULL,
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "nome" TEXT NOT NULL,
ADD COLUMN     "sexo" TEXT NOT NULL,
ADD COLUMN     "telefone" INTEGER NOT NULL,
ADD CONSTRAINT "Paciente_pkey" PRIMARY KEY ("id");

-- CreateTable
CREATE TABLE "Consulta" (
    "idConsulta" SERIAL NOT NULL,
    "idFuncionario" INTEGER NOT NULL,
    "idPaciente" INTEGER NOT NULL,
    "data" TIMESTAMP(3) NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "horario" TEXT NOT NULL,
    "procedimento" TEXT NOT NULL,

    CONSTRAINT "Consulta_pkey" PRIMARY KEY ("idConsulta")
);

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_idFuncionario_fkey" FOREIGN KEY ("idFuncionario") REFERENCES "Funcionario"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_idPaciente_fkey" FOREIGN KEY ("idPaciente") REFERENCES "Paciente"("id") ON DELETE CASCADE ON UPDATE CASCADE;
