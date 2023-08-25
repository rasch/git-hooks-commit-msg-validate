# git-hooks-commit-msg-validate

[![builds.sr.ht status](https://builds.sr.ht/~rasch/git-hooks-commit-msg-validate.svg)](https://builds.sr.ht/~rasch/git-hooks-commit-msg-validate?)

A `commit-msg` hook for validating commit messages. The rules are partially
based on tpope's post: [A Note About Git Commit Messages][1]. The title line
can optionally be prefixed with a [gitmoji][2] and a space before the subject.

## Install

To use this hook, place it in the repository's `.git/hooks/` directory. They
can also be used as a plugins by running [this git-hooks script][3] to set up
symlinks for each git hook and then cloning the repository to one of the
following directories:

- ~/.config/git/hooks/plugins/git-hooks-commit-msg-validate
- .git/hooks/git-hooks-commit-msg-validate
- .githooks/git-hooks-commit-msg-validate

## Enforced Commit Message Formatting

### Title Rules

- No empty title line
- Limit the title line length to 50 characters
- Capitalize the first word of the title line (with an optional [gitmoji][2] +
  space prefix)
- Remove trailing whitespace from the title line
- Remove hard tabs (\t) from the title line
- Remove punctuation from end of title line (?:!.,;)

### Body Rules

- Separate body from title with a blank line
- Wrap the body text at 72 characters
- Remove trailing whitespace from the body line(s)
- Remove hard tabs (\t) from the body

## Unenforced Rules

- Begin with imperative verb in the subject line (Add, Fix, Remove, Update,
  etc).
- Use the body to explain what and why instead of how.

## Skip Commit Validation

```sh
git commit --no-verify
```

## References

- <https://git-scm.com/docs/githooks#_commit_msg>
- <https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html>
- <https://chris.beams.io/posts/git-commit/>
- <https://www.git-scm.com/book/en/v2/Distributed-Git-Contributing-to-a-Project#_commit_guidelines>
- <https://github.com/conventional-changelog/commitlint>

[1]: https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[2]: https://gitmoji.dev/
[3]: https://git.sr.ht/~rasch/containers/blob/main/git/scripts/git-hooks
