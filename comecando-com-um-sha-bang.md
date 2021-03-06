# Capítulo 2 - Começando com um Sha-Bang

> A programação do Shell é uma juke box dos anos 50...
>
> --Larry Wall

No caso mais simples, um script nada mais é do que uma lista de comandos do sistema armazenados em um arquivo. No mínimo, isso economiza o esforço de redigitar essa sequência particular de comandos toda vez que é invocada.

<br>
**Exemplo 2-1. limpeza: Um script para limpar arquivos de log em /var/log**

[include](scripts/2.1-limpeza.sh)

<br>
Não há nada incomum aqui, apenas um conjunto de comandos que poderiam facilmente ser invocados um por um a partir da linha de comando no console ou em uma janela de terminal. As vantagens de colocar os comandos em um script vão muito além de não precisar redigitá-las várias vezes. O script se torna um programa - uma _ferramenta_ - e pode ser facilmente modificado ou personalizado para um aplicativo específico.

<br>
**Exemplo 2-2 Limpeza : um script de limpeza aprimorado**

[include](scripts/2.2-limpeza.sh)

<br><br>
**Exemplo 2-3 Limpeza : uma versão aprimorada e generalizada dos scripts acima.**

[include](scripts/2.3-limpeza.sh)

<br>
Como você pode não querer eliminar todo o log do sistema, essa versão do script mantém a última seção do log de mensagens intacta. Você descobrirá constantemente maneiras de ajustar os scripts escritos anteriormente para aumentar a eficácia.


O sha-bang \( \#! \) [\[6\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN205) o cabeçalho do script diz ao seu sistema que este arquivo é um conjunto de comandos a serem alimentados ao interpretador de comandos indicado. O \#! é na verdade um número mágico de dois bytes [\[7\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN214), um marcador especial que designa um tipo de arquivo ou, neste caso, um script de shell executável \(digite **man magic** para obter mais detalhes sobre esse fascinante tópico\). Imediatamente após o sha-bang, vem um nome de caminho. Este é o caminho para o programa que interpreta os comandos no script, seja um shell, uma linguagem de programação ou um utilitário. Este interpretador de comandos executa os comandos no script, começando no topo \(a linha que segue a linha sha-bang \) e ignorando os comentários. [\[8\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN226)

```bash
#!/bin/sh
#!/bin/bash
#!/usr/bin/perl
#!/usr/bin/tcl
#!/bin/sed -f
#!/bin/awk -f
```

Cada uma das linhas de cabeçalho, do script acima, chama um interpretador de comandos diferente, seja ele /bin/sh, o shell padrão \(**bash** em um sistema Linux\) ou outro. [\[9\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN242) Usando o Bourne shell **\#!/bin/sh**, que é o padrão na maioria das variantes comerciais do UNIX, torna o script [portável](http://tldp.org/LDP/abs/html/abs-guide.html#PORTABILITYISSUES) para máquinas não Linux, embora você [sacrifique recursos específicos do Bash](http://tldp.org/LDP/abs/html/abs-guide.html#BINSH). O script, no entanto, estará em conformidade com o padrão POSIX [\[10\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN256) **sh** .

Note que o caminho dado no "sha-bang" deve estar correto, caso contrário, uma mensagem de erro - geralmente "Comando não encontrado". - será o único resultado da execução do script. [\[11\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN269)

**\#!** pode ser omitido se o script consistir apenas em um conjunto de comandos genéricos do sistema, sem usar diretivas de shell internas. O segundo exemplo, acima, requer o inicial **\#!**, uma vez que a linha de atribuição de variáveis, **linhas = 50**, usa uma construção específica do shell. [\[12\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN279) Note novamente que **\#!/bin/sh** invoca o interpretador de shell padrão, cujo padrão é /bin/bash em uma máquina Linux.

![](http://tldp.org/LDP/abs/images/tip.gif "Gorjeta") Este tutorial incentiva uma abordagem modular para a construção de um script. Anote e colete os snippets de código "clichê" que podem ser úteis em futuros scripts. Eventualmente, você construirá uma extensa biblioteca de rotinas bacanas. Como exemplo, o prólogo de script a seguir testa se o script foi chamado com o número correto de parâmetros.

[include](scripts/2.4-nparam.sh)

<br>
Muitas vezes, você escreve um script que executa uma tarefa específica. O primeiro script deste capítulo é um exemplo. Posteriormente, pode ocorrer a generalização do script para outras tarefas semelhantes. Substituir as constantes literais \("hard-wired"\) por variáveis ​​é um passo nessa direção, pois está substituindo blocos de código repetitivos por [funções](http://tldp.org/LDP/abs/html/abs-guide.html#FUNCTIONREF) .
