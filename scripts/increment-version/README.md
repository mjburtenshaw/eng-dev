# Increment Version

We intend these scripts to automate version incrementation for various files.

This is useful in CI/CD.  
If you use [Husky](https://typicode.github.io/husky/#/), you might want to [bypass your Husky Hooks](https://typicode.github.io/husky/#/?id=bypass-hooks) when using these scripts.

#### Table of Contents

1. [Supported Formats](#supported-formats)
2. [Behaviors](#behaviors)  
    2.1. [Gotchas](#gotchas)

## Supported Formats

- **JSON:** Currently works for JSON files with a top-level **version** attribute.
- **Markdown:** Currently works for modifying [Shields Version Chips](https://shields.io/category/version).

## Behaviors

Every script in this directory should do the following:
1. Accept a single file to work on.
2. Parse the file using a pattern to locate the current version.
3. Increment a version element.  

    > ⭐️ _We recommend the **major.minor.patch** convention._

4. Write the new version to the file.
5. Expose the new version to callers.

### Gotchas

The entrypoint for this directory relies on an environment variable: **version_increment_type**.  
You can configure this variable in your shell's source config file.  
It should have the value **patch**. Set it to **minor** or **major** when applicable, but don't forget to reset.
