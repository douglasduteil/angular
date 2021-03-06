import 'package:angular2/testing_internal.dart' show SpyObject;
import 'package:angular2/core.dart' show LifeCycle, Injector, bind;
import 'package:angular2/src/core/linker/dynamic_component_loader.dart'
    show ComponentRef_;
import 'dart:js';

@proxy
class SpyLifeCycle extends SpyObject implements LifeCycle {
  noSuchMethod(m) => super.noSuchMethod(m);
}

@proxy
class SpyComponentRef extends SpyObject implements ComponentRef_ {
  Injector injector;

  SpyComponentRef() {
    this.injector =
        Injector.resolveAndCreate([bind(LifeCycle).toClass(SpyLifeCycle)]);
  }

  noSuchMethod(m) => super.noSuchMethod(m);
}

void callNgProfilerTimeChangeDetection([config]) {
  context['ng']['profiler']
      .callMethod('timeChangeDetection', config != null ? [config] : []);
}
