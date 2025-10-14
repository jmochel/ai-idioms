# Task Execution Overrides (Project Rule)

## When running `/task` on any item:
- If the task is a code/config change, **also create**:
  - A **Unit Test sub-task** with file paths and test names.
  - An **Integration Test sub-task** (or a short rationale if N/A).
- For Go projects:
  - Place unit tests next to the code under test with `_test.go` files.
  - Use table-driven tests and golden files where output is structured.
  - Integration tests must be tagged `//go:build integration` and skipped by default in CI unless `-tags=integration` is passed.
- Always update or create a `Makefile` target for the new tests:
  - `make test` (unit only), `make test.integration`, `make ci` (both where applicable).

