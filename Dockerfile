#docker_container_for_webapp

FROM alpine:latest

RUN apk update && \
    apk add git python3 && \
    cd /root && \
        git clone https://github.com/daninoks/student-exam2.git && \
        cd student-exam2/ && \
            python3 -m venv venv && . venv/bin/activate && pip3 install -e .

ENV FLASK_APP js_example

CMD cd /root/student-exam2/ && . venv/bin/activate && flask run --host=0.0.0.0
