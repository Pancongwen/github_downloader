
### Description
Download release package from a private github repository.

### Usage
```bash
./download.sh [repo] [tag] [file] [token]
```
Explanation of arguments:
* [repo]: the user and repository of github. e.g: `pancongwen/github_downloader`
* [tag]: the github release tag.
* [file]: the part of file name in release. The name format of release file is like `[file]-[tag].zip`
* [token]: the token of [repo] number.

For example:  
You have a **private** repository `peter/game`, and it has a file named `Tetris-0.1.0.zip` in tag `0.1.0`. Your token is `XXXXTOKENXXXX`.
```bash
./download.sh peter/game 0.1.0 Tetris XXXXTOKENXXXX
```
Then, a file named `Tetris-0.1.0.zip` is download at current directory.