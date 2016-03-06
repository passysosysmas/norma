<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="xhtml"/>
    
    <xsl:variable name="doi" select="*[local-name()='article-id' and @pub-id-type='doi']"/>
	<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
    
	<xsl:template match="/">
	  <html xmlns="http://www.w3.org/1999/xhtml">
		<xsl:apply-templates />
	  </html>
	</xsl:template>

 	<xsl:template match="text()"><xsl:value-of select="."/></xsl:template>
	
	<!-- normalize whitespace -->
 	<xsl:template match="text()[normalize-space(.)='']"><xsl:text></xsl:text></xsl:template>

<!--  unmatched tags -->
	<xsl:template match="*" >
	    <div class="unknown" title="{local-name()}">
	        <xsl:attribute name="tagxxx"><xsl:value-of select="local-name()"/></xsl:attribute>
			<xsl:apply-templates />
	    </div>
	</xsl:template>

<!--  HTML5 -->
	<xsl:template match="
		*[local-name()='article'] | 
		*[local-name()='caption'] | 
		*[local-name()='col'] | 
		*[local-name()='colgroup'] |
		*[local-name()='graphic'] | 
		*[local-name()='hr'] | 
		*[local-name()='p'] | 
		*[local-name()='sc'] | 
		*[local-name()='sub'] | 
		*[local-name()='sup'] | 
		*[local-name()='table'] | 
		*[local-name()='table-wrap'] | 
		*[local-name()='table-wrap-foot'] | 
		*[local-name()='tbody'] | 
		*[local-name()='td'] | 
		*[local-name()='tfoot'] | 
		*[local-name()='th'] | 
		*[local-name()='th'] | 
		*[local-name()='thead'] | 
		*[local-name()='tr'] 
		" >
        <xsl:copy>
           <xsl:apply-templates select=" * | text()" />
        </xsl:copy>
        </xsl:template>


<!--  NON-HTML DIV -->
	<xsl:template match="
	 	*[local-name()='article-meta'] |
		*[local-name()='title'] | 
	 	*[local-name()='journal-meta'] |
	 	*[local-name()='journal-title-group'] 
		">
		<div tagx="{local-name()}" class="{local-name()}" title="{local-name()}"><xsl:apply-templates select="*|text()" /></div>
	</xsl:template>

<!--  SPANS, mainly in references ITAL -->
	<xsl:template match="
	 	*[local-name()='article-title'] |
	 	*[local-name()='citation-author'] |
	 	*[local-name()='copyright-holder'] |
	 	*[local-name()='copyright-year'] |
	 	*[local-name()='journal-title'] |
	 	*[local-name()='mixed-citation'] |
	 	*[local-name()='email'] |
	 	*[local-name()='day'] |
	 	*[local-name()='month'] |
	 	*[local-name()='year'] |
	 	*[local-name()='source'] |
	 	*[local-name()='volume'] |
	 	*[local-name()='issue'] |
	 	*[local-name()='elocation'] |
	 	*[local-name()='etal'] | 
	 	*[local-name()='fpage'] |
	    *[local-name()='given-names'] |
		*[local-name()='label'] | 
		*[local-name()='name'] | 
	 	*[local-name()='surname'] |
	 	*[local-name()='year'] |
	 	
	 	*[local-name()='lpage']" >
		<span tagx="{local-name()}" class="{local-name()}" title="{local-name()}"><xsl:apply-templates select="*|text()" /></span>
	</xsl:template>

	<xsl:template match="*[local-name()='art']">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="*[local-name()='front']">
	    <head>
      	    <style type="text/css"> 		 
      	    article {border-style : dotted; border-width : 2px; }
      	    table {background : #ffffdd;}
		 	tr {background : #ddddff; padding : 1px;}
		 	div.ack {border-style : solid ; border-color : red; margin : 2em; }
		 	div.contrib-group {margin : 1em; }
		 	div.given-names {font-family : italic;}
		 	div.fig {border-style : solid; border-width : 2px; margin : 2em; }
		 	div.name {font-family : bold;}
		 	div.title {font-family : courier bold; font-size : 16pt; margin : 5px;}
		 	div.meta-name {font-style : bold ; font-size : 16pt;}
		 	div.abstract-title {font-style : bold ; font-size : 16pt;}
		 	div.funding {font-style : bold ; font-size : 16pt;}
		 	div.article-meta {border-style : solid; border-width : 1 pt; margin 1em;}
		 	div.journal-meta {border-style : solid; border-width : 1 pt; margin 1em;}
		 	div.journal-title-group {background : #ffeeee;}
		 	div.article-title {font-style : bold ; font-size : 18pt;}
		 	div.alt-title {font-style : italic; font-size : 12px;}
		 	
		 	div.sec {border : 2px; margin 5px; padding 2px;}
		 	div.intro { border-style : inset; margin : 5px;}
		 	div.introduction { border-style : inset; margin : 5px;}
		 	
		 	div.methods { border-style : double; margin : 5px;}
		 	
		 	div.results {border-style : solid; margin : 5px;}
		 	div.background { border-style : dotted; margin : 5px;}
		 	
		 	div.discussion {border-style : groove; margin : 5px;}
		 	div.conclusion {border-style : ridge; margin : 5px;}
		 	
		 	div.publisher {border-style : outset; margin : 5px;}
		 	div.fn-type-conflict {background : #f88; }
		 	div.fn-type-con {background : #ddf; }
		 	div.fn-type-other {background : #ddd; }
		 	
		 	div.unknown {background : #ffd;
		 	  border-style : solid;
		 	  border-width : 1px;
		 	  padding : 2 px;}
		 	
		 	span {background : #ffffcc;}
		 	span.mixed-article-title {font-style : italic ;}
		 	span.journal-title {background : #ddeeff;}
		 	span.nlm-ta {background : #ffddee; margin : 1px;}
		 	span.iso-abbrev {background : #ffdddd; margin : 1px;}
		 	span.publisher {background : #ffddcc; margin : 1px;}
		 	span.issn-epub {background : #ffaadd; margin : 1px;}
		 	span.issn-ppub {background : #ffcccc; margin : 1px;}
		 	span.pmc {background : #ffddbb; margin : 1px;}
		 	span.citation-author {font-family : helvetica;  background : #ffeeee;}
		 	span.etal {font-family : italic;}
		 	span.source {font-family : helvetica;}
		 	span.fpage {font-family : courier;}
		 	span.lpage {font-family : courier;}
		 	
		 	span.surname {background : #ffffff;}
		 	span.given-names {background : #ffffff;}
		 	
		 	span.email {font-family : courier; }
		 	span.corresp {background : #ddffdd; }
		 	
		 	span.volume {font-family : courier; font-style : bold;}
		 	span.year {font-family : courier italic;}
			</style>
			<xsl:apply-templates />
	    </head>
	</xsl:template>

<!-- 
<journal-meta>
<journal-id journal-id-type="nlm-ta">PLoS Negl Trop Dis</journal-id>
<journal-id journal-id-type="iso-abbrev">PLoS Negl Trop Dis</journal-id>
<journal-id journal-id-type="publisher-id">plos</journal-id>
<journal-id journal-id-type="pmc">plosntds</journal-id>
<journal-title-group>
<journal-title>PLoS Neglected Tropical Diseases</journal-title>
</journal-title-group>
<issn pub-type="ppub">1935-2727</issn>
<issn pub-type="epub">1935-2735</issn>
<publisher>
<publisher-name>Public Library of Science</publisher-name>
<publisher-loc>San Francisco, USA</publisher-loc>
</publisher>
</journal-meta>
-->

<!--  JOURNAL-meta -->
	<xsl:template match="*[local-name()='journal-id']">
	  <span class="{@journal-id-type}" title="{@journal-id-type}"><xsl:value-of select="."/></span>
	</xsl:template>
	
	<xsl:template match="
	 	*[local-name()='journal-meta'] |
	 	*[local-name()='journal-title-group'] |
	 	*[local-name()='publisher-name'] |
	 	*[local-name()='publisher-loc'] 
		">
		<div tagx="{local-name()}" class="{local-name()}" title="{local-name()}"><xsl:apply-templates select="*|text()" /></div>
	</xsl:template>

	<xsl:template match="
	 	*[local-name()='issn'] 
		">
		<span tagx="{local-name()}" class="{local-name()}-{@pub-type}" title="{local-name()}-{@pub-type}"><xsl:apply-templates select="*|text()" /></span>
	</xsl:template>

<!--  copy divs -->
	<xsl:template match="
	 	*[local-name()='publisher'] 
		">
		<div tagx="{local-name()}" class="publisher" title="publisher"><xsl:apply-templates select="*|text()" /></div>
	</xsl:template>

<!--  ARTICLE meta -->
<!-- 
<article-meta>
<article-id pub-id-type="pmcid">4288720</article-id>
<article-id pub-id-type="pmid">25569210</article-id>
<article-id pub-id-type="publisher-id">PNTD-D-14-01562</article-id>
<article-id pub-id-type="doi">10.1371/journal.pntd.0003414</article-id>
 -->
	<xsl:template match="*[local-name()='article-id']" priority="0.5">
	  <span class="{@pub-id-type}" title="{@pub-id-type}"><xsl:value-of select="."/></span>
	</xsl:template>

	<xsl:template match="*[local-name()='article-id' and @pub-id-type='doi']" priority="0.6">
	  <span class="{@pub-id-type}" title="{@pub-id-type}">[doi: <a href="http://doi.org/{.}"><xsl:value-of select="."/></a></span>
	</xsl:template>
	<xsl:template match="*[local-name()='article-id' and @pub-id-type='pmcid']" priority="0.6">
	  <span class="{@pub-id-type}" title="{@pub-id-type}">[pmcid: <a href="http://www.ncbi.nlm.nih.gov/pubmed/{.}">
	    <xsl:value-of select="."/>]</a></span>
	</xsl:template>
	<xsl:template match="*[local-name()='article-id' and @pub-id-type='pmid']" priority="0.6">
	  <span class="{@pub-id-type}" title="{@pub-id-type}">[pmid: <a href="http://www.ncbi.nlm.nih.gov/pubmed/{.}">
	    <xsl:value-of select="."/></a>]</span>
	</xsl:template>

<!-- 
<article-categories>
<subj-group subj-group-type="heading">
<subject>Research Article</subject>
</subj-group>
<subj-group subj-group-type="Discipline-v2">
<subject>Biology and Life Sciences</subject>
<subj-group>
<subject>Immunology</subject>
</subj-group>
</subj-group>
 -->
 	<xsl:template match="*[local-name()='article-categories']">
	  <div class="{local-name()}" title="{local-name()}"><xsl:apply-templates/></div>
	</xsl:template>
 
	<xsl:template match="*[local-name()='subj-group']">
	  <xsl:choose>
		  <xsl:when test="*[local-name()='subj-group']">
		    <div class="sub-group" title="subj-group">
		      <xsl:text>: </xsl:text>
		      <xsl:apply-templates/>
		    </div>
		  </xsl:when>
		  <xsl:otherwise>
		      <xsl:text>: </xsl:text>
		      <xsl:apply-templates select="*[local-name()='subject']"/>
		  </xsl:otherwise>
	  </xsl:choose>
	</xsl:template>
	<xsl:template match="*[local-name()='subject']">
	  <span class="subject" title="subject"><xsl:apply-templates/></span>
	</xsl:template>

<!-- 	
	<title-group>
		<article-title>
			Hyperreactive Onchocerciasis is Characterized by a Combination of Th17-Th2 Immune
			Responses and Reduced Regulatory T Cells
		</article-title>
		<alt-title alt-title-type="running-head">Th17/Th2 and Pathological
			Onchocerciasis</alt-title>
	</title-group>
	-->
	<xsl:template match="
	    *[local-name()='article-title'] |
		*[local-name()='alt-title']">
	  <div class="{local-name()}" title="{local-name()}"><xsl:apply-templates/></div>
	</xsl:template>

<!--  
	<contrib-group>
		<contrib contrib-type="author">
			<name>
				<surname>Katawa</surname>
				<given-names>Gnatoulma</given-names>
			</name>
			<xref ref-type="aff" rid="aff1">
				<sup>1</sup>
			</xref>
			<xref ref-type="aff" rid="aff2">
				<sup>2</sup>
			</xref>
			<xref ref-type="author-notes" rid="fn1">
				<sup>‡</sup>
			</xref>
		</contrib>
-->	
	<!--  xref ref-type="aff" rid="AF0001">1</xref> -->
	<xsl:template match="*[local-name()='xref' and @rid]">
	  <a href="#{@rid}"><xsl:apply-templates/></a>
	</xsl:template>

	<xsl:template match="
	    *[local-name()='contrib-group']">
	  <div class="{local-name()}" title="{local-name()}"><xsl:apply-templates/></div>
	</xsl:template>
	
	<xsl:template match="
	    *[local-name()='contrib']">
	  <span class="{local-name()}" title="{local-name()}"><xsl:apply-templates/></span>
	</xsl:template>

<!-- 	
<aff id="aff1">
	<label>1</label>
	<addr-line>
		Institute of Medical Microbiology, Immunology and Parasitology (IMMIP),
		University Hospital Bonn, Bonn, Germany
	</addr-line>
</aff>	
-->
	
	<xsl:template match="*[local-name()='aff']">
	  <span id="{@id}" class="citation_author_institution"><xsl:text>[</xsl:text><xsl:value-of select="*[local-name()='label']"/><xsl:text>]</xsl:text>,
	  <xsl:value-of select="*[local-name()='addr-line']"/></span>
	</xsl:template>

<!-- 
	<author-notes>
		<corresp id="cor1">
			* E-mail:
			<email>hoerauf@microbiology-bonn.de</email>
		</corresp>
		<fn fn-type="conflict">
			<p>
				The authors have declared that no competing interests exist.
			</p>
		</fn>
		-->
	<xsl:template match="*[local-name()='author-notes']">
	  <div class="{local-name()}" title="{local-name()}">
	    <xsl:apply-templates/>
	  </div>
	</xsl:template>

	<xsl:template match="
	    *[local-name()='corresp'] ">
	  <span class="{local-name()}" title="{local-name()}">
	    <xsl:apply-templates/>
	  </span>
	</xsl:template>

	<xsl:template match="
	    *[local-name()='fn'] ">
	  <div class="fn-type-{@fn-type}" title="{@fn-type}">
	    <xsl:apply-templates/>
	  </div>
	</xsl:template>

<!-- 
<pub-date pub-type="collection">
	<month>1</month>
	<year>2015</year>
</pub-date>
	<pub-date pub-type="epub">
		<day>8</day>
		<month>1</month>
		<year>2015</year>
	</pub-date>
	<volume>9</volume>
	<issue>1</issue>
	<elocation-id>e3414</elocation-id>
	<history>
		<date date-type="received">
			<day>10</day>
			<month>9</month>
			<year>2014</year>
		</date>
		<date date-type="accepted">
			<day>12</day>
			<month>11</month>
			<year>2014</year>
		</date>
	</history>
-->

	<xsl:template match="*[local-name()='pub-date']">
	  <span class="pub-date-{@pub-type}" title="pub-date-{@pub-type}"><xsl:value-of select="@pub-date"/>: <xsl:apply-templates/></span>
	</xsl:template>
	
	<!-- the volume, issue, elocation are covered above -->
	
	<xsl:template match="*[local-name()='history']">
	  <span class="history" title="history"><xsl:apply-templates/></span>
	</xsl:template>
	
	<xsl:template match="*[local-name()='date']">
	  <span class="{@date-type}" title="{@date-type}"><xsl:value-of select="@date-type"/>: <xsl:value-of select="year"/>-<xsl:value-of select="month"/>-<xsl:value-of select="day"/></span>
	</xsl:template>

<!-- 
	<permissions>
		<copyright-year>2015</copyright-year>
		<copyright-holder>Katawa et al</copyright-holder>
		<license>
			<license-p>
				This is an open-access article distributed under the terms of the
				<ext-link ext-link-type="uri"
					xlink:href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution License</ext-link>
				, which permits unrestricted use, distribution, and reproduction in
				any medium, provided the original author and source are credited.
			</license-p>
		</license>
	</permissions>
-->	
	<xsl:template match="*[local-name()='permissions']">
	  <div class="permissions">
	  <span class="copyright" title="copyright">(C) <xsl:apply-templates select="copyright-holder"/>, <xsl:apply-templates select="copyright-year"/></span>
	  <xsl:apply-templates select="*[local-name()='license']"/>
	  </div>
	</xsl:template>

	<xsl:template match="*[local-name()='license-p']">
	  <span class="license" title="license"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="*[local-name()='ext-link']">
	  <a href="{@xlink:href}"><xsl:apply-templates/></a>
	</xsl:template>

<!-- 
<abstract>
	<p>
		Clinical manifestations in onchocerciasis range from generalized
		onchocerciasis (GEO) to the rare but severe hyperreactive (HO)/sowda
		...
		Th2 cells form part of the immune network instigating the development
		of severe onchocerciasis.
	</p>
</abstract>
-->

	
	<xsl:template match="*[local-name()='abstract']"  priority="0.5">
	  <div class="abstract" title="abstract">
	    <div class="abstract-title" title="abstract-title">Abstract</div>
	  <xsl:apply-templates/>
	  </div>
	</xsl:template>

<!-- 
	<abstract abstract-type="summary">
		<title>Author Summary</title>
		<p>
			Onchocerciasis, also known as river blindness is a tropical disease
			causing health and socioeconomic problems in endemic communities
			...
			elevated frequencies of Th17 and Th2 cells form part of the immune
			network associated with severe onchocerciasis.
		</p>
	</abstract>
-->	
	<xsl:template match="*[local-name()='abstract' and @abstract-type]" priority="0.6">
	  <div class="abstract" title="abstract">
	  <!-- 
	    <div class="abstract-title" title="abstract-title"><xsl:apply-templates select="*[local-name()='title']"/></div>
	    -->
	  <xsl:apply-templates/>
	  </div>
	</xsl:template>

<!-- 
<funding-group>
	<funding-statement>
		This work was primarily supported through a grant from the German Research
		Council (DFG Ho2009/8-2). The study was further supported by the
		...
		collection and analysis, decision to publish, or preparation of the
		manuscript.
	</funding-statement>
</funding-group>
-->
	<xsl:template match="*[local-name()='funding-group']" >
	  <div class="funding-group" title="funding-group">
	  <div class="funding" title="funding">Funding</div>
	  <xsl:apply-templates/>
	  </div>
	</xsl:template>
	
	<xsl:template match="*[local-name()='funding-statement']" >
	  <div class="funding-statement" title="funding-statement">
	  <xsl:apply-templates/>
	  </div>
	</xsl:template>

<!-- 
<custom-meta-group>
	<custom-meta id="data-availability">
		<meta-name>Data Availability</meta-name>
		<meta-value>
			The authors confirm that all data underlying the findings are fully
			available without restriction. All relevant data are within the paper
			and its Supporting Information files.
		</meta-value>
	</custom-meta>
</custom-meta-group>
-->

	<xsl:template match="*[local-name()='custom-meta-group']">
  	  <xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="*[local-name()='custom-meta']">
  	  <div class="meta-name" title="meta-name"><xsl:apply-templates/></div>
  	  <xsl:apply-templates select="*[local-name()='meta-value']"/>
	</xsl:template>
	

<!-- 
	<notes>
		<title>Data Availability</title>
		<p>
			The authors confirm that all data underlying the findings are fully
			available without restriction. All relevant data are within the paper
			and its Supporting Information files.
		</p>
	</notes>
	-->
	
	<xsl:template match="*[local-name()='notes']">
	<xsl:apply-templates/>
	</xsl:template>
	
<!-- 	
<fig id="pntd-0003414-g001" orientation="portrait" position="float">
	<object-id pub-id-type="doi">10.1371/journal.pntd.0003414.g001</object-id>
	<label>Figure 1</label>
	<caption>
		<title>
			Higher frequencies of monocytes and memory T cells in HO individuals.
		</title>
		<p>
			Isolated PBMCs from EN and individuals presenting either generalized
			(GEO) or hyperreactive onchocerciasis (HO) were stained with a
			combination of antibodies to determine the frequencies of CD8
			<sup>+</sup>
			T cells (A); NK cells [CD3
			...
			T cells (H) and naive CD4
			<sup>+</sup>
			T cells (I). Graphs show box whiskers (tukey) with outliers from EN n
			= 10, GEO n = 10 and HO n = 6. Asterisks show statistical differences
			(Kruskal-Wallis and Mann Whitney test) between the groups indicated
			by the brackets (*p<0.05, **p<0.01).
		</p>
	</caption>
	<graphic xlink:href="pntd.0003414.g001" />
</fig>
	 -->
		
	<xsl:template match="*[local-name()='fig']">
	 <div class="fig" title="fig">
	  <div class="figure" title="figure">
	    <a href="http://doi.org/{*[local-name()='object-id' and @pub-id-type='doi']}"><xsl:apply-templates select="*[local-name()='label']"/></a>
	  </div>
	  <caption class="caption" title="caption"><xsl:apply-templates select="*[local-name()='caption']"/></caption>
	  <!--  the <graphic> links to files we don't have -->
      </div>
	</xsl:template>

<!-- 
	<sec sec-type="supplementary-material" id="s5">
		<title>Supporting Information</title>
		<supplementary-material content-type="local-data"
			id="pntd.0003414.s001">
			<label>S1 Fig</label>
			<caption>
				<p>
					<bold>
						Optimal time point for collecting cell culture supernatants.
					</bold>
					Thawed PBMCs (1×10
					<sup>5</sup>
					/well) from
					...
					were then measured by ELISA. Bars represent mean ± SD of cytokines
					levels.
				</p>
				<p>(TIF)</p>
			</caption>
			<media xlink:href="pntd.0003414.s001.tif">
				<caption>
					<p>Click here for additional data file.</p>
				</caption>
			</media>
		</supplementary-material>
	</sec>
-->	

	<xsl:template match="*[local-name()='sec' and @sec-type]">
	  <div class="{@sec-type}" title="{@sec-type}">
	    <xsl:apply-templates/>
	  </div>
	</xsl:template>

	<xsl:template match="*[local-name()='sec' and not(@sec-type)]">
	  <div class="sec" title="sec">
	    <xsl:if test="*[local-name()='title']">
	      <xsl:attribute name="class"><xsl:value-of 
	      select="translate(translate(normalize-space(*[local-name()='title']),' ',''),$uppercase,$lowercase)"/></xsl:attribute>
	    </xsl:if>
	    <xsl:apply-templates/>
	  </div>
	</xsl:template>

	<xsl:template match="*[local-name()='supplementary-material']">
	  <div class="{@content-type}" title="{@content-type}">
	    <xsl:apply-templates/>
	  </div>
	</xsl:template>

	<xsl:template match="*[local-name()='media']">
	  <div class="media" title="media">
	    <a href="{@xlink:href}">LINK</a>
	    <xsl:apply-templates/>
	  </div>
	</xsl:template>

	
	<!--  BODY  -->
	
	<xsl:template match="*[local-name()='body']">
	  <div class="body" title="body">
	  <xsl:apply-templates/>
	  </div>
	</xsl:template>
	
	
	<!--  BACK  -->
	
	<xsl:template match="*[local-name()='back']">
	  <div class="back" title="back">
	  <xsl:apply-templates/>
	  </div>
	</xsl:template>

<!-- 
	<ack>
		<p>
			We thank the entire Ghana-based research team for help with the
			recruitment of onchocerciasis patients.
		</p>
	</ack>
 -->	
	
	<xsl:template match="*[local-name()='ack']">
	  <div class="ack" title="ack">
	  <xsl:apply-templates/>
	  </div>
	</xsl:template>
	
	<!--  
<ref-list>
	<title>References</title>
	<ref id="pntd.0003414-Crump1">
		<label>1</label>
		<mixed-citation publication-type="journal">
			<name>
				<surname>Crump</surname>
				<given-names>A</given-names>
			</name>
			,
			<name>
				<surname>Morel</surname>
				<given-names>CM</given-names>
			</name>
			,
			<name>
				<surname>Omura</surname>
				<given-names>S</given-names>
			</name>
			(
			<year>2012</year>
			)
			<article-title>
				The onchocerciasis chronicle: from the beginning to the end?
			</article-title>
			<source>Trends Parasitol</source>
			<volume>28</volume>
			:
			<fpage>280</fpage>
			–
			<lpage>288</lpage>
			.
			<pub-id pub-id-type="pmid">22633470</pub-id>
		</mixed-citation>
	</ref>
-->
	<xsl:template match="ref-list">
	<div class="ref-list" title="ref-list">
	  <div class="references">References</div>
	    <xsl:apply-templates />
	</div>
	</xsl:template>
	
	<xsl:template match="ref">
	<div class="ref" title="ref" id="{@id}">
	    <xsl:apply-templates />
	</div>
	</xsl:template>

	<xsl:template match="*[local-name()='mixed-citation' or local-name()='element-citation']/*[local-name()='article-title']" priority="0.6">
	<span class="mixed-article-title" title="mixed-article-title" >
	    <xsl:apply-templates />
	</span>
	</xsl:template>

	
	<!--  GENERIC  -->
	
	<xsl:template match="strong | bold">
	    <b><xsl:apply-templates  select="*|text()"/></b>
	</xsl:template>
	
	<xsl:template match="*[local-name()='em'] | *[local-name()='italic'] | *[local-name()='i']">
	    <i><xsl:apply-templates select="*|text()"/></i>
	</xsl:template>
	
	<xsl:template match="*[not(self::sec)]/sec/title" priority="-0.5">
	    <h2><xsl:apply-templates /></h2>
	</xsl:template>
	
	<xsl:template priority = "-0.6"
	    match="*[local-name()='sec' and *[local-name()='title']]/*[local-name()='sec']/*[local-name()='title']">
	    <h3><xsl:apply-templates select="*|text()"/></h3>
	</xsl:template>
	
	<xsl:template match="*[local-name()='list']">
	    <ul><xsl:apply-templates  select="*|text()"/></ul>
	</xsl:template>
	
	<xsl:template match="*[local-name()='list-item']">
	    <li><xsl:apply-templates  select="*|text()"/></li>
	</xsl:template>
	
	<xsl:template match="*[local-name()='ref-list']">
	    <div tag="ref-list"><ul><xsl:apply-templates  select="*|text()"/></ul></div>
	</xsl:template>
	
	<xsl:template match="*[local-name()='ref']">
	    <li tag="ref"><a name="{@id}"/><xsl:apply-templates  select="*|text()"/></li>
	</xsl:template>
	
	<xsl:template match="*[local-name()='element-citation']">
	    <span class="element-citation'"><xsl:apply-templates/></span>
	</xsl:template>
	
	<xsl:template match="*[local-name()='person-group']">
	    <span class="person-group'"><xsl:apply-templates/></span>
	</xsl:template>
	
	<xsl:template match="*[local-name()='pub-id']">
	    <span class="pub-id"><a href="http://www.ncbi.nlm.nih.gov/pubmed/{.}">[<xsl:apply-templates/>]</a></span>
	</xsl:template>
		
	<xsl:template match="*[local-name()='collab']">
	    <span class="collab'">[<xsl:apply-templates/>]</span>
	</xsl:template>
		

<!--  		
	<xsl:template match="*[local-name()='etal']">
	    <i>et al.</i>
	</xsl:template>
-->
		
	<xsl:template match="*[local-name()='underline']">
	    <u><xsl:apply-templates select="* | text()"/></u>
	</xsl:template>

	<!-- <xref xref ref-type="table-fn"">4</xref> -->	
	<xsl:template match="*[local-name()='xref' and @ref-type='table-fn']" priority="-0.4">
 	    <span rid="{@rid}" ref-type="{@ref-type}"><sup><a href="#{@rid}"><xsl:value-of select="."/></a></sup></span>
	</xsl:template>
		
	<xsl:template match="*[local-name()='xref']" priority="-0.45">
 	    <span rid="{@rid}" ref-type="{@ref-type}"><xsl:apply-templates select="* | text()"/></span>
	</xsl:template>
	
	<!-- <xref ref-type="bibr" rid="CIT0004">4</xref> -->
	<xsl:template match="*[local-name()='xref' and @ref-type='bibr']" priority="-0.4">
 	    <span rid="{@rid}" ref-type="{@ref-type}"><sup><a href="#{@rid}"><xsl:value-of select="."/></a></sup></span>
	</xsl:template>
	
	<!-- <xref ref-type="table" rid="CIT0004">4</xref> -->
	<xsl:template match="*[local-name()='xref' and @ref-type='table']" priority="-0.4">
 	    <span rid="{@rid}" ref-type="{@ref-type}"><a href="#{@rid}"><xsl:value-of select="."/></a></span>
	</xsl:template>
	
</xsl:stylesheet>
