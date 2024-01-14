# LMHT

<p align="center">
    <img src="./recursos/imagens/lmht-laranja.svg" width="127" height="143" />
</p>

<p align="center">
    <a href="https://github.com/DesignLiquido/LMHT/issues" target="_blank"><img src="https://img.shields.io/github/issues/Designliquido/LMHT" /></a>
    <img src="https://img.shields.io/github/stars/Designliquido/LMHT" />
    <img src="https://img.shields.io/github/forks/Designliquido/LMHT" />
    <img src="https://img.shields.io/github/license/Designliquido/LMHT" />
    <br />
</p>

<p align="center">
    Acompanhe a Design Líquido nas redes sociais:
</p>

<p align="center">
    <a href="https://twitter.com/designliquido" target="_blank"><img src="https://img.shields.io/static/v1?style=for-the-badge&message=Twitter&color=1DA1F2&logo=Twitter&logoColor=FFFFFF&label=" /></a>
    <a href="https://www.instagram.com/design.liquido" target="_blank"><img src="https://img.shields.io/static/v1?style=for-the-badge&message=Instagram&color=E4405F&logo=Instagram&logoColor=FFFFFF&label=" /></a>
    <a href="https://www.youtube.com/channel/UCJRn3B7r0aex6LCaOyrQtZQ" target="_blank"><img src="https://img.shields.io/static/v1?style=for-the-badge&message=YouTube&color=FF0000&logo=YouTube&logoColor=FFFFFF&label=" /></a>
    <a href="https://www.linkedin.com/company/design-liquido" target="_blank"><img src="https://img.shields.io/static/v1?style=for-the-badge&message=LinkedIn&color=0A66C2&logo=LinkedIn&logoColor=FFFFFF&label=" /></a>
    <a href="https://www.tiktok.com/@designliquido" target="_blank"><img src="https://img.shields.io/static/v1?style=for-the-badge&message=TikTok&color=000000&logo=TikTok&logoColor=FFFFFF&label=" /></a>
</p>

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

Por ser independente de linguagem, todos os arquivos de especificações podem ser usados com qualquer biblioteca de qualquer linguagem que implemente XSLT 1.0 ou superior.

- Para uso de XSLT 1.0, use o arquivo `lmht10.xslt`;
- Para uso de XSLT 2.0 ou superior, use o arquivo `lmht.xslt`.

## Validação de arquivos em LMHT

Há também um arquivo XSD para validação de arquivos na extensão `.lmht`, que vive no diretório raiz deste repositório. Para validar seu arquivo LMHT usando XSD, basta adicionar à estrutura `<lmht>` a referência para o arquivo XSD da seguinte forma:

```xml
<lmht xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="https://raw.githubusercontent.com/DesignLiquido/LMHT/principal/lmht.xsd">
    ...
</lmht>
```

Para testar a validação online, use:

- [https://www.liquid-technologies.com/online-xsd-validator](https://www.liquid-technologies.com/online-xsd-validator).

Veja mais abaixo como validar usando diferentes linguagens de programação.

## Limitações

LMHT transforma para HTML5. _Tags_ não compatíveis, que existam apenas em HTML4, não possuem uma estrutura correspondente em LMHT. 

Não todos os valores de atributos são traduzidos. Quando há essa tradução, isso normalmente é especificado na Wiki de cada estrutura.

## Mapeamentos entre estruturas LMHT e _tags_ HTML

Algumas _tags_ HTML por ora não serão mapeadas:

- `<embed>` é uma _tag_ com várias alternativas, como `<img>`, `<iframe>`, `<video>` e `<audio>`. Essas _tags_ são mapeadas, respectivamente, com as estruturas `<imagem>`, `<subpágina>`, `<vídeo>` e `<áudio>`.

Mais detalhes sobre as estruturas podem ser encontrados [na nossa Wiki](https://github.com/DesignLiquido/LMHT/wiki).

| LMHT                                                                                                                                    | HTML                                                                             |
| --------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| [abreviacao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22abrevia%C3%A7%C3%A3o%22)                                           | [abbr](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/abbr)           |
| [abreviação](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22abrevia%C3%A7%C3%A3o%22)                                           | [abbr](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/abbr)           |
| [aparte](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22aparte%22)                                                             | [aside](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/aside)         |
| [area](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22%C3%A1rea%22)                                                            | [area](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/area)           |
| [área](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22%C3%A1rea%22)                                                            | [area](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/area)           |
| [area-texto](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22%C3%A1rea-texto%22)                                                | [textarea](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/textarea)   |
| [área-texto](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22%C3%A1rea-texto%22)                                                | [textarea](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/textarea)   |
| [artigo](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22artigo%22)                                                             | [article](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/article)     |
| [aspas](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22aspas%22)                                                               | [q](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/q)                 |
| [audio](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22%C3%A1udio%22)                                                          | [audio](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/audio)         |
| [áudio](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22%C3%A1udio%22)                                                          | [audio](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/audio)         |
| [botao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22bot%C3%A3o%22)                                                          | [button](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/button)       |
| [botão](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22bot%C3%A3o%22)                                                          | [button](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/button)       |
| [cabeca](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22cabe%C3%A7a%22)                                                        | [head](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/head)           |
| [cabeça](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22cabe%C3%A7a%22)                                                        | [head](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/head)           |
| [cabeca-tabela](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22cabe%C3%A7a%22)                                                 | [thead](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/head)          |
| [cabeça-tabela](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22cabe%C3%A7a%22)                                                 | [thead](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/head)          |
| [campo](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22campo%22)                                                               | [input](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/input)         |
| [campos](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22campos%22)                                                             | [fieldset](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/fieldset)   |
| [canvas](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22canvas%22)                                                             | [canvas](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/canvas)       |
| [celula](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22c%C3%A9lula%22)                                                        | [td](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/td)               |
| [célula](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22c%C3%A9lula%22)                                                        | [td](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/td)               |
| [citacao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22cita%C3%A7%C3%A3o%22)                                                 | [blockquote](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/blockquote) |
| [citação](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22cita%C3%A7%C3%A3o%22)                                                 | [blockquote](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/blockquote) |
| [citar](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22citar%22)                                                               | [cite](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/cite)           |
| [codigo](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22c%C3%B3digo%22)                                                        | [code](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/code)           |
| [código](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22c%C3%B3digo%22)                                                        | [code](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/code)           |
| [coluna](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22coluna%22)                                                             | [col](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/col)             |
| [corpo](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22corpo%22)                                                               | [body](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/body)           |
| [corpo-tabela](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22corpo-tabela%22)                                                 | [tbody](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/tbody)         |
| [definicao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22defini%C3%A7%C3%A3o%22)                                             | [dfn](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/dfn)             |
| [definição](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22defini%C3%A7%C3%A3o%22)                                             | [dfn](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/dfn)             |
| [detalhes](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22detalhes%22)                                                         | [details](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/details)     |
| [divisao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22divis%C3%A3o%22)                                                      | [div](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/div)             |
| [divisão](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22divis%C3%A3o%22)                                                      | [div](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/div)             |
| [endereco](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22endere%C3%A7o%22)                                                    | [address](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/address)     |
| [endereço](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22endere%C3%A7o%22)                                                    | [address](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/address)     |
| [envelope-texto](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22envelope-texto%22)                                             | [span](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/span)           |
| [escatel](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22escatel%22)                                                           | [slot](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/slot)           |
| [etiqueta](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22etiqueta%22)                                                         | [label](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/label)         |
| [excluido](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22exclu%C3%ADdo%22)                                                    | [del](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/del)             |
| [excluído](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22exclu%C3%ADdo%22)                                                    | [del](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/del)             |
| [exemplo](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22exemplo%22)                                                           | [samp](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/samp)           |
| [formulario](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22formul%C3%A1rio%22)                                                | [form](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form)           |
| [formulário](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22formul%C3%A1rio%22)                                                | [form](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form)           |
| [grupo-colunas](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22grupo-colunas%22)                                               | [colgroup](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/colgroup)   |
| [grupo-opcoes](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22grupo-op%C3%A7%C3%B5es%22)                                       | [optgroup](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/optgroup)   |
| [grupo-opções](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22grupo-op%C3%A7%C3%B5es%22)                                       | [optgroup](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/optgroup)   |
| [grupo-titulos](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22grupo-t%C3%ADtulos%22)                                          | [hgroup](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/hgroup)       |
| [grupo-títulos](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22grupo-t%C3%ADtulos%22)                                          | [hgroup](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/hgroup)       |
| [imagem](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22imagem%22)                                                             | [img](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/img)             |
| [inserido](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22inserido%22)                                                         | [ins](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ins)             |
| [invisivel](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22invisivel%22)                                                       | [template](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/template)   |
| [invisível](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22invisivel%22)                                                       | [template](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/template)   |
| [italico](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22it%C3%A1lico%22)                                                      | [em](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/em)               |
| [itálico](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22it%C3%A1lico%22)                                                      | [em](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/em)               |
| [item-lista](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22item-lista%22)                                                     | [li](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/li)               |
| [ligacao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22liga%C3%A7%C3%A3o%22)                                                 | [a](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/a)                 |
| [ligação](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22liga%C3%A7%C3%A3o%22)                                                 | [a](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/a)                 |
| [linha](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22linha%22)                                                               | [tr](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/tr)               |
| [linha-horizontal](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22linha-horizontal%22)                                         | [hr](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/hr)               |
| [lista-definicoes](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22lista-defini%C3%A7%C3%B5es%22)                               | [dl](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/dl)               |
| [lista-definições](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22lista-defini%C3%A7%C3%B5es%22)                               | [dl](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/dl)               |
| [lista-definicoes/definicao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22lista-defini%C3%A7%C3%B5es-defini%C3%A7%C3%A3o%22) | [dd](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/dd)               |
| [lista-definições/definição](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22lista-defini%C3%A7%C3%B5es-defini%C3%A7%C3%A3o%22) | [dd](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/dd)               |
| [lista-numerada](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22lista-numerada%22)                                             | [ol](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/ol)               |
| [lista-pesquisavel](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22lista-pesquis%C3%A1vel%22)                                  | [datalist](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/datalist)   |
| [lista-pesquisável](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22lista-pesquis%C3%A1vel%22)                                  | [datalist](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/datalist)   |
| [lista-simples](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22lista-simples%22)                                               | [ul](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/ul)               |
| [lmht](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22lmht%22)                                                                 | [html](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/html)           |
| [marca](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22marca%22)                                                               | [mark](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/mark)           |
| [medidor](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22medidor%22)                                                           | [meter](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/meter)         |
| [modal](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22modal%22)                                                               | [dialog](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/dialog)       |
| [navegacao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22navega%C3%A7%C3%A3o%22)                                             | [nav](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/nav)             |
| [navegação](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22navega%C3%A7%C3%A3o%22)                                             | [nav](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/nav)             |
| [negrito](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22negrito%22)                                                           | [strong](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/strong)       |
| [objeto](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22objeto%22)                                                             | [object](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object)       |
| [opcao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22op%C3%A7%C3%A3o%22)                                                     | [option](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/option)       |
| [opção](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22op%C3%A7%C3%A3o%22)                                                     | [option](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/option)       |
| [p](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22paragrafo%22)                                                               | [p](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/p)                 |
| [paragrafo](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22paragrafo%22)                                                       | [p](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/p)                 |
| [parágrafo](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22paragrafo%22)                                                       | [p](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/p)                 |
| [preformatado](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22preformatado%22)                                                 | [pre](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/pre)             |
| [principal](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22principal%22)                                                       | [main](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/main)           |
| [progresso](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22progresso%22)                                                       | [progress](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/progress)   |
| [quebra-linha](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22quebra-linha%22)                                                 | [br](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/br)               |
| [quebra-linha-oportuna](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22quebra-linha-oportuna%22)                               | [wbr](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/wbr)             |
| [recurso](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22recurso%22)                                                           | [link](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/link)           |
| [resultado](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22resultado%22)                                                       | [output](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/output)       |
| [riscado](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22riscado%22)                                                           | [s](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/s)                 |
| [rodape](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22rodap%C3%A9%22)                                                        | [footer](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/footer)       |
| [rodapé](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22rodap%C3%A9%22)                                                        | [footer](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/footer)       |
| [rodape (para tabelas)](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22rodap%C3%A9%22)                                         | [tfoot](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/tfoot)         |
| [rodapé (para tabelas)](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22rodap%C3%A9%22)                                         | [tfoot](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/tfoot)         |
| [script](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22script%22)                                                             | [script](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/script)       |
| [secao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22se%C3%A7%C3%A3o%22)                                                     | [section](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/section)     |
| [seção](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22se%C3%A7%C3%A3o%22)                                                     | [section](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/section)     | 
| [selecao](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22sele%C3%A7%C3%A3o%22)                                                 | [select](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/select)       |
| [seleção](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22sele%C3%A7%C3%A3o%22)                                                 | [select](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/select)       |
| [sem-script](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22sem%E2%80%90script%22)                                             | [noscript](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/noscript)   |
| [sobrescrito](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22sobrescrito%22)                                                   | [sup](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/sup)             |
| [sublinhado](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22sublinhado%22)                                                     | [u](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/u)                 |
| [subscrito](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22subscrito%22)                                                       | [sub](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/sub)             |
| [sumario](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22sum%C3%A1rio%22)                                                      | [summary](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/summary)     |
| [sumário](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22sum%C3%A1rio%22)                                                      | [summary](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/summary)     |
| [tabela](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22tabela%22)                                                             | [table](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/table)         |
| [teclado](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22teclado%22)                                                           | [kbd](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/kbd)             |
| [tempo](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22tempo%22)                                                               | [time](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/time)           |
| [termo](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22termo%22)                                                               | [dt](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/dt)               |
| [texto-pequeno](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22texto-pequeno%22)                                               | [small](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/small)         |
| [titulo1](https://github.com/DesignLiquido/LMHT/wiki/Estruturas-%22t%C3%ADtulo%22)                                                      | [h1](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) |
| [título1](https://github.com/DesignLiquido/LMHT/wiki/Estruturas-%22t%C3%ADtulo%22)                                                      | [h1](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) |
| [titulo2](https://github.com/DesignLiquido/LMHT/wiki/Estruturas-%22t%C3%ADtulo%22)                                                      | [h2](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) |
| [título2](https://github.com/DesignLiquido/LMHT/wiki/Estruturas-%22t%C3%ADtulo%22)                                                      | [h2](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) |
| [titulo3](https://github.com/DesignLiquido/LMHT/wiki/Estruturas-%22t%C3%ADtulo%22)                                                      | [h3](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) |
| [título3](https://github.com/DesignLiquido/LMHT/wiki/Estruturas-%22t%C3%ADtulo%22)                                                      | [h3](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) |
| [titulo4](https://github.com/DesignLiquido/LMHT/wiki/Estruturas-%22t%C3%ADtulo%22)                                                      | [h4](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) |
| [título4](https://github.com/DesignLiquido/LMHT/wiki/Estruturas-%22t%C3%ADtulo%22)                                                      | [h4](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) |
| [titulo5](https://github.com/DesignLiquido/LMHT/wiki/Estruturas-%22t%C3%ADtulo%22)                                                      | [h5](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) |
| [título5](https://github.com/DesignLiquido/LMHT/wiki/Estruturas-%22t%C3%ADtulo%22)                                                      | [h5](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) |
| [titulo6](https://github.com/DesignLiquido/LMHT/wiki/Estruturas-%22t%C3%ADtulo%22)                                                      | [h6](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) |
| [título6](https://github.com/DesignLiquido/LMHT/wiki/Estruturas-%22t%C3%ADtulo%22)                                                      | [h6](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) |
| [variavel](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22vari%C3%A1vel%22)                                                    | [var](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/var)             |
| [variável](https://github.com/DesignLiquido/LMHT/wiki/Estrutura-%22vari%C3%A1vel%22)                                                    | [var](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element/var)             |


## Bibliotecas por linguagem

- JavaScript/Node.js/TypeScript: [lmht-js](https://github.com/DesignLiquido/lmht-js)
- PHP: [lmht-php](https://github.com/DesignLiquido/lmht-php)
- C#/.NET: [lmht-csharp](https://github.com/DesignLiquido/lmht-csharp)

## Transformações por linguagem

### .NET em geral (C#, VB.NET, IronPython, PowerShell)

A forma mais fácil de testar é pelo PowerShell, mas esse exemplo pode ser facilmente replicado para as demais linguagens.

```powershell
$xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
$xslt.load("lmht.xslt");
$xslt.Transform("exemplo.lmht", "exemplo.html");
```

Para uma transformação reversa (de HTML para LMHT), use:

```powershell
$xsltReverso = New-Object System.Xml.Xsl.XslCompiledTransform;
$xsltReverso.load("lmht-reverso.xslt");
$xsltReverso.Transform("exemplo.html", "exemplo-reverso.lmht");
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

## Bibliotecas de validação por linguagem

### .NET em geral (C#, VB.NET, IronPython, PowerShell)

Abaixo temos um exemplo de como validar um arquivo usando PowerShell:

```powershell
$leitorSchema = New-Object System.Xml.XmlTextReader "lmht.xsd"
[scriptblock] $funcaoParaLidarComExcecoes = { Write-Error $args[1].Exception }
$schema = [System.Xml.Schema.XmlSchema]::Read($leitorSchema, $funcaoParaLidarComExcecoes)

$xml = New-Object System.Xml.XmlDocument
$xml.Schemas.Add($schema) | Out-Null
$xml.Load("exemplo.lmht")
$xml.Validate(
{
    throw ([PsCustomObject] @{
        SchemaFile = "lmht.xsd"
        XmlFile = "exemplo.lmht"
        Exception = $args[1].Exception
    })
})
$leitorSchema.Close()
```

### Python

Primeiro instale o pacote [lxml](https://pypi.org/project/lxml/). 

```python
from lxml import etree

xmlschema_doc = etree.parse("lmht.xsd")
xmlschema = etree.XMLSchema(xmlschema_doc)

xml_doc = etree.parse("exemplo.lmht")
print(xmlschema.validate(xml_doc))
```
