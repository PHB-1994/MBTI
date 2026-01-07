import 'package:flutter/material.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class UserSection extends StatefulWidget {
  const UserSection({super.key});

  @override
  State<UserSection> createState() => _UserSectionState();
}

class _UserSectionState extends State<UserSection> {

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final userName =
        authProvider.user?.userName;

    return Column(
      children: <Widget>[
        // 000 님
        SizedBox(child: Text('$userName님')),
        SizedBox(height: 20),
        SizedBox(child: Text('내 주변 10km 다른 유저의 MBTI 확인하기')),
      ],
    );
  }
}
