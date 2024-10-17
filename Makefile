BACKUP := 'db__$(shell date +%d.%m.%Y__%H-%M).sql.gz'

#dump-prod-db:
#	$(eval include ../backend/.envs/.prod/.db)
#	$(eval export $(shell sed 's/=.*//' ../backend/.envs/.prod/.db))
#	# usage: make dump-prod-db
#	# the command dumps the production db to the ./_data/db/backup/ folder and fixes the permissions
#	@echo "\033[1m1. Dumping production db...\033[0m"
#	@bash ./bin/dump-prod-db ${BACKUP};
#
#	@echo "\033[1m2. Fixing permissions...\033[0m"
#	@bash ./bin/fix-dump-permission ./_data/db/backup/${BACKUP};
#
#fix-dump-permissions:
#	# usage: make fix-dump-permissions backup=./_data/db/backup/db__*.sql.gz
#	# the command fixes the permissions of the dump file
#	@echo "\033[1mFixing permissions...\033[0m"
#	@bash ./bin/fix-dump-permission $(backup);
#
#restore-local-db:
#	# usage: make restore-local-db backup=./_data/db/backup/db__*.sql.gz or make restore-local-db
#	# the command restores the production db from the specified backup or from the latest backup
#	@echo "\033[1mRestoring local db...\033[0m"
#	@bash ./bin/restore-local-db $(backup);
#
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

#	@echo "\033[1m2. Fixing permissions...\033[0m"
#	@bash ./bin/fix-dump-permission ./_data/gtaapi-db/backup/${GTAAPI_BACKUP};

backups:
	docker-compose -f docker-compose.yaml run --rm database backups

restore-db:
	# usage: make restore-db backup=./_data/db/backup/db__*.sql.gz or make restore-db
	# the command restores the db from the specified backup or from the latest backup
	@echo "\033[1mRestoring local db...\033[0m"
	@bash ./bin/restore-db $(backup);

run-sql:
ifdef file
		$(eval include .dev.env)
		$(eval export $(shell sed 's/=.*//' .dev.env))

		@echo "--> Running sql..."

		docker-compose -f docker-compose.yaml run --rm --no-deps database \
			psql "postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@database:${POSTGRES_PORT}/${POSTGRES_DB}" -a -f file
else
		@echo 'please, pass sql file as an argument!'
endif
