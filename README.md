# git-gud

A friendly (and possibly judgmental), custom `git` subcommand: `git gud` — to remind you how not to suck at Git.

Displays a cheat-sheet of common Git commands with a bit of style.

## 🖥️ Platforms Supported

- Windows 10+ (Git Bash, PowerShell, CMD)
- macOS (Intel & Apple Silicon)
- Linux (Debian, Ubuntu, Arch, etc.)

---

## 📦 Installation

### 🟦 Windows

1. Download `git-gud.exe` from [Releases](https://github.com/SuperLonci/git-gud/releases)
2. Move it to Git’s executable folder:

```powershell
copy .\git-gud.exe "C:\Program Files\Git\cmd\"
```

### 🧴 Homebrew

```bash
brew tap superlonci/gitgud
brew install git-gud
```

### Build from Source
```bash
go build -o git-gud main.go
```