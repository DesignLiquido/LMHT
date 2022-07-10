<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="lmht">
        <html><xsl:apply-templates select="@*|node()" /></html>
    </xsl:template>
    <xsl:template match="corpo">
        <body><xsl:apply-templates select="@*|node()" /></body>
    </xsl:template>
    <xsl:template match="corpo/lista-simples">
        <ul><xsl:apply-templates select="@*|node()" /></ul>
    </xsl:template>
    <xsl:template match="corpo/lista-simples">
        <ul><xsl:apply-templates select="@*|node()" /></ul>
    </xsl:template>
    <xsl:template match="corpo/lista-simples/item-lista">
        <li><xsl:apply-templates select="@*|node()" /></li>
    </xsl:template>
    <xsl:template match="corpo/titulo1">
        <h1><xsl:apply-templates select="@*|node()" /></h1>
    </xsl:template>
</xsl:transform>
