# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.5.2] - 2018-09-11
### Added
- Add `WithdrawResponse#max_amount`

## [0.5.1] - 2018-09-04
### Changed
- Append `/withdraw` to host/path for `WithdrawRequest`

## [0.5.0] - 2018-08-29
### Changed
- Renamed from BridgeClient to StellarClient
- `host` configuration is now `bridge_host`

### Added
- `#get_toml` to fetch the toml of `host`
- `#get_withdraw` to get withdrawal details from an Anchor

## [0.4.0] - 2017-04-05
### Added
- Expose response's `code` (as `code_str`) and `message`

## [0.3.0] - 2017-03-31
### Changed
- Use `api_client_base` `~> 1.0`

## [0.2.0]
### Added
- Explicitly require ActiveSupport's hash with indifferent access
- Upgrade api_client_base to 0.2.0

## [0.1.0] - 2016-12-15
### Added
- Initial release. Payments only
