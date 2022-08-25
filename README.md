# LMHT

Especificação da Linguagem de Marcação Hiper Texto, LMHT.

LMHT nada mais é do que HTML em português, usando um arquivo de transformação XSL para mudar nomes de _tags_ e atributos.

Por exemplo:

```xml
<lmht>
    <corpo>
        <titulo1>Isso é um título</titulo1>
        <p classe="minha-classe">Isto é um parágrafo.</p>
        <lista-simples>
            <item-lista>Itens podem ser adicionados usando a estrutura item-lista.</item-lista>
            <item-lista>Cada item da lista é transformado em um item li do HTML.</item-lista>
            <item-lista>Não apenas estrutura são modificadas, como também seus atributos.</item-lista>
        </lista-simples>
    </corpo>
</lmht>
```

Gera o equivalente em HTML:

```html
<html>
    <body>
        <h1>Isso é um título</h1>
        <p class="minha-classe">Isto é um parágrafo.</p>
        <ul>
            <li>Itens podem ser adicionados usando a estrutura item-lista.</li>
            <li>Cada item da lista é transformado em um item li do HTML.</li>
            <li>Não apenas estrutura são modificadas, como também seus atributos.</li>
        </ul>
    </body>
</html>
```

Para testar a transformação XSL, use: 

- [https://www.freeformatter.com/xsl-transformer.html](https://www.freeformatter.com/xsl-transformer.html).

Por ser independente de linguagem, todos os arquivos de especificações podem ser usados com qualquer biblioteca de qualquer linguagem que implemente XSLT 2.0 ou superior.

Há também um arquivo XSD para validação de arquivos na extensão `.lmht`. 

Para testar a validação, use:

- [https://www.liquid-technologies.com/online-xsd-validator](https://www.liquid-technologies.com/online-xsd-validator).

## Limitações

LMHT transforma para HTML5. _Tags_ não compatíveis, que existam apenas em HTML4, não possuem uma estrutura correspondente em LMHT. 

Valores de atributos ainda não são traduzidos. Problema será contemplado em uma segunda fase do projeto. 

## Mapeamentos entre estruturas LMHT e _tags_ HTML

Mais detalhes sobre as estruturas podem ser encontrados [na nossa Wiki](https://github.com/DesignLiquido/LMHT/wiki).

| LMHT                                                                                                          | HTML       |
| ------------------------------------------------------------------------------------------------------------- | ---------- |
| [abreviacao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22abrevia%C3%A7%C3%A3o%22)                 | abbr       |
| [abreviação](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22abrevia%C3%A7%C3%A3o%22)                 | abbr       |
| [aparte](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22aparte%22)                                   | aside      |
| [area](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22%C3%A1rea%22)                                  | area       |
| [área](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22%C3%A1rea%22)                                  | area       |
| [area-texto](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22%C3%A1rea-texto%22)                      | textarea   |
| [área-texto](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22%C3%A1rea-texto%22)                      | textarea   |
| [artigo](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22artigo%22)                                   | article    |
| [aspas](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22aspas%22)                                     | q          |
| audio                      | audio      |
| áudio                      | audio      |
| [botao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22bot%C3%A3o%22)                                | button     |
| [botão](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22bot%C3%A3o%22)                                | button     |
| [cabeca](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22cabe%C3%A7a%22)                              | head       |
| [cabeça](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22cabe%C3%A7a%22)                              | head       |
| cabeca-tabela              | head       |
| cabeça-tabela              | head       |
| [campo](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22campo%22)                                     | input      |
| campos                     | fieldset   |
| canvas                     | canvas     |
| [celula](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22c%C3%A9lula%22)                              | td         |
| [célula](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22c%C3%A9lula%22)                              | td         |
| [citacao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22cita%C3%A7%C3%A3o%22)                       | blockquote |
| [citação](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22cita%C3%A7%C3%A3o%22)                       | blockquote |
| citar                      | cite       |
| codigo                     | code       |
| código                     | code       |
| coluna                     | col        |
| corpo                      | body       |
| corpo-tabela               | tbody      |
| definicao                  | dfn        |
| definiçao                  | dfn        |
| definição                  | dfn        |
| detalhes                   | details    |
| divisao                    | div        |
| divisão                    | div        |
| endereco                   | address    |
| endereço                   | address    |
| envelope-texto             | span       |
| etiqueta                   | label      |
| excluido                   | del        |
| excluído                   | del        |
| exemplo                    | samp       |
| formulario                 | form       |
| formulário                 | form       |
| grupo-colunas              | colgroup   |
| grupo-opcoes               | optgroup   |
| grupo-opçoes               | optgroup   |
| grupo-opções               | optgroup   |
| [imagem](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22imagem%22)                               | img        |
| inserido                   | ins        |
| invisivel                  | template   |
| invisível                  | template   |
| italico                    | em         |
| itálico                    | em         |
| item-lista                 | li         |
| ligacao                    | a          |
| ligação                    | a          |
| linha                      | tr         |
| linha-horizontal           | hr         |
| lista-definicoes           | dl         |
| lista-definiçoes           | dl         |
| lista-definições           | dl         |
| lista-definicoes/definicao | dd         |
| lista-definicoes/definiçao | dd         |
| lista-definicoes/definição | dd         |
| lista-definiçoes/definicao | dd         |
| lista-definiçoes/definiçao | dd         |
| lista-definiçoes/definição | dd         |
| lista-definições/definicao | dd         |
| lista-definições/definiçao | dd         |
| lista-definições/definição | dd         |
| lista-numerada             | ol         |
| lista-pesquisavel          | datalist   |
| lista-pesquisável          | datalist   |
| lista-simples              | ul         |
| lmht                       | html       |
| marca                      | mark       |
| medidor                    | meter      |
| navegacao                  | nav        |
| navegação                  | nav        |
| negrito                    | strong     |
| objeto                     | object     |
| opcao                      | option     |
| opçao                      | option     |
| opção                      | option     |
| p                          | p          |
| paragrafo                  | p          |
| parágrafo                  | p          |
| preformatado               | pre        |
| principal                  | main       |
| progresso                  | progress   |
| quebra-linha               | br         |
| quebra-linha-oportuna      | wbr        |
| recurso                    | link       |
| riscado                    | s          |
| script                     | script     |
| secao                      | section    |
| seção                      | section    |
| selecao                    | select     |
| seleção                    | select     |
| sem-script                 | noscript   |
| sobrescrito                | sup        |
| sublinhado                 | u          |
| subscrito                  | sub        |
| sumario                    | summary    |
| sumário                    | summary    |
| tabela                     | table      |
| teclado                    | kbd        |
| tempo                      | time       |
| termo                      | dt         |
| texto-pequeno              | small      |
| titulo1                    | h1         |
| título1                    | h1         |
| titulo2                    | h2         |
| título2                    | h2         |
| titulo3                    | h3         |
| título3                    | h3         |
| titulo4                    | h4         |
| título4                    | h4         |
| titulo5                    | h5         |
| título5                    | h5         |
| titulo6                    | h6         |
| título6                    | h6         |
| variavel                   | var        |
| variável                   | var        |


## Bibliotecas de transformação por linguagem

### .NET em geral (C#, VB.NET, IronPython, PowerShell)

A forma mais fácil de testar é pelo PowerShell, mas esse exemplo pode ser facilmente replicado para as demais linguagens.

```powershell
$xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
$xslt.load("lmht.xslt");
$xslt.Transform("exemplo.lmht", "exemplo.html");
```

### Groovy e outras linguagens na JVM

Usando [`groovysh`](https://groovy-lang.org/groovysh.html): 

```groovy
xslt = new File("lmht.xslt").getText()
stringReader = new StringReader(xslt)
stringSource = new javax.xml.transform.stream.StreamSource(stringReader)
transformer = javax.xml.transform.TransformerFactory.newInstance().newTransformer(stringSource)
exemplo = new File("exemplo.lmht").getText()
html = new FileOutputStream("exemplo.html")
transformer.transform(new javax.xml.transform.stream.StreamSource(new StringReader(exemplo)), new javax.xml.transform.stream.StreamResult(html))
```

Exemplo funciona para Groovy e Java, com as devidas adaptações.

### JavaScript ou Node.js

Pode ser utilizado [xslt3](https://www.npmjs.com/package/xslt3), que usa a [saxon-js](https://www.npmjs.com/package/saxon-js). 

Um comando para PowerShell pode ser o seguinte:

```powershell
xslt3 "-s:exemplo.lmht" "-xsl:lmht.xslt" "-o:exemplo.html" -t
```

Para bash, zsh, etc., não é necessário usar as aspas duplas.

```bash
xslt3 -s:exemplo.lmht -xsl:lmht.xslt -o:exemplo.html -t
```

### Python

Primeiro instale o pacote [lxml](https://pypi.org/project/lxml/). 

```python
import lxml.etree as ET

arquivo_lmht = ET.parse("exemplo.lmht")
xslt = ET.parse("lmht.xslt")
transform = ET.XSLT(xslt)
conteudo_html = transform(arquivo_lmht)
conteudo_html.write("exemplo.html", encoding="utf-8")
```

### Ruby

Primeiro instale o pacote [ruby-xslt](https://github.com/glejeune/ruby-xslt). Essa biblioteca reclama da versão 2.0 do XSL, mas faz a transformação assim mesmo.

```ruby
require 'xml/xslt'

xslt.xml = "exemplo.lmht"
xslt.xsl = "lmht.xslt"
xslt.save('exemplo.html')
```
