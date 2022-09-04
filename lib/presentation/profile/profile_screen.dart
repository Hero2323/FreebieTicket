import 'package:flutter/material.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';

import '../resources/asset_images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              radius: 54,
              backgroundImage: AssetImage(AssetImages.ticketsActive),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.language, color: AppColors.red),
          title: Text('Change Language',
              style: Theme.of(context).textTheme.titleSmall),
          trailing: const Icon(Icons.arrow_forward_ios,
              size: 16, color: AppColors.red),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.call, color: AppColors.red),
          title:
              Text('Contact Us', style: Theme.of(context).textTheme.titleSmall),
          trailing: const Icon(Icons.arrow_forward_ios,
              size: 16, color: AppColors.red),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.share, color: AppColors.red),
          title: Text('Invite Your Friends',
              style: Theme.of(context).textTheme.titleSmall),
          trailing: const Icon(Icons.arrow_forward_ios,
              size: 16, color: AppColors.red),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.help, color: AppColors.red),
          title:
              Text('About Us', style: Theme.of(context).textTheme.titleSmall),
          trailing: const Icon(Icons.arrow_forward_ios,
              size: 16, color: AppColors.red),
          onTap: () {},
        ),
      ],
    );
  }
}
