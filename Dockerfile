FROM ghcr.io/falcondev-oss/actions-runner:latest AS patched

FROM myoung34/github-runner:ubuntu-noble

COPY --from=patched /home/runner /actions-runner

RUN rm -rf /actions-runner/ || true \
  && mkdir -p /actions-runner \
  && (curl -fsSL -o /tmp/actions-runner.tar.gz "https://github.com/falcondev-oss/github-actions-runner/releases/download/v2.334.0/actions-runner-linux-x64-2.334.0.tar.gz" || wget -qO /tmp/actions-runner.tar.gz "https://github.com/falcondev-oss/github-actions-runner/releases/download/v2.334.0/actions-runner-linux-x64-2.334.0.tar.gz") \
  && tar -xzf /tmp/actions-runner.tar.gz -C /actions-runner \
  && chmod -R 755 /actions-runner \
  && rm -f /tmp/actions-runner.tar.gz \
  && sudo apt-get update \
  && sudo apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    tar \
    gzip \
    sudo \
  && rm -rf /var/lib/apt/lists/* \
  && echo 'DOCKER_OPTS="--mtu 1450"' > /etc/default/docker
  