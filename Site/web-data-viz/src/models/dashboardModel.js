var database = require("../database/config")

function ver_endereco(endereco) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function ver _endereco(): ")
    var instrucaoSql = `
    SELECT idSensor, concat('Andar ',andar, ' - ', local) as ambiente, andar FROM sensor JOIN dados ON idSensor = fkSensor WHERE fkEndereco = ${endereco} GROUP BY idSensor, andar, local;   
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// function buscar_endereco(empresa){
//     console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function ver _endereco(): ")
//     var instrucaoSql = `
//     SELECT concat(logradouro, ' ', numero,  ' ', bairro, ' ', cidade, ' ',estado, ' ',complemento) FROM endereco WHERE fkEmpresa = ${empresa}
//     `;
//     console.log("Executando a instrução SQL: \n" + instrucaoSql);
//     return database.executar(instrucaoSql);
// }

function obterDadosSensoresIndividual(idEndereco, idSensor, data) {
    console.log("ACESSEI O MODEL - obterDadosSensores");

    var instrucaoSql = `
    SELECT idSensor, luminosidade, momento
	FROM dados as d 
	JOIN sensor as s 
	ON d.fkSensor = s.idSensor
	WHERE s.fkEndereco = ${idEndereco} and s.idSensor = ${idSensor} and d.momento like '%${data}%'
    ORDER BY momento desc;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterDadosSensores(idGerente) {
    console.log("ACESSEI O MODEL - obterDadosSensores");

    var instrucaoSql = `
        SELECT 
            AVG(d.luminosidade) as luminosidade,  
            s.local, 
            s.andar 
        FROM 
            dados as d
        JOIN 
            sensor as s ON d.fkSensor = s.idSensor
        JOIN 
            endereco as e ON s.fkEndereco = e.idEndereco
        JOIN 
            gerenciadores as g ON e.idEndereco = g.fkEndereco
		WHERE g.idGerenciadores = ${idGerente}
		GROUP BY 
			s.local, s.andar;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
module.exports = {
    ver_endereco,
    // buscar_endereco,
    obterDadosSensores,
    obterDadosSensoresIndividual
};