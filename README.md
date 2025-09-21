# simple-novnc

## Usage
```yaml
services:
  display_service:
    build: .
    environment:
      - DISPLAY=:1
      - WIDTH=1920
      - HEIGHT=1080
      - DEPTH=24
    volumes:
      - x11-socket:/tmp/.X11-unix
    ports:
      - "5900:5900"
      - "7900:7900"
    restart: unless-stopped

  gui_app:
    image: ubuntu
    depends_on:
      - display_service
    environment:
      - DISPLAY=:1
    volumes:
      - x11-socket:/tmp/.X11-unix
    stdin_open: true
    tty: true
    command: ["tail", "-f", "/dev/null"]
volumes:
  x11-socket:

```