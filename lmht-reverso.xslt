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
    <xsl:template name="ProcessarShape">
        <xsl:param name="Shape" />
        <xsl:choose>
            <xsl:when test="$Shape = 'default'">padrão</xsl:when>
            <xsl:when test="$Shape = 'rect'">retangular</xsl:when>
            <xsl:when test="$Shape = 'circle'">circular</xsl:when>
            <xsl:when test="$Shape = 'poly'">polígono</xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- Especificação de `head` -->
    <xsl:template match="html/head">
        <cabeça>
            <xsl:apply-templates select="@*|node()" />
        </cabeça>
    </xsl:template>
    <xsl:template match="html/base">
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
    <xsl:template match="html/style">
        <estilo>
            <xsl:apply-templates select="@*|node()" />
        </estilo>
    </xsl:template>
    <xsl:template match="html/head/meta">
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
    <xsl:template match="html/head/link">
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
    <xsl:template match="html/head/title">
        <título>
            <xsl:apply-templates select="@*|node()" />
        </título>
    </xsl:template>

    <!-- Especificação de `body` -->
    <xsl:template match="html/body">
        <corpo>
            <xsl:apply-templates select="@*|node()" />
        </corpo>
    </xsl:template>
    <xsl:template match="html/body//abbr">
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
    <xsl:template match="html/body//aside">
        <aparte>
            <xsl:apply-templates select="@*|node()" />
        </aparte>
    </xsl:template>
    <xsl:template match="html/body//area">
        <area>
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
    <xsl:template match="html/body//textarea">
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
    <xsl:template match="html/body//article">
        <artigo>
            <xsl:apply-templates select="@*|node()" />
        </artigo>
    </xsl:template>
    <xsl:template match="html/body//q">
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
</xsl:transform>
