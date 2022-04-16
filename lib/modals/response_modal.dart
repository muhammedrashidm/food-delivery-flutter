class ResponseModal{
  bool _isSuccess;
  String _message;
  ResponseModal(this._message,this._isSuccess);
  String get message=>_message;
  bool get isSuccess=>_isSuccess;
}