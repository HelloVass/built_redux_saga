import 'package:built_redux_saga/built_redux_saga.dart';

class _Call<ValueType> extends RunnableFuture {
  final Future<ValueType> _future;

  

  _Call(this._future, [RunnableCallback<ValueType> _success, RunnableCallback _error]) : super(_success, _error){
    this._future.then(this.successHandler).catchError(this.errorHandler);
  }
}



Runnable call<ValueType>(Future<ValueType> future, [Result<ValueType> result]) {
  return _Call(future, result?.onSuccess, result?.onError);
}