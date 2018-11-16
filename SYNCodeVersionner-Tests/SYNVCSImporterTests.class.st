Class {
	#name : #SYNVCSImporterTests,
	#superclass : #TestCase,
	#instVars : [
		'importer',
		'model'
	],
	#category : #'SYNCodeVersionner-Tests'
}

{ #category : #running }
SYNVCSImporterTests >> setUp [
	model := MooseModel new.
	importer := SYNVCSImporter new
						model: model  ;
						yourself
]

{ #category : #tests }
SYNVCSImporterTests >> testCVSImport [
	importer parser: CVSLogImporter new.
	
	importer runOn: '
RCS file: /cvsroot/jhotdraw/JHotDraw/Attic/.cvsignore,v
description:
----------------------------
revision 1.2
date: 2004/02/01 17:56:15;  author: mrfloppy;  state: dead;  lines: +0 -0
no message
----------------------------
revision 1.1
date: 2003/05/03 14:18:31;  author: ricardo_padilha;  state: Exp;
*** empty log message ***
=============================================================================

RCS file: /cvsroot/jhotdraw/JHotDraw/Attic/.project,v
description:
----------------------------
revision 1.4
date: 2004/02/01 17:56:15;  author: mrfloppy;  state: dead;  lines: +0 -0
no message
----------------------------
revision 1.3
date: 2003/11/09 21:18:46;  author: mrfloppy;  state: Exp;  lines: +1 -2
TestSuite: adjusting auto-generated sourcecode (JunitDoclet) to coding style
----------------------------
revision 1.2
date: 2003/09/13 22:31:10;  author: mtnygard;  state: Exp;  lines: +1 -0
Eliminate some deprecated method warnings.

Organize imports to remove Eclipse warnings about unused imports.
----------------------------
revision 1.1
date: 2003/05/03 14:18:31;  author: ricardo_padilha;  state: Exp;
*** empty log message ***
=============================================================================
'.

	self assert: model entities size equals: 9.
	self assert: (model allWithType: SYNCommit) size equals: 6.
	self assert: (model allWithType: SYNAuthor) size equals: 3.
]

{ #category : #tests }
SYNVCSImporterTests >> testSVNImport [
	importer parser: SVNLogImporter new.
	
	importer runOn: '------------------------------------------------------------------------
r191 | anquetil | 2012-07-26 10:01:57 +0200 (Thu, 26 Jul 2012) | 1 line

fixing issue 813
------------------------------------------------------------------------
r190 | larcheveque | 2012-04-13 16:10:46 +0200 (Fri, 13 Apr 2012) | 1 line

corrected Issue 763: 	VerveineJ generates wrong paths in source anchors when there is a . in the root folder
------------------------------------------------------------------------
r189 | larcheveque | 2012-04-06 16:47:55 +0200 (Fri, 06 Apr 2012) | 1 line

Correction about ignored -o option
'.

	self assert: model entities size equals: 5.
	self assert: (model allWithType: SYNCommit) size equals: 3.
	self assert: (model allWithType: SYNAuthor) size equals: 2.
]
