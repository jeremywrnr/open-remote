# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-02-08

### Added
- Ruby code formatter (Standard) with auto-fix capability
- Rake tasks for code formatting: `rake format` and `rake format_check`
- Gitea support for both HTTPS and SSH remote URLs
- Comprehensive URL parsing tests for Gitea remotes
- Test for invalid remote arguments (ensures proper error handling)
- Better error handling with specific error messages for missing browser commands

### Changed
- **BREAKING**: Renamed constants to follow Ruby conventions:
  - `OpenRemote::Version` → `OpenRemote::VERSION`
  - `OpenRemote::Help` → `OpenRemote::HELP`
- Replaced Heroku support with Gitea (more relevant for modern Git hosting)
- Improved browser launching on Linux - now exits cleanly without blocking
- Suppressed verbose GTK warnings on Ubuntu/Linux systems
- Updated all dependencies to use pessimistic version constraints (`~>`)
- Modernized Ruby code style:
  - Hash syntax: `:key => value` → `key: value`
  - String literals: consistent double quotes
  - Method naming: `open()` → `open_url()` to avoid security warnings
  - OS detection: improved pattern matching with `.match?()`
  - Heredoc indentation: `<<-` → `<<~`

### Removed
- Ronn documentation generator dependency (simplified build process)
- Man page generation tasks (focusing on inline help and GitHub README)
- Travis CI badge (service no longer active)
- Heroku-specific URL transformation logic

### Fixed
- GTK warnings and errors when opening URLs on Ubuntu
- Command now exits immediately after launching browser (no longer blocks terminal)
- Open-ended dependency warnings in gemspec
- Multiple code style and security warnings flagged by RuboCop/Standard
- Proper error messages for malformed or missing remotes

### Security
- Renamed `open` method to `open_url` to avoid confusion with `Kernel#open`
- Added proper exception handling for browser spawn failures

## [0.5.2] - Previous Release
- Legacy version before 1.0.0 refactor
- Basic support for GitHub, Bitbucket, and Heroku remotes
- Simple git remote opening functionality
