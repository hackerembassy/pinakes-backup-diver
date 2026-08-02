---
name: researching-pinakes-backups
description: "Use when researching, inspecting, querying, or analyzing Pinakes database backups in the pinakes-backup-diver repo, especially database.sql dumps, MariaDB, mariadb.sh, schema discovery, aggregate reports, and sensitive backup data."
---

# Researching Pinakes Backups

## Overview

Use this repo as a disposable local MariaDB research environment for Pinakes backups. Assume the user has already followed the README: the backup is in place, Podman Compose is running, and the database is reachable through `./mariadb.sh`.

Keep raw backup data local, query through the provided helper, and avoid exposing personal fields unless the user explicitly needs them.

## Starting Point

Begin with database research, not container setup:

```sh
./mariadb.sh -e "SHOW TABLES;"
```

## Query Pattern

- Use `./mariadb.sh` for all database access so the compose file, service, database, user, and password stay consistent.
- Start with schema discovery before answering research questions:

  ```sh
  ./mariadb.sh -e "SHOW TABLES;"
  ./mariadb.sh -e "DESCRIBE table_name;"
  ```

- Prefer focused SQL files for multi-step investigations:

  ```sh
  ./mariadb.sh < research.sql
  ```

- Prefer aggregate outputs, counts, IDs, dates, status fields, and table relationships. Redact or avoid names, emails, tokens, API keys, and free-text private data unless they are essential to the task.

## Safety Checks

- Treat backups as sensitive data.
- Do not commit `database.sql`, archive files, exported rows, or notes containing private values.
- Before reporting findings, scan outputs for personal data and summarize when possible.
- If a query may produce large or sensitive output, add `COUNT(*)`, `LIMIT`, or explicit columns first.

## Useful Commands

```sh
./mariadb.sh -e "SELECT DATABASE();"
./mariadb.sh -e "SHOW CREATE TABLE table_name\\G"
```
