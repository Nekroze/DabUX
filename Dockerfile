FROM mono:5

# Install unzip
RUN apt-get update \
 && apt-get install -y \
    unzip \
 && rm -rf /var/lib/apt/lists/*

# Install pickles
RUN curl -L https://github.com/picklesdoc/pickles/releases/download/v2.20.1/Pickles-exe-2.20.1.zip -o /release.zip \
 && mkdir -p /app \
 && cd /app \
 && unzip /release.zip \
 && rm -f /release.zip

ENTRYPOINT ["/usr/bin/mono","/app/Pickles.exe"]

VOLUME /project
WORKDIR /project

CMD ["--feature-directory=/project/features","--documentation-format=html"]
