import 'package:dio/dio.dart';

import '../../app/constants.dart';
import '../../helper/http_service.dart';
import '../../model/course.dart';
import 'response/course_response.dart';

class CourseRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();
  
  Future<List<Course>> getAllCourse() async{
    try{
      Response response = await _httpServices.get(
        Constant.courseURL,
      );
    if (response.statusCode == 200){
      CourseResponse courseResponse = CourseResponse.fromJson(response.data);
      return courseResponse.data!;
    } else{
      return [];
    } 
    }catch (e){
      throw Exception(e.toString());
    }
  }
}
