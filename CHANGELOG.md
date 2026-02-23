# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Allow `Switchbot::Client.new` to read `SWITCHBOT_API_TOKEN` and `SWITCHBOT_API_SECRET` when arguments are omitted. ([#25](https://github.com/ytkg/switchbot/pull/25))

## [0.8.0] - 2023-03-21

### Added
- Add Plug Mini support. ([#21](https://github.com/ytkg/switchbot/pull/21))

## [0.7.0] - 2022-10-27

### Added
- Add Lock support. ([#16](https://github.com/ytkg/switchbot/pull/16))

### Changed
- **BREAKING:** Support SwitchBot API v1.1. ([#15](https://github.com/ytkg/switchbot/pull/15))
  The authentication method has changed:

  ```ruby
  client = Switchbot::Client.new('YOUR_TOKEN', 'YOUR_SECRET')
  ```

  App version 6.14 or later is required to get the secret key.

## [0.6.0] - 2022-05-25

### Added
- Add ColorBulb support. ([#14](https://github.com/ytkg/switchbot/pull/14))

### Changed
- Update Faraday to v2. ([#12](https://github.com/ytkg/switchbot/pull/12))

### Removed
- **BREAKING:** Drop support for Ruby 2.5. ([#12](https://github.com/ytkg/switchbot/pull/12))

## [0.5.1] - 2022-01-04

### Security
- Enable MFA requirement for gem releasing. ([#11](https://github.com/ytkg/switchbot/pull/11))

## [0.5.0] - 2021-06-25

### Added
- Add Bot support. ([#9](https://github.com/ytkg/switchbot/pull/9))

## [0.4.0] - 2021-04-23

### Added
- Add Humidifier support. ([#7](https://github.com/ytkg/switchbot/pull/7))
- Add Light support. ([#6](https://github.com/ytkg/switchbot/pull/6))
- Add `Device#on?` and `Device#off?`. ([#5](https://github.com/ytkg/switchbot/pull/5))

## [0.3.0] - 2021-03-07

### Added
- Add `Device#on` and `Device#off`. ([#4](https://github.com/ytkg/switchbot/pull/4))
- Add `Device#commands`. ([#3](https://github.com/ytkg/switchbot/pull/3))

## [0.2.0] - 2021-03-05

### Added
- Add resource methods. ([#2](https://github.com/ytkg/switchbot/pull/2))
- Support scenes endpoint. ([#1](https://github.com/ytkg/switchbot/pull/1))

## [0.1.0] - 2021-03-02

### Added
- First release.

[Unreleased]: https://github.com/ytkg/switchbot/compare/v0.8.0...HEAD
[0.8.0]: https://github.com/ytkg/switchbot/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/ytkg/switchbot/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/ytkg/switchbot/compare/v0.5.1...v0.6.0
[0.5.1]: https://github.com/ytkg/switchbot/compare/v0.5.0...v0.5.1
[0.5.0]: https://github.com/ytkg/switchbot/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/ytkg/switchbot/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/ytkg/switchbot/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/ytkg/switchbot/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/ytkg/switchbot/releases/tag/v0.1.0
