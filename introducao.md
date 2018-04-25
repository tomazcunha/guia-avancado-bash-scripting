# 1 Introdução

> _Script: uma escrita; um documento escrito.\[Obs.\]_
>
> * _Dicionário de Webster, 1913 ed._

O shell é um interpretador de comandos. Mais do que apenas a camada de isolamento entre o kernel do sistema operacional e o usuário, também é uma linguagem de programação bastante poderosa. Um programa shell, chamado de script, é uma ferramenta fácil de usar para criar aplicativos "colando" chamadas de sistema, ferramentas, utilitários e binários compilados. Praticamente todo o repertório de comandos, utilitários e ferramentas do UNIX está disponível para invocação por um script de shell. Se isso não bastasse, os comandos internos do shell, como testes e construções de loop, fornecem mais poder e flexibilidade aos scripts. Scripts Shell são especialmente adequados para tarefas administrativas do sistema e outras tarefas rotineiras e repetitivas que não requerem os sinos e assobios de uma linguagem de programação totalmente estruturada.

# 1.1 Programação Shell!

> Nenhuma linguagem de programação é perfeita. Não existe sequer uma única melhor linguagem; existem apenas idiomas adequados ou talvez pouco adequados para fins particulares.
>
> --Herbert Mayer



Um conhecimento prático de scripts shell é essencial para qualquer pessoa que deseje se tornar razoavelmente proficiente na administração do sistema, mesmo que não tenha a intenção de escrever um script. Considere que, quando uma máquina Linux é inicializada, ela executa os scripts shell em /etc/rc.d para restaurar a configuração do sistema e configurar os serviços. Uma compreensão detalhada desses scripts de inicialização é importante para analisar o comportamento de um sistema e, possivelmente, modificá-lo.

O ofício de escrever scripts não é difícil de dominar, uma vez que os scripts podem ser construídos em seções de tamanhos pequenos e existe apenas um conjunto relativamente pequeno de operadores e opções específicos de shell [\[1\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN62) para aprender.A sintaxe é simples - até mesmo austera - semelhante à de invocar e encadear utilitários na linha de comando, e há apenas algumas "regras" que governam seu uso. A maioria dos scripts curtos funciona bem na primeira vez, e depurar até os mais longos é simples.



> Nos primórdios da computação pessoal, a linguagem BASIC permitia qualquer pessoa razoavelmente proficiente em computação, pudesse escrever programas nas primeiras gerações de microcomputadores. Décadas depois, a linguagem de script Bash permite que qualquer pessoa com um conhecimento rudimentar de Linux ou UNIX, faça o mesmo em máquinas modernas.
>
> Agora temos computadores miniaturizados de placa única com incrível capacidades, como o [Raspberry Pi](http://www.raspberrypi.org/). O script Bash fornece uma maneira de explorar os recursos desses dispositivos fascinantes.



Um shell script é um método rápido e sujo de prototipar um aplicativo complexo. Obter até mesmo um subconjunto limitado de funcionalidades para trabalhar em um script geralmente é um primeiro estágio útil no desenvolvimento de projetos. Dessa forma, a estrutura do aplicativo pode ser testada e ajustada e as principais armadilhas encontradas antes de prosseguir para a codificação final em C , C ++ , Java , [Perl](http://tldp.org/LDP/abs/html/abs-guide.html#PERLREF) ou Python .

O script Shell remete à filosofia clássica do UNIX de dividir projetos complexos em subtarefas mais simples, de encadear componentes e utilitários.Muitos consideram isso uma abordagem melhor ou, pelo menos, mais esteticamente agradável para a solução de problemas do que usar uma das novas linguagens multifuncionais de alta potência, como o Perl , que tenta ser tudo para todas as pessoas, mas o custo de forçar você a alterar seus processos de raciocínio para se adequar à ferramenta.

De acordo com [Herbert Mayer](http://tldp.org/LDP/abs/html/abs-guide.html#MAYERREF) , "uma linguagem útil precisa de matrizes, ponteiros e um mecanismo genérico para construir estruturas de dados".Por esses critérios, o shell script fica um pouco aquém de ser "útil".Ou talvez não....



Quando não usar scripts de shell

* Tarefas intensivas em recursos, especialmente onde a velocidade é um fator \(classificação, hashing, recursão [\[2\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN87) ...\)Procedimentos envolvendo operações matemáticas resistentes, especialmente aritmética de ponto flutuante, cálculos de precisão arbitrária ou números complexos \(use C ++ ou FORTRAN \)Portabilidade entre plataformas necessária \(use C ou Java \)Aplicações complexas, onde a programação estruturada é uma necessidade \(verificação de tipo de variáveis, protótipos de funções, etc.\)Aplicativos de missão crítica nos quais você está apostando o futuro da empresaSituações em que a _segurança_ é importante, onde você precisa garantir a integridade do sistema e proteger contra invasões, rachaduras e vandalismoProjeto consiste em subcomponentes com dependências interligadasExtensas operações de arquivo necessárias \(o Bash é limitado ao acesso a arquivos seriais, e isso apenas de maneira particularmente desajeitada e ineficiente linha por linha\).Precisa de suporte nativo para matrizes multidimensionaisPrecisa de estruturas de dados, como listas vinculadas ou árvoresPrecisa gerar / manipular gráficos ou GUIsPrecisa de acesso direto ao hardware do sistema ou periféricos externosPrecisa de porta ou [soquete](http://tldp.org/LDP/abs/html/abs-guide.html#SOCKETREF) I / OPrecisa usar bibliotecas ou fazer interface com código legadoAplicações proprietárias de código fechado \(os scripts da Shell colocam o código-fonte em aberto para todo o mundo ver\).Se alguma das situações acima se aplica, considere uma linguagem de script mais poderosa - talvez Perl , Tcl , Python , Ruby - ou possivelmente uma linguagem compilada como C , C ++ ou Java .Mesmo assim, a criação de protótipos do aplicativo como um script de shell ainda pode ser uma etapa de desenvolvimento útil.

Nós estaremos usando Bash , um acrônimo [\[3\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN139) para "Bourne-Again shell" e um trocadilho com o agora clássico Bourne shell de Stephen Bourne.O Bash se tornou um padrão de fato para scripts de shell na maioria dos sabores do UNIX.A maioria dos princípios que este livro cobre se aplica igualmente a scripts com outros shells, como o Korn Shell , do qual o Bash deriva algumas de suas características, [\[4\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN147) e o C Shell e suas variantes.\(Note que a programação C Shell não é recomendada devido a certos problemas inerentes, como apontado em um [post Usenet de](http://www.faqs.org/faqs/unix-faq/shell/csh-whynot/) outubro de 1993 por Tom Christiansen.\)

O que segue é um tutorial sobre scripts de shell.Ele depende muito de exemplos para ilustrar vários recursos do shell.Os scripts de exemplo funcionam - eles foram testados, na medida do possível - e alguns deles são úteis na vida real.O leitor pode brincar com o código de trabalho real dos exemplos no arquivo de origem \( scriptname.sh ou scriptname.bash \), [\[5\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN157) dar permissão de execução \( **chmod u + rx scriptname** \), depois executá-los para ver o que acontece.Se o [arquivo de origem](http://bash.deta.in/abs-guide-latest.tar.bz2) não estiver disponível, recorte e cole nas versões em [HTML](http://www.tldp.org/LDP/abs/abs-guide.html.tar.gz) ou em [PDF](http://bash.deta.in/abs-guide.pdf) .Esteja ciente de que alguns dos scripts apresentados aqui introduzem recursos antes de serem explicados, e isso pode exigir que o leitor pule temporariamente para a iluminação.

Salvo indicação em contrário, [o autor](mailto:thegrendel.abs@gmail.com) deste livro escreveu os scripts de exemplo a seguir.

|  | Seu semblante era ousado e bateu não.--Edmund Spenser |
| :--- | :--- |




