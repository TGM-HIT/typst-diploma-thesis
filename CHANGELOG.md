# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

<details>
<summary>Migration guide from v0.1.x</summary>

<!-- Write migration guide here -->

</details>

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

## [0.2.0] - 2024-10-23

### Changed
- long chapter titles now look nicer in the header
- **breaking:** glossary entries are now defined differently, see [the diff of the template](https://github.com/TGM-HIT/typst-diploma-thesis/commit/8c4d03a14ac3ddab6718cc7e11341924c66703bd#diff-7c3fcb5c97b51160af4b4a26981b152d6995f8ec0077281456d3f51f4b0e9d84) for an example
- **regression:** if there are no glossary references, an empty glossary section will be shown (glossarium 0.5 hides a couple private functions, see [glossarium#70](https://github.com/typst-community/glossarium/issues/70))

### Fixed
- fix deprecation warnings and incompatibilities introduced in 0.12, in part by updating codly, glossarium and outrageous

## [0.1.3] - 2024-09-14

### Changed
- get rid of more custom outline styling thanks to outrageous:0.2.0

## [0.1.2] - 2024-09-14

(this version was released in a broken state)

## [0.1.1] - 2024-09-09

### Added
- adds support for highlighting authors of individual pages of the thesis, which is a requirement for the thesis' grading

### Changed
- replaces some custom outline styling with [outrageous](https://typst.app/universe/package/outrageous)

## [0.1.0] - 2024-07-13

Initial Release


[Unreleased]: https://github.com/SillyFreak/typst-typst-diploma-thesis/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/SillyFreak/typst-typst-diploma-thesis/releases/tag/v0.2.0
[0.1.3]: https://github.com/SillyFreak/typst-typst-diploma-thesis/releases/tag/v0.1.3
[0.1.2]: https://github.com/SillyFreak/typst-typst-diploma-thesis/releases/tag/v0.1.2
[0.1.1]: https://github.com/SillyFreak/typst-typst-diploma-thesis/releases/tag/v0.1.1
[0.1.0]: https://github.com/SillyFreak/typst-typst-diploma-thesis/releases/tag/v0.1.0
