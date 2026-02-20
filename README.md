# 🍎 Engel's Nix-Darwin Configuration

> Декларативная настройка macOS через Nix — всё в одном месте, всё под контролем.

[![Nix](https://img.shields.io/badge/Nix-2.0+-5277C3?style=flat-square&logo=nixos&logoColor=white)](https://nixos.org)
[![Darwin](https://img.shields.io/badge/nix--darwin-macOS-000000?style=flat-square&logo=apple&logoColor=white)](https://github.com/LnL7/nix-darwin)
[![Home Manager](https://img.shields.io/badge/Home%20Manager-25.05-5277C3?style=flat-square)](https://github.com/nix-community/home-manager)

---

## 📦 Что внутри

| Компонент | Описание |
|-----------|----------|
| **nix-darwin** | Системная конфигурация macOS |
| **home-manager** | Настройка домашней директории и пользовательских пакетов |
| **nix-homebrew** | Интеграция Homebrew в Nix (casks, brews, mas) |

### Установленные пакеты

**Nix packages:** `git` · `nodejs` · `htop` · `eza` · `neovim` · `tree` · `jq` · `rustup` · `iina` · `ani-cli` · `zoxide` · `qbittorrent`

**Homebrew:** `mas` · `cava` · `soulseek` (cask)

### Shell

- **Zsh** с Powerlevel10k
- **zoxide** — умная навигация по директориям
- Автодополнение и подсветка синтаксиса

---

## 🚀 Установка

### Предварительные требования

- **macOS** (Apple Silicon — `aarch64-darwin`)
- Права администратора

### Шаг 1: Установить Nix

```bash
# Официальный инсталлер (рекомендуется)
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume

# Или через Homebrew (если уже установлен)
brew install nix
```

После установки **перезапусти терминал** или выполни:

```bash
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
```

### Шаг 2: Включить Flakes

Убедись, что Flakes включены (обычно уже есть в новых версиях Nix):

```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### Шаг 3: Установить nix-darwin

```bash
# Клонировать репозиторий
git clone https://github.com/YOUR_USERNAME/nix.git ~/nix
cd ~/nix

# Первый запуск — создаст конфигурацию darwin
nix run nix-darwin# -- switch --flake ~/nix#engel
```

> ⚠️ **Важно:** замени `YOUR_USERNAME` на свой GitHub username или путь к репозиторию.

### Шаг 4: Готово!

После успешной установки перезапусти терминал. Конфигурация применена.

---

## 🔄 Обновление конфигурации

```bash
# Применить изменения
darwin-rebuild switch --flake ~/nix#engel

# Или через алиас (если настроен в zsh)
nixupdateconf
```

---

## 📁 Структура проекта

```
nix/
├── flake.nix          # Flake inputs и outputs
├── configuration.nix  # Системная конфигурация (hostname, nix, users)
├── home.nix           # Home-manager: пакеты, zsh, алиасы
├── brew.nix           # Homebrew: casks, brews, mas
├── flake.lock         # Закреплённые версии зависимостей
└── README.md
```

---

## 🛠 Полезные команды

| Команда | Описание |
|---------|----------|
| `darwin-rebuild switch --flake ~/nix#engel` | Применить конфигурацию |
| `darwin-rebuild build --flake ~/nix#engel` | Собрать без применения |
| `darwin-rebuild check --flake ~/nix#engel` | Проверить конфигурацию |
| `nix flake update` | Обновить inputs (nixpkgs, home-manager и т.д.) |

---

## 📝 Кастомизация

1. **Пакеты** — добавь в `home.packages` в `home.nix`
2. **Homebrew** — `brew.nix` (casks, brews, mas)
3. **Zsh** — алиасы и плагины в `home.nix`
4. **Система** — hostname, users в `configuration.nix`

---

## 🔗 Ссылки

- [nix-darwin](https://github.com/LnL7/nix-darwin)
- [home-manager](https://github.com/nix-community/home-manager)
- [nix-homebrew](https://github.com/zhaofengli-wip/nix-homebrew)
- [Nix Manual](https://nixos.org/manual/nix/stable/)

---

*Сделано с ❤️ и Nix*
