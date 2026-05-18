FROM myoung34/github-runner:ubuntu-noble

RUN sed -i 's/\x41\x00\x43\x00\x54\x00\x49\x00\x4F\x00\x4E\x00\x53\x00\x5F\x00\x52\x00\x45\x00\x53\x00\x55\x00\x4C\x00\x54\x00\x53\x00\x5F\x00\x55\x00\x52\x00\x4C\x00/\x41\x00\x43\x00\x54\x00\x49\x00\x4F\x00\x4E\x00\x53\x00\x5F\x00\x52\x00\x45\x00\x53\x00\x55\x00\x4C\x00\x54\x00\x53\x00\x5F\x00\x4F\x00\x52\x00\x4C\x00/g' /actions-runner/bin/Runner.Worker.dll \
  && python3 -c "from pathlib import Path; b=Path('/actions-runner/bin/Runner.Worker.dll').read_bytes(); old=bytes.fromhex('41 00 43 00 54 00 49 00 4F 00 4E 00 53 00 5F 00 52 00 45 00 53 00 55 00 4C 00 54 00 53 00 5F 00 55 00 52 00 4C 00'); new=bytes.fromhex('41 00 43 00 54 00 49 00 4F 00 4E 00 53 00 5F 00 52 00 45 00 53 00 55 00 4C 00 54 00 53 00 5F 00 4F 00 52 00 4C 00'); assert old not in b and new in b, 'Runner.Worker.dll patch verification failed'" && \
  echo 'DOCKER_OPTS="--mtu 1450"' > /etc/default/docker
