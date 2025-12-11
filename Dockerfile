FROM drwetter/testssl.sh:latest

# Switch to root to set up the entrypoint script
USER root

# Set the entrypoint to a wrapper script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Switch back to testssl user
USER testssl

ENTRYPOINT ["/entrypoint.sh"]
