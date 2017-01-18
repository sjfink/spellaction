# Dockerfile for example whisk docker action
FROM openwhisk/dockerskeleton
 
ENV FLASK_PROXY_PORT 8080

### Add source file(s)
RUN apk update
RUN apk add aspell-en aspell
RUN rm -f /action/exec
ADD action.sh /action/exec

CMD ["/bin/bash", "-c", "cd actionProxy && python -u actionproxy.py"]
