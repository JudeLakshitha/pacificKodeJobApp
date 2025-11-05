import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/models/job.dart';
import 'package:provider/provider.dart';

import '../../../utils/theme/base_theme.dart';
import '../../../utils/theme/theme_provider.dart';

class JobDetailsScreen extends StatelessWidget {
  static const routeName = '/jobDetailScreen';

  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    BaseTheme baseTheme = themeProvider.colors;
    final Job job = ModalRoute.of(context)!.settings.arguments as Job;
    return Scaffold(
      backgroundColor: baseTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Job Details',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: baseTheme.textColor,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "LKR ${job.salary}/month",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              job.fullDescription,
              style: TextStyle(fontSize: 16, color: baseTheme.textColor),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Job Type: ",
                  style: TextStyle(fontSize: 16, color: baseTheme.textColor),
                ),
                Text(
                  job.jobType,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: baseTheme.textColor,
                  ),
                ),
              ],
            ),

            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Location: ",
                  style: TextStyle(fontSize: 16, color: baseTheme.textColor),
                ),
                Text(
                  job.location,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: baseTheme.textColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  side: BorderSide(width: 1.0, color: baseTheme.textColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  "Apply Now",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: baseTheme.textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
