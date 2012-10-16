#!/bin/sh

# class path based on maven dependencies
CLASSPATH=$CLASSPATH:lib/ucm-11.1.1.6.0.jar:lib/asm-3.3.1.jar:lib/asm-analysis-3.3.1.jar:lib/asm-commons-3.3.1.jar:lib/asm-tree-3.3.1.jar:lib/asm-util-3.3.1.jar:lib/asm-xml-3.3.1.jar:lib/caliper-0.5-rc1.jar:lib/commons-lang-2.6.jar:lib/gson-1.7.1.jar:lib/guava-11.0.1.jar:lib/java-allocation-instrumenter-2.0.jar:lib/jsr305-1.3.9.jar

TWINE_PERF_VERSION=0.9.0.1-SNAPSHOT

# Twine version
TWINE_VERSION=0.9.0

CLASSPATH=$CLASSPATH:lib/ucm-twine-$TWINE_VERSION.jar:lib/ucm-twine-perf-$TWINE_PERF_VERSION.jar

# example test suite to run
TEST_SUITE=org.ucmtwine.perf.benchmarks.ScriptProxyCallingBenchmark

# put your Java bin locations here separated by commas (no spaces)
VMLIST=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home/bin/java

# outputfile
OUTPUTFILE="--saveResults results.json"

java -server -cp $CLASSPATH com.google.caliper.Runner --vm $VMLIST $*
