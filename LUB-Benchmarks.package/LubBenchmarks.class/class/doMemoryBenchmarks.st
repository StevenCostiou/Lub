benchmarks - memory
doMemoryBenchmarks
	<script>
	self generateTestClasses.
	Smalltalk garbageCollect.
	self lubMemoryBenchmarkSameClass.
	Smalltalk garbageCollect.
	self lubMemoryBenchmarkDifferentClasses.
	Smalltalk garbageCollect.
	self pharoMemoryBenchmarkSameClass.
	Smalltalk garbageCollect.
	self pharoMemoryBenchmarkDifferentClasses.
	self removeTestClasses