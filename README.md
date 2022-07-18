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
            <item-lista>Itens podem ser adicionados usando a etiqueta item-lista.</item-lista>
            <item-lista>Cada item da lista é transformado em um item li do HTML.</item-lista>
            <item-lista>Não apenas etiquetas são modificadas, como também seus atributos.</item-lista>
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
            <li>Itens podem ser adicionados usando a etiqueta item-lista.</li>
            <li>Cada item da lista é transformado em um item li do HTML.</li>
            <li>Não apenas etiquetas são modificadas, como também seus atributos.</li>
        </ul>
    </body>
</html>
```

Para testar a transformação XSL, use: 

- [http://xsltransform.net](http://xsltransform.net);
- [https://www.freeformatter.com/xsl-transformer.html](https://www.freeformatter.com/xsl-transformer.html).

Por ser independente de linguagem, todos os arquivos de especificações podem ser usados com qualquer biblioteca de qualquer linguagem que implemente XSLT 3.0.

## Limitações

LMHT transforma para HTML5. Tags não compatíveis, que existam apenas em HTML4, não possuem uma estrutura correspondente em LMHT. 

## Bibliotecas de transformação por linguagem

### .NET em geral (C#, VB.NET, IronPython, PowerShell)

A forma mais fácil de testar é pelo PowerShell, mas esse exemplo pode ser facilmente replicado para as demais linguagens.

```powershell
$xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
$xslt.load("lmht.xslt");
$xslt.Transform("exemplo.lmht", "exemplo.html");
```

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