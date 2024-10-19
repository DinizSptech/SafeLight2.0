
# <img src="C:\Users\joaog\Downloads\logo1.png">
# ⁺˖ Safe Light ⸝⸝

Nosso projeto visa otimizar a iluminação em ambientes corporativos através de um sistema de controle de luz baseado em sensores LDR. A ideia central é ajustar automaticamente a intensidade luminosa, garantindo o nível ideal para cada situação, promovendo conforto, produtividade e economia de energia.


## Referência

 - [API](https://github.com/BandTec/dat-acqu-ino)



## Documentação da API

_Data Acquisition Arduino API = API Arduino para Aquisição de Dados_


# Como usar

1. Certifique-se de que o Arduino está em funcionamento e capturando dado do sensor, seja ele analógico ou digital.

1. Clone este repositório em sua máquina.

1. Acesse o arquivo **main.js** e parametrize:

- Gostaria de efetuar a inserção dos dados capturados no Banco de Dados? **Linha 11 - HABILITAR_OPERACAO_INSERIR;**

- Para configurar as credenciais do banco de dados: adicione as credenciais para inserção no banco MySQL (**Linhas 22 - 26**) e ajuste seu INSERT para que esteja de acordo com a tabela que receberá as medidas (**Linhas 66 e 67**).

4. Acesse o local deste repositório no terminal (GitBash ou VSCode) e execute os comandos abaixo:

```
npm i
``` 
_O comando acima irá instalar as bibliotecas necessárias para o funcionamento da API. As bibliotecas a serem instaladas estão listadas no arquivo **package.json** então é muito importante que este não seja alterado. Será criada uma nova pasta/diretório chamado **node_modules** quando o comando for finalizado, que é onde as bibliotecas estão localizadas. Não altere a pasta/diretório._

```
npm start
``` 

_O comando acima irá iniciar sua API e efetuar os comandos de acordo com a sua parametrização feita nos passos anteriores._

5. Para "ver" sua API funcionando você pode visualizar os gráficos das capturas sendo exibidos no seu navegador pelo caminho **http://localhost:3300** ou efetuando SELECT no seu Banco de Dados, caso tenha optado por inseri-los.

6. Caso queira parar a API, tecle **CTRL+C** no terminal em que a API está rodando.



## Autores

- [Matheus Diniz](https://github.com/DinizSptech)
- [João Assis](https://github.com/jodroassis)
- [Gabriel Feitosa](https://github.com/gabrielpacificoo)
- [Maria Eduarda Silva](https://github.com/mahducosta)
- [Fabricio Nunes](https://github.com/Fabricio-Nunes-Ernandes)
- [Diogo Yudi Duarte](https://github.com/digobigo)

