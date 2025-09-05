# Base image with SteamCMD
FROM steamcmd/steamcmd:latest

# Set working directory
WORKDIR /gmod

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



