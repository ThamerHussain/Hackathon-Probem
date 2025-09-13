import 'package:hackathon/src/presentation/home/page/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

part 'route.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter(ref: ref));

@AutoRouterConfig(replaceInRouteName: 'Page,PageRoute|Widget,WidgetRoute')
class AppRouter extends RootStackRouter {
  final Ref ref;

  AppRouter({super.navigatorKey, required this.ref});

  @override
  late final List<AutoRoute> routes = [
    AutoRoute(page: HomePageRoute.page, initial: true, path: '/'),
  ];

  @override
  RouteType get defaultRouteType => RouteType.custom(
    transitionsBuilder: TransitionsBuilders.fadeIn,
    duration: Duration(milliseconds: 300),
    reverseDuration: Duration(milliseconds: 300),
  );
}
