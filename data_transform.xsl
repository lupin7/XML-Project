<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />


<xsl:template match="mysqldump">
  	<xsl:apply-templates select="database" />
</xsl:template>

<xsl:template match="database">
	<sales>
		<xsl:apply-templates select="table_data" />
	</sales>
</xsl:template>

<xsl:template match="table_data">
	<xsl:for-each select="row">
		<xsl:element name="{../@name}">
			<xsl:attribute name="date">
				<xsl:value-of select="field[2]/text()" />
			</xsl:attribute>

			<amount>
				<xsl:value-of select="field[3]/text()" />
			</amount>
			<paid>
				<xsl:value-of select="field[4]/text()" />
			</paid>
			<description>
				<xsl:value-of select="field[5]/text()" />
			</description>
			<salesperson>
				<xsl:value-of select="field[6]/text()" />
			</salesperson>

		</xsl:element>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>