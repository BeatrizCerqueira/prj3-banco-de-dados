run-db:
	@./build/build.sh
	docker compose up -d

run-down:
	docker compose down

restart: run-down run-db

aplicar-plano-indexacao:
	@if [ -n "$(PLANO)" ]; then \
		echo "\nAplicando plano de indexação $(PLANO)..."; \
		docker exec prj3-database psql -U usuario -d base-de-dados -f /docker-entrypoint-initdb.d/planos_de_indexacao/plano_$(PLANO).sql; \
	fi

executar-medicao-desempenho:
	@if [ -z "$(PLANO)" ]; then \
		echo "\nExecutando avaliação sem indexação..."; \
		docker exec prj3-python python measure_performance.py sem_indexacao; \
	else \
		echo "\nExecutando avaliação com plano $(PLANO)..."; \
		docker exec prj3-python python measure_performance.py plano_$(PLANO); \
	fi

avaliar-desempenho-plano:
	@make restart
	@make aplicar-plano-indexacao PLANO=$(PLANO)
	@make executar-medicao-desempenho PLANO=$(PLANO)

avaliar-desempenho:
	@make run-db
	# [TODO] Limpar o arquivo de resumo
	@echo "\n=== Iniciando avaliação de desempenho ==="
	@make executar-medicao-desempenho
	@make avaliar-desempenho-plano PLANO=1
	@make avaliar-desempenho-plano PLANO=2
	@make avaliar-desempenho-plano PLANO=3
	@echo "\n=== Avaliação de desempenho concluída ==="
	@make run-down
