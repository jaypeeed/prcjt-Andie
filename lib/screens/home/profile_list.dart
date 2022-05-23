import 'package:flutter/material.dart';
import 'package:prjct_andie/screens/home/profile_tile.dart';
import 'package:provider/provider.dart';
import 'package:prjct_andie/models/profile.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  Widget build(BuildContext context) {
    
    final profiles = Provider.of<List<Profile>?>(context);

return ListView.builder(
  itemCount: profiles!.length,
    itemBuilder: (context, index) {
      return ProfileTile(profile: profiles[index]);
     },
    );
  }
}
