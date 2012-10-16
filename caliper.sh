#!/bin/sh


CLASSPATH=$CLASSPATH:lib/ucm-11.1.1.6.0.jar:lib/asm-3.3.1.jar:lib/asm-analysis-3.3.1.jar:lib/asm-commons-3.3.1.jar:lib/asm-tree-3.3.1.jar:lib/asm-util-3.3.1.jar:lib/asm-xml-3.3.1.jar:lib/caliper-0.5-rc1.jar:lib/commons-lang-2.6.jar:lib/gson-1.7.1.jar:lib/guava-11.0.1.jar:lib/java-allocation-instrumenter-2.0.jar:lib/jsr305-1.3.9.jar:lib/ucm-twine-perf-0.9.0.1-SNAPSHOT.jar:lib/ucm-twine-0.9.0.jar

TEST_SUITE=org.ucmtwine.perf.benchmarks.ScriptProxyCallingBenchmark

java -server -cp $CLASSPATH com.google.caliper.Runner $TEST_SUITE $*
