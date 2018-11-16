Class {
	#name : #SYNAuthor,
	#superclass : #FAMIXNamedEntity,
	#instVars : [
		'commits'
	],
	#category : #SYNVersionner
}

{ #category : #'instance creation' }
SYNAuthor class >> annotation [
	<MSEClass: #Author super: #FAMIXNamedEntity>
	<package: #SYN>
	^self
]

{ #category : #'instance creation' }
SYNAuthor class >> anonymous [

	^ self ensureAuthor: self anonymousName 
]

{ #category : #'instance creation' }
SYNAuthor class >> anonymousName [

	^ 'anonymous'
]

{ #category : #'instance creation' }
SYNAuthor class >> ensureAuthor: aString [
	"Return the unique author associated who is named aString"
	
	^self new name: aString.
					
	
]

{ #category : #accessing }
SYNAuthor >> addCommit: anObject [
	
	(commits isNil) ifTrue: [ commits := OrderedCollection new ].
	commits add: anObject
]

{ #category : #accessing }
SYNAuthor >> commits [
	<MSEProperty: #commits type: #SYNCommit opposite: #author> <multivalued> <derived>
	<MSEComment: 'Commits of the Author'>
	^ commits
]

{ #category : #accessing }
SYNAuthor >> commits: anObject [
	
	commits := anObject
]

{ #category : #private }
SYNAuthor >> definedClasses [
]

{ #category : #private }
SYNAuthor >> definedEntities [
]

{ #category : #private }
SYNAuthor >> definesMethods [
]

{ #category : #initialize }
SYNAuthor >> initialize [
	super initialize.
	commits := FMNullMultivalueLink on: self opposite: #author: selector: #commits
]
