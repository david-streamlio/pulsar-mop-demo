FROM apachepulsar/pulsar:2.9.3

ARG AMQP_PROTOCOL_PLUGIN=https://github.com/streamnative/mop/releases/download/v2.9.3.14/pulsar-protocol-handler-mqtt-2.9.3.14.nar

RUN  apt-get update && \
     apt-get install -y wget && \
     wget ${AMQP_PROTOCOL_PLUGIN} -P /pulsar/protocols

RUN echo "messagingProtocols=mqtt" >> /pulsar/conf/standalone.conf  && \
    echo "protocolHandlerDirectory=./protocols" >> /pulsar/conf/standalone.conf && \
    echo "amqpListeners=amqp://127.0.0.1:1883" >> /pulsar/conf/standalone.conf

