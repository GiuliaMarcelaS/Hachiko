#include <WiFi.h>                          //importa biblioteca para conectar esp32 com wifi
#include <IOXhop_FirebaseESP32.h>          //importa biblioteca para esp32 se comunicar com firebase
#include <ArduinoJson.h>                   //importa biblioteca para colocar informação no formato json, utilizado no firebase
#include <WiFiManager.h>
#include "time.h"

#define FIREBASE_HOST "https://hachiko-54054-default-rtdb.firebaseio.com/"    //FIREBASE_HOST DEFINIÇÃO DO LINK DO BANCO DE DADOS
#define FIREBASE_AUTH "zuvaxVyztnmo4FtNt3xvWkVlUwjek6ebHmuhhSns"   //FIREBASE_AUTH COMPARTILHAMENTO DA SENHA DO BANCO DE DADOS

#define ADC_VREF_mV    5000.0 //  millivolt
#define ADC_RESOLUTION 4096.0
#define PIN_LM35       33 // Pino do sensor na ESP 32
//-------------------------------------------------------------------------------------------------------------------------------------------
const char* ntpServer = "pool.ntp.org";
const long  gmtOffset_sec = 0;
const int   daylightOffset_sec = -3600*3;
char timeHour[3];
char timeMinuto[3];
char timeWeekDay[10];
char timeDia[3];
char timeMes[10];
char timeAno[5];
int tempoatual;
//-------------------------------------------------------------------------------------------------------------------------------------------
//coisas pulse sensor
int fadePin = 12;                 
int fadeRate = 0;                 
volatile int BPM;                  
volatile int Signal;                
volatile int IBI = 600;              
volatile boolean Pulse = false;     
volatile boolean QS = false;
//-------------------------------------------------------------------------------------------------------------------------------------------
void setup() 
{
    wifiman();
    
    configTime(gmtOffset_sec, daylightOffset_sec, ntpServer);
    LocalTime();
    tempoatual=0;

    Serial.begin(9600);    
    Serial.begin(115200);      
    Serial.begin(9600);
    Serial.begin(115200);                          
    Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);   //INICIA COMUNICAÇÃO COM O BANCO FIREBASE DEFINIDO
    //-----------------------------------------------------------------------------------------------------------------------------------------
    //coisas pulse sensor
    pinMode(LED_BUILTIN,OUTPUT);     
    pinMode(fadePin,OUTPUT);         
    interruptSetup();                  
    // serial begin 115200?
   //-----------------------------------------------------------------------------------------------------------------------------------------
}

void loop() 
{
    LocalTime();
    int adcVal = analogRead(PIN_LM35);
    float milliVolt = adcVal * (ADC_VREF_mV / ADC_RESOLUTION); // CONVERTE O  Analogical to Digital Convert (porta 36) PRA VOLTAGEM EM MILIVOLT
    float tempC = milliVolt / 10; // conta pra converter a voltagem para temperatura em graus celsius
    //----------------------------------------------------------------------------------------------------------------------------------------
    // PULSESENSOR
  	sendDataToProcessing('S', Signal);     
  if (QS == true){                       
        fadeRate = 255;                  
        sendDataToProcessing('B',BPM);   
        sendDataToProcessing('Q',IBI);  
        QS = false;                          
        Serial.println(BPM);
     }

      //ledFadeToBeat(); ??
      yield();

    //-----------------------------------------------------------------------------------------------------------------------------------------
   
    //-------------------------------------------------------------------------------------------------------------- PUXANDO E SETANDO FIREBASE
    Firebase.setInt("/medicoes/BATIMENTOS", BPM);
    Firebase.setInt("/medicoes/TEMPERATURA", tempC);
    Firebase.setString("/medicoes/HORA", timeHour);
    Firebase.setString("/medicoes/MINUTO", timeMinuto);
    Firebase.setString("/medicoes/DIASEMANA", timeWeekDay);
    Firebase.setString("/medicoes/DIA", timeDia);
    Firebase.setString("/medicoes/MES", timeMes);
    Firebase.setString("/medicoes/ANO", timeAno);

  if(millis()-tempoatual>=60000*15){
    StaticJsonBuffer<200> jsonBuffer;
    JsonObject& root = jsonBuffer.createObject();
    root["BATIMENTOS"] = BPM;
    root["TEMPERATURA"] = tempC ;
    root["HORA"] = timeHour ;
    root["MINUTO"] = timeMinuto ;
    root["DIASEMANA"] = timeWeekDay ;
    root["DIA"] = timeDia ;
    root["MES"] = timeMes ;
    root["ANO"] = timeAno ;
    Firebase.push("/medicoesAnterioresEsp", root);
    tempoatual=millis();
  }
    delay(1000);
}

void sendDataToProcessing(char symbol, int data ){
    Serial.print(symbol);               //dados pulse sensor 
    Serial.println(data);               
  }