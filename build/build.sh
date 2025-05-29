SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_FOLDER=$(cd "$SCRIPT_DIR" && cd .. && pwd)

echo "pasta do script: $SCRIPT_DIR"
echo "pasta do projeto: $ROOT_FOLDER"

cd "$ROOT_FOLDER" && \
docker build -t prj3-postgres:latest \
-f "$SCRIPT_DIR"/Dockerfile .
