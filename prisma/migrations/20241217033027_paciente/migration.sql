-- CreateTable
CREATE TABLE "Paciente" (
    "Id" SERIAL NOT NULL,
    "Cpf" INTEGER NOT NULL,
    "Nome" TEXT NOT NULL,
    "Telefone" INTEGER NOT NULL,
    "Endereço" TEXT NOT NULL,
    "Data_nascimento" TIMESTAMP(3) NOT NULL,
    "Historico" TEXT NOT NULL,
    "Sexo" TEXT NOT NULL,

    CONSTRAINT "Paciente_pkey" PRIMARY KEY ("Id")
);
