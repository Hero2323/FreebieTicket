import '../../domain/models/filter.dart';
import '../resources/asset_images.dart';
import '../styles/app_colors.dart';

List<Filter> filters = [
  Filter(
    id: 1,
    color: AppColors.red,
    image: AssetImages.yourAreaIcon,
    name: 'Your Area'.toUpperCase(),
  ),
  Filter(
    id: 2,
    color: AppColors.blue,
    image: AssetImages.musicIcon,
    name: 'Music'.toUpperCase(),
  ),
  Filter(
    id: 3,
    color: AppColors.orange,
    image: AssetImages.sportsIcon,
    name: 'Sports'.toUpperCase(),
  ),
];
