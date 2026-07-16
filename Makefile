BACKUP := 'db__$(shell date +%d.%m.%Y__%H-%M).dump'
#clear-backups:
#	# usage: make clear-backups
#	# the command clears all backups
#	@echo "\033[1m Clearing the backups...\033[0m"
#	@bash ./bin/clear-backups;

dump-prod-db:
	# usage: make dump-prod-db
	# the command dumps the production db to the ./_data/db/backup/ folder and fixes the permissions
	@echo "\033[1m1. Dumping production db...\033[0m"
	@bash ./bin/dump-prod-db ${BACKUP};

backups:
	docker-compose -f docker-compose.yaml run --rm database backups

restore-db:
	# usage: make restore-db backup=./_data/db/backup/db__*.sql.gz or make restore-db
	# the command restores the db from the specified backup or from the latest backup
	@echo "\033[1mRestoring local db...\033[0m"
	@bash ./bin/restore-db $(backup);

sync-prod-target:
	# usage: make sync-prod-target target=local   (or target=dev)
	# dumps the production db + media and restores/mirrors them into the target environment
	@echo "\033[1mSyncing production → $(target)...\033[0m"
	@bash ./bin/sync-prod-target $(target);

sync-supabase-local:
	# usage: make sync-supabase-local
	# syncs production Supabase DB and storage to local for gems-labe
	@bash ./bin/sync-supabase-local;

sync-supabase:
	# usage: make sync-supabase target=local|dev|prod [source=prod|local] [flags="--reset --dry-run"]
	# source defaults to "prod" when omitted; source=local is only valid when target=local
	# flags are forwarded verbatim to the migrate_from_supabase management command
	# reads Supabase (source) READ-ONLY and migrates it into the target Django backend
	@bash ./bin/sync-supabase $(target) $(source) $(flags);

sync-agents:
	# usage: make sync-agents
	# the command creates symlinks from main/GENERAL.AGENTS.md to CLAUDE.md and AGENTS.md in the project root
	@echo "\033[1m Creating symlinks for CLAUDE.md and AGENTS.md...\033[0m"
	@ln -sf main/GENERAL.AGENTS.md ../CLAUDE.md
	@ln -sf main/GENERAL.AGENTS.md ../AGENTS.md

erebus:
	# usage: make erebus args  
	# the command runs erebus parser with specified arguments (DEPRECATED - use 'make app' instead)
	@echo "\033[1mRunning erebus parser ...\033[0m"
	@bash ./bin/erebus $(args)
