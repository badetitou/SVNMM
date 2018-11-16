"
A SYNSVNExtractorTests is xxxxxxxxx.

"
Class {
	#name : #SYNCVSExtractorTests,
	#superclass : #SYNVCSAbstractTests,
	#category : #'SYNCodeVersionner-Tests'
}

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> parserClass [
	^ CVSLogParser
]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testCvsLog1 [
	self parse: '
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
' rule: #cvsLog
]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testCvsLog2 [
	self parse: '
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
' rule: #cvsLog
]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testCvsLogEntry [

	self parse: '----------------------------
revision 1.3
date: 2003/01/30 00:27:33;  author: mrfloppy;  state: Exp;  lines: +1 -1
prepare for 5.4 release: various bug fixes
' rule: #cvsLogEntry.

	self parse: '----------------------------
revision 1.2.4.2
date: 2003/01/07 21:23:13;  author: dnoyeb;  state: Exp;  lines: +10 -7
1. Added getDesktop to the DrawingEditor.  added null returns to all Classes that dont fully support
   the Desktop architecture yet, like the applets.

2. Added a figureSelection listener to the DrawingEditor so one can register with the DrawingEditor to
   hear figure selection events.  You can still register with the individual DrawingViews if you wish.
   The DrawingEditor will guarantee that it only fires this event on the active view, so it saves a listener
   from having to register and unregister with views to hear this event each time the activeView changes.
   All Commands were doing this register/unregister dance.

3. AbstractCommand now registers for figureSelectionEvents with the drawingEditor as opposed to the
   DrawingView.

4. Went back to viewCreated and viewDestroying naming.  flip flopping.  Its actually more accurate.  the
   real issue is that 2 events are missing, viewDestroyed and viewCreating.  dont need them yet, but
   they may materialize in the future.

5. Went back to Tool CompositeTool being enabled even when no figure is selected.

6. FigureSelectionListener now extends java.util.EventListener now because I am too lazy to write
   an event handler just yet.

7. implemented new findFigureInside() fix.  needs testing.

8. standardDrawingView selectionZordered now returns figures in the proper order(not reversed).
' rule: #cvsLogEntry.

]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testCvsLogEntrySeparatorLine [
	self assertParse: '----------------------------
' rule: #cvsLogEntrySeparatorLine
]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testCvsLogFileEntry [

	self parse: '
RCS file: /cvsroot/jhotdraw/JHotDraw/src/CH/ifa/draw/util/collections/jdk12/CollectionsFactoryJDK12.java,v
Working file: src/CH/ifa/draw/util/collections/jdk12/CollectionsFactoryJDK12.java
head: 1.3
branch:
locks: strict
access list:
symbolic names:
	jhotdraw54b2-release: 1.3
	reorg_6x_split: 1.3
	MVC_PHASE1: 1.3.0.4
	NEW_ATTRIBUTES: 1.3.0.2
	DNOYEB1_ALPHA-2: 1.2
	release_JHD54b1: 1.3
	BUGFIX_670992: 1.2.0.6
	DNOYEB1_ALPHA-1: 1.2
	dnoyeb1: 1.2.0.4
	repack: 1.2.0.2
	Root_repack: 1.2
	Before_FigureVisitor: 1.2
keyword substitution: kv
total revisions: 3;	selected revisions: 3
description:
----------------------------
revision 1.3
date: 2003/01/30 00:27:33;  author: mrfloppy;  state: Exp;  lines: +1 -1
prepare for 5.4 release: various bug fixes
----------------------------
revision 1.2
date: 2002/09/07 12:27:28;  author: mrfloppy;  state: Exp;  lines: +8 -0
removed remains of FigureAttributeConstant.getName() and some code-clean up
----------------------------
revision 1.1
date: 2002/08/04 22:59:08;  author: mrfloppy;  state: Exp;
after variou merges... (before 5.4 release)
=============================================================================
' rule: #cvsLogFileEntry.

]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testCvsLogFileHeader [
	self assertParse: 'RCS file: /cvsroot/jhotdraw/JHotDraw/Attic/.project,v
Working file: .project
head: 1.4
branch:
locks: strict
access list:
symbolic names:
	jhotdraw54b2-release: 1.4
	reorg_6x_split: 1.3
keyword substitution: kv
total revisions: 4;	selected revisions: 4
description:
' rule: #cvsLogFileHeader
]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testCvsLogFileSeparatorLine [
	self assertParse: '=============================================================================
' rule: #cvsLogFileSeparatorLine
]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testEntryAuthor [

	self parse: 'author: mrfloppy' rule: #entryAuthor

]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testEntryDate [

	self parse: 'date: 2003/01/07 21:23:13' rule: #entryDate.

]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testEntryDateLine [

	self parse: 'date: 2003/01/07 21:23:13;  author: dnoyeb;  state: Exp;  lines: +10 -7
' rule: #entryDateLine.

]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testEntryMessageLine [

	self parse: 'after variou merges... (before 5.4 release)
' rule: #entryMessageLine

]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testEntryRevisionLine [

	self parse: 'revision 1.2
' rule: #entryRevisionLine.
	self parse: 'revision 1.1.1.1
' rule: #entryRevisionLine.

]

{ #category : #'as yet unclassified' }
SYNCVSExtractorTests >> testFilePathLine [
	self assertParse: 'RCS file: /cvsroot/jhotdraw/JHotDraw/Attic/.project,v
' rule: #filePathLine
]
