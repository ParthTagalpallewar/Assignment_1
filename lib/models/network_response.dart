import 'package:untitled/models/response_type.dart';

class NetworkResponse{
    ResponseType responseType;
    dynamic result;
    int statusCode;

    NetworkResponse(this.responseType, this.result, this.statusCode);
}