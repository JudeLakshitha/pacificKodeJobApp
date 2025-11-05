import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/repositories/home_repository.dart';
import 'package:job_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data.dart';
import '../../../widgets/job_card.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  //List<Job> jobList = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeRepository())..add(LoadJobListEvent()),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is LoadingJobListState) {
            setState(() {
              isLoading = true;
            });
          } else if (state is LoadedJobListState) {
            setState(() {
              isLoading = false;
              //jobList = state.jobList;
            });
          } else if (state is ErrorJobListState) {
            setState(() {
              isLoading = false;
            });
          } else if (state is NetworkFailedState) {
            setState(() {
              isLoading = false;
            });
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          jobList.isNotEmpty
                              ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ListView.separated(
                                      itemCount: jobList.length,
                                      itemBuilder: (context, index) {
                                        final job = jobList[index];
                                        return JobCard(
                                          job: job,
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              '/jobDetailScreen',
                                              arguments: job,
                                            );
                                          },
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                            return const SizedBox(height: 20);
                                          },
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'No Jobs Found',
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
          },
        ),
      ),
    );
  }
}
