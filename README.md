# Projeto de Coleira inteligente para monitoramento da saúde pet

## Do propósito do projeto
Este é um repositório baseado em um projeto referente a uma disciplina na Universidade Federal do Pará.
A ideia central dos autores foi estabelecer um método em que os seres os humanos pudessem monitorar a saúde de seus animais de estimação (gatos e cachorros) com base em um dispositivo que consistia em uma placa microcontroladora e sensores acoplados e enviava esses dados para a plataforma do Firebase em um banco de dados, onde um aplicativo se comunicava e interpretava os dados recebidos para dizer se haviam anomalias.
## Das complicações e problemas a serem solucionados
Para poder realizar o projeto tivemos que usar algumas versões que não são as mais atuais de algumas bibliotecas, além disso, o nosso pulse sensor enfrentou uma certa instabilidade, mas como não tinhamos acesso a outro sensor equivalente, não conseguimos descobrir se o problema era no componente ou na adaptação de sua biblioteca do arduíno para o código na ESP 32.


### Componentes e bibliotecas utilizadas no hardware
- Do hardware:
  - ESP 32
  - Pulse Sensor (Sensor de batimentos)
  - LM35 (Sensor de temperatura) 
  - Placa de fenolite    
- Bibliotecas: 
    - WiFi.h
    - IOXhop_FirebaseESP32.h
    - ArduinoJson.h
    - WiFiManager.h
    - Time.h
A bibliotec IOXP está na pasta libraries caso seja necessário acessá-la

##

# Smart Collar Project for Pet Health Monitoring

## About the Project
This is a repository based on a project related to a course at the Federal University of Pará. The main idea of the authors was to establish a method where humans could monitor the health of their pets (cats and dogs) based on a device consisting of a microcontroller board and attached sensors. This device would send data to the Firebase platform in a database, where an application would communicate and interpret the received data to detect anomalies.
## Challenges and Issues to Address
To carry out the project, we had to use some versions of libraries that were not the most up-to-date. Additionally, our pulse sensor faced some instability issues. However, as we didn't have access to another equivalent sensor, we couldn't determine whether the problem was with the component itself or with the adaptation of its Arduino library to the ESP 32 code.


### Components and Libraries Used in the Hardware
- Hardware:
  - ESP 32
  - Pulse Sensor
  - LM35 (Temperature sensor) 
  - Placa de fenolite    
- Libraries: 
    - WiFi.h
    - IOXhop_FirebaseESP32.h
    - ArduinoJson.h
    - WiFiManager.h
    - Time.h
The IOXhop library is in the "libraries" folder if it needs to be accessed.
