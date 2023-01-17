FROM registry.gitlab.com/enki-portal/thermoengine:master
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
RUN pip install --no-cache-dir appmode
RUN jupyter nbextension enable --py --sys-prefix appmode
RUN jupyter serverextension enable --py --sys-prefix appmode
USER ${NB_USER}

# Launch Notebook server
EXPOSE 8888
CMD ["Ol-Opx-SplV14", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''"]

#EOF
