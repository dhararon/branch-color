# Branch Color

Change your Visual Studio Color based on your git branch. Just need to install the hook and make `git checkout main` and thats it your VSCode will change the color.

## Color Reference

| Brach | Color | Example |
| ----------------- | ------------------------------------------------------------------ | ----------------- |
| Main | ![#2f7c47](https://via.placeholder.com/10/2f7c47?text=+) #2f7c47 | main |
| Staging | ![#fbed80](https://via.placeholder.com/10/fbed80?text=+) #fbed80 | staging |
| Developer | ![#ab307e](https://via.placeholder.com/10/ab307e?text=+) #ab307e | development |
| Releases | ![#ff6433](https://via.placeholder.com/10/ff6433?text=+) #ff6433 | releases/main-v2023.06.09 |
| Features | ![#1f6fd0](https://via.placeholder.com/10/1f6fd0?text=+) #1f6fd0 | features/development-change-something |
| Hotfix | ![#93e6fc](https://via.placeholder.com/10/93e6fc?text=+) #93e6fc | horfixes/main-fix-typo |
| Error | ![#fa1b49](https://via.placeholder.com/10/fa1b49?text=+) #fa1b49 | Any other formats |

`NOTE: Add ./vscode/settings.json into your .gitignore file to prevent errors.`

## Installation

Just run the next command into your project with git installed.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PixelFlowMX/branch-color/master/install.sh)"
```