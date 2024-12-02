var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
    SELECT idGerenciadores, gerenciadores.nome as nome_g, email, idEmpresa, idEndereco, empresa.nome as nome_e FROM gerenciadores JOIN endereco ON fkEndereco = idEndereco JOIN empresa ON fkEmpresa = idEmpresa WHERE email = '${email}' AND senha = '${senha}';`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, cpf, celular, email, senha, fkEndereco) {
    console.log("ACESSEI O USUARIO MODEL:", nome, email, senha, fkEndereco);
  
    var instrucaoSql = `
      INSERT INTO gerenciadores (nome, cpf, celular, email, senha, fkEndereco) VALUES 
        ('${nome}', '${cpf}', '${celular}', '${email}', '${senha}', ${fkEndereco});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
  }

  function listarEnderecos() {
    return new Promise(function(resolve, reject) {
        var query = 'select * from endereco';
        database.executar(query)
            .then(function(resultado) {
                resolve(resultado);
            })
            .catch(function(erro) {
                reject(erro);
            });
    });
}

module.exports = {
    autenticar,
    cadastrar,
    listarEnderecos
};
