<!-- <?xml version="1.0" encoding="UTF-8"?> -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output omit-xml-declaration="yes" indent="yes"/>

<xsl:template match="/">

<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <fo:layout-master-set>
    <fo:simple-page-master master-name="master"
          margin-right="1.5cm"
          margin-left="1.5cm"
          margin-bottom="2cm"
          margin-top="1cm"
          page-width="8in"
          page-height="11in">
      <fo:region-body margin-top="1cm"/>
      <fo:region-before extent="1cm"/>
      <fo:region-after extent="1.5cm"/>
    </fo:simple-page-master>
  </fo:layout-master-set>

  <fo:page-sequence master-reference="master">
  	<fo:flow flow-name="xsl-region-body">
  		<fo:block text-align="center" content-width="auto" font-family="sans-serif">
	  		<fo:block font-size="20pt" margin-left="2in" margin-right="2in" text-decoration="underline" font-weight="bold">
	  			Sales by Date 
	        </fo:block>

	  		<fo:table border-style="solid" border-width="1px" border-color="black" text-align="center" content-width="auto">
				<fo:table-column/>
				<fo:table-column/>
				<fo:table-column/>
				<fo:table-column/>
				<fo:table-column/>

				<fo:table-header>
					<fo:table-row>
					    <fo:table-cell border-style="solid" border-width="1px" border-color="black" text-align="center" padding="7px" font-weight="bold">
					        <fo:block font-weight="bold" text-align="center">Date</fo:block>
					    </fo:table-cell>

					    <fo:table-cell border-style="solid" border-width="1px" border-color="black" text-align="center" padding="7px" font-weight="bold">
					        <fo:block font-weight="bold">Amount</fo:block>
					    </fo:table-cell>

					    <fo:table-cell border-style="solid" border-width="1px" border-color="black" text-align="center" padding="7px" font-weight="bold">
					        <fo:block font-weight="bold">Paid</fo:block>
					    </fo:table-cell>

					    <fo:table-cell border-style="solid" border-width="1px" border-color="black" text-align="center" padding="7px" font-weight="bold">
					        <fo:block font-weight="bold">Description</fo:block>
					    </fo:table-cell>

					    <fo:table-cell border-style="solid" border-width="1px" border-color="black" text-align="center" padding="7px" font-weight="bold">
					        <fo:block font-weight="bold">Salesperson</fo:block>
					    </fo:table-cell>
					</fo:table-row>
				</fo:table-header>

				<xsl:variable name="totalSales" select="sum(//amount)" />
	      		<xsl:variable name="counted" select="count(//amount)" />

				<fo:table-footer>
					<fo:table-row>
					    <fo:table-cell number-columns-spanned="5" border-style="solid" border-width="1px" border-color="black" text-align="center" padding="7px">
					        <fo:block>Number of sales: 
					        	<xsl:value-of select="$counted"/>
					        </fo:block>
					    </fo:table-cell>
					</fo:table-row>
					<fo:table-row>
					    <fo:table-cell number-columns-spanned="5" border-style="solid" border-width="1px" border-color="black" text-align="center" padding="7px">
					        <fo:block>Total sales:  
					        	<xsl:value-of select="format-number($totalSales, '$###,##0.00')"/>
					        </fo:block>
					    </fo:table-cell>
					</fo:table-row>
					<fo:table-row>
					    <fo:table-cell number-columns-spanned="5" border-style="solid" border-width="1px" border-color="black" text-align="center" padding="7px">
					        <fo:block>Average sale: 
					        	<xsl:value-of select="format-number( ($totalSales div $counted), '$###,##0.00')"/>
					        </fo:block>
					    </fo:table-cell>
					</fo:table-row>
				</fo:table-footer>

				<fo:table-body>
					<xsl:for-each select="sales/sale">
						<fo:table-row>

						    <fo:table-cell border-style="solid" border-width="1px" border-color="black" text-align="center" padding="7px">
						        <fo:block>
									<xsl:value-of select="@date" />
						        </fo:block>
						    </fo:table-cell>

						    <fo:table-cell border-style="solid" border-width="1px" border-color="black" text-align="right" padding="7px">
						      	<fo:block>
						      		<xsl:value-of select="amount" />
						      	</fo:block>
						    </fo:table-cell>

						    <fo:table-cell border-style="solid" border-width="1px" border-color="black" text-align="right" padding="7px">
						      	<fo:block>
									<xsl:value-of select="paid" />
						      	</fo:block>
						    </fo:table-cell>

						    <fo:table-cell border-style="solid" border-width="1px" border-color="black" text-align="center" padding="7px" width="85px">
						      	<fo:block>
									<xsl:value-of select="description" />
						      	</fo:block>
						    </fo:table-cell>

						    <fo:table-cell border-style="solid" border-width="1px" border-color="black" text-align="center" padding="7px" width="100px">
						      	<fo:block>
									<xsl:value-of select="salesperson" />
						      	</fo:block>
						    </fo:table-cell>

						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>

			</fo:table>
		</fo:block>
	</fo:flow>
  </fo:page-sequence>
</fo:root>
</xsl:template>
</xsl:stylesheet>