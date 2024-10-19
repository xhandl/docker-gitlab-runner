# GitLab runner scripts for Docker
Helper scripts for quick preparation of GitLab runner environment on virtual machines and runners management.

## Create runners environment
1. Install Docker engine on VM.
2. Run gitlab-runner container. It takes care of GitLab runners and all jobs.
    ```
    ./create-runner.sh
    ```

## Register Runner to GitLab

1. Create new runner in GitLab runners management.
2. Register runner via script:
    ```
    ./register-runner.sh <gitlab_url> <runner_auth_token> [<runner name>]
    ```

For examle

```
./register-runner.sh https://gitlab.com glrt-xxx runner1
```

## Runners configuration

Configuration is stored in 
```
/etc/gitlab-runner/config.toml
```
Correct volumes setup:
```
volumes = ["/var/run/docker.sock:/var/run/docker.sock", "/builds:/builds", "/cache"]
```