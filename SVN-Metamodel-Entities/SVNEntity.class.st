Class {
	#name : #SVNEntity,
	#superclass : #MooseEntity,
	#category : #'SVN-Metamodel-Entities-Entities'
}

{ #category : #meta }
SVNEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'SVN-Metamodel-Entities'>
	<generated>
	^self
]

{ #category : #generator }
SVNEntity class >> generatedSlotNames [
	<generated>
	'SVNEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
SVNEntity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
SVNEntity class >> metamodel [

	<generated>
	^ (self class environment at: #SVNMetamodelGenerator) metamodel
]

{ #category : #meta }
SVNEntity class >> requirements [

	<generated>
	^ {  }
]
