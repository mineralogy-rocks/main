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

erebus:
	# usage: make erebus args  
	# the command runs erebus parser with specified arguments (DEPRECATED - use 'make app' instead)
	@echo "\033[1mRunning erebus parser ...\033[0m"
	@bash ./bin/erebus $(args)
