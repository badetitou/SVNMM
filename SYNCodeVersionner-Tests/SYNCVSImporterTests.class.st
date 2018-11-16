"
A SYNSVNExtractorTests is xxxxxxxxx.

"
Class {
	#name : #SYNCVSImporterTests,
	#superclass : #SYNVCSAbstractTests,
	#category : #'SYNCodeVersionner-Tests'
}

{ #category : #accessing }
SYNCVSImporterTests >> parserClass [
	^ CVSLogImporter
]

{ #category : #running }
SYNCVSImporterTests >> setUp [
	importer := self parserClass new.

]

{ #category : #tests }
SYNCVSImporterTests >> testCvsLog [

	| res |
	res := self parse: '
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
' rule: #cvsLog.

	self assert: res size equals: 6.
	self assert: res first revision equals: '1.2'.
	self assert: res second revision equals: '1.1'.
	self assert: res third revision equals: '1.4'.
	self assert: res fourth revision equals: '1.3'.
	self assert: res fifth revision equals: '1.2'.
	self assert: res sixth revision equals: '1.1'.

]

{ #category : #tests }
SYNCVSImporterTests >> testCvsLogEntry [

	| res |
	res := self parse: '----------------------------
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

	self assert: res class equals: SYNCommit.
	self assert: res revision equals: '1.2.4.2'.
	self assert: res author equals: 'dnoyeb'.
	self assert: res message size equals: 24.
	self assert: (res message at: 15) equals: '   they may materialize in the future.'.

]

{ #category : #tests }
SYNCVSImporterTests >> testCvsLogFileEntry [

	| res |
	res := self parse: '
RCS file: /cvsroot/jhotdraw/JHotDraw/Attic/.classpath,v
description:
----------------------------
revision 1.4
date: 2004/02/01 17:56:15;  author: mrfloppy;  state: dead;  lines: +0 -0
no message
----------------------------
revision 1.3
date: 2003/11/09 21:18:46;  author: mrfloppy;  state: Exp;  lines: +5 -1
TestSuite: adjusting auto-generated sourcecode (JunitDoclet) to coding style
----------------------------
revision 1.2
date: 2003/09/13 22:31:10;  author: mtnygard;  state: Exp;  lines: +2 -0
Eliminate some deprecated method warnings.

Organize imports to remove Eclipse warnings about unused imports.
----------------------------
revision 1.1
date: 2003/05/03 14:18:31;  author: ricardo_padilha;  state: Exp;
*** empty log message ***
=============================================================================
' rule: #cvsLogFileEntry.

	self assert: res size equals: 4.
	self assert: res first revision equals: '1.4'.
	self assert: res second revision equals: '1.3'.
	self assert: res third revision equals: '1.2'.
	self assert: res fourth revision equals: '1.1'.

]
