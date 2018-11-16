Class {
	#name : #SYNVCSAbstractTests,
	#superclass : #Object,
	#instVars : [
		'importer'
	],
	#category : #'SYNCodeVersionner-Tests'
}

{ #category : #'as yet unclassified' }
SYNVCSAbstractTests >> assertParse: aString rule: aRule [
	^ self assert: (self parse: aString rule: aRule) isPetitFailure not 
]

{ #category : #'as yet unclassified' }
SYNVCSAbstractTests >> parse: input rule: startingRule [
	| production |
	production := importer productionAt: startingRule.
	^ production end parse: input
]

{ #category : #'as yet unclassified' }
SYNVCSAbstractTests >> setUp [
	importer := self parserClass new.

]
