package org.ucmtwine.perf.benchmarks;

import intradoc.common.ExecutionContext;
import intradoc.common.GrammarElement;
import intradoc.common.ScriptInfo;
import intradoc.common.ServiceException;
import intradoc.server.Service;
import intradoc.shared.UserData;

import org.ucmtwine.proxy.ScriptProxy;

import com.google.caliper.SimpleBenchmark;

public class ScriptProxyCallingBenchmark extends SimpleBenchmark {

  private ScriptProxy proxy;
  private ExecutionContext ctx;
  private ScriptInfo info;
  private Object args[];
  private VanillaScriptPackage vanilla;

  public void setUp() {
    proxy = new ScriptProxy(TwineScriptPackage.class);
    ctx = new Service();
    ctx.setCachedObject("UserData", new UserData());
    info = new ScriptInfo();
    info.m_key = "strLength";
    // index, arg count, arg 1 type, arg 2 type return type
    info.m_entry = new int[] { 0, 1, GrammarElement.STRING_VAL, -1, ScriptProxy.RETURN_INTEGER };

    args = new Object[] { "testString", new Integer(2) };

    vanilla = new VanillaScriptPackage();
  }

  public void timeVanillaCall(int reps) throws ServiceException {
    for (int i = 0; i < reps; i++) {
      vanilla.evaluateFunction(info, args, ctx);
    }
  }

  public void timeTwineProxyCall(int reps) throws ServiceException {
    for (int i = 0; i < reps; i++) {
      proxy.evaluateFunction(info, args, ctx);
    }
  }

}
