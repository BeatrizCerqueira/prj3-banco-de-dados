run-db:
	@./build/build.sh
	docker compose up -d

run-down:
	docker compose down

restart: run-down run-db
