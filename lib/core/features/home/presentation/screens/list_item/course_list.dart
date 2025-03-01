import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../bloc/course_bloc/course_bloc.dart';
import '../../../../../../bloc/course_bloc/course_state.dart';
import '../../../../../../model/course_model.dart';
import '../../../../../utils/colors.dart';
import '../live_course/course_create/step_1_screen.dart';

class CourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        if (state is CourseLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CourseLoaded) {
          return state.courses.isNotEmpty ? ListView.builder(
            shrinkWrap: true,
            itemCount: state.courses.length,
            itemBuilder: (context, index) {
              Course course = state.courses[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Course Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/course_card.jpeg', // Replace with your image
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Course Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                course.courseType,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                course.type,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      side: const BorderSide(
                                          color: Colors.deepOrange),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 18,
                                        vertical: 5,
                                      ),
                                    ),
                                    child: const Text(
                                      'Details',
                                      style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Edit',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.edit_outlined,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ):  Column(

            children: [


              Image.asset(
                'assets/images/home.png',
                height: 250,
              ),
              const SizedBox(height: 16),
              const Text(
                "You don’t have any live sessions listed here yet",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LiveStepOneScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColorCode,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Create Live Session',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          );
        } else if (state is CourseError) {
          return Center(child: Text(state.message));
        }
        return Center(child: Text("No Courses Available"));
      },
    );
  }
}
