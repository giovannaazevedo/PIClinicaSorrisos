-- CreateTable
CREATE TABLE "Funcionario" (
    "Id" SERIAL NOT NULL,
    "Cpf" INTEGER NOT NULL,
    "Nome" TEXT NOT NULL,
    "Telefone" INTEGER NOT NULL,
    "Endereço" TEXT NOT NULL,
    "Cargo" TEXT NOT NULL,
    "Salario" DOUBLE PRECISION NOT NULL,
    "Data_admissao" TIMESTAMP(3) NOT NULL,
    "Sexo" TEXT NOT NULL,

    CONSTRAINT "Funcionario_pkey" PRIMARY KEY ("Id")
);
