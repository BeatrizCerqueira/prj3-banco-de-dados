FROM postgres:15.6

ENV POSTGRES_USER=usuario
ENV POSTGRES_DB=base-de-dados
ENV POSTGRES_HOST_AUTH_METHOD=trust

COPY ../sql/tabelas/* /docker-entrypoint-initdb.d/
COPY ../sql/seeds/* /docker-entrypoint-initdb.d/

# [TODO] Passar as queries para dentro sem executá-las
# COPY ../sql/consultas/* /docker-entrypoint-initdb.d/