FROM registry.gitlab.com/enki-portal/thermoengine:master
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
RUN pip install jupyterlab_appmode
RUN jupyter labextension install jupyterlab_appmode
USER ${NB_USER}
CMD jupyter lab --no-browser --notebook-dir=${HOME} --ip=0.0.0.0 --port=8888 --allow-root ${HOME}/Ol-Opx-SplV14.ipynb



#EOF
