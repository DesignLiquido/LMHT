<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
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

    <!-- Especificação de `corpo` -->
    <xsl:template match="lmht/corpo">
        <body>
            <xsl:apply-templates select="@*|node()" />
        </body>
    </xsl:template>
    <xsl:template match="lmht/corpo//artigo">
        <article>
            <xsl:apply-templates select="@*|node()" />
        </article>
    </xsl:template>
    <xsl:template match="lmht/corpo//codigo|lmht/corpo//código">
        <code>
            <xsl:apply-templates select="@*|node()" />
        </code>
    </xsl:template>

    <!-- Listas -->
    <xsl:template match="lmht/corpo//lista-numerada">
        <ol>
            <xsl:apply-templates select="@*|node()" />
        </ol>
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
    <xsl:template match="lmht/corpo//n|lmht/corpo//negrito">
        <strong>
            <xsl:apply-templates select="@*|node()" />
        </strong>
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

    <!-- Atributos independentes de tags -->
    <xsl:template match="@classe">
        <xsl:attribute name="class">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
</xsl:transform>