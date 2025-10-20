import 'package:flutter/material.dart';
import 'package:phirus/features/profile/presentation/widgets/profile_body.dart';
import 'package:phirus/features/profile/presentation/widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [ProfileHeader(), ProfileBody()],
      ),
    );
  }
}
