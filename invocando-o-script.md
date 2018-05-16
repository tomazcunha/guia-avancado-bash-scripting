# Capítulo 2.1 - Invocando o Script

Tendo escrito o script, você pode invocá-lo por **sh scriptname**, [[1]](http://tldp.org/LDP/abs/html/invoking.html#FTN.AEN300) ou, alternativamente, bash scriptname . (Não é recomendado usar sh \<scriptname , pois isso efetivamente desativa a leitura de stdin dentro do script.) Muito mais conveniente é tornar o script diretamente executável com um chmod .

Ou:

    chmod 555 scriptname (dá permissão de leitura / execução a todos) [2]
ou

    chmod + rx scriptname (dá a todos permissão de leitura / execução)

    chmod u + rx scriptname (fornece apenas a permissão de leitura / execução do proprietário do script)

Tendo feito o script executável, agora você pode testá-lo por ./scriptname . [3] Se começar com uma linha "sha-bang" , invocar o script chama o interpretador de comandos correto para executá-lo.

Como etapa final, após testar e depurar, você provavelmente desejaria movê-lo para / usr / local / bin (como root , é claro), para tornar o script disponível para você e para todos os outros usuários como um executável em todo o sistema. O script poderia então ser invocado simplesmente digitando scriptname [ENTER] na linha de comando.
Notas
[1]

Cuidado: invocar um script Bash por sh scriptname desativa as extensões específicas do Bash, e o script pode falhar na execução.
[2]

Um script precisa ser lido , bem como permissão de execução para ser executado, já que o shell precisa ser capaz de lê-lo.
[3]

Por que não simplesmente invocar o script com scriptname ? Se o diretório em que você está ( $ PWD ) é onde o scriptname está localizado, por que isso não funciona? Isso falha porque, por motivos de segurança, o diretório atual ( ./ ) não é incluído por padrão no $ PATH do usuário. Portanto, é necessário invocar explicitamente o script no diretório atual com um ./scriptname .
