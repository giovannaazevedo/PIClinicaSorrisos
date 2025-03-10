-- CreateTable
CREATE TABLE "Funcionario" (
    "Id" SERIAL NOT NULL,
    "Cpf" TEXT NOT NULL,
    "Nome" TEXT NOT NULL,
    "Telefone" TEXT NOT NULL,
    "Endereco" TEXT NOT NULL,
    "Cargo" TEXT NOT NULL,
    "Salario" DOUBLE PRECISION NOT NULL,
    "DataAdmissao" TEXT NOT NULL,
    "DataNascimento" TEXT NOT NULL,
    "Sexo" TEXT NOT NULL,

    CONSTRAINT "Funcionario_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "Paciente" (
    "Id" SERIAL NOT NULL,
    "Cpf" TEXT NOT NULL,
    "Nome" TEXT NOT NULL,
    "Telefone" TEXT NOT NULL,
    "Endereco" TEXT NOT NULL,
    "DataNascimento" TEXT NOT NULL,
    "Sexo" TEXT NOT NULL,

    CONSTRAINT "Paciente_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "Consulta" (
    "IdConsulta" SERIAL NOT NULL,
    "CpfFuncionario" TEXT NOT NULL,
    "CpfPaciente" TEXT NOT NULL,
    "Data" TEXT NOT NULL,
    "Valor" DOUBLE PRECISION NOT NULL,
    "Horario" TEXT NOT NULL,
    "Procedimento" TEXT NOT NULL,

    CONSTRAINT "Consulta_pkey" PRIMARY KEY ("IdConsulta")
);

-- CreateTable
CREATE TABLE "Usuario" (
    "Id" SERIAL NOT NULL,
    "Nome" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "Senha" TEXT NOT NULL,
    "Acesso" TEXT NOT NULL,
    "CriadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Funcionario_Cpf_key" ON "Funcionario"("Cpf");

-- CreateIndex
CREATE UNIQUE INDEX "Paciente_Cpf_key" ON "Paciente"("Cpf");

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_Email_key" ON "Usuario"("Email");

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_CpfFuncionario_fkey" FOREIGN KEY ("CpfFuncionario") REFERENCES "Funcionario"("Cpf") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_CpfPaciente_fkey" FOREIGN KEY ("CpfPaciente") REFERENCES "Paciente"("Cpf") ON DELETE CASCADE ON UPDATE CASCADE;
