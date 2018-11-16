Class {
	#name : #SVNVCSImporter,
	#superclass : #Object,
	#instVars : [
		'model',
		'authors',
		'parser',
		'files'
	],
	#category : #'SVNCodeVersionner-Extractors'
}

{ #category : #'as yet unclassified' }
SVNVCSImporter class >> runOn: aStream [
	| importer |
	importer := self new parser: SVNLogImporter new.
	^importer runOn: aStream.
]

{ #category : #'as yet unclassified' }
SVNVCSImporter class >> runOnAFile: aFileName [
	^ self runOn:aFileName asFileReference contents.
]

{ #category : #accessing }
SVNVCSImporter >> authors [
	
	^ authors
]

{ #category : #accessing }
SVNVCSImporter >> authors: anObject [
	
	authors := anObject
]

{ #category : #creating }
SVNVCSImporter >> createAuthor: authorName [
	^ SVNAuthor new name: authorName ; mooseModel: model; yourself 
]

{ #category : #creating }
SVNVCSImporter >> createCommit: rev date: aDate author: aName message: aString [
	| commit |
	commit := SVNCommit new
		revision: rev  asInteger;
		date: (DateAndTime fromString: aDate);
		author: (self ensureAuthor: aName);
		message: aString;
		mooseModel: model;
		yourself.
	commit author addCommit: commit.
	^ commit
]

{ #category : #creating }
SVNVCSImporter >> createFile: fileName [
	^ SVNFile new name: fileName ; mooseModel: model; yourself 
]

{ #category : #creating }
SVNVCSImporter >> ensureAuthor: authorName [
	^ authors at: authorName
				ifAbsentPut: [ self createAuthor: authorName ]
]

{ #category : #creating }
SVNVCSImporter >> ensureFile: fileName [
	^ files at: fileName
				ifAbsentPut: [ self createFile: fileName ]
]

{ #category : #initialization }
SVNVCSImporter >> initialize [
	super initialize.
	authors := Dictionary new.
	files := Dictionary new.
	model := MooseModel new.
]

{ #category : #accessing }
SVNVCSImporter >> model [
	
	^ model
]

{ #category : #accessing }
SVNVCSImporter >> model: anObject [
	
	model := anObject
]

{ #category : #accessing }
SVNVCSImporter >> parser [
	
	^ parser
]

{ #category : #accessing }
SVNVCSImporter >> parser: anObject [
	
	parser := anObject
]

{ #category : #public }
SVNVCSImporter >> runOn: aString [
	"converts temporary commits to real one with links to author / file entities
	 adds all entities in the model"
	(parser parse: aString) do: [ :tmp | | header filesList commit|
		header := tmp first.
		filesList := tmp second. 
		commit:=self createCommit: header first date:  header fifth author: header third message: tmp third.
		filesList ifNotNil: [ filesList do: [ :assoc | commit addFile: (self ensureFile: assoc key). ] ]
	]
]
