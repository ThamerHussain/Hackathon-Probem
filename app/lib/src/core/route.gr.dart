// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute({List<PageRouteInfo>? children})
    : super(HomePageRoute.name, initialChildren: children);

  static const String name = 'HomePageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [UserDetailsPage]
class UserDetailsPageRoute extends PageRouteInfo<UserDetailsPageRouteArgs> {
  UserDetailsPageRoute({
    Key? key,
    required String fingerPrintId,
    List<PageRouteInfo>? children,
  }) : super(
         UserDetailsPageRoute.name,
         args: UserDetailsPageRouteArgs(key: key, fingerPrintId: fingerPrintId),
         initialChildren: children,
       );

  static const String name = 'UserDetailsPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserDetailsPageRouteArgs>();
      return UserDetailsPage(key: args.key, fingerPrintId: args.fingerPrintId);
    },
  );
}

class UserDetailsPageRouteArgs {
  const UserDetailsPageRouteArgs({this.key, required this.fingerPrintId});

  final Key? key;

  final String fingerPrintId;

  @override
  String toString() {
    return 'UserDetailsPageRouteArgs{key: $key, fingerPrintId: $fingerPrintId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserDetailsPageRouteArgs) return false;
    return key == other.key && fingerPrintId == other.fingerPrintId;
  }

  @override
  int get hashCode => key.hashCode ^ fingerPrintId.hashCode;
}

/// generated route for
/// [UserRegistrationPage]
class UserRegistrationPageRoute extends PageRouteInfo<void> {
  const UserRegistrationPageRoute({List<PageRouteInfo>? children})
    : super(UserRegistrationPageRoute.name, initialChildren: children);

  static const String name = 'UserRegistrationPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserRegistrationPage();
    },
  );
}
