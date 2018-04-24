# 1.1 Programação Shell!

> Nenhuma linguagem de programação é perfeita. Não existe sequer uma única melhor linguagem; existem apenas idiomas adequados ou talvez pouco adequados para fins particulares.
>
> --Herbert Mayer

Um conhecimento prático de script de shell é essencial para qualquer pessoa que deseje se tornar razoavelmente proficiente na administração do sistema, mesmo que não tenha a intenção de escrever um script. Considere que, quando uma máquina Linux é inicializada, ela executa os scripts de shell em /etc/rc.d para restaurar a configuração do sistema e configurar os serviços. Uma compreensão detalhada desses scripts de inicialização é importante para analisar o comportamento de um sistema e, possivelmente, modificá-lo.

O ofício de scripting não é difícil de dominar, uma vez que os scripts podem ser construídos em seções de tamanhos pequenos e existe apenas um conjunto relativamente pequeno de operadores e opções específicos de shell [[1]](http://tldp.org/LDP/abs/html/abs-guide.html\#FTN.AEN62) para aprender.A sintaxe é simples - até mesmo austera - semelhante à de invocar e encadear utilitários na linha de comando, e há apenas algumas "regras" que governam seu uso.A maioria dos scripts curtos funciona bem na primeira vez, e depurar até os mais longos é simples.

