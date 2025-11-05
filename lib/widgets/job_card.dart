import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/widgets/tag_card.dart';
import 'package:provider/provider.dart';
import '../common/common.dart';
import '../models/favourite_job.dart';
import '../models/job.dart';
import '../utils/theme/base_theme.dart';
import '../utils/theme/theme_provider.dart';

class JobCard extends StatefulWidget {
  final Job job;
  final VoidCallback onTap;
  final List<FavouriteJob> favList;

  const JobCard({
    super.key,
    required this.job,
    required this.onTap,
    required this.favList,
  });

  @override
  JobCardState createState() => JobCardState();
}

class JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    BaseTheme baseTheme = themeProvider.colors;
    bool isFavourite = favJobList.any(
      (fav) => fav.job.jobId == widget.job.jobId,
    );
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        color: baseTheme.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: baseTheme.borderColor, width: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 280,
                    child: Text(
                      widget.job.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: baseTheme.textColor,
                      ),
                    ),
                  ),

                  IconButton(
                    icon: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                      color: isFavourite ? Colors.red : baseTheme.textColor,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavourite = !isFavourite;
                      });
                      if (isFavourite) {
                        FavouriteJob favJob = FavouriteJob(
                          job: widget.job,
                          isFav: true,
                        );
                        favJobList.add(favJob);
                      } else {
                        favJobList.removeWhere(
                          (element) => element.job.jobId == widget.job.jobId,
                        );
                      }
                    },
                  ),
                ],
              ),
              Text(
                widget.job.companyName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: baseTheme.textColor,
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TagCard(tag: widget.job.jobType),
                  SizedBox(width: 8),
                  TagCard(tag: widget.job.location),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "LKR ${widget.job.salary}/month",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12),
              Text(
                widget.job.description,
                style: TextStyle(fontSize: 16, color: baseTheme.textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
