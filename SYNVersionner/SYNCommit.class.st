"
Represents a commit in the versionning system

Instance Variables
	date:		<Object>
	message:		<Object>

date
	- xxxxx

message
	- xxxxx

"
Class {
	#name : #SYNCommit,
	#superclass : #FAMIXEntity,
	#instVars : [
		'message',
		'author',
		'files',
		'date',
		'revision'
	],
	#category : #SYNVersionner
}

{ #category : #'as yet unclassified' }
SYNCommit class >> annotation [
	<MSEClass: #Commit super: #FAMIXEntity>
	<package: #SYN>
	^self
]

{ #category : #accessing }
SYNCommit >> addFile: anObject [
	
	files add: anObject
]

{ #category : #accessing }
SYNCommit >> author [
	<MSEProperty: #author type: #SYNAuthor opposite: #commits>
	<MSEComment: 'Author of a commit'>
	^ author
]

{ #category : #accessing }
SYNCommit >> author: anObject [
	author := FMMultivalueLink on: self
					update: #commits
					from: self author
					to: anObject
]

{ #category : #accessing }
SYNCommit >> date [
	<MSEProperty: #date type: #String>
	<MSEComment: 'Date of the commit'>
	^ date
]

{ #category : #accessing }
SYNCommit >> date: anObject [
	date := anObject
]

{ #category : #accessing }
SYNCommit >> files [
	<MSEProperty: #files type: #SYNFile opposite: #entities> <multivalued> <derived>
	<MSEComment: 'files modified by the commit'>
	^ files
]

{ #category : #accessing }
SYNCommit >> files: aFileInstance [
	Halt now.
	files := FMMultivalueLink on: self
					update: #entities
					from: self files  
					to: aFileInstance
]

{ #category : #accessing }
SYNCommit >> initialize [
	super initialize.
	files := FMMultiMultivalueLink  
		on: self
		opposite: #entities.
]

{ #category : #accessing }
SYNCommit >> message [
	<MSEProperty: #message type: #String>
	<MSEComment: 'Message commenting the commit'>
	^ message
]

{ #category : #accessing }
SYNCommit >> message: aString [
	message := aString
]

{ #category : #accessing }
SYNCommit >> revision [
	<MSEProperty: #revision type: #Number>
	<MSEComment: 'Revision number of the commit'>
	^ revision
]

{ #category : #accessing }
SYNCommit >> revision: anObject [
	
	revision := anObject
]
