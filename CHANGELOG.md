# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [1.0.0] - 2016-02-28
### Changed
- Require jsonapi-resources 0.9.0 and above

### Fixed
- `have_attribute` and `have_one`, `have_many` matchers: give instructions to the developer when the primary key is not set

## [0.6.0] - 2016-12-22
### Added
- support for `have_sortable_field`

## [0.5.0] - 2016-11-24
### Added
- support for `have_creatable_field` and `have_updatable_field`

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
