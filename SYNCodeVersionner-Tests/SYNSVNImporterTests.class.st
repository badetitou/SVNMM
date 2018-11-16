"
A SYNSVNExtractorTests is xxxxxxxxx.

"
Class {
	#name : #SYNSVNImporterTests,
	#superclass : #SYNVCSAbstractTests,
	#category : #'SYNCodeVersionner-Tests'
}

{ #category : #'as yet unclassified' }
SYNSVNImporterTests >> parserClass [
	^ SVNLogImporter
]

{ #category : #tests }
SYNSVNImporterTests >> testSvnLog [

	| res |
	res := self parse: '------------------------------------------------------------------------
r191 | anquetil | 2012-07-26 10:01:57 +0200 (Thu, 26 Jul 2012) | 1 line

fixing issue 813
------------------------------------------------------------------------
r190 | larcheveque | 2012-04-13 16:10:46 +0200 (Fri, 13 Apr 2012) | 1 line

corrected Issue 763: 	VerveineJ generates wrong paths in source anchors when there is a . in the root folder
------------------------------------------------------------------------
r189 | larcheveque | 2012-04-06 16:47:55 +0200 (Fri, 06 Apr 2012) | 1 line

Correction about ignored -o option
' rule: #svnLog.

	self assert: res size equals: 3.
	self assert: res first revision equals: '191'.	
	self assert: res second revision equals: '190'.
	self assert: res third revision equals: '189'.
]

{ #category : #tests }
SYNSVNImporterTests >> testSvnLogEntry [

	| res |
	res := self parse: '------------------------------------------------------------------------
r172 | anquetil | 2011-10-21 23:30:32 +0200 (Fri, 21 Oct 2011) | 6 lines

- Corrected bug #728: placing methods in the wrong classes
- added a test for this bug
- also added superclass "java.lang.Enum" to all enumTypes
- also migrated to eclipse 3.7 and related libraries

One red test in Test_AdHoc was failing and has been temporarily commented out
' rule: #svnLogEntry.

	self assert: res class equals: SYNCommit.
	self assert: res revision equals: '172'.
	self assert: res author equals: 'anquetil'.
	self assert: res message size equals: 6.
	self assert: res message first equals: '- Corrected bug #728: placing methods in the wrong classes'.

]
