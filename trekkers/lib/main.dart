import 'package:trekkers/achievements/achievements_items.dart';
import 'package:trekkers/achievements/achievements_items_2.dart';
import 'package:trekkers/achievements/achievements_page.dart';
import 'package:trekkers/achievements/achievements_progress.dart';
import 'package:trekkers/achievements/challenge_page.dart';
import 'package:trekkers/app/blocs/authentication_bloc.dart';
import 'package:trekkers/cart/views/cart_page.dart';
import 'package:trekkers/checkin/views/check_in.dart';
import 'package:trekkers/checkin/views/check_in_page.dart';
import 'package:trekkers/checkin/views/my_check_in_page.dart';
import 'package:trekkers/events/models/event.dart';
import 'package:trekkers/events/views/events_screen.dart';
import 'package:trekkers/friends/friend_list_page.dart';
import 'package:trekkers/friends/me_friends_page.dart';
import 'package:trekkers/friends/models/friend.dart';
import 'package:trekkers/level/friends_page.dart';
import 'package:trekkers/level/level_page.dart';
import 'package:trekkers/level/me_page.dart';
import 'package:trekkers/login/views/login_page.dart';
import 'package:trekkers/login/views/start_page.dart';
import 'package:trekkers/news/views/noticias_screen.dart';
import 'package:trekkers/payment/views/payment_page.dart';
import 'package:trekkers/profile/views/profile.dart';
import 'package:trekkers/profile/views/profile_detail.dart';
import 'package:trekkers/screens/user-participated-events/user_participated_events_screen.dart';
import 'package:trekkers/shared/models/shopping_cart.dart';
import 'package:trekkers/shared/utils/navigator_key.dart';
import 'package:trekkers/shared/utils/store.dart';
import 'package:trekkers/signup/views/cadstre_se.dart';
import 'package:trekkers/store/views/loja_screen.dart';
import 'package:trekkers/trail/views/begin_trail_map.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  IAuthenticationBloc _authenticationBloc;
  ShoppingCart _shoppingCart;

  @override
  void initState() {
    _shoppingCart = ShoppingCart();
    _authenticationBloc = AuthenticationBloc(SharedPreferencesTokenStore());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationProvider(
      _authenticationBloc,
      _shoppingCart,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Trekkers',
        routes: {
          // '/': (context) => ForgotPassword(),
          //   '/':(context) => TicketsPage(),
          '/': (context) => LoginPage(),
          //  '/': (context) => MeFriendsPage(),
          //  '/': (context) =>  const EventsScreen(),
          // '/': (context) => const LojaScreen(),
          // '/': (context) => const UserParticipatedEventsScreen(id: 1,),
          // '/': (context) => const NewsPage(),
          // '/': (context) => const Profile(),
          //   '/': (context) => const StartPage(),
// '/': (context) => TrailMap(),
          //    '/medals': (context) => ProgressPage(),
          // '/': (context) => ProgressPage(),
//'/': (context) => AchievementsProgress(),
//'/': (context) => CheckInPage(),]
          '/my_checkin': (context) => const MyCheckinPage(),
          '/amigos': (context) => FriendListPage(),
          '/medals': (context) => const AchievementsProgress(),
          '/news': (context) => const NewsPage(),
          '/events': (context) => const EventsPage(),
          '/store': (context) => const StorePage(),
          '/news': (context) => const NewsPage(),
          '/begin_trail': (context) => const BeginTrailMap(),
          '/athlete_checkin': (context) => const CheckinScannerPage(),
          '/profile': (context) => const ProfilePage(),
          '/profileDetail': (context) => const ProfileDetailPage()
        },
        theme: ThemeData(
          primaryColor: Colors.yellowAccent,
          secondaryHeaderColor: Colors.yellow[700],
          accentColor: Colors.yellow[700],
        ),
      ),
    );
  }
}

class AuthenticationProvider extends InheritedWidget {
  const AuthenticationProvider(this.authenticationBloc, this.shoppingCart,
      {Key key, this.child})
      : super(key: key, child: child);
  final AuthenticationBloc authenticationBloc;
  final ShoppingCart shoppingCart;
  final Widget child;

  static AuthenticationProvider of(BuildContext context) {
    return (context
        .dependOnInheritedWidgetOfExactType<AuthenticationProvider>());
  }

  @override
  bool updateShouldNotify(AuthenticationProvider oldWidget) {
    return false;
  }
}
/*
 Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AmountButton(
                          onTap: () {},
                          borderColor: Colors.grey,
                          icon: const Icon(Icons.remove,
                              size: 15, color: Colors.grey),
                          radius: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text("5"),
                        ),
                        AmountButton(
                          onTap: () {},
                          borderColor: Colors.grey,
                          icon: const Icon(Icons.add,
                              size: 15, color: Colors.grey),
                          radius: 40,
                        ),
                      ],
                    )
*/
