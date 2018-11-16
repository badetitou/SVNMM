Class {
	#name : #SVNAuthor,
	#superclass : #SVNEntity,
	#instVars : [
		'#commits => FMMany type: #SVNCommit opposite: #author',
		'#name'
	],
	#category : #'SVN-Metamodel-Entities-Entities'
}

{ #category : #meta }
SVNAuthor class >> annotation [

	<MSEClass: #Author super: #SVNEntity>
	<package: #'SVN-Metamodel-Entities'>
	<generated>
	^self
]

{ #category : #generator }
SVNAuthor class >> generatedSlotNames [
	<generated>
	'SVNAuthor class>>#generatedSlotNames'.
	^ #(name commits)
]

{ #category : #generator }
SVNAuthor class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
SVNAuthor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
SVNAuthor >> addCommit: anObject [
	
	self commits add: anObject
]

{ #category : #accessing }
SVNAuthor >> commits [

	<generated>
	^ commits
]

{ #category : #accessing }
SVNAuthor >> commits: anObject [

	<generated>
	commits value: anObject

]

{ #category : #accessing }
SVNAuthor >> name [

	<MSEProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
SVNAuthor >> name: anObject [

	<generated>
	name := anObject

]
