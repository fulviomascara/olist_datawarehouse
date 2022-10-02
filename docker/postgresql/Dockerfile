# Dockerfile para Imagem PostgreSQL - Banco de Dados Transacional de Origem
# Dados OList

FROM postgres:alpine

# Cria uma pasta chamada files na raiz da imagem
RUN mkdir -p /files

# Copia o arquivo zipado contendo os CSVs para a pasta /files
COPY datasets/olist_files.tar.gz /files

# Muda o Diretório de trabalho para /files
WORKDIR /files

# Executa TAR para descompactar os arquivos na própria pasta /files
RUN tar -xzvf olist_files.tar.gz

# Muda as permissões do arquivo
RUN chmod 755 /files

# Copia o script de criação de database, tabelas e carga para a pasta initdb, que só é executada uma vez
COPY sql_scripts/schema.sql /docker-entrypoint-initdb.d/

# Muda as permissões da pasta
RUN chmod a+r /docker-entrypoint-initdb.d/*