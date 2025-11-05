class Job {
  final int jobId;
  final String title;
  final String companyName;
  final String location;
  final String jobType;
  final String description;
  final String fullDescription;
  final String salary;

  Job({
    required this.jobId,
    required this.title,
    required this.companyName,
    required this.location,
    required this.jobType,
    required this.description,
    required this.fullDescription,
    required this.salary,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      jobId: json['jobId'],
      title: json['title'],
      companyName: json['companyName'],
      location: json['location'],
      jobType: json['jobType'],
      description: json['description'],
      fullDescription: json['fullDescription'],
      salary: json['salary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobId': jobId,
      'title': title,
      'companyName': companyName,
      'location': location,
      'jobType': jobType,
      'description': description,
      'fullDescription': fullDescription,
      'salary': salary,
    };
  }
}
