# Pinakes Backup Diver

Local scratch space for researching Pinakes MariaDB backups.

## Usage

1. Put the backup in this directory as `database.sql`.
2. Start MariaDB:

   ```sh
   podman compose up -d
   ```

3. Query the database:

   ```sh
   ./mariadb.sh -e "SHOW TABLES;"
   ```

## Common Commands

```sh
./mariadb.sh -e "DESCRIBE table_name;"
./mariadb.sh < research.sql
./mariadb.sh
```

## Replacing the Backup

`database.sql` is imported when the container initializes. After replacing the backup, recreate MariaDB:

```sh
podman compose down
podman compose up -d
```

## Data Handling

Backups can contain private data. `database.sql` and `*.zip` are ignored by git; keep raw dumps and sensitive query output out of commits.
