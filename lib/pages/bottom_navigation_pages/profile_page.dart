import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _SettingPageState();
}

class _SettingPageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title: Text("Profile"),),
    );
  }
}