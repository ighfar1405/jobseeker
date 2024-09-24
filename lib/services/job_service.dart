// lib/services/job_service.dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/job.dart';

class JobService {
  static final host = 'https://api.jobee.my.id/api';
  static final imgUrl = 'https://api.jobee.my.id/storage/images';
  static getHost() {
    return imgUrl;
  }

  Future<List<Job>> fetchJobs() async {
    final response = await http.get(Uri.parse('$host/jobs'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Job> jobs = body.map((dynamic item) => Job.fromJson(item)).toList();
      return jobs;
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  Future<List<Job>> searchJobs(String query) async {
    final response = await http.get(Uri.parse('$host/search?query=$query'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Job> jobs = body.map((dynamic item) => Job.fromJson(item)).toList();
      return jobs;
    } else {
      throw Exception('Failed to search jobs');
    }
  }

  Future<Job?> FetchJobDetail(int id) async {
    final response = await http.get(Uri.parse('$host/jobs/$id'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Job.fromJson(json);
    } else {
      // Handle error
      return null;
    }
  }
}
