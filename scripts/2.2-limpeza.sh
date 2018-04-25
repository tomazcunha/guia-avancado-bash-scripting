#!/bin/bash
# Cabeçalho adequado para um script Bash.

# Limpeza, versão 2

# Corra como root, claro.
# Insira o código aqui para imprimir a mensagem de erro e saia se não for root.

LOG_DIR=/var/log
# As variáveis ​​são melhores que os valores codificados.
cd $LOG_DIR

cat /dev/null > messages
cat /dev/null > wtmp

echo "Logs limpos".

exit # O método correto e adequado de "sair" de um script.
     # Uma "saída" nua (sem parâmetro) retorna o status de saída
     # + do comando anterior.