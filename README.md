# Content Publisher

A unified publishing application for content on GOV.UK

## Nomenclature

  * Content - Some text ([and related fields][content-schemas]) a user wants to publish
  * Revision - A version of a piece of content in a particular locale
  * Edition - A revision that is in the Publishing API
  * Document - All revisions of a piece of content in a particular locale


## Technical documentation

This is a Ruby on Rails application.

### Dependencies

- [postgresql][] - provides a backing database
- [yarn][] - package manager for JavaScripts
- [imagemagick][] - image manipulation library

### Running the application

```
bowl content-publisher
```

### Running the test suite

```
yarn install
bundle exec rake
```

## Licence

[MIT License](LICENCE)

[content-schemas]: https://github.com/alphagov/govuk-content-schemas
[postgresql]: https://www.postgresql.org/
[yarn]: https://yarnpkg.com/
[imagemagick]: https://www.imagemagick.org/script/index.php
