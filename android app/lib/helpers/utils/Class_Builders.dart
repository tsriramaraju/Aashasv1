import 'package:aashas/main-home.dart';
import 'package:aashas/screens/4-Shop_Screen/Shop-Screen.dart';
import 'package:aashas/screens/6-Designer_Screen/BlogsScreen.dart';
import 'package:aashas/screens/6-Designer_Screen/Messages.dart';
import 'package:aashas/screens/7-User_profile_Screen/NotificationsScreen.dart';
import 'package:aashas/screens/8-Order_Screen/OrderScreen.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<MainHome>(() => MainHome());
    register<BlogsScreen>(() => BlogsScreen());
    register<MessagesScreen>(() => MessagesScreen());
    register<OrdersScreen>(() => OrdersScreen());
    register<NotificationsScreen>(() => NotificationsScreen());
    register<ShopScreen>(() => ShopScreen());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
