# ⬡ Engel's Nix-Darwin

> Декларативная настройка macOS через Nix. Всё в одном месте — система, окружение, dotfiles.

<p align="center">
  <img src="https://img.shields.io/badge/Nix-2.0+-5277C3?style=for-the-badge&logo=nixos&logoColor=white" alt="Nix" />
  <img src="https://img.shields.io/badge/nix--darwin-macOS-000000?style=for-the-badge&logo=apple&logoColor=white" alt="nix-darwin" />
  <img src="https://img.shields.io/badge/Home%20Manager-25.05-5277C3?style=for-the-badge" alt="Home Manager" />
</p>

---

## ✨ Что внутри

| Компонент | Описание |
|-----------|----------|
| **nix-darwin** | Системная конфигурация macOS |
| **home-manager** | Пользовательские пакеты, dotfiles, окружение |
| **nix-homebrew** | Homebrew в Nix — casks, brews, mas |

### Тайловый менеджер окон

- **Yabai** — tiling WM для macOS
- **skhd** — hotkey daemon
- **Borders** — визуальные границы окон

### Терминал и shell

- **WezTerm** — GPU-ускоренный терминал
- **Zsh** + Powerlevel10k
- **zoxide** — быстрая навигация по директориям

### Медиа и развлечения

- **MPD** + **rmpc** — музыкальный плеер в терминале
- **IINA** — видеоплеер
- **ani-cli** — аниме в терминале
- **qBittorrent** — торрент-клиент

### Редактор и утилиты

- **Neovim** — полная конфигурация (LSP, Telescope, Oil, Treesitter)
- **eza**, **htop**, **jq**, **tree**
- **alejandra** — форматтер Nix

### Homebrew

| Тип | Пакеты |
|-----|--------|
| **brews** | mas, cava |
| **casks** | Soulseek |
| **mas** | Telegram, V2Box |

---

## 🚀 Установка

### 1. Установить Nix

```bash
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
```

Перезапусти терминал или:

```bash
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
```

### 2. Включить Flakes

```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### 3. Клонировать и применить

```bash
git clone https://github.com/YOUR_USERNAME/nix.git ~/nix
cd ~/nix

nix run nix-darwin# -- switch --flake ~/nix#engel
```

> Замени `YOUR_USERNAME` на свой GitHub username.

### 4. Готово

Перезапусти терминал. Конфигурация применена.

---

## 📁 Структура проекта

```
nix/
├── flake.nix              # Flake: inputs, darwin config
├── configuration.nix      # Точка входа darwin + home-manager
├── home.nix               # Home-manager: импорт модулей
├── brew.nix               # Homebrew: casks, brews, mas
│
├── modules/
│   ├── darwin/            # Системные модули
│   │   ├── system.nix     # hostname, nix, users
│   │   ├── yabai.nix
│   │   ├── skhd.nix
│   │   └── borders.nix
│   │
│   └── home/              # Пользовательские модули
│       ├── packages.nix
│       ├── zsh.nix
│       ├── p10k.nix
│       ├── wezterm.nix
│       ├── nvim.nix
│       ├── yabai.nix
│       ├── skhd.nix
│       ├── mpd.nix
│       └── rmpc.nix
│
├── dotfiles/              # Конфиги (yabai, skhd, wezterm, nvim, mpd, rmpc, p10k)
└── flake.lock
```

---

## 🔄 Обновление

```bash
darwin-rebuild switch --flake ~/nix#engel
```

Обновить inputs (nixpkgs, home-manager):

```bash
nix flake update
```

---

## 🛠 Полезные команды

| Команда | Описание |
|---------|----------|
| `darwin-rebuild switch --flake ~/nix#engel` | Применить конфигурацию |
| `darwin-rebuild build --flake ~/nix#engel` | Собрать без применения |
| `darwin-rebuild check --flake ~/nix#engel` | Проверить синтаксис |
| `nix flake update` | Обновить все inputs |

---

## 📝 Кастомизация

| Что менять | Где |
|------------|-----|
| Пакеты Nix | `modules/home/packages.nix` |
| Homebrew (casks, brews, mas) | `brew.nix` |
| Zsh, алиасы, плагины | `modules/home/zsh.nix` |
| Powerlevel10k | `modules/home/p10k.nix` |
| WezTerm | `dotfiles/wezterm/wezterm.lua` |
| Neovim | `dotfiles/nvim/` |
| Yabai правила | `dotfiles/yabai/yabairc` |
| skhd хоткеи | `dotfiles/skhd/skhdrc` |
| Hostname, users | `modules/darwin/system.nix` |

---

## 🔗 Ссылки

- [nix-darwin](https://github.com/LnL7/nix-darwin)
- [home-manager](https://github.com/nix-community/home-manager)
- [nix-homebrew](https://github.com/zhaofengli-wip/nix-homebrew)
- [Nix Manual](https://nixos.org/manual/nix/stable/)

---

<p align="center">
  <sub>Сделано с ⬡ и Nix</sub>
</p>
