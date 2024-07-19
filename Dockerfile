# Use a imagem oficial do Ubuntu como base
FROM ubuntu:22.04

# Evita que algumas interações sejam solicitadas durante a instalação de pacotes
ENV DEBIAN_FRONTEND=noninteractive
ENV GITHUB_PATH="$HOME/sfdx/bin"
ENV PATH="/root/sfdx/bin/:${PATH}"

# Realiza as atualizações e instalações requeridas
RUN apt update -y && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt install -y \
    build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev \
    libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libbz2-dev \
    zip curl openjdk-8-jdk grep jq lsb-release \
    python3.7 python3-pip coreutils python-is-python3 git && \
    apt install -y sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    python3 -m pip install --upgrade pip && \
    wget https://developer.salesforce.com/media/salesforce-cli/sfdx/channels/stable/sfdx-linux-x64.tar.xz && \
    mkdir ~/sfdx && \
    tar xJf sfdx-linux-x64.tar.xz -C ~/sfdx --strip-components 1 && \
    rm -f sfdx-linux-x64.tar.xz && \
    /root/sfdx/bin/sfdx plugins:install @salesforce/sfdx-scanner

# # Realiza as atualizações e instalações requeridas
# RUN apt-get update -y && \
#     apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libbz2-dev -y && \
#     apt install -y zip && \
#     apt install -y curl && \
#     apt install openjdk-8-jdk -y && \
#     apt install -y jq && \
#     apt install -y grep && \
#     apt install -y lsb-release && \
#     apt install -y software-properties-common && \
#     add-apt-repository ppa:deadsnakes/ppa && \
#     apt install -y python3.7 && \
#     apt install -y python3-pip && \
#     python3 -m pip install --upgrade pip && \
#     apt install -y coreutils && \
#     apt install -y python-is-python3 && \
#     apt install -y git && \
#     rm -rf /var/lib/apt/lists/* && \
#     apt-get clean -y && \
#     apt autoremove -y && \
#     wget https://developer.salesforce.com/media/salesforce-cli/sfdx/channels/stable/sfdx-linux-x64.tar.xz && \
#     mkdir ~/sfdx && \
#     tar xJf sfdx-linux-x64.tar.xz -C ~/sfdx --strip-components 1 && \
#     rm -f sfdx-linux-x64.tar.xz && \
#     /root/sfdx/bin/sfdx plugins:install @salesforce/sfdx-scanner

# RUN apt install -y acl && \   
#     apt install -y aria2 && \
#     apt install -y autoconf && \
#     apt install -y automake && \
#     apt install -y binutils && \
#     apt install -y bison && \
#     apt install -y brotli && \
#     apt install -y bzip2 && \
#     apt install -y coreutils && \
#     apt install -y curl && \
#     apt install -y dbus && \
#     apt install -y dnsutils && \
#     apt install -y dpkg && \
#     apt install -y dpkg-dev && \
#     apt install -y fakeroot && \
#     apt install -y file && \
#     apt install -y flex && \
#     apt install -y fonts-noto-color-emoji && \
#     apt install -y ftp && \
#     apt install -y g++ && \
#     apt install -y gcc && \
#     apt install -y gnupg2 && \
#     apt install -y haveged && \
#     apt install -y imagemagick && \
#     apt install -y iproute2 && \
#     apt install -y iputils-ping && \
#     apt install -y jq && \
#     apt install -y lib32z1 && \
#     apt install -y libc++-dev && \
#     apt install -y libc++abi-dev && \
#     apt install -y libc6-dev && \
#     apt install -y libcurl4 && \
#     apt install -y libgbm-dev && \
#     apt install -y libgconf-2-4 && \
#     apt install -y libgsl-dev && \
#     apt install -y libgtk-3-0 && \
#     apt install -y libmagic-dev && \
#     apt install -y libmagickcore-dev && \
#     apt install -y libmagickwand-dev && \
#     apt install -y libsecret-1-dev && \
#     apt install -y libsqlite3-dev && \
#     apt install -y libssl-dev && \
#     apt install -y libtool && \
#     apt install -y libunwind8 && \
#     apt install -y libxkbfile-dev && \
#     apt install -y libxss1 && \
#     apt install -y libyaml-dev && \
#     apt install -y locales && \
#     apt install -y lz4 && \
#     apt install -y m4 && \
#     apt install -y make && \
#     apt install -y mediainfo && \
#     apt install -y mercurial && \
#     apt install -y net-tools && \
#     apt install -y netcat && \
#     apt install -y openssh-client && \
#     apt install -y p7zip-full && \
#     apt install -y p7zip-rar && \
#     apt install -y parallel && \
#     apt install -y pass && \
#     apt install -y patchelf && \
#     apt install -y pigz && \
#     apt install -y pkg-config && \
#     apt install -y pollinate && \
#     apt install -y python-is-python3 && \
#     apt install -y rpm && \
#     apt install -y rsync && \
#     apt install -y shellcheck && \
#     apt install -y sphinxsearch && \
#     apt install -y sqlite3 && \
#     apt install -y ssh && \
#     apt install -y sshpass && \
#     apt install -y subversion && \
#     apt install -y sudo && \
#     apt install -y swig && \
#     apt install -y tar && \
#     apt install -y telnet && \
#     apt install -y texinfo && \
#     apt install -y time && \
#     apt install -y tk && \
#     apt install -y tzdata && \
#     apt install -y unzip && \
#     apt install -y upx && \
#     apt install -y wget && \
#     apt install -y xorriso && \
#     apt install -y xvfb && \
#     apt install -y xz-utils && \
#     apt install -y zip && \
#     apt install -y zsync && \
#     apt install -y git
    
# Define o diretório de trabalho
WORKDIR /app

# Define o comando padrão para rodar quando iniciar o container
CMD ["bash"]
