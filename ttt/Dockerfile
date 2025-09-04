# Base image with SteamCMD
FROM steamcmd/steamcmd:latest

# Set working directory
WORKDIR /gmod

# Install required runtime packages
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y lib32gcc-s1 ca-certificates tmux wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Create server directory
RUN mkdir -p /gmod/server

# Copy your Garry's Mod configs and scripts
COPY garrysmod/ /gmod/server/garrysmod/
COPY start.sh /gmod/start.sh
RUN chmod +x /gmod/start.sh

# Expose Garry's Mod default
EXPOSE 27015/tcp
EXPOSE 27015/udp

# Ensure SteamCMD does not override the entrypoint
ENTRYPOINT ["/gmod/start.sh"]
