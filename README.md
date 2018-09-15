
# git-unrealmodule

Manage git repositories inside git repositories

## Background

- You deploy code using git to a system where all the code must be committed inside the repository
- You want to share code between your projects
- You cannot or do not want to use git submodule

Unrealmodules can help you in this situation.

## Usage

Define a list of sub repositories and paths in a `.unrealmodules` file

    path/in/the/repo|https://github.com/epeli/git-unrealmodule|master
    something/else|https://github.com/epeli/redux-render-prop

- Commit `.unrealmodules` in to the parent repository.
- Clone the sub repositories using `git unrealmodule clone`
- Work on the parent and/or cloned sub repositories
- Commit the sub repositories to the parent repository with `git unrealmodule commit`

When a new developer comes to the project he/she does not have to care at all about
the Unrealmodules but if they want to commit code back to the sub repository upstreams
they can restore the `.git` directories for the Unrealmodules with `git unrealmodule restore`.

If there has been changes to the sub repository from the parent repository the changes
will appear as untracked changes in the sub repository.

## Install

The `git-unrealmodule` is just a single POSIX shell script.

Simplest way to install it is just to copy it to `/usr/local/bin` directory.

or you can use the provided installer

    git clone https://github.com/epeli/git-unrealmodule
    cd git-unrealmodule
    sudo make install

or you can install it with npm

    npm install -g git-unrealmodule


## Command documentation

From `--help`
```

Manage sub git repositories from an .unrealmodules file

    usage: git-unrealmodule [SUBCOMMAND] <PATH>

Available subcommands

    clone   - clone new git repositories from .unrealmodules
    commit  - commit changes from sub repositories
    restore - restore .git files for the .unrealmodules
    help    - show this help

Add PATH to execute command to a single sub repository

Format of the .unrealmodules

    Each line has following format

        [PATH]|[GIT_SOURCE]<|BRANCH>

    Example

        path/in/the/repo|https://github.com/epeli/git-unrealmodule|master
        # This line is a comment
        something/else|https://github.com/epeli/redux-render-prop

    The branch is optional

For more information see https://github.com/epeli/git-unrealmodule

```
