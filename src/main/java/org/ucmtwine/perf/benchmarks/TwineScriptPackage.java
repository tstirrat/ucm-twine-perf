package org.ucmtwine.perf.benchmarks;

import org.ucmtwine.annotation.IdocFunction;

public class TwineScriptPackage {

  @IdocFunction
  public Long strLength(String input) {
    return new Long(input.length());
  }
}
