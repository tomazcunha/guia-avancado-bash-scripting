# Capítulo 2.1 - Invocando o Script

Tendo escrito o script, você pode invocá-lo com o comando **sh nomedoscript**, [[1]](http://tldp.org/LDP/abs/html/invoking.html#FTN.AEN300) ou, alternativamente, **bash nomedoscript**. (Não é recomendado usar **sh <nomedoscript**, pois isso efetivamente desativa a leitura de stdin dentro do script.) Muito mais conveniente é tornar o script diretamente executável com um chmod.

Dessa forma [[2]](http://tldp.org/LDP/abs/html/invoking.html#FTN.AEN315):
```bash
chmod 555 nomedoscript  # dá permissão de leitura/execução a todos
```

ou:

```bash
chmod +rx nomedoscript  # dá a todos permissão de leitura/execução
```

```bash
chmod u+rx nomedoscript  # fornece apenas a permissão de leitura/execução do proprietário do script
```


Tendo feito o script executável, agora você pode testá-lo com o comando **./nomedoscript**. [[3]](http://tldp.org/LDP/abs/html/invoking.html#FTN.AEN327) Se começar com uma linha "sha-bang", ao invocar o script, chama o interpretador de comandos correto para executá-lo.

Como etapa final, após testar e depurar, você provavelmente desejaria movê-lo para _/usr/local/bin_ (como root, é claro), para tornar o script disponível para você e para todos os outros usuários como um executável em todo o sistema. O script poderia então ser invocado simplesmente digitando **nomedoscript \[ENTER\]** na linha de comando.
Notas

[[1]](http://tldp.org/LDP/abs/html/invoking.html#AEN300) Cuidado: invocar um script Bash com **sh nomedoscript** desativa as extensões específicas do Bash, e o script pode falhar na execução.

[[2]](http://tldp.org/LDP/abs/html/invoking.html#AEN315) Um script precisa ser lido, bem como possuir permissão de execução para ser executado, já que o shell precisa ser capaz de lê-lo.

[[3]](http://tldp.org/LDP/abs/html/invoking.html#AEN327) Por que não simplesmente invocar o script só com **nomedoscript**? Se o diretório em que você está [($PWD)](http://tldp.org/LDP/abs/html/internalvariables.html#PWDREF) é onde o **nomedoscript** está localizado, por que isso não funciona? Isso falha porque, por motivos de segurança, o diretório atual (./) não é incluído por padrão no [$PATH](http://tldp.org/LDP/abs/html/internalvariables.html#PATHREF) do usuário. Portanto, é necessário invocar explicitamente o script no diretório atual com um **./nomedoscript**.
