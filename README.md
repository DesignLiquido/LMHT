# LMHT

Especificação da Linguagem de Marcação Hiper Texto, LMHT.

LMHT nada mais é do que HTML em português, usando um arquivo de transformação XSL para mudar nomes de _tags_ e atributos.

Por exemplo:

```xml
<lmht>
    <corpo>
        <titulo1>Isso é um título</titulo1>
        <p>Isto é um parágrafo.</p>
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
        <p>Isto é um parágrafo.</p>
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