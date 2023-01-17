FROM registry.gitlab.com/enki-portal/thermoengine:master
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
RUN pip install --no-cache-dir appmode
RUN jupyter nbextension enable --py --sys-prefix appmode
RUN jupyter serverextension enable --py --sys-prefix appmode
USER ${NB_USER}

docker login registry.gitlab.com
docker run -p 8888:8888 --env JUPYTER_ENABLE_LAB=yes --user root -e GRANT_SUDO=yes registry.gitlab.com/enki-portal/thermoengine:master start-notebook.sh

