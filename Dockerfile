# plugin-echo: the echo test plugin served as an external plugin service.
FROM ghcr.io/pelegw/aab-plugin-base:0.3.0
USER root
COPY VERSION pyproject.toml /tmp/aab-plugin-echo/
COPY aab_plugin_echo /tmp/aab-plugin-echo/aab_plugin_echo
RUN pip install --no-cache-dir /tmp/aab-plugin-echo && rm -rf /tmp/aab-plugin-echo
RUN mkdir -p /data && chown aab:aab /data && chmod 0700 /data
VOLUME /data
USER aab
EXPOSE 8090
CMD ["uvicorn", "--factory", "aab_plugin_echo.main:create_app", "--host", "0.0.0.0", "--port", "8090", "--workers", "1", "--no-access-log"]
