package org.example;


import org.fusesource.mqtt.client.*;

import java.io.IOException;

import java.net.URISyntaxException;
import java.util.concurrent.TimeoutException;

public class Main {
    public static void main(String[] args) throws Exception {

        MQTT mqtt = new MQTT();
        mqtt.setHost("127.0.0.1", 1883);
        BlockingConnection connection = mqtt.blockingConnection();
        connection.connect();
        Topic[] topics = { new Topic("persistent://public/default/my-topic", QoS.AT_LEAST_ONCE) };
        connection.subscribe(topics);

        for (int i = 0; i < 100; i++) {
            String msg = "hello - " + i;
            System.out.println("Sending msg: " + msg);
            connection.publish("persistent://public/default/my-topic",
                    msg.getBytes(), QoS.AT_LEAST_ONCE, false);
        }

        for (int i = 0; i < 100; i++) {
            Message received = connection.receive();
            System.out.println("Received " + new String(received.getPayload()));
            received.ack();
        }

        connection.disconnect();

    }
}