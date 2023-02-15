# Increment Version

We intend these scripts to automate version incrementation for various files.

This is useful in CI/CD and [Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks).  
If you use [Husky](https://typicode.github.io/husky/#/), you might want to [bypass your Husky Hooks](https://typicode.github.io/husky/#/?id=bypass-hooks) when using these scripts.

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
