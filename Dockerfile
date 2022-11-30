FROM nekorro/rusty-focaccia:v0.3.0
COPY conf/ /conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
