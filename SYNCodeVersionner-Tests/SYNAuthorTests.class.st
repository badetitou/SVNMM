"
A FamixAuthorTests is xxxxxxxxx.

Instance Variables
	author:		<Object>

author
	- xxxxx

"
Class {
	#name : #SYNAuthorTests,
	#superclass : #TestCase,
	#instVars : [
		'author'
	],
	#category : #'SYNCodeVersionner-Tests'
}

{ #category : #initialization }
SYNAuthorTests >> setUp [
	SYNAuthor initialize.
	author := SYNAuthor ensureAuthor: 'me'.
	author age: 12; institution: 'inria'.

]

{ #category : #tests }
SYNAuthorTests >> testAnonymous [
	"self debug: #testAnonymous"
	
	| ano ano2|
	ano := SYNAuthor anonymous.
	self assert: ano name = SYNAuthor anonymousName.
	
	ano2 := SYNAuthor anonymous.
	self assert: ano2 == ano.
]

{ #category : #tests }
SYNAuthorTests >> testAuthorWithSameNameAreSameAuthor [
	"self debug: #testAuthorWithSameNameAreSameAuthor"
	
	| au2 au3 |
	au2 := SYNAuthor ensureAuthor: 'me'.
	self assert: au2 == author.
	au3 := SYNAuthor ensureAuthor: 'notMe'.
	self deny: au2 == au3.
	self deny: au3 == author.
]

{ #category : #tests }
SYNAuthorTests >> testStupidCreation [
	"self debug: #testStupidCreation"
	
	self assert: author name = 'me'.
	self assert: author age = 12.
	self assert: author institution  = 'inria'.
	
]
