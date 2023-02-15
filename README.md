# eng-dev

An accumulation of work on the philosophy of engineering development.

[![version](https://img.shields.io/badge/version-v1.1.0-blue)](https://github.com/mjburtenshaw/eng-dev)

#### Table of Contents

1. [Setup](#setup)
2. [Contributing](#contributing)

## Setup

If you have permission to push to the `main` branch for this repository, please add an execution of the [`increment-version`](./scripts/increment-version/README.md) script to your [pre-push Git Hook](https://git-scm.com/docs/githooks#_pre_push).  
This requires you to add an environment variable **eng_dev_path** to your shell's source config file, with the value as home-relative or absolute path to this repository on your machine.

## Contributing

Feel free to make a pull request.
