<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>

<xsl:template match="/">

<html xml:lang="en" lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title> Sales Report </title>
		<link rel="stylesheet" type="text/css" href="css/sale_report.css"/>
	</head>
 	<body>
 		<h2> Sales by amount </h2>
 	<div>
 		
	<table>
		<thead>
		    <tr>
		      <th class="head">Date</th>
		      <th class="head">Amount</th>
		      <th class="head">Paid</th>
		      <th class="head">Description</th>
		      <th class="head">Salesperson</th>
		    </tr>
	    </thead>
	    <tfoot>
      		<xsl:variable name="totalSales" select="sum(//amount)" />
      		<xsl:variable name="counted" select="count(//amount)" />
      		<tr>
      			<th colspan="5"><strong>Number of sales:  
	      		<xsl:value-of select="$counted"/></strong></th>
	      	</tr>
	      	<tr>
	      		<th colspan="5"><strong>Total sales:  
	      		<xsl:value-of select="format-number($totalSales, '$###,##0.00')"/></strong></th>
	      	</tr>
	      	<tr>
	      		<th colspan="5"><strong>Average Sale:  
	      		<xsl:value-of select="format-number( ($totalSales div $counted), '$###,##0.00')"/></strong></th>
	      	</tr>
      	</tfoot>
	    <tbody>
		<xsl:for-each select="sales/sale">
		<xsl:sort select="amount" data-type="number" order="descending" />
			<tr>
			<xsl:element name="td">
				<xsl:value-of select="@date" />
			</xsl:element>

			<xsl:element name="td">
				<xsl:attribute name="class">right</xsl:attribute>
				<xsl:value-of select="amount" />
			</xsl:element>

			<xsl:element name="td">
				<xsl:attribute name="class">right</xsl:attribute>
				<xsl:value-of select="paid" />
			</xsl:element>

			<xsl:element name="td">
				<xsl:value-of select="description" />
			</xsl:element>

			<xsl:element name="td">
				<xsl:value-of select="salesperson" />
			</xsl:element>
			</tr>
		</xsl:for-each>
		</tbody>
      <!-- <xsl:variable name="amount" select="//amountTotal | //amount" />  --> 
	</table>

	</div>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>