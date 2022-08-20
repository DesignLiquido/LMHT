<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="html" version="5.0" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
    <xsl:variable name="atributosGlobais">|class|dir|</xsl:variable>

    <!-- Atributos independentes de tags (globais) -->
    <xsl:template match="@arrastavel|@arrastável">
        <xsl:attribute name="draggable">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@classe">
        <xsl:attribute name="class">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@chave-acesso">
        <xsl:attribute name="accesskey">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@conteudo-editavel">
        <xsl:attribute name="contenteditable">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@direcao-texto|@direção-texto">
        <xsl:attribute name="dir">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@escondido">
        <xsl:attribute name="hidden">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@idioma">
        <xsl:attribute name="lang">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@verificar-grafia">
        <xsl:attribute name="spellcheck">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@estilo">
        <xsl:attribute name="style">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@indice-tab">
        <xsl:attribute name="tabindex">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@titulo">
        <xsl:attribute name="title">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@traduzir">
        <xsl:attribute name="translate">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="lmht">
        <html>
            <xsl:apply-templates select="@*|node()" />
        </html>
    </xsl:template>

    <!-- Especificação de `cabeça`, ou `cabeca` -->
    <xsl:template match="lmht/cabeca|lmht/cabeça">
        <head>
            <xsl:apply-templates select="@*|node()" />
        </head>
    </xsl:template>
    <xsl:template match="lmht/cabeca/titulo|lmht/cabeca/título|lmht/cabeça/titulo|lmht/cabeça/título">
        <title>
            <xsl:apply-templates select="@*|node()" />
        </title>
    </xsl:template>

    <!-- Especificação de `corpo` -->
    <xsl:template match="lmht/corpo">
        <body>
            <xsl:apply-templates select="@*|node()" />
        </body>
    </xsl:template>
    <xsl:template match="lmht/corpo//abreviacao|lmht/corpo//abreviação">
        <abbr>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'titulo'">
                        <xsl:attribute name="title">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="@title|node()" />
        </abbr>
    </xsl:template>
    <xsl:template match="lmht/corpo//aparte">
        <aside>
            <xsl:apply-templates select="@*|node()" />
        </aside>
    </xsl:template>
    <xsl:template match="lmht/corpo//area-texto|lmht/corpo//área-texto">
        <textarea>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'autofoco'">
                        <xsl:attribute name="autofocus">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'colunas'">
                        <xsl:attribute name="cols">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'direcao-texto' or name() = 'direção-texto'">
                        <xsl:attribute name="dirname">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'desabilitada'">
                        <xsl:attribute name="disabled">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'formulario' or name() = 'formulário'">
                        <xsl:attribute name="disabled">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'largura-maxima' or name() = 'largura-máxima'">
                        <xsl:attribute name="maxlength">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'nome'">
                        <xsl:attribute name="name">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'dica-campo'">
                        <xsl:attribute name="placeholder">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'somente-leitura'">
                        <xsl:attribute name="readonly">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'obrigatorio' or name() = 'obrigatório'">
                        <xsl:attribute name="required">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'linhas'">
                        <xsl:attribute name="rows">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'quebra-automatica' or name() = 'quebra-automática'">
                        <xsl:attribute name="wrap">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </textarea>
    </xsl:template>
    <xsl:template match="lmht/corpo//artigo">
        <article>
            <xsl:apply-templates select="@*|node()" />
        </article>
    </xsl:template>
    <xsl:template match="lmht/corpo//aspas">
        <q>
            <xsl:apply-templates select="@*|node()" />
        </q>
    </xsl:template>
    <xsl:template match="lmht/corpo//botao|lmht/corpo//botão">
        <button>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'tipo'">
                        <xsl:attribute name="type">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </button>
    </xsl:template>
    <xsl:template match="lmht/corpo//canvas">
        <canvas>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </canvas>
    </xsl:template>
    <xsl:template match="lmht/corpo//citacao|lmht/corpo//citação">
        <blockquote>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'citar'">
                        <xsl:attribute name="cite">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </blockquote>
    </xsl:template>
    <xsl:template match="lmht/corpo//citar">
        <cite>
            <xsl:apply-templates select="@*|node()" />
        </cite>
    </xsl:template>
    <xsl:template match="lmht/corpo//codigo|lmht/corpo//código">
        <code>
            <xsl:apply-templates select="@*|node()" />
        </code>
    </xsl:template>
    <xsl:template match="lmht/corpo//definicao|lmht/corpo//definição">
        <dfn>
            <xsl:apply-templates select="@*|node()" />
        </dfn>
    </xsl:template>
    <xsl:template match="lmht/corpo//detalhes">
        <details>
            <xsl:apply-templates select="@*|node()" />
        </details>
    </xsl:template>
    <xsl:template match="lmht/corpo//detalhes/sumario|lmht/corpo//detalhes/sumário">
        <summary>
            <xsl:apply-templates select="@*|node()" />
        </summary>
    </xsl:template>
    <xsl:template match="lmht/corpo//divisao|lmht/corpo//divisão">
        <div>
            <xsl:apply-templates select="@*|node()" />
        </div>
    </xsl:template>
    <xsl:template match="lmht/corpo//endereco|lmht/corpo//endereço">
        <address>
            <xsl:apply-templates select="@*|node()" />
        </address>
    </xsl:template>
    <xsl:template match="lmht/corpo//envelope-texto">
        <span>
            <xsl:apply-templates select="@*|node()" />
        </span>
    </xsl:template>
    <xsl:template match="lmht/corpo//etiqueta">
        <label>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'para'">
                        <xsl:attribute name="for">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </label>
    </xsl:template>
    <xsl:template match="lmht/corpo//exemplo">
        <samp>
            <xsl:apply-templates select="@*|node()" />
        </samp>
    </xsl:template>

    <!-- Formulários -->
    <xsl:template match="lmht/corpo//formulario|lmht/corpo//formulário">
        <form>
            <xsl:apply-templates select="@*|node()" />
        </form>
    </xsl:template>
    <xsl:template match="lmht/corpo//formulario/campos|lmht/corpo//formulário/campos">
        <fieldset>
            <xsl:apply-templates select="@*|node()" />
        </fieldset>
    </xsl:template>
    <xsl:template match="lmht/corpo//formulario/campos/campo|lmht/corpo//formulário/campos/campo|lmht/corpo//formulario/campo|lmht/corpo//formulário/campo">
        <input>
            <xsl:apply-templates select="@*|node()" />
        </input>
    </xsl:template>
    <xsl:template match="lmht/corpo//formulario/titulo|lmht/corpo//formulário/título">
        <legend>
            <xsl:apply-templates select="@*|node()" />
        </legend>
    </xsl:template>

    <xsl:template match="lmht/corpo//imagem">
        <img>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'altura'">
                        <xsl:attribute name="height">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="name() = 'largura'">
                        <xsl:attribute name="width">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="name() = 'legenda'">
                        <xsl:attribute name="alt">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="name() = 'origem'">
                        <xsl:attribute name="src">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </img>
    </xsl:template>
    <xsl:template match="lmht/corpo//invisivel|lmht/corpo//invisível">
        <template>
            <xsl:apply-templates select="@*|node()" />
        </template>
    </xsl:template>
    <xsl:template match="lmht/corpo//italico|lmht/corpo//itálico">
        <em>
            <xsl:apply-templates select="@*|node()" />
        </em>
    </xsl:template>
    <xsl:template match="lmht/corpo//ligacao|lmht/corpo/ligação">
        <a>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'alvo'">
                        <xsl:attribute name="target">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'destino'">
                        <xsl:attribute name="href">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'idioma'">
                        <xsl:attribute name="hreflang">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'midia'">
                        <xsl:attribute name="media">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'nome-arquivo'">
                        <xsl:attribute name="download">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'politica-referencia'">
                        <xsl:attribute name="referrerpolicy">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'relacionamento'">
                        <xsl:attribute name="rel">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'tipo'">
                        <xsl:attribute name="type">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="@*|node()" />
        </a>
    </xsl:template>
    <xsl:template match="lmht/corpo//linha-horizontal">
        <hr />
    </xsl:template>

    <!-- Listas -->
    <xsl:template match="lmht/corpo//lista-numerada">
        <ol>
            <xsl:apply-templates select="@*|node()" />
        </ol>
    </xsl:template>
    <xsl:template match="lmht/corpo//lista-pesquisavel|lmht/corpo//lista-pesquisável">
        <datalist>
            <xsl:apply-templates select="@*|node()" />
        </datalist>
    </xsl:template>
    <xsl:template match="lmht/corpo//lista-pesquisavel/opcao|lmht/corpo//lista-pesquisavel/opção|lmht/corpo//lista-pesquisável/opcao|lmht/corpo//lista-pesquisável/opção">
        <option>
            <xsl:apply-templates select="@*|node()" />
        </option>
    </xsl:template>
    <xsl:template match="lmht/corpo//lista-simples">
        <ul>
            <xsl:apply-templates select="@*|node()" />
        </ul>
    </xsl:template>
    <xsl:template match="lmht/corpo//lista-simples/item-lista|lmht/corpo//lista-numerada/item-lista">
        <li>
            <xsl:apply-templates select="@*|node()" />
        </li>
    </xsl:template>

    <xsl:template match="lmht/corpo//marca">
        <mark>
            <xsl:apply-templates select="@*|node()" />
        </mark>
    </xsl:template>
    <xsl:template match="lmht/corpo//medidor">
        <meter>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'maximo' or name() = 'máximo'">
                        <xsl:attribute name="max">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'minimo'">
                        <xsl:attribute name="min">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'valor'">
                        <xsl:attribute name="value">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </meter>
    </xsl:template>
    <xsl:template match="lmht/corpo//navegacao|lmht/corpo//navegação">
        <nav>
            <xsl:apply-templates select="@*|node()" />
        </nav>
    </xsl:template>
    <xsl:template match="lmht/corpo//n|lmht/corpo//negrito">
        <strong>
            <xsl:apply-templates select="@*|node()" />
        </strong>
    </xsl:template>
    <xsl:template match="lmht/corpo//objeto">
        <object>
            <xsl:apply-templates select="@*|node()" />
        </object>
    </xsl:template>
    <xsl:template match="lmht/corpo//p|lmht/corpo//paragrafo|lmht/corpo//parágrafo">
        <p>
            <xsl:apply-templates select="@*|node()" />
        </p>
    </xsl:template>
    <xsl:template match="lmht/corpo//preformatado">
        <pre>
            <xsl:apply-templates select="@*|node()" />
        </pre>
    </xsl:template>
    <xsl:template match="lmht/corpo//principal">
        <main>
            <xsl:apply-templates select="@*|node()" />
        </main>
    </xsl:template>
    <xsl:template match="lmht/corpo//progresso">
        <progress>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'maximo' or name() = 'máximo'">
                        <xsl:attribute name="max">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'minimo'">
                        <xsl:attribute name="min">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'valor'">
                        <xsl:attribute name="value">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </progress>
    </xsl:template>
    <xsl:template match="lmht/corpo//quebra-linha">
        <br />
    </xsl:template>
    <xsl:template match="lmht/corpo//quebra-linha-oportuna">
        <wbr>
            <xsl:apply-templates select="@*|node()" />
        </wbr>
    </xsl:template>
    <xsl:template match="lmht/corpo//riscado">
        <s>
            <xsl:apply-templates select="@*|node()" />
        </s>
    </xsl:template>
    <xsl:template match="lmht/corpo//script">
        <script>
            <xsl:apply-templates select="@*|node()" />
        </script>
    </xsl:template>
    <xsl:template match="lmht/corpo//secao|lmht/corpo//seção">
        <section>
            <xsl:apply-templates select="@*|node()" />
        </section>
    </xsl:template>

    <xsl:template match="lmht/corpo//selecao|lmht/corpo//seleção">
        <select>
            <xsl:apply-templates select="@*|node()" />
        </select>
    </xsl:template>
    <xsl:template match="lmht/corpo//selecao/opcao|lmht/corpo//selecao/opção|lmht/corpo//seleção/opcao|lmht/corpo//seleção/opção">
        <option>
            <xsl:apply-templates select="@*|node()" />
        </option>
    </xsl:template>

    <xsl:template match="lmht/corpo//sem-script">
        <noscript>
            <xsl:apply-templates select="@*|node()" />
        </noscript>
    </xsl:template>
    <xsl:template match="lmht/corpo//sobrescrito">
        <sup>
            <xsl:apply-templates select="@*|node()" />
        </sup>
    </xsl:template>
    <xsl:template match="lmht/corpo//sublinhado">
        <u>
            <xsl:apply-templates select="@*|node()" />
        </u>
    </xsl:template>
    <xsl:template match="lmht/corpo//subscrito">
        <sub>
            <xsl:apply-templates select="@*|node()" />
        </sub>
    </xsl:template>

    <!-- Tabelas -->
    <xsl:template match="lmht/corpo//tabela">
        <table>
            <xsl:apply-templates select="@*|node()" />
        </table>
    </xsl:template>
    <xsl:template match="lmht/corpo//tabela/cabeca-tabela|lmht/corpo//tabela/cabeça-tabela">
        <thead>
            <xsl:apply-templates select="@*|node()" />
        </thead>
    </xsl:template>
    <xsl:template match="lmht/corpo//tabela/cabeca-tabela/linha|lmht/corpo//tabela/cabeça-tabela/linha">
        <tr>
            <xsl:apply-templates select="@*|node()" />
        </tr>
    </xsl:template>
    <xsl:template match="lmht/corpo//tabela/cabeca-tabela/linha/celula|lmht/corpo//tabela/cabeça-tabela/linha/celula">
        <th>
            <xsl:apply-templates select="@*|node()" />
        </th>
    </xsl:template>
    <xsl:template match="lmht/corpo//tabela/cabeca-tabela/linha/célula|lmht/corpo//tabela/cabeça-tabela/linha/célula">
        <th>
            <xsl:apply-templates select="@*|node()" />
        </th>
    </xsl:template>
    <xsl:template match="lmht/corpo//tabela/corpo-tabela">
        <tbody>
            <xsl:apply-templates select="@*|node()" />
        </tbody>
    </xsl:template>
    <xsl:template match="lmht/corpo//tabela/corpo-tabela/linha">
        <tr>
            <xsl:apply-templates select="@*|node()" />
        </tr>
    </xsl:template>
    <xsl:template match="lmht/corpo//tabela/corpo-tabela/linha/celula|lmht/corpo//tabela/corpo-tabela/linha/célula">
        <td>
            <xsl:apply-templates select="@*|node()" />
        </td>
    </xsl:template>
    <xsl:template match="lmht/corpo//tabela/rodape|lmht/corpo//tabela/rodapé">
        <tfoot>
            <xsl:apply-templates select="@*|node()" />
        </tfoot>
    </xsl:template>
    <xsl:template match="lmht/corpo//tabela/titulo|lmht/corpo//tabela/título">
        <caption>
            <xsl:apply-templates select="@*|node()" />
        </caption>
    </xsl:template>

    <xsl:template match="lmht/corpo//teclado">
        <kbd>
            <xsl:apply-templates select="@*|node()" />
        </kbd>
    </xsl:template>
    <xsl:template match="lmht/corpo//tempo">
        <time>
            <xsl:apply-templates select="@*|node()" />
        </time>
    </xsl:template>
    <xsl:template match="lmht/corpo//texto-pequeno">
        <small>
            <xsl:apply-templates select="@*|node()" />
        </small>
    </xsl:template>

    <!-- Títulos -->
    <xsl:template match="lmht/corpo//titulo1">
        <h1>
            <xsl:apply-templates select="@*|node()" />
        </h1>
    </xsl:template>
    <xsl:template match="lmht/corpo//titulo2">
        <h2>
            <xsl:apply-templates select="@*|node()" />
        </h2>
    </xsl:template>
    <xsl:template match="lmht/corpo//titulo3">
        <h3>
            <xsl:apply-templates select="@*|node()" />
        </h3>
    </xsl:template>
    <xsl:template match="lmht/corpo//titulo4">
        <h4>
            <xsl:apply-templates select="@*|node()" />
        </h4>
    </xsl:template>
    <xsl:template match="lmht/corpo//titulo5">
        <h5>
            <xsl:apply-templates select="@*|node()" />
        </h5>
    </xsl:template>
    <xsl:template match="lmht/corpo//titulo6">
        <h6>
            <xsl:apply-templates select="@*|node()" />
        </h6>
    </xsl:template>
    <xsl:template match="lmht/corpo//variavel|lmht/corpo//variável">
        <var>
            <xsl:apply-templates select="@*|node()" />
        </var>
    </xsl:template>
</xsl:transform>