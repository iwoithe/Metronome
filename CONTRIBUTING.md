# Contributing Guide

<!-- To do -->

## Commit Guidelines

<!-- Modified from https://github.com/penpot/penpot/blob/develop/CONTRIBUTING.md -->

The structure and formating of each git commit message are precise.

The commit message format is:

```
<type> <subject>

[body]

[footer]
```

Where `<type>` is:

- :bug: `:bug:` a commit that fixes a bug
- :sparkles: `:sparkles:` a commit that an improvement
- :tada: `:tada:` a commit with new feature
- :recycle: `:recycle:` a commit that introduces a refactor
- :lipstick: `:lipstick:` a commit with cosmetic changes
- :ambulance: `:ambulance:` a commit that fixes critical bug
- :books: `:books:` a commit that improves or adds documentation
- :construction: `:construction:`: a wip commit
- :boom: `:boom:` a commit with breaking changes
- :wrench: `:wrench:` a commit for config updates
- :zap: `:zap:` a commit with performance improvements
- :whale: `:whale:` a commit for CI/CD related stuff
- :rewind: `:rewind:` a commit that reverts changes
- :paperclip: `:paperclip:` a commit with other not relevant changes
- :test_tube: `:test_tube:` a commit for tests
- :hammer_and_wrench: `:hammer_and_wrench` a commit for developer tools, for example shell scripts
- :arrow_up: `:arrow_up:` a commit with dependencies updates

Each commit should have:

- A concise subject using imperative mood.
- The subject should have capitalized the first letter, without period
  at the end and no larger than 65 characters.
- A blank line between the subject line and the body.
- Put extra details/information here if absolutely needed.

Examples of good commit messages:

- `:bug: Fix unexpected error on launching modal`
- `:bug: Set proper error message on generic error`
- `:sparkles: Enable new modal for profile`
- `:zap: Improve performance of dashboard navigation`
- `:wrench: Update default backend configuration`
- `:books: Add more documentation for authentication process`
- `:ambulance: Fix critical bug on user registration process`
- `:tada: Add new approach for user registration`
