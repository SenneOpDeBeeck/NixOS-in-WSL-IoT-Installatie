# NixOS-in-WSL-IoT-Installatie

![image](https://user-images.githubusercontent.com/100275526/227935137-8420fa27-6a02-4415-9c7d-65b3393e51c3.png)


Inleiding:

Voor een opdracht van school moesten we een IoT installatie tot stand brengen met behulp van een MQTT broker die op kubernetes draait met een Influxdb. De basis opzet hiervan is NixOS in WSL met een enkele Kubernetes node. Een esp32 zal met een geconfigureert yaml bestand de waardes van een dht sensor doorsturen naar de broker m.b.v. het mqtt communicatie Protocol.



