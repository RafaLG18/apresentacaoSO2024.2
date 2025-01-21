#####
# Script para verificar próxima porta livre a partir da porta 8080
# e executar o container, expondo a próxima porta encontrada.
#####

# Define a porta inicial para verificar
PORTA_INICIAL=8080

# Lista as portas em uso
PORTAS_EM_USO=$(ss -tuln | awk 'NR>1 {split($5, addr, ":"); print addr[length(addr)]}' | sort -nu)

# Encontra a próxima porta disponível
PORTA=$PORTA_INICIAL
while echo "$PORTAS_EM_USO" | grep -q "^$PORTA$"; do
  PORTA=$((PORTA + 1))
done

# Exibe a próxima porta disponível
echo "A próxima porta disponível após $PORTA_INICIAL é: $PORTA"
docker run -p $PORTA:80 -it alpine:latest sh

