import 'package:auto_route/auto_route.dart';

class ServiceItemEntity {
  final String title;
  final String label;
  final String iconSrc;
  final PageRouteInfo screen;

  ServiceItemEntity(this.title, this.label, this.iconSrc, this.screen);
}
