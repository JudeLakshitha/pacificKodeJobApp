import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/repositories/home_repository.dart';
import 'package:job_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../common/common.dart';
import '../../../data/data.dart';
import '../../../models/job.dart';
import '../../../utils/theme/base_theme.dart';
import '../../../utils/theme/theme_provider.dart';
import '../../../widgets/job_card.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  //List<Job> jobList = [];
  List<Job> filterJobList = jobList;
  TextEditingController searchTextController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    BaseTheme baseTheme = themeProvider.colors;
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
              //filterJobList = state.jobList;
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
              backgroundColor: baseTheme.backgroundColor,
              appBar: AppBar(
                title: Text(
                  'Jobs',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                centerTitle: true,
                backgroundColor: Colors.amber,
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.bookmark_border,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/favoriteScreen');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.nightlight_outlined,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () {

                    },
                  ),
                ],
              ),
              body: SafeArea(
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.amber),
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SizedBox(
                                    height: 70,
                                    child: TextField(
                                      controller: searchTextController,
                                      onChanged: (value) {
                                        final String searchText =
                                            searchTextController.text.trim();
                                        setState(() {
                                          filterJobList = jobList.where((job) {
                                            return job.title
                                                    .toLowerCase()
                                                    .contains(
                                                      searchText.toLowerCase(),
                                                    ) ||
                                                job.location
                                                    .toLowerCase()
                                                    .contains(
                                                      searchText.toLowerCase(),
                                                    );
                                          }).toList();
                                        });
                                      },
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: baseTheme.textColor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText:
                                            'Search using job title or location',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          borderSide: BorderSide(
                                            color: baseTheme.borderColor,
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          borderSide: BorderSide(
                                            color: baseTheme.borderColor,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          jobList.isNotEmpty
                              ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ListView.separated(
                                      itemCount: filterJobList.length,
                                      itemBuilder: (context, index) {
                                        final job = filterJobList[index];
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
