"
Creating because in another day, we might need to add SYN related stuff
"
Class {
	#name : #SYNFile,
	#superclass : #FAMIXFile,
	#category : #SYNVersionner
}

{ #category : #'as yet unclassified' }
SYNFile class >> annotation [
	<MSEClass: #File super: #FAMIXFile>
	<package: #SYN>
	^self
]

{ #category : #'as yet unclassified' }
SYNFile >> entities [
	<MSEProperty: #entities type: #SYNCommit opposite: #files> <multivalued> <derived>
	<MSEComment: 'commits relative to the file'>
	^entities
]

{ #category : #'as yet unclassified' }
SYNFile >> entities: aCommitInstance [
	Halt now.
	entities := FMMultivalueLink on: self
					update: #files
					from: self entities  
					to: aCommitInstance
]

{ #category : #'as yet unclassified' }
SYNFile >> initialize [
	super initialize.
	entities := FMMultiMultivalueLink  
		on: self
		opposite: #files.
]
