import 'package:chatinganfe/bloc/user/user_bloc.dart';
import 'package:chatinganfe/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListuserPage extends StatelessWidget {
  const ListuserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list data user'),
      ),
      body: BlocProvider(
        create: (context) => UserBloc()..add(UserList()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              print(state);
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: state.user.map((users) {
                  return Container(
                    width: double.infinity,
                    height: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Name : '),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Email : '),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(users.name!),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(users.email!),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
