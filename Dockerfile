FROM ubuntu

ENV DISPLAY=:1
ENV WIDTH=1280
ENV HEIGHT=720
ENV DEPTH=24

RUN apt-get update && apt-get install -y supervisor xvfb x11vnc websockify novnc

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 7900

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]