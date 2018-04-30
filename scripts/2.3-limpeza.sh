#!/bin/bash
# Limpeza, versão 3

# Atenção:
# -------
# Este script usa um grande número de recursos que serão explicados
# + mais tarde.
# Quando você terminar a primeira metade do livro,
# + não deve haver nada misterioso sobre isso.



LOG_DIR=/var/log
ROOT_UID=0     # Somente usuários com $UID 0 possuem privilégios de root.
LINES=50       # Número padrão de linhas salvas.
E_XCD=86       # Não é possível alterar o diretório?
E_NOTROOT=87   # Erro de saída Non-root.


# Execute como root, claro.
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Deve ser root para executar este script."
  exit $E_NOTROOT
fi  

if [ -n "$1" ]
# Testar se o argumento da linha de comando está presente (não vazio).
then
  lines=$1
else  
  lines=$LINES # Padrão, se não for especificado na linha de comando.
fi  


#  Stephane Chazelas sugere o seguinte,
#+ como uma maneira melhor de verificar os argumentos da linha de comando,
#+ mas isso ainda é um pouco avançado para este estágio do tutorial.
#
#    E_WRONGARGS=85  # Argumento não numérico (formato de argumento inválido).
#
#    case "$1" in
#    ""      ) lines=50;;
#    *[!0-9]*) echo "Uso: `basename $0` linhas para limpeza";
#     exit $E_WRONGARGS;;
#    *       ) lines=$1;;
#    esac
#
#* Pule para o capítulo "Loops" para decifrar tudo isso.


cd $LOG_DIR

if [ `pwd` != "$LOG_DIR" ]  # ou   if [ "$PWD" != "$LOG_DIR" ]
                            # Não está em /var/log?
then
  echo "Não é possível alterar para $LOG_DIR."
  exit $E_XCD
fi  # Dupla verificação se está no diretório correto antes de mexer no arquivo de log.

# Este é muito mais eficiente:
#
# cd /var/log || {
#   echo "Não é possível mudar para o diretório necessário." >&2
#   exit $E_XCD;
# }




tail -n $lines messages > mesg.temp # Salva a última seção do arquivo de registro de mensagens.
mv mesg.temp messages               # Renomeia como arquivo de log do sistema.


#  cat /dev/null > messages
#* Não é mais necessário, pois o método acima é mais seguro.

cat /dev/null > wtmp  #  ': > wtmp' and '> wtmp'  têm o mesmo efeito.
echo "Arquivos de log limpos."
#  Note que existem outros arquivos de log em /var/log não afetados
#+ por este script.

exit 0
#  Um valor de retorno zero do script na saída indica sucesso
#+ para o shell.