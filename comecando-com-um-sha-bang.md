# 1.2 Começando com um Sha-Bang

> A programação do Shell é uma juke box dos anos 50...
>
> --Larry Wall

No caso mais simples, um script nada mais é do que uma lista de comandos do sistema armazenados em um arquivo. No mínimo, isso economiza o esforço de redigitar essa sequência particular de comandos toda vez que é invocada.

**Exemplo 2-1. limpeza: Um script para limpar arquivos de log em /var/log**

```bash
# Limpar
# Execute como root, claro.
cd /var/log
cat /dev/null > messages
cat /dev/null > wtmp
echo "Arquivos de log limpos."
```


Não há nada incomum aqui, apenas um conjunto de comandos que poderiam facilmente ser invocados um por um a partir da linha de comando no console ou em uma janela de terminal. As vantagens de colocar os comandos em um script vão muito além de não precisar redigitá-las várias vezes. O script se torna um programa - uma _ferramenta_ - e pode ser facilmente modificado ou personalizado para um aplicativo específico.

**Exemplo 2-2 limpeza : um script de limpeza aprimorado**

```bash
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
```


[include](scripts/2.2-limpeza.sh)

**Exemplo 2-3limpeza : uma versão aprimorada e generalizada dos scripts acima.**

| \#! / bin / bash \# Limpeza, versão 3 \# Atenção: \# ------- \# Este script usa um grande número de recursos que serão explicados \# + mais tarde. \# Quando você terminar a primeira metade do livro, \# + não deve haver nada misterioso sobre isso. LOG\_DIR = / var / log ROOT\_UID = 0 \# Somente usuários com $ UID 0 possuem privilégios de root. LINES = 50 \# Número padrão de linhas salvas. E\_XCD = 86 \# Não é possível alterar o diretório? E\_NOTROOT = 87 \# Erro de saída não raiz. \# Corra como root, claro. if \["$ UID" -ne "$ ROOT\_UID"\] então echo "Deve ser root para executar este script." sair $ E\_NOTROOT fi if \[-n "$ 1"\] \# Testar se o argumento da linha de comando está presente \(não vazio\). então linhas = $ 1 outro linhas = $ LINES \# Padrão, se não for especificado na linha de comando. fi \# Stephane Chazelas sugere o seguinte, \# + como uma maneira melhor de verificar os argumentos da linha de comando, \# + mas isso ainda é um pouco avançado para este estágio do tutorial. \# \# E\_WRONGARGS = 85 \# Argumento não numérico \(formato de argumento inválido\). \# \# case "$ 1" in \# ""\) linhas = 50 ;; \# \* \[! 0-9\] \*\) echo "Uso:\` basename $ 0\` linhas para limpeza "; \# exit $ E\_WRONGARGS ;; \# \*\) linhas = $ 1 ;; \# esac \# \# \* Pule para o capítulo "Loops" para decifrar tudo isso. cd $ LOG\_DIR if \[\`pwd\`! =" $ LOG\_DIR "\] \# ou se \[" $ PWD "! =" $ LOG\_DIR "\] \# Não está em / var / log? então echo "Não é possível alterar para $ LOG\_DIR." sair $ E\_XCD fi \# Doublecheck if no diretório correto antes de mexer no arquivo de log. \# Muito mais eficiente é: \# \# cd / var / log \|\| { \# echo "Não é possível mudar para o diretório necessário."&gt;& 2 \# exit $ E\_XCD; \#} tail -n $ lines messages&gt; mesg.temp \# Salva a última seção do arquivo de registro de mensagens. mv mesg.temp messages \# Renomeia como arquivo de log do sistema. \# cat / dev / null&gt; messages \# \* Não é mais necessário, pois o método acima é mais seguro. cat / dev / null&gt; wtmp \# ':&gt; wtmp' e '&gt; wtmp' têm o mesmo efeito. echo "Arquivos de log limpos." \# Note que existem outros arquivos de log em / var / log não afetados \# + por este script. sair 0 \# Um valor de retorno zero do script na saída indica sucesso \# + para o shell. |
| :--- |


Como você pode não querer eliminar todo o log do sistema, essa versão do script mantém a última seção do log de mensagens intacta.Você descobrirá constantemente maneiras de ajustar os scripts escritos anteriormente para aumentar a eficácia.

\* \* \*

O sha-bang \( \#! \) [\[6\]](https://translate.googleusercontent.com/translate_c?depth=1&hl=pt-BR&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=pt-BR&u=http://tldp.org/LDP/abs/html/abs-guide.html&xid=17259,15700022,15700124,15700149,15700168,15700173,15700186,15700201&usg=ALkJrhj5lJ2g4Z3cLQUtenDTXITEeeXkXQ#FTN.AEN205) na cabeça de um script diz ao seu sistema que este arquivo é um conjunto de comandos a serem alimentados ao interpretador de comandos indicado.O \#!é na verdade um número mágico de dois bytes [\[7\]](https://translate.googleusercontent.com/translate_c?depth=1&hl=pt-BR&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=pt-BR&u=http://tldp.org/LDP/abs/html/abs-guide.html&xid=17259,15700022,15700124,15700149,15700168,15700173,15700186,15700201&usg=ALkJrhj5lJ2g4Z3cLQUtenDTXITEeeXkXQ#FTN.AEN214) , um marcador especial que designa um tipo de arquivo ou, neste caso, um script de shell executável \(digite **man magic** para obter mais detalhes sobre esse fascinante tópico\).Imediatamente após o sha-bang é um nome de caminho .Este é o caminho para o programa que interpreta os comandos no script, seja um shell, uma linguagem de programação ou um utilitário.Este interpretador de comandos executa os comandos no script, começando no topo \(a linha que segue a linha sha-bang \) e ignorando os comentários.[\[8\]](https://translate.googleusercontent.com/translate_c?depth=1&hl=pt-BR&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=pt-BR&u=http://tldp.org/LDP/abs/html/abs-guide.html&xid=17259,15700022,15700124,15700149,15700168,15700173,15700186,15700201&usg=ALkJrhj5lJ2g4Z3cLQUtenDTXITEeeXkXQ#FTN.AEN226)

\#! / bin / sh \#! / bin / bash \#! / usr / bin / perl \#! / usr / bin / tcl \#! / bin / sed -f \#! / bin / awk -f

Cada uma das linhas de cabeçalho do script acima chama um interpretador de comandos diferente, seja ele / bin / sh , o shell padrão \( **bash** em um sistema Linux\) ou outro.[\[9\]](https://translate.googleusercontent.com/translate_c?depth=1&hl=pt-BR&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=pt-BR&u=http://tldp.org/LDP/abs/html/abs-guide.html&xid=17259,15700022,15700124,15700149,15700168,15700173,15700186,15700201&usg=ALkJrhj5lJ2g4Z3cLQUtenDTXITEeeXkXQ#FTN.AEN242) Usando **\#! / Bin / sh** , o shell Bourne padrão na maioria das variantes comerciais do UNIX, torna o script [portável](https://translate.googleusercontent.com/translate_c?depth=1&hl=pt-BR&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=pt-BR&u=http://tldp.org/LDP/abs/html/abs-guide.html&xid=17259,15700022,15700124,15700149,15700168,15700173,15700186,15700201&usg=ALkJrhj5lJ2g4Z3cLQUtenDTXITEeeXkXQ#PORTABILITYISSUES) para máquinas não Linux, embora você [sacrifique recursos específicos do Bash](https://translate.googleusercontent.com/translate_c?depth=1&hl=pt-BR&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=pt-BR&u=http://tldp.org/LDP/abs/html/abs-guide.html&xid=17259,15700022,15700124,15700149,15700168,15700173,15700186,15700201&usg=ALkJrhj5lJ2g4Z3cLQUtenDTXITEeeXkXQ#BINSH) .O script, no entanto, estará em conformidade com o padrão POSIX[\[10\]](https://translate.googleusercontent.com/translate_c?depth=1&hl=pt-BR&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=pt-BR&u=http://tldp.org/LDP/abs/html/abs-guide.html&xid=17259,15700022,15700124,15700149,15700168,15700173,15700186,15700201&usg=ALkJrhj5lJ2g4Z3cLQUtenDTXITEeeXkXQ#FTN.AEN256)**sh** .

Note que o caminho dado no "sha-bang" deve estar correto, caso contrário, uma mensagem de erro - geralmente "Comando não encontrado".- será o único resultado da execução do script.[\[11\]](https://translate.googleusercontent.com/translate_c?depth=1&hl=pt-BR&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=pt-BR&u=http://tldp.org/LDP/abs/html/abs-guide.html&xid=17259,15700022,15700124,15700149,15700168,15700173,15700186,15700201&usg=ALkJrhj5lJ2g4Z3cLQUtenDTXITEeeXkXQ#FTN.AEN269)

\#!pode ser omitido se o script consistir apenas em um conjunto de comandos genéricos do sistema, sem usar diretivas de shell internas.O segundo exemplo, acima, requer o \# inicial !, uma vez que a linha de atribuição de variáveis, **linhas = 50** , usa uma construção específica do shell.[\[12\]](https://translate.googleusercontent.com/translate_c?depth=1&hl=pt-BR&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=pt-BR&u=http://tldp.org/LDP/abs/html/abs-guide.html&xid=17259,15700022,15700124,15700149,15700168,15700173,15700186,15700201&usg=ALkJrhj5lJ2g4Z3cLQUtenDTXITEeeXkXQ#FTN.AEN279) Note novamente que **\#! / Bin / sh** invoca o interpretador de shell padrão, cujo padrão é / bin / bash em uma máquina Linux.

| ![](http://tldp.org/LDP/abs/images/tip.gif "Gorjeta") | Este tutorial incentiva uma abordagem modular para a construção de um script.Anote e colete os snippets de código "boilerplate" que podem ser úteis em futuros scripts.Eventualmente, você construirá uma extensa biblioteca de rotinas bacanas.Como exemplo, o prólogo de script a seguir testa se o script foi chamado com o número correto de parâmetros. E\_WRONG\_ARGS = 85 script\_parameters = "- a -h -m -z" \# -a = all, -h = help, etc. if \[$ \# -ne $ Number\_of\_expected\_args\] então echo "Uso:\` basename $ 0\` $ script\_parameters " \# \`basename $ 0\` é o nome do arquivo do script. sair de $ E\_WRONG\_ARGS fiMuitas vezes, você escreve um script que executa uma tarefa específica.O primeiro script deste capítulo é um exemplo.Posteriormente, pode ocorrer a generalização do script para outras tarefas semelhantes.Substituir as constantes literais \( "hard-wired" \) por variáveis ​​é um passo nessa direção, pois está substituindo blocos de código repetitivos por [funções](https://translate.googleusercontent.com/translate_c?depth=1&hl=pt-BR&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=pt-BR&u=http://tldp.org/LDP/abs/html/abs-guide.html&xid=17259,15700022,15700124,15700149,15700168,15700173,15700186,15700201&usg=ALkJrhj5lJ2g4Z3cLQUtenDTXITEeeXkXQ#FUNCTIONREF) . |
| :--- | :--- |




