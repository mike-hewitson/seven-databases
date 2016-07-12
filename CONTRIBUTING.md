## Git Guides

The short course on how to use git and github.
```
https://www.udacity.com/course/how-to-use-git-and-github--ud775
```

## Github Guides

For some guides on how to use Github. These are short and really informative.
```
https://guides.github.com
```

## Workflow

Fork the repo in github via the front-end. Clone your copy of the repo onto your machine, which is where you will work from and make changes..
```
git clone
```
Add the upstream seven-web-frameworks repository as a new remote to your clone. 
```
$ git remote add upstream https://github.com/mike-hewitson/seven-databases.git
```
Create a new branch:
```
git checkout -b name-of-branch
```
Commit and push as usual on your branch.
When you're ready to submit a pull request, rebase your branch onto the upstream master so that you can resolve any conflicts: 
```
$ git fetch upstream && git rebase upstream/master
```
You may need to push with --force up to your branch after resolving conflicts.
When you've got everything solved, push up to your branch and send the pull request as usual. You do this by logging onto github on your account, and submitting a pull request for your branch. The repo owner will pull this in and merge with master if all is OK.

## Ignore

Don't forget to update the .gitignore file with stuff not to be added to the repo eg databases

## Issues
We keep track of everything around the repository using Github issues.
