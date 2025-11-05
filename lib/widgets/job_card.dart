import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/widgets/tag_card.dart';
import '../models/job.dart';

class JobCard extends StatefulWidget {
  final Job job;
  final VoidCallback onTap;

  const JobCard({super.key, required this.job, required this.onTap});

  @override
  JobCardState createState() => JobCardState();
}

class JobCardState extends State<JobCard> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: Colors.black, width: 1.0),
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
                      ),
                    ),
                  ),

                  IconButton(
                    icon: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                      color: isFavourite ? Colors.red : Colors.black,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavourite = !isFavourite;
                      });
                    },
                  ),
                ],
              ),
              Text(
                widget.job.companyName,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
              Text(widget.job.description, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
