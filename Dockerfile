FROM amazoncorretto:22-alpine


# Set up the user environment
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/$NB_USER


##### ----- DOWNLOAD DEPENDENCIES ----- #####
RUN apk update && apk upgrade && \
    apk add --no-cache py3-pip \
    make gcc g++ musl-dev linux-headers \ 
    python3-dev curl git nodejs npm \
    msttcorefonts-installer fontconfig && \
    pip3 install --no-cache-dir jupyter jupyterlab --break-system-packages && \
    update-ms-fonts


##### ----- INSATLL JAVA KERNEL ----- #####
USER root
# Download the kernel release
RUN curl -L https://github.com/padreati/rapaio-jupyter-kernel/releases/download/2.1.0/rapaio-jupyter-kernel-2.1.0.jar > rapaio-jupyter-kernel-2.1.0.jar


##### ----- CREATE USER ----- #####
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid $NB_UID \
    $NB_USER

USER $NB_USER

# Unpack and install the kernel
RUN java -jar ./rapaio-jupyter-kernel-2.1.0.jar -i -auto


##### ----- INSTALL C KERNEL ----- #####
# Install C kernal
USER root
WORKDIR /tmp
RUN git clone https://github.com/brendan-rius/jupyter-c-kernel.git
RUN pip install --no-cache-dir --break-system-packages jupyter-c-kernel/
RUN cd jupyter-c-kernel/jupyter_c_kernel && install_c_kernel --user


##### ----- INSTALL JAVASCRIPT KERNEL ----- #####
RUN npm install -g ijavascript
RUN ijsinstall


##### ----- LAUNCH NOTEBOOK ----- #####
# Launch the notebook server
USER $NB_USER
WORKDIR $HOME

# binder does not allow internet access, as such we will use everything offline
RUN curl -L https://github.com/padreati/rapaio/releases/download/6.1.0/rapaio-core-6.1.0.jar > rapaio-core-6.1.0.jar


CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
EXPOSE 8888
