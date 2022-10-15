enum DataState { none, loading, success, failure }

extension DataStateExt on DataState {
  isSuccess() => this == DataState.success;
  isFailure() => this == DataState.failure;
  isLoading() => this == DataState.loading;
}
