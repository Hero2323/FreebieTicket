import 'package:flutter/material.dart';
import 'package:ticket_app/presentation/router/router_names.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/router/app_router.dart';
import '../domain/ext.dart';

class TicketApp extends ConsumerWidget {
  const TicketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.getRoute,
      initialRoute: RouterNames.mainRoute,
      title: 'Ticket App',
      theme: ref.theme,
    );
  }
}
