
# git-unrealmodule

Manage git repositories inside git repositories with Unreal Modules.

## Background

- You deploy code using git to a system where all the code must be committed inside the repository
- You want to share code between your projects
- You cannot or do not want to use git submodules

Unreal Modules can help you in this situation.

## Usage

Define a list of subrepositories and paths in a `.unrealmodules` file

    path/in/the/repo|https://github.com/epeli/git-unrealmodule|master
    something/else|https://github.com/epeli/redux-render-prop

- Commit `.unrealmodules` in to the parent repository.
- Clone the subrepositories using `git unrealmodule clone`
- Work on the parent and/or cloned subrepositories
- Commit the subrepositories to the parent repository with `git unrealmodule commit`

Now when new developers come to the project ***they do not have to know anything at all about the Unreal Modules***.
They can just clone the repository and continue as if Unreal Modules were never used.
That's why they are called "Unreal".

But if they (or you with a fresh clone) want to commit code back to the subrepository upstreams
they can restore the `.git` directories for the Unreal Modules with `git unrealmodule restore`.

If there has been changes to the subrepository from the parent repository the changes
will appear as untracked changes in the subrepository.

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
    commit  - commit changes from sub repositories to the parent repository
    restore - restore .git directories for the sub repositories defined in .unrealmodules
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
