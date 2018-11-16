Class {
	#name : #SVNCommit,
	#superclass : #SVNEntity,
	#instVars : [
		'#author => FMOne type: #SVNAuthor opposite: #commits',
		'#date',
		'#files => FMMany type: #SVNFile opposite: #commits',
		'#message',
		'#revision'
	],
	#category : #'SVN-Metamodel-Entities-Entities'
}

{ #category : #meta }
SVNCommit class >> annotation [

	<MSEClass: #Commit super: #SVNEntity>
	<package: #'SVN-Metamodel-Entities'>
	<generated>
	^self
]

{ #category : #generator }
SVNCommit class >> generatedSlotNames [
	<generated>
	'SVNCommit class>>#generatedSlotNames'.
	^ #(revision date message files author)
]

{ #category : #generator }
SVNCommit class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
SVNCommit class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
SVNCommit >> addFile: aFile [
	self files add: aFile
]

{ #category : #accessing }
SVNCommit >> author [

	<generated>
	^ author
]

{ #category : #accessing }
SVNCommit >> author: anObject [

	<generated>
	author := anObject

]

{ #category : #accessing }
SVNCommit >> date [

	<MSEProperty: #date type: #Object>
	<generated>
	^ date
]

{ #category : #accessing }
SVNCommit >> date: anObject [

	<generated>
	date := anObject

]

{ #category : #accessing }
SVNCommit >> files [

	<generated>
	^ files
]

{ #category : #accessing }
SVNCommit >> files: anObject [

	<generated>
	files value: anObject

]

{ #category : #accessing }
SVNCommit >> message [

	<MSEProperty: #message type: #String>
	<generated>
	^ message
]

{ #category : #accessing }
SVNCommit >> message: anObject [

	<generated>
	message := anObject

]

{ #category : #accessing }
SVNCommit >> revision [

	<MSEProperty: #revision type: #Number>
	<generated>
	^ revision
]

{ #category : #accessing }
SVNCommit >> revision: anObject [

	<generated>
	revision := anObject

]
