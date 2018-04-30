# Limpar
# Execute como root, claro.
cd /var/log
cat /dev/null > messages
cat /dev/null > wtmp
echo "Arquivos de log limpos."