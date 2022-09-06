import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';

import '../resources/asset_images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: Theme(
        data: ThemeData(
          splashColor: AppColors.red.withOpacity(0.2),
          highlightColor: Colors.red.withOpacity(0.1),
        ),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 54,
                  child: SvgPicture.asset(AssetImages.appLogo, height: 110),
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
              title: Text('Contact Us',
                  style: Theme.of(context).textTheme.titleSmall),
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
              title: Text('About Us',
                  style: Theme.of(context).textTheme.titleSmall),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: AppColors.red),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
