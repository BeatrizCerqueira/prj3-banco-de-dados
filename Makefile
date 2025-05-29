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
	@make run # Garante que os containers estão de pé
	@echo "Aguardando a finalização do pip install -r requirements.txt..."
	@timeout_seconds=180; \
	start_time=$$(date +%s); \
	while ! docker logs prj3-python 2>/dev/null | grep -q "Successfully installed"; do \
		current_time=$$(date +%s); \
		elapsed_time=$$((current_time - start_time)); \
		if [ $$elapsed_time -ge $$timeout_seconds ]; then \
			echo "Timeout: A instalação do pip demorou mais de $$timeout_seconds segundos."; \
			echo "Últimos logs do prj3-python:"; \
			docker logs prj3-python; \
			exit 1; \
		fi; \
		echo "Instalação do pip ainda em andamento ou container prj3-python não pronto para logs... aguardando 5s"; \
		sleep 5; \
		if ! docker ps -q --filter "name=prj3-python" --filter "status=running" | grep -q .; then \
			echo "Erro: Container prj3-python não está em execução. Verifique os logs do Docker."; \
			docker logs prj3-python || echo "Não foi possível obter logs de prj3-python."; \
			exit 1; \
		fi; \
	done
	@echo "Instalação do pip concluída."
	@rm -rf ./avaliacao_de_desempenho/resultados
	@echo "\n=== Iniciando avaliação de desempenho ==="
	@make executar-medicao-desempenho        # sem indexação
	@make avaliar-desempenho-plano PLANO=1   # plano 1
	@make avaliar-desempenho-plano PLANO=2   # plano 2
	@make avaliar-desempenho-plano PLANO=3   # plano 3
	@make avaliar-desempenho-plano PLANO=4   # plano 4
	@echo "\n=== Avaliação de desempenho concluída ==="
	@make run-down

executar-consulta:
	 @if [ -z "$(CONSULTA)" ]; then \
	  echo "Erro: Especifique o número da consulta. Exemplo: make executar-consulta CONSULTA=1"; \
	  exit 1; \
	 fi
	 @NUMERO_FORMATADO=$$(printf "%02d" $(CONSULTA)); \
	 echo "Executando consulta C$${NUMERO_FORMATADO}_* do diretório /opt/consultas/ ..."; \
	 docker exec prj3-database sh -c "psql -U usuario -d base-de-dados -f /opt/consultas/C$${NUMERO_FORMATADO}_*.sql"