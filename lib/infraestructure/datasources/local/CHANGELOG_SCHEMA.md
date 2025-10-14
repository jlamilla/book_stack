# Local Database Schema Changelog

This file documents changes to the local database schema by `schemaVersion`.

## [schemaVersion: 1] - 2025-10-14
### Added
- Initial schema version.
- Tables created:
  - `book_favorites`: Stores user's favorite books.
  - `book_ratings`: Stores user's ratings for books.

---

### Commit References

- `b771edc` (2025-10-14): Added local database and table structures for book favorites and ratings, including provider setup.
- `d633e24` (2025-10-14): Implemented book and book details entities, updated data source and repository methods for search functionality.