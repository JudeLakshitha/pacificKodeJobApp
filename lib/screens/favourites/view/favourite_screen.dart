import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/common/common.dart';

import '../../../widgets/job_card.dart';

class FavouriteScreen extends StatelessWidget {

  static const routeName = '/favoriteScreen';
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            favJobList.isNotEmpty
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.separated(
                        itemCount: favJobList.length,
                        itemBuilder: (context, index) {
                          final job = favJobList[index].job;
                          return JobCard(
                            job: job,
                            favList: favJobList,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/jobDetailScreen',
                                arguments: job,
                              );
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 20);
                        },
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      'No Favourite Jobs!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
