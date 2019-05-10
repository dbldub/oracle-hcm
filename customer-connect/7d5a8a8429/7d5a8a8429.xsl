<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xsl" version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:output encoding="utf-8" method="text"/>
        <xsl:strip-space elements="*"/>
        <xsl:variable name="delimiter" select="'|'"/>
        <xsl:template match="/">

        <!-- header -->
        <xsl:text>Action</xsl:text>
        <xsl:value-of select="$delimiter"/>
        <xsl:text>Company</xsl:text>
        <xsl:value-of select="$delimiter"/>
        <xsl:text>Subunit</xsl:text>

        <!-- newline -->
        <xsl:text>&#xD;</xsl:text>

        <!-- details -->
        <xsl:for-each select="//Assignment_Record">
                <xsl:text>Update</xsl:text>
                <xsl:value-of select="$delimiter"/>
                <xsl:text>Janko LTD.</xsl:text>
                <xsl:value-of select="$delimiter"/>
                <xsl:value-of select="Sub_Unit"/>
                <xsl:text>&#xD;</xsl:text>
        </xsl:for-each>

        </xsl:template>
</xsl:stylesheet>
