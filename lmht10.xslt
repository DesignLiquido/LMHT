<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="1.0">
    <xsl:output method="html" version="5.0" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <!-- Seção de _templates_ utilitários -->
    <!-- Os _templates_ abaixo normalmente trabalham com transcrição de valores de atributos LMHT para HTML -->
    <xsl:template name="ProcessarAlvos">
        <xsl:param name="Alvo" />
        <xsl:choose>
            <xsl:when test="$Alvo = '_mesmo'">_self</xsl:when>
            <xsl:when test="$Alvo = '_novo'">_blank</xsl:when>
            <xsl:when test="$Alvo = '_pai'">_parent</xsl:when>
            <xsl:when test="$Alvo = '_topo'">_top</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="ProcessarForma">
        <xsl:param name="Forma" />
        <xsl:choose>
            <xsl:when test="$Forma = 'padrão' or $Forma = 'padrao'">default</xsl:when>
            <xsl:when test="$Forma = 'retangular'">rect</xsl:when>
            <xsl:when test="$Forma = 'circular'">circle</xsl:when>
            <xsl:when test="$Forma = 'polígono' or $Forma = 'poligono'">poly</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="ProcessarPoliticasReferenciador">
        <xsl:param name="Politica" />
        <xsl:choose>
            <xsl:when test="$Politica = 'destino-não-seguro' or $Politica = 'destino-nao-seguro'">unsafe-url</xsl:when>
            <xsl:when test="$Politica = 'mesma-origem'">same-origin</xsl:when>
            <xsl:when test="$Politica = 'origem'">origin</xsl:when>
            <xsl:when test="$Politica = 'origem-quando-origem-cruzada'">origin-when-cross-origin</xsl:when>
            <xsl:when test="$Politica = 'origem-quando-origem-cruzada-rigorosa'">strict-origin-when-cross-origin</xsl:when>
            <xsl:when test="$Politica = 'sem-referenciador'">no-referrer</xsl:when>
            <xsl:when test="$Politica = 'sem-referenciador-ao-rebaixar'">no-referrer-when-downgrade</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="ProcessarPreCarga">
        <xsl:param name="PreCarga" />
        <xsl:choose>
            <xsl:when test="$PreCarga = 'automática' or $PreCarga = 'automatica'">auto</xsl:when>
            <xsl:when test="$PreCarga = 'metadados'">metadata</xsl:when>
            <xsl:when test="$PreCarga = 'circular'">circle</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="ProcessarRelacionamentos">
        <xsl:param name="Relacionamento" />
        <xsl:choose>
            <xsl:when test="$Relacionamento = 'ajuda'">help</xsl:when>
            <xsl:when test="$Relacionamento = 'alternativa'">alternate</xsl:when>
            <xsl:when test="$Relacionamento = 'anterior'">prev</xsl:when>
            <xsl:when test="$Relacionamento = 'autor'">author</xsl:when>
            <xsl:when test="$Relacionamento = 'externo'">external</xsl:when>
            <xsl:when test="$Relacionamento = 'licença' or $Relacionamento = 'licenca'">license</xsl:when>
            <xsl:when test="$Relacionamento = 'marcador'">bookmark</xsl:when>
            <xsl:when test="$Relacionamento = 'não-seguir' or $Relacionamento = 'nao-seguir'">nofollow</xsl:when>
            <xsl:when test="$Relacionamento = 'palavra-chave'">tag</xsl:when>
            <xsl:when test="$Relacionamento = 'pesquisa'">search</xsl:when>
            <xsl:when test="$Relacionamento = 'próximo' or $Relacionamento = 'proximo'">next</xsl:when>
            <xsl:when test="$Relacionamento = 'sem-anterior'">noreferrer</xsl:when>
            <xsl:when test="$Relacionamento = 'sem-janela-abertura'">noopener</xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- Atributos independentes de tags (globais) -->
    <!-- Por algum motivo, adicionar `id` aqui não funciona. -->
    <!-- Atributo id, portanto, é usado em todas as estruturas de `<corpo>`. -->
    <xsl:template match="@arrastavel|@arrastável">
        <xsl:attribute name="draggable">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@atalho">
        <xsl:attribute name="accesskey">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@classe">
        <xsl:attribute name="class">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@conteudo-editavel|@conteúdo-editavel|@conteudo-editável|@conteúdo-editável">
        <xsl:attribute name="contenteditable">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@direcao-texto|@direçao-texto|@direcão-texto|@direção-texto">
        <xsl:attribute name="dir">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@escondido">
        <xsl:attribute name="hidden">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@estilo">
        <xsl:attribute name="style">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@idioma">
        <xsl:attribute name="lang">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>    
    <xsl:template match="@indice-tab|@índice-tab">
        <xsl:attribute name="tabindex">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@titulo|@título">
        <xsl:attribute name="title">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@traduzir">
        <xsl:attribute name="translate">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@verificar-grafia">
        <xsl:attribute name="spellcheck">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="lmht">
        <html>
            <xsl:apply-templates select="node()" />
        </html>
    </xsl:template>

    <!-- Especificação de `cabeça`, ou `cabeca` -->
    <xsl:template match="lmht/cabeca|lmht/cabeça">
        <head>
            <xsl:apply-templates select="@*|node()" />
        </head>
    </xsl:template>
    <xsl:template match="lmht/cabeca/base-ligacoes|lmht/cabeca/base-ligações|lmht/cabeça/base-ligacoes|lmht/cabeça/base-ligações">
        <base>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'alvo'">
                        <xsl:attribute name="target">
                            <xsl:call-template name="ProcessarAlvos">
                                <xsl:with-param name="Alvo" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'prefixo'">
                        <xsl:attribute name="href">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </base>
    </xsl:template>
    <xsl:template match="lmht/cabeca/estilo|lmht/cabeça/estilo">
        <style>
            <xsl:apply-templates select="@*|node()" />
        </style>
    </xsl:template>
    <!-- Estrutura style é apenas replicada para ser usada por FolEs. -->
    <!-- https://github.com/DesignLiquido/FolEs -->
    <xsl:template match="lmht/cabeca/style|lmht/cabeça/style">
        <style>
            <xsl:apply-templates select="@*|node()" />
        </style>
    </xsl:template>
    <xsl:template match="lmht/cabeca/meta|lmht/cabeça/meta">
        <meta>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'nome'">
                        <xsl:attribute name="name">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'conteudo' or name() = 'conteúdo'">
                        <xsl:attribute name="content">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </meta>
    </xsl:template>
    <xsl:template match="lmht/cabeca/recurso|lmht/cabeça/recurso">
        <link>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'destino'">
                        <xsl:attribute name="href">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'tipo'">
                        <xsl:attribute name="rel">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </link>
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
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
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
    <xsl:template match="lmht/corpo//area|lmht/corpo//área">
        <area>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'alvo'">
                        <xsl:attribute name="target">
                            <xsl:call-template name="ProcessarAlvos">
                                <xsl:with-param name="Alvo" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'coordenadas'">
                        <xsl:attribute name="coords">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'destino'">
                        <xsl:attribute name="href">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'forma'">
                        <xsl:attribute name="shape">
                            <xsl:call-template name="ProcessarForma">
                                <xsl:with-param name="Forma" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'legenda'">
                        <xsl:attribute name="alt">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'mídia' or name() = 'midia'">
                        <xsl:attribute name="media">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'origem'">
                        <xsl:attribute name="href">
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
            <xsl:apply-templates select="node()" />
        </area>
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
                        <xsl:attribute name="form">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
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
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'citar'">
                        <xsl:attribute name="cite">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </q>
    </xsl:template>
    <xsl:template match="lmht/corpo//audio|lmht/corpo//áudio">
        <audio>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'controles'">
                        <xsl:attribute name="controls">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'inicio-automatico' or name() = 'início-automático'">
                        <xsl:attribute name="autoplay">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'nome'">
                        <xsl:attribute name="name">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'mudo'">
                        <xsl:attribute name="muted">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'origem'">
                        <xsl:attribute name="src">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'pre-carregar' or name() = 'pré-carregar'">
                        <xsl:attribute name="preload">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'repetir'">
                        <xsl:attribute name="loop">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </audio>
    </xsl:template>
    <xsl:template match="lmht/corpo//botao|lmht/corpo//botão">
        <button>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'acao-formulario' or name() = 'ação-formulário'">
                        <xsl:attribute name="formaction">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'alvo-formulario' or name() = 'alvo-formulário'">
                        <xsl:attribute name="formtarget">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'autofoco'">
                        <xsl:attribute name="autofocus">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'codificacao-formulario' or name() = 'codificação-formulário'">
                        <xsl:attribute name="formenctype">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'desabilitado'">
                        <xsl:attribute name="disabled">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'formulario' or name() = 'formulário'">
                        <xsl:attribute name="form">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'metodo-formulario' or name() = 'método-formulário'">
                        <xsl:attribute name="formmethod">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'nao-validar-formulario' or name() = 'não-validar-formulário'">
                        <xsl:attribute name="formnovalidate">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'nome'">
                        <xsl:attribute name="name">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'tipo'">
                        <xsl:attribute name="type">
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
        </button>
    </xsl:template>
    <xsl:template match="lmht/corpo//canvas">
        <canvas>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'altura'">
                        <xsl:attribute name="height">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'largura'">
                        <xsl:attribute name="width">
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
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
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
    <xsl:template match="lmht/corpo//dados">
        <data>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
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
        </data>
    </xsl:template>
    <xsl:template match="lmht/corpo//definicao|lmht/corpo//definição">
        <dfn>
            <xsl:apply-templates select="@*|node()" />
        </dfn>
    </xsl:template>
    <xsl:template match="lmht/corpo//detalhes">
        <details>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'open'">
                        <xsl:attribute name="abertos">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
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
                    <xsl:when test="name() = 'formulario' or name() = 'formulário'">
                        <xsl:attribute name="form">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
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
    <xsl:template match="lmht/corpo//excluido|lmht/corpo//excluído">
        <del>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'citar'">
                        <xsl:attribute name="cite">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'data'">
                        <xsl:attribute name="datetime">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </del>
    </xsl:template>
    <xsl:template match="lmht/corpo//exemplo">
        <samp>
            <xsl:apply-templates select="@*|node()" />
        </samp>
    </xsl:template>
    <xsl:template match="lmht/corpo//figura">
        <figure>
            <xsl:apply-templates select="@*|node()" />
        </figure>
    </xsl:template>
    <xsl:template match="lmht/corpo//figura/descricao|lmht/corpo//figura/descriçao|lmht/corpo//figura/descrição">
        <figcaption>
            <xsl:apply-templates select="@*|node()" />
        </figcaption>
    </xsl:template>

    <!-- Formulários -->
    <xsl:template match="lmht/corpo//formulario|lmht/corpo//formulário">
        <form>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'acao' or name() = 'ação'">
                        <xsl:attribute name="action">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'aceita-codificacao-texto' or name() = 'aceita-codificação-texto'">
                        <xsl:attribute name="accept-charset">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'alvo'">
                        <xsl:attribute name="target">
                            <xsl:call-template name="ProcessarAlvos">
                                <xsl:with-param name="Alvo" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'autocompletar'">
                        <xsl:attribute name="autocomplete">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'codificacao' or name() = 'codificação'">
                        <xsl:attribute name="enctype">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'metodo' or name() = 'método'">
                        <xsl:attribute name="method">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'nome'">
                        <xsl:attribute name="name">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'nao-validar' or name() = 'não-validar'">
                        <xsl:attribute name="novalidate">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'relacionamento'">
                        <xsl:attribute name="rel">
                            <xsl:call-template name="ProcessarRelacionamentos">
                                <xsl:with-param name="Relacionamento" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </form>
    </xsl:template>
    <xsl:template match="lmht/corpo//formulario/campos|lmht/corpo//formulário/campos">
        <fieldset>
            <xsl:apply-templates select="@*|node()" />
        </fieldset>
    </xsl:template>
    <xsl:template match="lmht/corpo//formulario/campos/campo|lmht/corpo//formulário/campos/campo|lmht/corpo//formulario/campo|lmht/corpo//formulário/campo">
        <input>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'aceita'">
                        <xsl:attribute name="accept">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'altura'">
                        <xsl:attribute name="height">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'autocompletar'">
                        <xsl:attribute name="autocomplete">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'autofoco'">
                        <xsl:attribute name="autofocus">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'direcao-texto' or name() = 'direção-texto'">
                        <xsl:attribute name="dirname">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'formulario' or name() = 'formulário'">
                        <xsl:attribute name="form">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'largura'">
                        <xsl:attribute name="width">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'nome'">
                        <xsl:attribute name="name">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'obrigatorio' or name() = 'obrigatório'">
                        <xsl:attribute name="required">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'selecionado'">
                        <xsl:attribute name="checked">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'tamanho'">
                        <xsl:attribute name="size">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'tipo'">
                        <xsl:attribute name="type">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'value'">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
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
                    <xsl:when test="name() = 'estilo'">
                        <xsl:attribute name="style">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'largura'">
                        <xsl:attribute name="width">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'legenda'">
                        <xsl:attribute name="alt">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'mapa'">
                        <xsl:attribute name="usemap">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
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
    <xsl:template match="lmht/corpo//inserido">
        <ins>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'citar'">
                        <xsl:attribute name="cite">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'data'">
                        <xsl:attribute name="datetime">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </ins>
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
    <xsl:template match="lmht/corpo//ligacao|lmht/corpo//ligação">
        <a>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'alvo'">
                        <xsl:attribute name="target">
                            <xsl:call-template name="ProcessarAlvos">
                                <xsl:with-param name="Alvo" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'destino'">
                        <xsl:attribute name="href">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'idioma'">
                        <xsl:attribute name="hreflang">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'midia' or name() = 'mídia'">
                        <xsl:attribute name="media">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'nome-arquivo'">
                        <xsl:attribute name="download">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'politica-referencia' or name() = 'política-referência'">
                        <xsl:attribute name="referrerpolicy">
                            <xsl:call-template name="ProcessarPoliticasReferenciador">
                                <xsl:with-param name="Politica" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'relacionamento'">
                        <xsl:attribute name="rel">
                            <xsl:call-template name="ProcessarRelacionamentos">
                                <xsl:with-param name="Relacionamento" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'tipo'">
                        <xsl:attribute name="type">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </a>
    </xsl:template>
    <xsl:template match="lmht/corpo//linha-horizontal">
        <hr />
    </xsl:template>

    <!-- Listas -->
    <xsl:template match="lmht/corpo//lista-definicoes|lmht/corpo//lista-definiçoes|lmht/corpo//lista-definições">
        <dl>
            <xsl:apply-templates select="@*|node()" />
        </dl>
    </xsl:template>
    <xsl:template match="lmht/corpo//lista-definicoes/termo|lmht/corpo//lista-definiçoes/termo|lmht/corpo//lista-definições/termo">
        <dt>
            <xsl:apply-templates select="@*|node()" />
        </dt>
    </xsl:template>
    <xsl:template match="lmht/corpo//lista-definicoes/definicao|lmht/corpo//lista-definiçoes/definicao|lmht/corpo//lista-definições/definicao|lmht/corpo//lista-definicoes/definiçao|lmht/corpo//lista-definiçoes/definiçao|lmht/corpo//lista-definições/definiçao|lmht/corpo//lista-definicoes/definição|lmht/corpo//lista-definiçoes/definição|lmht/corpo//lista-definições/definição">
        <dd>
            <xsl:apply-templates select="@*|node()" />
        </dd>
    </xsl:template>
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
    <xsl:template match="lmht/corpo//lista-pesquisavel/opcao|lmht/corpo//lista-pesquisavel/opçao|lmht/corpo//lista-pesquisavel/opção|lmht/corpo//lista-pesquisável/opcao|lmht/corpo//lista-pesquisável/opçao|lmht/corpo//lista-pesquisável/opção">
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
            <xsl:apply-templates select="node()" />
        </li>
    </xsl:template>

    <xsl:template match="lmht/corpo//mapa">
        <map>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'nome'">
                        <xsl:attribute name="name">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </map>
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
    <xsl:template match="lmht/corpo//modal">
        <dialog>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'aberta'">
                        <xsl:attribute name="open">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="@*|node()" />
        </dialog>
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
    <xsl:template match="lmht/corpo//recurso">
        <source>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'origem'">
                        <xsl:attribute name="src">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </source>
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

    <!-- Seleção -->
    <xsl:template match="lmht/corpo//selecao|lmht/corpo//seleçao|lmht/corpo//seleção">
        <select>
            <xsl:apply-templates select="@*|node()" />
        </select>
    </xsl:template>
    <xsl:template match="lmht/corpo//selecao/grupo-opcoes|lmht/corpo//selecao/grupo-opçoes|lmht/corpo//selecao/grupo-opções|lmht/corpo//seleçao/grupo-opcoes|lmht/corpo//seleçao/grupo-opçoes|lmht/corpo//seleçao/grupo-opções|lmht/corpo//seleção/grupo-opcoes|lmht/corpo//seleção/grupo-opçoes|lmht/corpo//seleção/grupo-opções">
        <optgroup>
            <xsl:apply-templates select="@*|node()" />
        </optgroup>
    </xsl:template>
    <xsl:template match="lmht/corpo//grupo-opcoes/opcao|lmht/corpo//grupo-opcoes/opção|lmht/corpo//grupo-opções/opcao|lmht/corpo//grupo-opções/opção">
        <option>
            <xsl:apply-templates select="@*|node()" />
        </option>
    </xsl:template>
    <xsl:template match="lmht/corpo//selecao/opcao|lmht/corpo//selecao/opçao|lmht/corpo//selecao/opção|lmht/corpo//seleção/opcao|lmht/corpo//seleção/opçao|lmht/corpo//seleção/opção">
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
    <xsl:template match="lmht/corpo//subpagina|lmht/corpo//subpágina">
        <iframe>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'altura'">
                        <xsl:attribute name="height">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'carregamento'">
                        <xsl:attribute name="loading">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'codigo-fonte' or name() = 'código-fonte'">
                        <xsl:attribute name="srcdoc">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'experimentacao' or name() = 'experimentação'">
                        <xsl:attribute name="sandbox">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'largura'">
                        <xsl:attribute name="width">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'nome'">
                        <xsl:attribute name="name">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'origem'">
                        <xsl:attribute name="src">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'permitir'">
                        <xsl:attribute name="allow">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'permitir-tela-cheia'">
                        <xsl:attribute name="allowfullscreen">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'permitir-requisicao-pagamento' or name() = 'permitir-requisição-pagamento'">
                        <xsl:attribute name="allowpaymentrequest">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'politica-referencia' or name() = 'política-referência'">
                        <xsl:attribute name="referrerpolicy">
                            <xsl:call-template name="ProcessarPoliticasReferenciador">
                                <xsl:with-param name="Politica" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="@*|node()" />
        </iframe>
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
    <xsl:template match="lmht/corpo//tabela/grupo-colunas">
        <colgroup>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'numero-colunas' or name() = 'número-colunas'">
                        <xsl:attribute name="span">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </colgroup>
    </xsl:template>
    <xsl:template match="lmht/corpo//tabela/grupo-colunas/coluna">
        <col>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'numero-colunas' or name() = 'número-colunas'">
                        <xsl:attribute name="span">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </col>
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
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'cabecalhos' or name() = 'cabeçalhos'">
                        <xsl:attribute name="headers">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'numero-colunas' or name() = 'número-colunas'">
                        <xsl:attribute name="colspan">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'numero-linhas' or name() = 'número-linhas'">
                        <xsl:attribute name="rowspan">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
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
    <xsl:template match="lmht/corpo//titulo1|lmht/corpo//título1">
        <h1>
            <xsl:apply-templates select="@*|node()" />
        </h1>
    </xsl:template>
    <xsl:template match="lmht/corpo//titulo2|lmht/corpo//título2">
        <h2>
            <xsl:apply-templates select="@*|node()" />
        </h2>
    </xsl:template>
    <xsl:template match="lmht/corpo//titulo3|lmht/corpo//título3">
        <h3>
            <xsl:apply-templates select="@*|node()" />
        </h3>
    </xsl:template>
    <xsl:template match="lmht/corpo//titulo4|lmht/corpo//título4">
        <h4>
            <xsl:apply-templates select="@*|node()" />
        </h4>
    </xsl:template>
    <xsl:template match="lmht/corpo//titulo5|lmht/corpo//título5">
        <h5>
            <xsl:apply-templates select="@*|node()" />
        </h5>
    </xsl:template>
    <xsl:template match="lmht/corpo//titulo6|lmht/corpo//título6">
        <h6>
            <xsl:apply-templates select="@*|node()" />
        </h6>
    </xsl:template>
    <xsl:template match="lmht/corpo//variavel|lmht/corpo//variável">
        <var>
            <xsl:apply-templates select="@*|node()" />
        </var>
    </xsl:template>
    <xsl:template match="lmht/corpo//video|lmht/corpo//vídeo">
        <video>
            <xsl:apply-templates select="@*|node()" />
        </video>
    </xsl:template>
</xsl:transform>