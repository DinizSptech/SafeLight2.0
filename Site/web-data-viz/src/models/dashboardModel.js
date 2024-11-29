var database = require("../database/config")

function ver_endereco(empresa) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function ver _endereco(): ")
    var instrucaoSql = `
    SELECT * FROM endereço WHERE fkEmpresa = ${empresa}
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscar_endereco(empresa){
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function ver _endereco(): ")
    var instrucaoSql = `
    SELECT concat(logradouro, ' ', numero,  ' ', bairro, ' ', cidade, ' ',estado, ' ',complemento) FROM endereco WHERE fkEmpresa = ${empresa}
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    ver_endereco,
    buscar_endereco
};