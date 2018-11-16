Class {
	#name : #SVNFile,
	#superclass : #SVNEntity,
	#instVars : [
		'#commits => FMMany type: #SVNCommit opposite: #files',
		'#name'
	],
	#category : #'SVN-Metamodel-Entities-Entities'
}

{ #category : #meta }
SVNFile class >> annotation [

	<MSEClass: #File super: #SVNEntity>
	<package: #'SVN-Metamodel-Entities'>
	<generated>
	^self
]

{ #category : #generator }
SVNFile class >> generatedSlotNames [
	<generated>
	'SVNFile class>>#generatedSlotNames'.
	^ #(name commits)
]

{ #category : #generator }
SVNFile class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
SVNFile class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
SVNFile >> commits [

	<generated>
	^ commits
]

{ #category : #accessing }
SVNFile >> commits: anObject [

	<generated>
	commits value: anObject

]

{ #category : #accessing }
SVNFile >> name [

	<MSEProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
SVNFile >> name: anObject [

	<generated>
	name := anObject

]
