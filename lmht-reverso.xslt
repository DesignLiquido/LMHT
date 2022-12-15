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
    
    <!-- Especificação de `head` -->
    <xsl:template match="html/head">
        <cabeça>
            <xsl:apply-templates select="@*|node()" />
        </cabeça>
    </xsl:template>
    <xsl:template match="lmht/cabeca/base-ligacoes|lmht/cabeca/|lmht/cabeça/base-ligacoes|lmht/cabeça/base-ligações">
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
    <xsl:template match="lmht/cabeca/estilo|lmht/cabeça/estilo">
        <style>
            <xsl:apply-templates select="@*|node()" />
        </style>
    </xsl:template>
</xsl:transform>
