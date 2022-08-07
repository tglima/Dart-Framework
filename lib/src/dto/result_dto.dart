class ResultDTO {
  late final String _resultMsg;
  late final bool _hasSuccess;
  Object? object;

  ResultDTO(this._hasSuccess, this._resultMsg, [this.object]);

  String get resultMsg => _resultMsg;
  bool get hasSuccess => _hasSuccess;
}
