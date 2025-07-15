# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal Emacs configuration using the `straight.el` package manager with a modular architecture. The configuration is organized into separate package files in the `lisp/` directory, each prefixed with `pkg-` for external packages or `lang-` for language-specific configurations.

## Architecture

### Core Structure
- `init.el`: Main entry point that loads all package configurations
- `lisp/`: Contains modular package configuration files
  - `pkg-*.el`: External package configurations (e.g., `pkg-evil.el`, `pkg-magit.el`)
  - `lang-*.el`: Language-specific configurations (e.g., `lang-org.el`)

### Package Manager
- Uses `straight.el` for package management, not the default Emacs package manager
- Packages are defined using `use-package` with `:straight t`
- Package repositories are cloned to `straight/repos/`
- Built packages are stored in `straight/build/`

### Key Packages and Their Roles
- **Evil**: Vim-like modal editing with comprehensive keybindings
- **General**: Centralized keybinding management with leader key system (`SPC`)
- **Vertico/Consult/Marginalia**: Modern completion and search interface
- **Corfu**: In-buffer completion popup
- **Projectile**: Project management and navigation
- **Magit**: Git interface and operations
- **Activities**: Session/workspace management
- **Vterm/Eat**: Terminal emulation within Emacs

## Common Development Tasks

### Adding New Packages
1. Create a new `pkg-<package-name>.el` file in `lisp/`
2. Configure the package using `use-package` with `:straight t`
3. Add `(require 'pkg-<package-name>)` to `init.el`
4. Follow the existing naming and structure patterns

### Keybinding System
- Uses `general.el` with a leader key system
- Leader key is `SPC` in normal/visual states, `M-SPC` in other states
- Keybindings are organized hierarchically with descriptive groups
- All keybindings are defined in `pkg-general.el`

### Configuration Patterns
- Each package file should include `;;; -*- lexical-binding: t; -*-` header
- Use `use-package` for configuration structure
- End each file with `(provide 'pkg-<name>)`
- Japanese comments are present in some files

## File Organization

### Important Files
- `init.el`: Main configuration entry point
- `lisp/pkg-general.el`: Keybinding definitions
- `custom.el`: Emacs customization settings
- `straight/`: Package management directory structure

### Git Status
Currently modified files:
- `lisp/pkg-consult.el`: Consult package configuration
- `lisp/pkg-general.el`: Keybinding definitions
- `lisp/pkg-vterm.el`: Terminal package configuration

## Development Notes

### Performance Optimizations
- Garbage collection threshold is increased during startup
- Process output max size is set to 4MB for better performance
- Packages are loaded with `:defer t` when appropriate

### Terminal Integration
- Both `vterm` and `eat` are configured for terminal emulation
- First-time setup for `eat` requires running `M-x eat-compile-terminfo`

### Session Management
- Uses `activities` for workspace/session management
- Undo history is persisted using `undo-fu-session`
- Recent files and places are maintained across sessions