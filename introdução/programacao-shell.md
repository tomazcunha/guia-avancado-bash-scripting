# 1.1 Programação Shell!

> Nenhuma linguagem de programação é perfeita. Não existe sequer uma única melhor linguagem; existem apenas idiomas adequados ou talvez pouco adequados para fins particulares.
>
> --Herbert Mayer

Um conhecimento prático de scripts shell é essencial para qualquer pessoa que deseje se tornar razoavelmente proficiente na administração do sistema, mesmo que não tenha a intenção de escrever um script. Considere que, quando uma máquina Linux é inicializada, ela executa os scripts shell em /etc/rc.d para restaurar a configuração do sistema e configurar os serviços. Uma compreensão detalhada desses scripts de inicialização é importante para analisar o comportamento de um sistema e, possivelmente, modificá-lo.

O ofício de escrever scripts não é difícil de dominar, uma vez que os scripts podem ser construídos em seções de tamanhos pequenos e existe apenas um conjunto relativamente pequeno de operadores e opções específicos de shell [\[1\]](http://tldp.org/LDP/abs/html/abs-guide.html#FTN.AEN62) para aprender.A sintaxe é simples - até mesmo austera - semelhante à de invocar e encadear utilitários na linha de comando, e há apenas algumas "regras" que governam seu uso. A maioria dos scripts curtos funciona bem na primeira vez, e depurar até os mais longos é simples.

> Nos primórdios da computação pessoal, a linguagem BASIC permitia qualquer pessoa razoavelmente proficiente em computação para escrever programas em um início geração de microcomputadores. Décadas depois, a linguagem de script Bash permite que qualquer pessoa com um conhecimento rudimentar de Linux ou UNIX para fazer o mesmo em máquinas modernas.
>
> Nós agora temos computadores miniaturizados de placa única com incrível capacidades, como o [Raspberry Pi](https://translate.googleusercontent.com/translate_c?depth=1&hl=pt-BR&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=pt-BR&u=http://www.raspberrypi.org/&xid=17259,15700022,15700124,15700149,15700168,15700173,15700186,15700201&usg=ALkJrhjeKLY3hZbQu_KIRTg_YthA7d4vJQ). O script Bash fornece uma maneira de explorar os recursos desses dispositivos fascinantes.



