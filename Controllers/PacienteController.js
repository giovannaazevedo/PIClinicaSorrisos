// PacienteController.js
import PacienteModel from '../Models/PacienteModel.js';


class PacienteController {
  async index(req, res) {
    const Pacientes = await PacienteModel.find();
    res.json(Pacientes);
  }

  async store(req, res) {
    const Cpf = req.body.Cpf;
    const Nome = req.body.Nome;
    const Telefone = req.body.Telefone; 
    const Endereco = req.body.Endereco;
    const DataNascimento = req.body.DataNascimento; 
    const Historico = req.body.Historico;
    const Sexo  = req.body.Sexo;
    const Paciente = await PacienteModel.create({ Cpf, Nome, Telefone, Endereco, DataNascimento, Historico, Sexo  });
    res.json(Paciente);
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
      const paciente = await PacienteModel.findOne(cpfInt); // Chama a função findOne passando o CPF convertido
  
      if (!paciente) {
        return res.status(404).json({ error: "Paciente não encontrado" });
      }
  
      // Retorna o paciente encontrado
      res.json(paciente);
    } catch (error) {
      // Em caso de erro, retorna uma mensagem de erro
      res.status(400).json({ error: error.message });
    }
  }

  async update(req, res) {
      const Cpf  = req.params.Cpf;
      const Nome = req.body.Nome;
      const Telefone = req.body.Telefone; 
      const Endereço = req.body.Endereço;
      const Historico = req.body.Historico;
      const Paciente = await PacienteModel.update({ Cpf, Nome, Telefone, Endereço, Historico});
      res.json(Paciente);
  
}

  async destroy(req, res) {
    const Cpf  = req.params.Cpf;
    const Paciente = await PacienteModel.delete(Cpf);
    res.json(Paciente);
  }
}

export default new PacienteController();
