### Documento de Requisitos para Sistema de Gerenciamento de Consultas para Clínica de Estética

### Visão Geral

Este documento descreve os requisitos para o desenvolvimento de um sistema de gerenciamento de consultas para uma mini clínica de estética com um único profissional. O sistema será uma Progressive Web App (PWA) servida por uma API em um servidor doméstico, funcionando apenas dentro da rede Wi-Fi local.

### Funcionalidades Principais

1. **Gerenciamento de Pacientes**
   - Cadastro de pacientes com informações básicas (nome, idade, telefone, endereço, histórico médico).
   - Edição e exclusão de registros de pacientes.
   - Visualização da lista de pacientes.
2. **Agendamento de Consultas**
   - Agendamento de novas consultas com paciente, procedimento, data e Hora, notas, precoCobrado, desconto, status, valorg asto em descartaveis e valor gasto em insumos.
   - Visualização de um calendário interativo com as consultas agendadas.
   - Fluxo de consultas com os seguintes status: agendada, confirmada, cancelada, adiada ou realizada.
   - Após consulta realizada, possibilidade de adicionar lembrete para retorno.
   - Registro de gastos nas consultas
3. **Registro de Procedimentos**
   - Registro de procedimentos realizados com nome e descrição.


### Funcionalidades Adicionais
   
1. **Avisos**
   - Avisos sobre aniversários de pacientes.
   - Avisos sobre próximas consultas agendadas e confirmadas.
   - Envio de confirmação de consultas para pacientes pelo whatsapp.
   - Configuração de lembretes para datas de expiração de procedimentos e aniversários próximos.
2. **Estatísticas**
   - Custos médios em insumos e descartáveis por tipo de procedimento.
   - Custos totais mensais em insumos e descartáveis.
   - Faixa etária de pacientes para cada tipo de procedimento.
3. **Sincronização**
   - Sincronização de calendário com Google Agenda (a pedido do contratante).

### Requisitos Funcionais
1. Cadastro de Pacientes

   - O sistema deve permitir o cadastro de pacientes com as seguintes informações: nome, idade, telefone, endereço, histórico médico.
   - O sistema deve permitir a edição e exclusão de registros de pacientes. (Exclusão será revisada posteriormente)
   - O sistema deve permitir a visualização de uma lista de pacientes cadastrados.

2. Agendamento de Consultas

   - O sistema deve permitir o agendamento de novas consultas com os seguintes campos: paciente, procedimento, dataHora, notas, status.
   - Ao agendar, a consulta deve ter o status inicial "agendada". Campos obrigatórios: id, pacienteId, procedimentoId, dataHora. Campos opcionais: notas, precoCobrado, desconto, valorGastoDescartaveis e valorGastoInsumos. Todos os campos obrigatórios não podem ser alterados após o agendamento.
   - O sistema deve permitir a edição dos campos notas, precoCobrado, desconto, valorGastoDescartaveis e valorGastoInsumos.
   - O sistema deve permitir o adiamento de consultas, onde uma nova consulta é agendada reutilizando os dados da antiga, exceto dataHora. A nova consulta recebe o status "agendada" e a consulta original recebe o status "adiada" com o campo consultaAdiadaId apontando para a nova consulta.
   - O sistema deve permitir o cancelamento de consultas, onde a consulta apenas recebe o status "cancelada" e o campo consultaAdiadaId permanece em branco.
   - O sistema deve permitir a confirmação de consultas, onde a consulta apenas recebe o status "confirmada" e o campo consultaAdiadaId permanece em branco.
   - O sistema deve permitir a realização de consultas, onde o profissional pode marcar a consulta como "realizada" e opcionalmente selecionar uma nova data de retorno para lembrete. O profissional deve registrar os gastos nesse momento.
   - O sistema deve apresentar um calendário interativo para visualização das consultas agendadas e confirmadas.

3. Registro de Procedimentos

   - O sistema deve permitir o registro de procedimentos disponíveis.
   - O sistema pode permitir o upload de fotos associadas aos procedimentos. (será adicionado em feature posterior)

4. Avisos

   - O sistema deve gerar avisos sobre aniversários de pacientes.
   - O sistema deve gerar avisos sobre próximas consultas agendadas e confirmadas.
   - O sistema deve enviar confirmações de consultas para pacientes via WhatsApp.

5. Estatísticas e Relatórios

   - O sistema deve calcular os custos médios em insumos e descartáveis por tipo de procedimento.
   - O sistema deve calcular os custos totais mensais em insumos e descartáveis.
   - O sistema deve gerar relatórios sobre a faixa etária dos pacientes para cada tipo de procedimento.

6. Sincronização de Calendário

   - O sistema deve permitir a sincronização do calendário de consultas com o Google Agenda, se solicitado. (será adicionado em feature posterior)

### Requisitos Não Funcionais

1. Desempenho

   - O sistema deve ser responsivo e ter tempo de resposta inferior a 2 segundos para todas as operações de CRUD.
   - O sistema deve suportar o acesso simultâneo de até 10 dispositivos sem degradação de desempenho.

2. Segurança

   - O sistema deve assegurar que todos os dados dos pacientes e consultas sejam armazenados de forma segura.
   - O sistema não precisa exigir autenticação para acesso às funcionalidades de gerenciamento de pacientes e agendamento de consultas.
   - Os dados transmitidos entre o cliente e o servidor devem ser criptografados. (será adicionado em feature posterior)

3. Usabilidade

   - O sistema deve ser intuitivo e fácil de usar, com uma interface clara e navegável.
   - O sistema deve fornecer feedback apropriado para as ações dos usuários, como confirmações de operações bem-sucedidas e mensagens de erro claras.

4. Compatibilidade

   - O sistema deve ser compatível com o navegador Safari.
   - O sistema deve ser otimizado para dispositivos móveis.

5. Disponibilidade

   - O sistema deve estar disponível 99% do tempo, principalmente durante o horário de funcionamento da clínica.
   - O sistema deve ser projetado para recuperação rápida em caso de falhas. (será adicionado em feature posterior)

6. Manutenibilidade

   - O código do sistema deve ser bem documentado para facilitar futuras manutenções e atualizações.
   - O sistema deve ser modular para permitir a fácil adição de novas funcionalidades.

7. Tecnologias Utilizadas

   - A API deve ser desenvolvida em Java utilizando o framework Spring.
   - O front-end deve ser uma Progressive Web App (PWA) desenvolvida em React com Bootstrap.
   - O banco de dados deve ser MySQL.
   - O sistema deve ser virtualizado utilizando Docker, com contêineres separados para a API, o front-end e o banco de dados, para facilitar o gerenciamento e a implantação.