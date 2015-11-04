package org.xmlcml.norma.tagger;

import org.junit.Assert;
import org.junit.Test;
import org.xmlcml.norma.Fixtures;
import org.xmlcml.norma.Norma;
import org.xmlcml.norma.NormaArgProcessor;

public class SectionTaggerTest {

	/** iterates over two taggers.
	 * 
	 */
	@Test
	public void testSectionTagger() {
		new Norma().run("-i "+Fixtures.F0113556_XML+" -o target/tagger/f0113556 --cmdir ");
		String cmdir = "target/tagger/f0113556/src_test_resources_org_xmlcml_norma_pubstyle_plosone_journal_pone_0113556_fulltext_xml";
		String cmd = "-i fulltext.xml --cmdir "+cmdir+" -o scholarly.html --transform nlm2html --tag foo bar";
		Norma norma = new Norma();
		norma.run(cmd);
		Assert.assertEquals("taggers", 2, ((NormaArgProcessor)norma.getArgProcessor()).getSectionTaggers().size());
	}
}

