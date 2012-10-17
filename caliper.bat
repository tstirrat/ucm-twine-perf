@echo off
SETLOCAL

REM class path based on maven dependencies
SET CLASSPATH=lib\ucm-11.1.1.6.0.jar;lib\asm-3.3.1.jar;lib\asm-analysis-3.3.1.jar;lib\asm-commons-3.3.1.jar;lib\asm-tree-3.3.1.jar;lib\asm-util-3.3.1.jar;lib\asm-xml-3.3.1.jar;lib\caliper-0.5-rc1.jar;lib\commons-lang-2.6.jar;lib\gson-1.7.1.jar;lib\guava-11.0.1.jar;lib\java-allocation-instrumenter-2.0.jar;lib\jsr305-1.3.9.jar

SET TWINE_PERF_VERSION=0.9.0.1-SNAPSHOT

REM Twine version
SET TWINE_VERSION=0.9.0

SET CLASSPATH=%CLASSPATH%;lib\ucm-twine-%TWINE_VERSION%.jar;lib\ucm-twine-perf-%TWINE_PERF_VERSION%.jar

REM example test suite to run
SET TEST_SUITE=org.ucmtwine.perf.benchmarks.ScriptProxyCallingBenchmark

REM put your Java bin locations here separated by commas (no spaces)
SET VMLIST="C:\Program Files\Java\jdk1.6.0_31\jre\bin\java.exe,C:\Program Files\Java\jdk1.7.0\jre\bin\java.exe"

REM outputfile
SET OUTPUTFILE="--saveResults results.json"

java.exe -server -cp %CLASSPATH% com.google.caliper.Runner --warmupMillis 10000 --runMillis 10000 --vm %VMLIST% %TEST_SUITE%