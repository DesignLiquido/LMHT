<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.1" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <!-- Seção de _templates_ utilitários -->
    <!-- Os _templates_ abaixo normalmente trabalham com transcrição de valores de atributos LMHT para HTML -->
    <xsl:template name="ProcessarTargets">
        <xsl:param name="Target" />
        <xsl:choose>
            <xsl:when test="$Target = '_self'">_mesmo</xsl:when>
            <xsl:when test="$Target = '_blank'">_novo</xsl:when>
            <xsl:when test="$Target = '_parent'">_pai</xsl:when>
            <xsl:when test="$Target = '_top'">_topo</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="ProcessarReferrerPolicy">
        <xsl:param name="Policy" />
        <xsl:choose>
            <xsl:when test="$Policy = 'unsafe-url'">destino-não-seguro</xsl:when>
            <xsl:when test="$Policy = 'same-origin'">mesma-origem</xsl:when>
            <xsl:when test="$Policy = 'origin'">origem</xsl:when>
            <xsl:when test="$Policy = 'origin-when-cross-origin'">origem-quando-origem-cruzada</xsl:when>
            <xsl:when test="$Policy = 'strict-origin-when-cross-origin'">origem-quando-origem-cruzada-rigorosa</xsl:when>
            <xsl:when test="$Policy = 'no-referrer'">sem-referenciador</xsl:when>
            <xsl:when test="$Policy = 'no-referrer-when-downgrade'">sem-referenciador-ao-rebaixar</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="ProcessarRels">
        <xsl:param name="Rel" />
        <xsl:choose>
            <xsl:when test="$Rel = 'help'">ajuda</xsl:when>
            <xsl:when test="$Rel = 'alternate'">alternativa</xsl:when>
            <xsl:when test="$Rel = 'prev'">anterior</xsl:when>
            <xsl:when test="$Rel = 'author'">autor</xsl:when>
            <xsl:when test="$Rel = 'external'">externo</xsl:when>
            <xsl:when test="$Rel = 'license'">licença</xsl:when>
            <xsl:when test="$Rel = 'bookmark'">marcador</xsl:when>
            <xsl:when test="$Rel = 'nofollow'">não-seguir</xsl:when>
            <xsl:when test="$Rel = 'tag'">palavra-chave</xsl:when>
            <xsl:when test="$Rel = 'search'">pesquisa</xsl:when>
            <xsl:when test="$Rel = 'next'">próximo</xsl:when>
            <xsl:when test="$Rel = 'noreferrer'">sem-anterior</xsl:when>
            <xsl:when test="$Rel = 'noopener'">sem-janela-abertura</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="ProcessarShape">
        <xsl:param name="Shape" />
        <xsl:choose>
            <xsl:when test="$Shape = 'default'">padrão</xsl:when>
            <xsl:when test="$Shape = 'rect'">retangular</xsl:when>
            <xsl:when test="$Shape = 'circle'">circular</xsl:when>
            <xsl:when test="$Shape = 'poly'">polígono</xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- Atributos independentes de tags (globais) -->
    <!-- Por algum motivo, adicionar `id` aqui não funciona. -->
    <!-- Atributo id, portanto, é usado em todas as estruturas de `<corpo>`. -->
    <xsl:template match="@draggable">
        <xsl:attribute name="arrastável">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@accesskey">
        <xsl:attribute name="atalho">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@class">
        <xsl:attribute name="classe">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@contenteditable">
        <xsl:attribute name="conteúdo-editável">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@dir">
        <xsl:attribute name="@direção-texto">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@hidden">
        <xsl:attribute name="escondido">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@style">
        <xsl:attribute name="estilo">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@lang">
        <xsl:attribute name="idioma">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>    
    <xsl:template match="@tabindex">
        <xsl:attribute name="@índice-tab">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@title">
        <xsl:attribute name="título">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@translate">
        <xsl:attribute name="traduzir">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@spellcheck">
        <xsl:attribute name="verificar-grafia">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="/html">
        <lmht>
            <xsl:apply-templates select="node()" />
        </lmht>
    </xsl:template>
    
    <!-- Especificação de `head` -->
    <xsl:template match="/html/head">
        <cabeça>
            <xsl:apply-templates select="@*|node()" />
        </cabeça>
    </xsl:template>
    <xsl:template match="/html/base">
        <base-ligações>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'target'">
                        <xsl:attribute name="alvo">
                            <xsl:call-template name="ProcessarTargets">
                                <xsl:with-param name="Target" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'href'">
                        <xsl:attribute name="prefixo">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </base-ligações>
    </xsl:template>
    <xsl:template match="/html/style">
        <estilo>
            <xsl:apply-templates select="@*|node()" />
        </estilo>
    </xsl:template>
    <xsl:template match="/html/head/meta">
        <meta>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'name'">
                        <xsl:attribute name="nome">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'content'">
                        <xsl:attribute name="conteúdo">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </meta>
    </xsl:template>
    <xsl:template match="/html/head/link">
        <recurso>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'href'">
                        <xsl:attribute name="destino">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'rel'">
                        <xsl:attribute name="tipo">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </recurso>
    </xsl:template>
    <xsl:template match="/html/head/title">
        <título>
            <xsl:apply-templates select="@*|node()" />
        </título>
    </xsl:template>

    <!-- Especificação de `body` -->
    <xsl:template match="/html/body">
        <corpo>
            <xsl:apply-templates select="@*|node()" />
        </corpo>
    </xsl:template>
    <xsl:template match="/html/body//abbr">
        <abreviação>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'title'">
                        <xsl:attribute name="título">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </abreviação>
    </xsl:template>
    <xsl:template match="/html/body//aside">
        <aparte>
            <xsl:apply-templates select="@*|node()" />
        </aparte>
    </xsl:template>
    <xsl:template match="/html/body//area">
        <área>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'target'">
                        <xsl:attribute name="alvo">
                            <xsl:call-template name="ProcessarTargets">
                                <xsl:with-param name="Target" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'coords'">
                        <xsl:attribute name="coordenadas">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'href'">
                        <xsl:attribute name="destino">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'shape'">
                        <xsl:attribute name="forma">
                            <xsl:call-template name="ProcessarShape">
                                <xsl:with-param name="Shape" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'alt'">
                        <xsl:attribute name="legenda">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'media'">
                        <xsl:attribute name="mídia">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'href'">
                        <xsl:attribute name="origem">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'type'">
                        <xsl:attribute name="tipo">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </área>
    </xsl:template>
    <xsl:template match="/html/body//textarea">
        <área-texto>
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
                    <xsl:when test="name() = 'dirname'">
                        <xsl:attribute name="direção-texto">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'disabled'">
                        <xsl:attribute name="desabilitada">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'form'">
                        <xsl:attribute name="formulario">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'maxlength'">
                        <xsl:attribute name="largura-máxima">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'name'">
                        <xsl:attribute name="nome">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'placeholder'">
                        <xsl:attribute name="dica-campo">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'readonly'">
                        <xsl:attribute name="somente-leitura">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'required'">
                        <xsl:attribute name="obrigatório">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'rows'">
                        <xsl:attribute name="linhas">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'wrap'">
                        <xsl:attribute name="quebra-automática">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </área-texto>
    </xsl:template>
    <xsl:template match="/html/body//article">
        <artigo>
            <xsl:apply-templates select="@*|node()" />
        </artigo>
    </xsl:template>
    <xsl:template match="/html/body//q">
        <aspas>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'cite'">
                        <xsl:attribute name="citar">
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
        </aspas>
    </xsl:template>
    <xsl:template match="/html/body//audio">
        <áudio>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'controls'">
                        <xsl:attribute name="controles">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'autoplay'">
                        <xsl:attribute name="início-automático">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'name'">
                        <xsl:attribute name="nome">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'muted'">
                        <xsl:attribute name="mudo">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'src'">
                        <xsl:attribute name="origem">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'preload'">
                        <xsl:attribute name="pré-carregar">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'loop'">
                        <xsl:attribute name="repetir">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </áudio>
    </xsl:template>
    <xsl:template match="/html/body//button">
        <botão>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'formaction'">
                        <xsl:attribute name="ação-formulário">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'formtarget'">
                        <xsl:attribute name="alvo-formulário">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'autofocus'">
                        <xsl:attribute name="autofoco">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'formenctype'">
                        <xsl:attribute name="codificação-formulário">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'disabled'">
                        <xsl:attribute name="desabilitado">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'form'">
                        <xsl:attribute name="formulário">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'formmethod'">
                        <xsl:attribute name="método-formulário">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'formnovalidate'">
                        <xsl:attribute name="não-validar-formulário">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'name'">
                        <xsl:attribute name="nome">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'type'">
                        <xsl:attribute name="tipo">
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
        </botão>
    </xsl:template>
    <xsl:template match="/html/body//canvas">
        <canvas>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'height'">
                        <xsl:attribute name="altura">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'width'">
                        <xsl:attribute name="largura">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </canvas>
    </xsl:template>
    <xsl:template match="/html/body//header">
        <cabeçalho>
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
        </cabeçalho>
    </xsl:template>
    <xsl:template match="/html/body//blockquote">
        <citação>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'cite'">
                        <xsl:attribute name="citar">
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
        </citação>
    </xsl:template>
    <xsl:template match="/html/body//cite">
        <citar>
            <xsl:apply-templates select="@*|node()" />
        </citar>
    </xsl:template>
    <xsl:template match="/html/body//code">
        <código>
            <xsl:apply-templates select="@*|node()" />
        </código>
    </xsl:template>
    <xsl:template match="/html/body//data">
        <dados>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
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
        </dados>
    </xsl:template>
    <xsl:template match="/html/body//dfn">
        <definição>
            <xsl:apply-templates select="@*|node()" />
        </definição>
    </xsl:template>
    <xsl:template match="/html/body//details">
        <detalhes>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'abertos'">
                        <xsl:attribute name="open">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </detalhes>
    </xsl:template>
    <xsl:template match="/html/body//details/summary">
        <sumário>
            <xsl:apply-templates select="@*|node()" />
        </sumário>
    </xsl:template>
    <xsl:template match="/html/body//div">
        <divisão>
            <xsl:apply-templates select="@*|node()" />
        </divisão>
    </xsl:template>
    <xsl:template match="/html/body//address">
        <endereço>
            <xsl:apply-templates select="@*|node()" />
        </endereço>
    </xsl:template>
    <xsl:template match="/html/body//span">
        <envelope-texto>
            <xsl:apply-templates select="@*|node()" />
        </envelope-texto>
    </xsl:template>
    <xsl:template match="/html/body//label">
        <etiqueta>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'form'">
                        <xsl:attribute name="formulário">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'for'">
                        <xsl:attribute name="para">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </etiqueta>
    </xsl:template>
    <xsl:template match="/html/body//del">
        <excluído>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'cite'">
                        <xsl:attribute name="citar">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'datetime'">
                        <xsl:attribute name="data">
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
        </excluído>
    </xsl:template>
    <xsl:template match="/html/body//samp">
        <exemplo>
            <xsl:apply-templates select="@*|node()" />
        </exemplo>
    </xsl:template>
    <xsl:template match="/html/body//figure">
        <figura>
            <xsl:apply-templates select="@*|node()" />
        </figura>
    </xsl:template>
    <xsl:template match="/html/body//figure/figcaption">
        <descrição>
            <xsl:apply-templates select="@*|node()" />
        </descrição>
    </xsl:template>

    <!-- Formulários -->
    <xsl:template match="/html/body//form">
        <formulário>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'action'">
                        <xsl:attribute name="ação">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'accept-charset'">
                        <xsl:attribute name="aceita-codificação-texto">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'target'">
                        <xsl:attribute name="alvo">
                            <xsl:call-template name="ProcessarTargets">
                                <xsl:with-param name="Target" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'autocomplete'">
                        <xsl:attribute name="autocompletar">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'enctype'">
                        <xsl:attribute name="codificação">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'method'">
                        <xsl:attribute name="método">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'name'">
                        <xsl:attribute name="nome">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'novalidate'">
                        <xsl:attribute name="não-validar">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'rel'">
                        <xsl:attribute name="relacionamento">
                            <xsl:call-template name="ProcessarRels">
                                <xsl:with-param name="Rel" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </formulário>
    </xsl:template>
    <xsl:template match="/html/body//form/fieldset">
        <campos>
            <xsl:apply-templates select="@*|node()" />
        </campos>
    </xsl:template>
    <xsl:template match="/html/body//form/fieldset/input|html/body//form/input">
        <campo>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'accept'">
                        <xsl:attribute name="aceita">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'height'">
                        <xsl:attribute name="altura">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'autocomplete'">
                        <xsl:attribute name="autocompletar">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'autofocus'">
                        <xsl:attribute name="autofoco">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'dirname'">
                        <xsl:attribute name="direção-texto">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'form'">
                        <xsl:attribute name="formulário">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'width'">
                        <xsl:attribute name="largura">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'name'">
                        <xsl:attribute name="nome">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'required'">
                        <xsl:attribute name="obrigatório">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'checked'">
                        <xsl:attribute name="selecionado">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'size'">
                        <xsl:attribute name="tamanho">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'type'">
                        <xsl:attribute name="tipo">
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
        </campo>
    </xsl:template>
    
    <xsl:template match="/html/body//form/legend">
        <título>
            <xsl:apply-templates select="@*|node()" />
        </título>
    </xsl:template>
    <xsl:template match="/html/body//img">
        <imagem>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'height'">
                        <xsl:attribute name="altura">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'style'">
                        <xsl:attribute name="estilo">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'width'">
                        <xsl:attribute name="largura">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'alt'">
                        <xsl:attribute name="legenda">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'usemap'">
                        <xsl:attribute name="mapa">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'src'">
                        <xsl:attribute name="origem">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </imagem>
    </xsl:template>
    <xsl:template match="/html/body//template">
        <invisível>
            <xsl:apply-templates select="@*|node()" />
        </invisível>
    </xsl:template>
    <xsl:template match="/html/body//em">
        <itálico>
            <xsl:apply-templates select="@*|node()" />
        </itálico>
    </xsl:template>
    <xsl:template match="/html/body//a">
        <ligação>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'target'">
                        <xsl:attribute name="alvo">
                            <xsl:call-template name="ProcessarTargets">
                                <xsl:with-param name="Target" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'href'">
                        <xsl:attribute name="destino">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'hreflang'">
                        <xsl:attribute name="idioma">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'media'">
                        <xsl:attribute name="mídia">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'download'">
                        <xsl:attribute name="nome-arquivo">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'referrerpolicy'">
                        <xsl:attribute name="política-referência">
                            <xsl:call-template name="ProcessarReferrerPolicy">
                                <xsl:with-param name="Policy" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'rel'">
                        <xsl:attribute name="relacionamento">
                            <xsl:call-template name="ProcessarRels">
                                <xsl:with-param name="Rel" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'type'">
                        <xsl:attribute name="tipo">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </ligação>
    </xsl:template>
    <xsl:template match="/html/body//hr">
        <linha-horizontal />
    </xsl:template>

    <!-- Listas -->
    <xsl:template match="/html/body//dl">
        <lista-definições>
            <xsl:apply-templates select="@*|node()" />
        </lista-definições>
    </xsl:template>
    <xsl:template match="/html/body//dl/dt">
        <termo>
            <xsl:apply-templates select="@*|node()" />
        </termo>
    </xsl:template>
    <xsl:template match="/html/body//dl/dd">
        <definição>
            <xsl:apply-templates select="@*|node()" />
        </definição>
    </xsl:template>
    <xsl:template match="/html/body//ol">
        <lista-numerada>
            <xsl:apply-templates select="@*|node()" />
        </lista-numerada>
    </xsl:template>
    <xsl:template match="/html/body//datalist">
        <lista-pesquisável>
            <xsl:apply-templates select="@*|node()" />
        </lista-pesquisável>
    </xsl:template>
    <xsl:template match="/html/body//datalist/option">
        <opção>
            <xsl:apply-templates select="@*|node()" />
        </opção>
    </xsl:template>
    <xsl:template match="/html/body//ul">
        <lista-simples>
            <xsl:apply-templates select="@*|node()" />
        </lista-simples>
    </xsl:template>
    <xsl:template match="/html/body//ol/li|html/body//ul/li">
        <item-lista>
            <xsl:apply-templates select="node()" />
        </item-lista>
    </xsl:template>

    <xsl:template match="/html/body//map">
        <mapa>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'name'">
                        <xsl:attribute name="nome">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </mapa>
    </xsl:template>
    <xsl:template match="/html/body//mark">
        <marca>
            <xsl:apply-templates select="@*|node()" />
        </marca>
    </xsl:template>
    <xsl:template match="/html/body//meter">
        <medidor>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'max'">
                        <xsl:attribute name="máximo">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'min'">
                        <xsl:attribute name="mínimo">
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
        </medidor>
    </xsl:template>
    <xsl:template match="/html/body//dialog">
        <modal>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'open'">
                        <xsl:attribute name="aberta">
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
        </modal>
    </xsl:template>
    <xsl:template match="/html/body//nav">
        <navegação>
            <xsl:apply-templates select="@*|node()" />
        </navegação>
    </xsl:template>
    <xsl:template match="/html/body//strong">
        <negrito>
            <xsl:apply-templates select="@*|node()" />
        </negrito>
    </xsl:template>
    <xsl:template match="/html/body//object">
        <objeto>
            <xsl:apply-templates select="@*|node()" />
        </objeto>
    </xsl:template>
    <xsl:template match="/html/body//p">
        <parágrafo>
            <xsl:apply-templates select="@*|node()" />
        </parágrafo>
    </xsl:template>
    <xsl:template match="/html/body//pre">
        <preformatado>
            <xsl:apply-templates select="@*|node()" />
        </preformatado>
    </xsl:template>
    <xsl:template match="/html/body//main">
        <principal>
            <xsl:apply-templates select="@*|node()" />
        </principal>
    </xsl:template>
    <xsl:template match="/html/body//progress">
        <progresso>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'max'">
                        <xsl:attribute name="máximo">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'min'">
                        <xsl:attribute name="mínimo">
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
        </progresso>
    </xsl:template>
    <xsl:template match="/html/body//br">
        <quebra-linha />
    </xsl:template>
    <xsl:template match="/html/body//wbr">
        <quebra-linha-oportuna>
            <xsl:apply-templates select="@*|node()" />
        </quebra-linha-oportuna>
    </xsl:template>
    <xsl:template match="/html/body//source">
        <recurso>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'src'">
                        <xsl:attribute name="origem">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </recurso>
    </xsl:template>
    <xsl:template match="/html/body//s">
        <riscado>
            <xsl:apply-templates select="@*|node()" />
        </riscado>
    </xsl:template>
    <xsl:template match="/html/body//script">
        <script>
            <xsl:apply-templates select="@*|node()" />
        </script>
    </xsl:template>
    <xsl:template match="/html/body//section">
        <seção>
            <xsl:apply-templates select="@*|node()" />
        </seção>
    </xsl:template>

    <!-- Seleção -->
    <xsl:template match="/html/body//select">
        <seleção>
            <xsl:apply-templates select="@*|node()" />
        </seleção>
    </xsl:template>
    <xsl:template match="/html/body//select/optgroup">
        <grupo-opções>
            <xsl:apply-templates select="@*|node()" />
        </grupo-opções>
    </xsl:template>
    <xsl:template match="/html/body//optgroup/option|html/body//select/option">
        <opção>
            <xsl:apply-templates select="@*|node()" />
        </opção>
    </xsl:template>

    <xsl:template match="/html/body//noscript">
        <sem-script>
            <xsl:apply-templates select="@*|node()" />
        </sem-script>
    </xsl:template>
    <xsl:template match="/html/body//sup">
        <sobrescrito>
            <xsl:apply-templates select="@*|node()" />
        </sobrescrito>
    </xsl:template>
    <xsl:template match="/html/body//iframe">
        <subpágina>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'height'">
                        <xsl:attribute name="altura">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'loading'">
                        <xsl:attribute name="carregamento">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'srcdoc'">
                        <xsl:attribute name="código-fonte">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'sandbox'">
                        <xsl:attribute name="experimentação">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'width'">
                        <xsl:attribute name="largura">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'name'">
                        <xsl:attribute name="nome">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'src'">
                        <xsl:attribute name="origem">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'allow'">
                        <xsl:attribute name="permitir">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'allowfullscreen'">
                        <xsl:attribute name="permitir-tela-cheia">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'allowpaymentrequest'">
                        <xsl:attribute name="permitir-requisição-pagamento">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'referrerpolicy'">
                        <xsl:attribute name="política-referência">
                            <xsl:call-template name="ProcessarReferrerPolicy">
                                <xsl:with-param name="Policy" select="." />
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="@*|node()" />
        </subpágina>
    </xsl:template>
    <xsl:template match="/html/body//u">
        <sublinhado>
            <xsl:apply-templates select="@*|node()" />
        </sublinhado>
    </xsl:template>
    <xsl:template match="/html/body//sub">
        <subscrito>
            <xsl:apply-templates select="@*|node()" />
        </subscrito>
    </xsl:template>

    <!-- Tabelas -->
    <xsl:template match="/html/body//table">
        <tabela>
            <xsl:apply-templates select="@*|node()" />
        </tabela>
    </xsl:template>
    <xsl:template match="/html/body//table/colgroup">
        <grupo-colunas>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'span'">
                        <xsl:attribute name="número-colunas">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </grupo-colunas>
    </xsl:template>
    <xsl:template match="/html/body//table/colgroup/col">
        <coluna>
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
        </coluna>
    </xsl:template>
    <xsl:template match="/html/body//table/thead">
        <cabeça-tabela>
            <xsl:apply-templates select="@*|node()" />
        </cabeça-tabela>
    </xsl:template>
    <xsl:template match="/html/body//table/thead/tr">
        <linha>
            <xsl:apply-templates select="@*|node()" />
        </linha>
    </xsl:template>
    <xsl:template match="/html/body//table/thead/tr/th">
        <célula>
            <xsl:apply-templates select="@*|node()" />
        </célula>
    </xsl:template>
    <xsl:template match="/html/body//table/tbody">
        <corpo-tabela>
            <xsl:apply-templates select="@*|node()" />
        </corpo-tabela>
    </xsl:template>
    <xsl:template match="/html/body//table/tbody/tr">
        <linha>
            <xsl:apply-templates select="@*|node()" />
        </linha>
    </xsl:template>
    <xsl:template match="/html/body//table/tbody/tr/td">
        <célula>
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name() = 'headers'">
                        <xsl:attribute name="cabeçalhos">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'id'">
                        <xsl:attribute name="id">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'colspan'">
                        <xsl:attribute name="número-colunas">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="name() = 'rowspan'">
                        <xsl:attribute name="número-linhas">
                            <xsl:value-of select="." />
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="node()" />
        </célula>
    </xsl:template>
    <xsl:template match="/html/body//table/tfoot">
        <rodapé>
            <xsl:apply-templates select="@*|node()" />
        </rodapé>
    </xsl:template>
    <xsl:template match="/html/body//table/caption">
        <título>
            <xsl:apply-templates select="@*|node()" />
        </título>
    </xsl:template>

    <xsl:template match="/html/body//kbd">
        <teclado>
            <xsl:apply-templates select="@*|node()" />
        </teclado>
    </xsl:template>
    <xsl:template match="/html/body//time">
        <tempo>
            <xsl:apply-templates select="@*|node()" />
        </tempo>
    </xsl:template>
    <xsl:template match="/html/body//small">
        <texto-pequeno>
            <xsl:apply-templates select="@*|node()" />
        </texto-pequeno>
    </xsl:template>

    <!-- Títulos -->
    <xsl:template match="/html/body//h1">
        <título1>
            <xsl:apply-templates select="@*|node()" />
        </título1>
    </xsl:template>
    <xsl:template match="/html/body//h2">
        <título2>
            <xsl:apply-templates select="@*|node()" />
        </título2>
    </xsl:template>
    <xsl:template match="/html/body//h3">
        <título3>
            <xsl:apply-templates select="@*|node()" />
        </título3>
    </xsl:template>
    <xsl:template match="/html/body//h4">
        <título4>
            <xsl:apply-templates select="@*|node()" />
        </título4>
    </xsl:template>
    <xsl:template match="/html/body//h5">
        <título5>
            <xsl:apply-templates select="@*|node()" />
        </título5>
    </xsl:template>
    <xsl:template match="/html/body//h6">
        <título6>
            <xsl:apply-templates select="@*|node()" />
        </título6>
    </xsl:template>
</xsl:transform>
