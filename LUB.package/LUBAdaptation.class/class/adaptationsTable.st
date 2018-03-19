accessing
adaptationsTable
	^ adaptationTable ifNil: [ adaptationTable := WeakKeyDictionary new ]