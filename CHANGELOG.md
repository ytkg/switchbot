## Unreleased
[full changelog](http://github.com/ytkg/switchbot/compare/v0.8.0...main)

## v0.8.0
[full changelog](http://github.com/ytkg/switchbot/compare/v0.7.0...v0.8.0)

* Add Plug Mini (https://github.com/ytkg/switchbot/pull/21)

## v0.7.0
[full changelog](http://github.com/ytkg/switchbot/compare/v0.6.0...v0.7.0)

* Add Lock (https://github.com/ytkg/switchbot/pull/16)
* :bomb: **[BREAKING CHANGE]** Support SwitchBot API v1.1 ( https://github.com/ytkg/switchbot/pull/15)

  The authentication method has been changed.

  ```ruby
  client = Switchbot::Client.new('YOUR_TOKEN', 'YOUR_SECRET')
  ```

  You must update the app to the latest version, V6.14 or later, in order to get the secret key.

## v0.6.0
[full changelog](http://github.com/ytkg/switchbot/compare/v0.5.1...v0.6.0)

* Add ColorBulb (https://github.com/ytkg/switchbot/pull/14)
* :bomb: **[BREAKING CHANGE]** Update faraday v2 and Drop support ruby 2.5 (https://github.com/ytkg/switchbot/pull/12)

## v0.5.1
[full changelog](http://github.com/ytkg/switchbot/compare/v0.5.0...v0.5.1)

* Enable MFA requirement for gem releasing (https://github.com/ytkg/switchbot/pull/11)

## v0.5.0
[full changelog](http://github.com/ytkg/switchbot/compare/v0.4.0...v0.5.0)

* Add Bot (https://github.com/ytkg/switchbot/pull/9)

## v0.4.0
[full changelog](http://github.com/ytkg/switchbot/compare/v0.3.0...v0.4.0)

* Add Humidifier (https://github.com/ytkg/switchbot/pull/7)
* Add Light (https://github.com/ytkg/switchbot/pull/6)
* Add Device#on? and Device#off? (https://github.com/ytkg/switchbot/pull/5)

## v0.3.0
[full changelog](http://github.com/ytkg/switchbot/compare/v0.2.0...v0.3.0)

* Add Device#on and Device#off (https://github.com/ytkg/switchbot/pull/4)
* Add Device#commands (https://github.com/ytkg/switchbot/pull/3)

## v0.2.0
[full changelog](http://github.com/ytkg/switchbot/compare/v0.1.0...v0.2.0)

* Add resource methods (https://github.com/ytkg/switchbot/pull/2)
* Support scenes endpoint (https://github.com/ytkg/switchbot/pull/1)

## v0.1.0
* first release
