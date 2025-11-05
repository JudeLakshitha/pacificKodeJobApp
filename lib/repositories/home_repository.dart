import 'package:job_app/models/response.dart';
import 'package:job_app/network/api_helper.dart';
import 'package:job_app/network/urls.dart';

class HomeRepository {
  ApiHelper apiHelper = ApiHelper();

  HomeRepository();

  Future<Response> jobData(Map<String, dynamic> data) async {
    try {
      final apiResponse = await apiHelper.apiGet(getJobListUrl);
      Response response = Response.fromJson(apiResponse, (json) => apiResponse);
      return response;
    } catch (e) {
      return Response(status: "Error", message: e.toString(), data: null);
    }
  }
}
