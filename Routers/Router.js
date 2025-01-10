
import { Router } from 'express';
import FuncionarioController from '../Controllers/FuncionarioController.js';
import PacienteController from '../Controllers/PacienteController.js';
import ConsultaController from '../Controllers/ConsultaController.js';
const router = Router();

router.get('/funcionarios', FuncionarioController.index);

router.get('/funcionarios/:Cpf', FuncionarioController.show);

router.post('/funcionarios', FuncionarioController.store);  // Rota para adicionar funcionário

router.put('/funcionarios/:Cpf', FuncionarioController.update);

router.delete('/funcionarios/:Cpf', FuncionarioController.destroy);


router.get('/pacientes', PacienteController.index);

router.get('/pacientes/:Cpf', PacienteController.show);

router.post('/pacientes', PacienteController.store);  

router.put('/pacientes/:Cpf', PacienteController.update);

router.delete('/pacientes/:Cpf', PacienteController.destroy);


router.get('/consultas', ConsultaController.index);

router.get('/consultas/:IdConsulta', ConsultaController.show);

router.post('/consultas', ConsultaController.store);  

router.put('/consultas/:IdConsulta', ConsultaController.update);

router.delete('/consultas/:IdConsulta', ConsultaController.destroy);

export default router;
