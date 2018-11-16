Class {
	#name : #SYNVCSImporter,
	#superclass : #Object,
	#instVars : [
		'model',
		'authors',
		'parser',
		'files'
	],
	#category : #'SYNCodeVersionner-Extractors'
}

{ #category : #accessing }
SYNVCSImporter >> authors [
	
	^ authors
]

{ #category : #accessing }
SYNVCSImporter >> authors: anObject [
	
	authors := anObject
]

{ #category : #creating }
SYNVCSImporter >> createAuthor: authorName [
	^ SYNAuthor new name: authorName ; mooseModel: model; yourself 
]

{ #category : #creating }
SYNVCSImporter >> createCommit: rev date: aDate author: aName message: aString [
	| commit |
	commit := SYNCommit new
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
SYNVCSImporter >> createFile: fileName [
	^ SYNFile new name: fileName ; mooseModel: model; yourself 
]

{ #category : #creating }
SYNVCSImporter >> ensureAuthor: authorName [
	^ authors at: authorName
				ifAbsentPut: [ self createAuthor: authorName ]
]

{ #category : #creating }
SYNVCSImporter >> ensureFile: fileName [
	^ files at: fileName
				ifAbsentPut: [ self createFile: fileName ]
]

{ #category : #initialization }
SYNVCSImporter >> initialize [
	super initialize.
	authors := Dictionary new.
	files := Dictionary new.
	model := MooseModel new.
]

{ #category : #accessing }
SYNVCSImporter >> model [
	
	^ model
]

{ #category : #accessing }
SYNVCSImporter >> model: anObject [
	
	model := anObject
]

{ #category : #accessing }
SYNVCSImporter >> parser [
	
	^ parser
]

{ #category : #accessing }
SYNVCSImporter >> parser: anObject [
	
	parser := anObject
]

{ #category : #public }
SYNVCSImporter >> runOn: aString [
	"converts temporary commits to real one with links to author / file entities
	 adds all entities in the model"
	(parser parse: aString) do: [ :tmp | | header files commit|
		header := tmp first.
		files := tmp second. 
		commit:=self createCommit: header first date:  header fifth author: header third message: tmp third.
		files do: [ :assoc | commit addFile: (self ensureFile: assoc key).  ]
	]
]
