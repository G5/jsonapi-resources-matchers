# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [0.4.0]
### Changed
- Update jsonapi-resources dependency to `>= 0.6.0`

### Fixed
- Use the key formatter JSONAPI resources is set to use https://github.com/G5/jsonapi-resources-matchers/pull/3

## [0.3.0]
### Added
- Add `with_relation_name` to `have_many` matcher

### Changed
- Condense `HaveOne` and `HaveMany` into `Relationship`. No public API change.

## [0.2.0]
### Added
- Add `have_one` matcher

## [0.1.0]
### Added
- Initial release
