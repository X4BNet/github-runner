# github-runner

Docker image definition for `x4bnet/github-runner`.

- Base image: `myoung34/github-runner:ubuntu-noble`
- Applies a binary patch to `/actions-runner/bin/Runner.Worker.dll` to allow `ACTIONS_RESULTS_URL`
- Published by `.github/workflows/docker-publish.yml`
