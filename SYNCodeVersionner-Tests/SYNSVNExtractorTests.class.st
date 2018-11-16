Class {
	#name : #SYNSVNExtractorTests,
	#superclass : #SYNVCSAbstractTests,
	#category : #'SYNCodeVersionner-Tests'
}

{ #category : #'as yet unclassified' }
SYNSVNExtractorTests >> parserClass [
	^ SVNLogParser
]

{ #category : #'as yet unclassified' }
SYNSVNExtractorTests >> testCommitDate [
	self assertParse: '2014-01-24 14:25:35 +0100 (Fri, 24 Jan 2014)' rule: #commitDate
]

{ #category : #'as yet unclassified' }
SYNSVNExtractorTests >> testDashLine [
	self assertParse: '------------------------------------------------------------------------
' rule: #dashLine
]

{ #category : #'as yet unclassified' }
SYNSVNExtractorTests >> testFilePath [
	self assertParse: '   M /Projects/pequi2/Pequi-2015/Pequi2015.pdf
' rule: #filePathLine
]

{ #category : #'as yet unclassified' }
SYNSVNExtractorTests >> testLogEntry [
	self assertParse: '------------------------------------------------------------------------
r172 | anquetil | 2011-10-21 23:30:32 +0200 (Fri, 21 Oct 2011) | 6 lines

- Corrected bug #728: placing methods in the wrong classes
- added a test for this bug
- also added superclass "java.lang.Enum" to all enumTypes
- also migrated to eclipse 3.7 and related libraries

One red test in Test_AdHoc was failing and has been temporarily commented out
' rule: #svnLogEntry
]

{ #category : #'as yet unclassified' }
SYNSVNExtractorTests >> testLogEntryHeaderLine [
	self assertParse: 'r602 | ubhatti | 2014-01-24 14:25:35 +0100 (Fri, 24 Jan 2014) | 1 line
' rule: #logEntryHeaderLine
]

{ #category : #'as yet unclassified' }
SYNSVNExtractorTests >> testLogEntryWithFilePath [
	self assertParse: '------------------------------------------------------------------------
r19917 | anquetil | 2015-08-20 18:49:40 +0200 (Jeu, 20 aoû 2015) | 1 line
Changed paths:
   M /Projects/pequi2/Pequi-2015/Pequi2015.pdf
   A /Projects/pequi2/Pequi-2015/Pequi2015.tex

filling up the blanks
' rule: #svnLogEntry
]

{ #category : #'as yet unclassified' }
SYNSVNExtractorTests >> testMessageLength [
	self assertParse: '2 lines' rule:#messageLength.
	self assertParse: '1 line' rule:#messageLength.
]

{ #category : #'as yet unclassified' }
SYNSVNExtractorTests >> testMessageLine [
	self assertParse: 'corrected Issue 763:    VerveineJ generates wrong paths in source anchors when there is a . in the root folder
' rule: #messageLine
]

{ #category : #'as yet unclassified' }
SYNSVNExtractorTests >> testPipe [
	self assertParse: ' | ' rule:#pipe
]

{ #category : #'as yet unclassified' }
SYNSVNExtractorTests >> testRAuthorName [
	self assertParse: 'ubhatti' rule: #authorname
]

{ #category : #'as yet unclassified' }
SYNSVNExtractorTests >> testRevisionNumber [
	self assertParse: 'r501' rule: #revisionNumber
]
