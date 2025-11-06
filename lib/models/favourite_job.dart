import 'job.dart';

class FavouriteJob {
  final Job job;
  final bool isFav;

  FavouriteJob({required this.job, required this.isFav});

  factory FavouriteJob.fromJson(Map<String, dynamic> json) {
    return FavouriteJob(job: Job.fromJson(json['job']), isFav: json['isFav']);
  }

  Map<String, dynamic> toJson() {
    return {'job': job.toJson(), 'isFav': isFav};
  }
}
