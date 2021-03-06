<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:tp="http://www.plazi.org/taxpub"
>

<xsl:output method='html' version='1.0' encoding='utf-8' indent='yes'/>

<xsl:param name="path"/>

<xsl:template match="/">
       <html>
            <head>
                <style type="text/css">	
body {
	margin: 10;
	padding: 10;	
	font-family: Verdana;
	font-size: 11px!important;
	
	line-height:1.5em;
}
h1 {
	line-height:1.5em;
	font-weight:normal;
}
h2 {
	line-height:1.5em;
	font-weight:normal;
	font-family: Helvetica,sans-serif;
}

p{
	margin:0px;
	padding:0px 0px;
	margin-top:10px;
}
tbody{
	font-family: Verdana;
	font-size: 11px!important;
}
                </style>
            </head>
            <body>

	<xsl:apply-templates select="//article-meta"/>
	<xsl:apply-templates select="//abstract"/>
	<xsl:apply-templates select="//body"/>
	<xsl:apply-templates select="//back"/>
	
	<!-- Biodiversity Data Journal -->
	<xsl:apply-templates select="//floats-group"/>

	</body>
	</html>
</xsl:template>

<xsl:template match="//article-meta">


<div>
					<p style="font-size:80%">
						<xsl:value-of select="//journal-meta/journal-title-group/journal-title"/>
						<xsl:text> </xsl:text>
						<xsl:if test="//article-meta/pub-date/day">
							<xsl:value-of select="//article-meta/pub-date/day"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if test="//article-meta/pub-date/month">
							<xsl:choose>
								<xsl:when test="//article-meta/pub-date/month = 1">
									<xsl:text>January</xsl:text>
								</xsl:when>
								<xsl:when test="//article-meta/pub-date/month = 2">
									<xsl:text>February</xsl:text>
								</xsl:when>
								<xsl:when test="//article-meta/pub-date/month = 3">
									<xsl:text>March</xsl:text>
								</xsl:when>
								<xsl:when test="//article-meta/pub-date/month = 4">
									<xsl:text>April</xsl:text>
								</xsl:when>
								<xsl:when test="//article-meta/pub-date/month = 5">
									<xsl:text>May</xsl:text>
								</xsl:when>
								<xsl:when test="//article-meta/pub-date/month = 6">
									<xsl:text>June</xsl:text>
								</xsl:when>
								<xsl:when test="//article-meta/pub-date/month = 7">
									<xsl:text>July</xsl:text>
								</xsl:when>
								<xsl:when test="//article-meta/pub-date/month = 8">
									<xsl:text>August</xsl:text>
								</xsl:when>
								<xsl:when test="//article-meta/pub-date/month = 9">
									<xsl:text>September</xsl:text>
								</xsl:when>
								<xsl:when test="//article-meta/pub-date/month = 10">
									<xsl:text>October</xsl:text>
								</xsl:when>
								<xsl:when test="//article-meta/pub-date/month = 11">
									<xsl:text>November</xsl:text>
								</xsl:when>
								<xsl:when test="//article-meta/pub-date/month = 12">
									<xsl:text>December</xsl:text>
								</xsl:when>
							</xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:value-of select="//article-meta/pub-date/year"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="//article-meta/volume"/>
						<xsl:if test="//article-meta/issue">
							<xsl:text>(</xsl:text>
							<xsl:value-of select="//article-meta/issue"/>
							<xsl:text>)</xsl:text>
						</xsl:if>
						<xsl:text>: </xsl:text>
						<xsl:if test="//article-meta/fpage">
							<xsl:value-of select="//article-meta/fpage"/>
							<xsl:text>-</xsl:text>
							<xsl:value-of select="//article-meta/lpage"/>
						</xsl:if>
						<xsl:if test="//article-meta/elocation-id">
							<xsl:value-of select="//article-meta/elocation-id"/>
						</xsl:if>
						
					</p>
				</div>


	<h1><xsl:value-of select="//article-title" /></h1>
	<xsl:apply-templates select="//contrib-group"/>
	<ul>
		<xsl:apply-templates select="//article-id"/>
		<xsl:apply-templates select="//self-uri[@content-type='lsid']"/>
	</ul>
</xsl:template>

<xsl:template match="article-id">
	<xsl:choose>
		<xsl:when test="@pub-id-type='doi'">
			<li>
				<xsl:text>DOI:</xsl:text>
				<xsl:value-of select="." />
			</li>
		</xsl:when>
		<xsl:when test="@pub-id-type='pmid'">
			<li>
				<xsl:text>PMID:</xsl:text>
				<xsl:value-of select="." />
			</li>
		</xsl:when>
		<xsl:when test="@pub-id-type='pmc'">
			<li>
				<xsl:text>PMC</xsl:text>
				<xsl:value-of select="." />
			</li>
		</xsl:when>
		
		<xsl:otherwise />
	</xsl:choose>
</xsl:template>


<!-- ZooBank LSID for article -->
<xsl:template match="//self-uri[@content-type='lsid']">
<li><xsl:value-of select="." /></li>
</xsl:template>

<!-- authors -->
<xsl:template match="//contrib-group">
	<h2>
		<xsl:apply-templates select="contrib"/>
	</h2>
</xsl:template>

    <xsl:template match="contrib">
        <xsl:if test="@contrib-type='author'">
            <xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
            <xsl:value-of select="name/given-names" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="name/surname" />
        </xsl:if>
        
    </xsl:template>

    <xsl:template match="//abstract">
            <xsl:apply-templates/>
     </xsl:template>

    <xsl:template match="//body">
        <xsl:apply-templates select="sec"/>
    </xsl:template>
    
    <xsl:template match="//back">
        <xsl:apply-templates select="ack"/>
        <xsl:apply-templates select="ref-list"/>
    </xsl:template>
    
    <xsl:template match="sec">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- basic elements -->
    <xsl:template match="p"><p><xsl:apply-templates /></p></xsl:template>
    <xsl:template match="italic"><i><xsl:apply-templates /></i></xsl:template>
    <xsl:template match="bold"><b><xsl:apply-templates /></b></xsl:template>
    <xsl:template match="list">
    	<ol>
			<xsl:choose>
				<xsl:when test="@list-type='alpha-lower'">
					<xsl:attribute name="type">
						<xsl:text>a</xsl:text>
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>    		
						<xsl:apply-templates />
				</xsl:otherwise>
			</xsl:choose>
    		<xsl:apply-templates />
    	</ol>
    </xsl:template>
    <xsl:template match="list-item"><li><xsl:apply-templates /></li></xsl:template>

    
    <!-- citations -->
    <xsl:template match="xref">
    	<xsl:choose>
    		<xsl:when test="@ref-type='bibr'">
				<a> 
					<xsl:attribute name="href">
						<xsl:text>#</xsl:text>
						<xsl:value-of select="@rid" />
					</xsl:attribute>
					<xsl:apply-templates />
				</a>
			</xsl:when>
			<xsl:otherwise>    		
					<xsl:apply-templates />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- links to data -->
    <xsl:template match="ext-link">
    	<xsl:choose>
    		<xsl:when test="ext-link-type='gen'">
				<span style="background-color:blue;color:white;">
					<xsl:apply-templates />
				</span>
			</xsl:when>
			<xsl:otherwise>    		
				<span style="background-color:green;color:white;"> 
					<xsl:apply-templates />
				</span>
			</xsl:otherwise>
		</xsl:choose>
    </xsl:template>
	
    <!-- named content -->
    <xsl:template match="named-content">
    	<xsl:choose>
    		<xsl:when test="@content-type='taxon-name'">
    		
    			<!-- <xsl:if test="@xlink:href"> -->
					<span style="background-color:blue;color:white;">
						<xsl:value-of select="@xlink:href" />
					</span>
    			<!-- </xsl:if> -->
    			
				<span style="background-color:orange;">
					<xsl:apply-templates />
				</span>
			</xsl:when>
			
    		<xsl:when test="@content-type='taxon-authority'">
				<span style="background-color:pink;color:white;">
					<xsl:apply-templates />
				</span>
			</xsl:when>

    		<xsl:when test="@content-type='taxon-status'">
				<span style="background-color:red;color:white;">
					<xsl:apply-templates />
				</span>
			</xsl:when>

    		<xsl:when test="@content-type='dwc:verbatimCoordinates'">
				<span style="background-color:green;color:white;">
					<xsl:apply-templates />
				</span>
			</xsl:when>
			
    		<xsl:when test="@content-type='comment'">
				<span style="background-color:#CCCCCC;">
					<xsl:apply-templates />
				</span>
			</xsl:when>
			
			
			<xsl:otherwise>    		
				<!-- <span style="background-color:yellow;"> --> 
				<span> 
					<xsl:apply-templates />
				</span>
			</xsl:otherwise>
		</xsl:choose>
    </xsl:template>

	<!-- label -->
    <xsl:template match="label"><b><xsl:apply-templates /></b></xsl:template>

	<!-- title -->
	<xsl:template match="sec/title"><h2><xsl:apply-templates /></h2></xsl:template>
	<xsl:template match="ack/title"><h2><xsl:apply-templates /></h2></xsl:template>

    <xsl:template match="title"><b><xsl:apply-templates /></b></xsl:template>

	<!-- table -->
    <xsl:template match="table"><table><xsl:apply-templates /></table></xsl:template>
    <xsl:template match="tr"><tr><xsl:apply-templates /></tr></xsl:template>
    <xsl:template match="td"><td><xsl:apply-templates /></td></xsl:template>
    
 
	<!-- tp -->
	<!--
          <tp:nomenclature>
            <tp:taxon-name><tp:taxon-name-part taxon-name-part-type="genus">Parasthena</tp:taxon-name-part> (<tp:taxon-name-part taxon-name-part-type="subgenus">Parasthena</tp:taxon-name-part>) <tp:taxon-name-part taxon-name-part-type="species">flexilinea</tp:taxon-name-part></tp:taxon-name>
            <tp:taxon-authority>Warren, 1902</tp:taxon-authority>
            <tp:nomenclature-citation-list>
              <tp:nomenclature-citation>
                <tp:taxon-name><tp:taxon-name-part taxon-name-part-type="genus">Parasthena</tp:taxon-name-part> (<tp:taxon-name-part taxon-name-part-type="subgenus">Parasthena</tp:taxon-name-part>) <tp:taxon-name-part taxon-name-part-type="species">flexilinea</tp:taxon-name-part></tp:taxon-name>
                <comment>
                  <xref ref-type="bibr" rid="B1615067">Warren 1902</xref>
                </comment>
              </tp:nomenclature-citation>
            </tp:nomenclature-citation-list>
          </tp:nomenclature>
	-->
    <xsl:template match="tp:nomenclature"><xsl:apply-templates /></xsl:template>
    <xsl:template match="tp:taxon-name"><xsl:apply-templates /></xsl:template>
    <xsl:template match="tp:taxon-authority"><xsl:apply-templates /></xsl:template>

    <xsl:template match="tp:nomenclature-citation-list"><ul><xsl:apply-templates /></ul></xsl:template>
    <xsl:template match="tp:nomenclature-citation-list/tp:taxon-authority"><li><xsl:apply-templates /></li></xsl:template>
    
 
    <xsl:template match="tp:taxon-name-part">
     	<xsl:choose>
    		<xsl:when test="@taxon-name-part-type='genus'">
    			<i><xsl:value-of select="." /></i>
    		</xsl:when>
    		<xsl:when test="@taxon-name-part-type='subgenus'">
    			<i><xsl:value-of select="." /></i>
    		</xsl:when>
    		<xsl:when test="@taxon-name-part-type='species'">
    			<i><xsl:value-of select="." /></i>
    		</xsl:when>

    		<xsl:when test="@taxon-name-part-type='family'">
    			<font style="font-variant: small-caps"><xsl:value-of select="." /></font>
    		</xsl:when>
    		<xsl:when test="@taxon-name-part-type='subfamily'">
    			<font style="font-variant: small-caps"><xsl:value-of select="." /></font>
    		</xsl:when>
    		
    	    <xsl:otherwise>
    	    	<xsl:value-of select="." />
    	    </xsl:otherwise>
    	</xsl:choose>
    </xsl:template>
		


    <!-- figure -->
    <xsl:template match="fig">
    	<div style="border:1px solid rgb(228,228,228);padding:10px;width:320px;text-align:center;">
					<img>
						<xsl:attribute name="src">
							<!-- 
							<xsl:value-of select="$path" />
							<xsl:text>/</xsl:text>
							<xsl:text>.jpg</xsl:text>
							<xsl:value-of select="graphic/@xlink:href" /> 
							-->
							
							<xsl:text>http://arpha.pensoft.net//showfigure.php?filename=</xsl:text>
							<xsl:value-of select="graphic/@id" /> 
							
						</xsl:attribute>
						<xsl:attribute name="width">
							<xsl:text>300</xsl:text>
						</xsl:attribute>
					</img>    	
    	</div>
    	<div style="clear:both;" />
    	<!-- <div style="border:1px solid rgb(228,228,228);padding:10px;margin-top:10px;"> -->
    	<div>
    		<xsl:apply-templates />
    	</div>
    </xsl:template>
    
    <!--
		<table width="100%" cellspacing="10">
			<tr>
				<td width="346">
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="$path" />
							<xsl:text>/</xsl:text>
							<xsl:value-of select="graphic/@xlink:href" />
							<xsl:text>.jpg</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="width">
							<xsl:text>346</xsl:text>
						</xsl:attribute>
					</img>
				</td>
				<td valign="top">
					<xsl:apply-templates />
				</td>
			</tr>
		</table>
	-->
<!--
<fig id="F2" position="float" orientation="portrait">

                                    <label>Figure 2.</label>

                                    <caption><p><italic><tp:taxon-name>Malvinometopa porcellana</tp:taxon-name></italic> (K.H. Barnard, 1932): Discovery Reports St. 51, Falklands.</p></caption>

                                    <graphic xlink:href="ZooKeys-086-011-g002.jpg" position="float" orientation="portrait" xlink:type="simple"/>

                                </fig>
-->

	<!-- references -->
    <xsl:template match="ref-list">
    	<h2><xsl:value-of select="title" /></h2>
        <ol>
            <xsl:apply-templates select="ref"/>
        </ol>
    </xsl:template>

    <!-- Reference list -->
    <xsl:template match="ref">
        <li>
            <a>
                <xsl:attribute name="name">
                    <xsl:value-of select="@id" />
                </xsl:attribute>
            </a>
            
            <xsl:apply-templates select="mixed-citation"/>
            
            <!-- Hindawi -->
            <xsl:apply-templates select="nlm-citation"/>            
            
            <!-- Biodiversity Data Journal -->
            <xsl:apply-templates select="element-citation"/>
        </li>
    </xsl:template>

    <!-- authors -->
    <xsl:template match="//person-group">
        <xsl:apply-templates select="name"/>
    </xsl:template>
    
    <xsl:template match="name">
        <xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
        <xsl:value-of select="surname" />
        <xsl:text>, </xsl:text>
        <xsl:value-of select="given-names" />
    </xsl:template>

    <!-- a citation -->
    <xsl:template match="mixed-citation | element-citation | nlm-citation">
    	<xsl:choose>
    		<xsl:when test="person-group">
        		<xsl:apply-templates select="person-group"/>
        	</xsl:when>
        	<xsl:otherwise>
        		<xsl:apply-templates select="name"/>
        	</xsl:otherwise>
        </xsl:choose>
        
        <xsl:text> (</xsl:text><xsl:value-of select="year" /><xsl:text>) </xsl:text>

		<xsl:choose>
			<xsl:when test="article-title and volume">
				<b><xsl:value-of select="article-title" /></b>
				<xsl:text>. </xsl:text>							
				<xsl:value-of select="source" />
				<xsl:text> </xsl:text>
				<xsl:value-of select="volume" />
				<xsl:text>:</xsl:text>
				<xsl:value-of select="fpage" />
				<xsl:text>-</xsl:text>
				<xsl:value-of select="lpage" />
			</xsl:when>
			
			<xsl:when test="source and publisher-name and publisher-loc">
				<b><xsl:value-of select="source" /></b>
				<xsl:text>, </xsl:text>
				<xsl:value-of select="publisher-name" />
				<xsl:text>, </xsl:text>
				<xsl:value-of select="publisher-loc" />
			</xsl:when>

			<xsl:when test="chapter-title and source and size">
				<b><xsl:value-of select="chapter-title" /></b>
				<xsl:value-of select="source" />
				<xsl:text>, </xsl:text>
				<xsl:value-of select="size" />
			</xsl:when>

			
		</xsl:choose>
		
		<!-- links -->
		<xsl:for-each select="uri">
			<xsl:choose>
				<xsl:when test="@xlink:type='simple'">
					<span style="background-color:blue;color:white;">
						<xsl:value-of select="." />
					</span>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>

		<!-- identifiers -->
		<xsl:for-each select="ext-link">
			<xsl:choose>
				<xsl:when test="@ext-link-type='uri'">
					<span style="background-color:blue;color:white;">
						<xsl:value-of select="." />
					</span>
				</xsl:when>
				<xsl:when test="@ext-link-type='doi'">
					<span style="background-color:blue;color:white;">
						<xsl:text> DOI:</xsl:text>
						<xsl:value-of select="." />
					</span>
				</xsl:when>
				
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>

		<xsl:for-each select="pub-id">
			<xsl:choose>
				<xsl:when test="@pub-id-type='pmid'">
					<span style="background-color:blue;color:white;">
						<xsl:text> PMID:</xsl:text>
						<xsl:value-of select="." />
					</span>
				</xsl:when>
				<xsl:when test="@pub-id-type='doi'">
					<span style="background-color:blue;color:white;">
						<xsl:text> DOI:</xsl:text>
						<xsl:value-of select="." />
					</span>
				</xsl:when>
				
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
				
</xsl:template>


</xsl:stylesheet>