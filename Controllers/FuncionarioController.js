// FuncionarioController.js
import FuncionarioModel from '../Models/FuncionarioModel.js';


class FuncionarioController {
  async index(req, res) {
    const funcionarios = await FuncionarioModel.find();
    res.json(funcionarios);
  }

  async store(req, res) {
    const Cpf = req.body.Cpf;
    const Nome = req.body.Nome;
    const Telefone = req.body.Telefone; 
    const Endereco = req.body.Endereco;
    const Cargo = req.body.Cargo;
    const Salario = req.body.Salario;
    const DataAdmissao = req.body.DataAdmissao; 
    const Sexo  = req.body.Sexo;
    const Funcionario = await FuncionarioModel.create({ Cpf, Nome, Telefone, Endereco, Cargo, Salario, DataAdmissao, Sexo  });
    res.json(Funcionario);
  }

  async show(req, res) {
    const { Cpf } = req.params; // "Cpf" vem da URL como string
  
    // Converte o Cpf para número inteiro (Int), já que no banco ele é um número
    const cpfInt = parseInt(Cpf);
  
    // Verifica se a conversão foi bem-sucedida (se o CPF não for um número)
    if (isNaN(cpfInt)) {
      return res.status(400).json({ error: "CPF inválido" });
    }
  
    try {
      // Consulta ao banco para buscar o paciente usando o CPF convertido
      const funcionario = await FuncionarioModel.findOne(cpfInt); // Chama a função findOne passando o CPF convertido
  
      if (!funcionario) {
        return res.status(404).json({ error: "Funcionario não encontrado" });
      }
  
      res.json(funcionario);
    } catch (error) {
      // Em caso de erro, retorna uma mensagem de erro
      res.status(400).json({ error: error.message });
    }
  }
  

  async update(req, res) {
      const Cpf  = req.params.Cpf;
      const Nome = req.body.Nome;
      const Telefone = req.body.Telefone; 
      const Endereco = req.body.Endereco;
      const Cargo = req.body.Cargo;
      const Salario = req.body.Salario;
      const Funcionario = await FuncionarioModel.update({ Cpf, Nome, Telefone, Endereco, Cargo, Salario});
      res.json(Funcionario);
  
}

  async destroy(req, res) {
    const Cpf  = req.params.Cpf;
    const Funcionario = await FuncionarioModel.delete(Cpf);
    res.json(Funcionario);
  }
}

export default new FuncionarioController();
