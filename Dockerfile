# Use archlinux:latest as parent image
FROM archlinux:latest

#Labels as key value pair
LABEL Maintainer="<Dean Rickles> Dean@rickles.co.uk"

# Update mirrors, packages, and Install jupyterlab
RUN pacman --noconfirm -Syyu jupyterlab

# Build the lab
RUN jupyter lab build --minimize=False

# Preset aguments. (pip, git+gh)
ARG PACMAN_ARGS="python-pip  glu npm nodejs git github-cli aspnet-runtime dotnet-runtime" \
    PIP_ARGS="Matplotlib numpy pillow opencv-python jupyterlab-git jupyterlab-kite"

# Install packages.
RUN pacman --noconfirm -Syyu $PACMAN_ARGS && pip install --no-input $PIP_ARGS

# install the dotnet sdk | aspnet-runtime dotnet-runtime packages required.
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --install-dir '/usr/share/dotnet/'
# /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.dotnet/tools
RUN dotnet tool install --global Microsoft.dotnet-interactive 
ENV PATH="/root/.dotnet/tools:${PATH}"
RUN dotnet interactive jupyter install

# Expose port and path
EXPOSE 8888
VOLUME /appdata

# Run JupyterLab
CMD cp -R -n /usr/share/jupyter/* /appdata && jupyter lab --ip=* --port=8888 --no-browser --notebook-dir=/opt/app/data --ServerApp.base_url=/code/ --allow-root