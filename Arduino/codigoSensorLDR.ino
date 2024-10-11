const ldr_pin = A5; //Pino conectado ao sensor LDR
const ldr_read = 0; //Variavel para armazenar o valor da luminosidade

float vin = 5.00;
float valor_ADC = 0.0048875, r_ohms = 10000;

// Função de inicialização
void setup() {
Serial.begin(9600); //Inicializa a comunicação serial a 9600 bps (bits por segundo)  

}

// Função principal de execução contínua
void loop() {
  ldr_read = analogRead(ldr_pin);

  float vout = valor_ADC * ldr_read;
  float res_ldr = (r_ohms * (vin - vout)) / vout;
  float lux = 500/(res_ldr/1000);

  Serial.println(lux);
  
  //Aguarda 2 segundos antes da próxima leitura
  delay(2000);
}
