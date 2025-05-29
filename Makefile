run-db:
	@echo "Iniciando o container do banco de dados..."
	docker compose up -d postgres
	@echo "Aguardando o banco de dados iniciar..."
	@docker exec prj3-database sh -c 'until pg_isready -U usuario; do sleep 1; done'
	@echo "Banco de dados iniciado."

run-down-db:
	@echo "Parando o container do banco de dados..."
	docker compose down postgres
	@echo "Container do banco de dados parado."

restart-db:
	@make run-down-db
	@make run-db

run:
	@./build/build.sh
	docker compose up -d

run-down:
	docker compose down

restart: run-down run

executar-medicao-desempenho:
	@if [ -z "$(PLANO)" ]; then \
		echo "\nExecutando avaliação sem indexação..."; \
		docker exec prj3-python python script.py sem_indexacao; \
	else \
		echo "\nExecutando avaliação com plano $(PLANO)..."; \
		docker exec prj3-python python script.py plano_$(PLANO); \
	fi

aplicar-plano-indexacao:
	@if [ -n "$(PLANO)" ]; then \
		echo "\nAplicando plano de indexação $(PLANO)..."; \
		docker exec prj3-database psql -U usuario -d base-de-dados -f /opt/planos_de_indexacao/plano_$(PLANO).sql; \
	fi

avaliar-desempenho-plano:
	@make restart-db
	@make aplicar-plano-indexacao PLANO=$(PLANO)
	@make executar-medicao-desempenho PLANO=$(PLANO)

avaliar-desempenho:
		@make run # [TODO] Ver se é run ou restart
		@echo "Aguardando a finalização do pip install -r requirements.txt..."
		@docker logs prj3-python | grep -q "Successfully installed" || (echo "Instalação ainda em andamento..."; sleep 5; make avaliar-desempenho)
		# [TODO] Limpar o arquivo de resumo
		@echo "\n=== Iniciando avaliação de desempenho ==="
		@make executar-medicao-desempenho        # sem indexação
		@make avaliar-desempenho-plano PLANO=1   # plano 1
		@make avaliar-desempenho-plano PLANO=2   # plano 2
		@make avaliar-desempenho-plano PLANO=3   # plano 3
		@make avaliar-desempenho-plano PLANO=4   # plano 3
		@echo "\n=== Avaliação de desempenho concluída ==="
		@make run-down
