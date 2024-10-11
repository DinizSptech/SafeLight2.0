int ldr_pin = A5;
int ldr_read = 0;
float vin = 5.00;
float valor_ADC = 0.00488758, r_ohms = 10000;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {

  if (isnan(ldr_read)) {
    Serial.println('Erro ao ler o sensor');
  } else {
    // put your main code here, to run repeatedly:
    ldr_read = analogRead(ldr_pin);

    float vout = valor_ADC * ldr_read;
    float res_ldr = (r_ohms * (vin - vout)) / vout;
    float lux = 500 / (res_ldr / 1000);

    Serial.println(lux);
    
  }
  delay(5000);
}
