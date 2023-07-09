import 'package:go_router/go_router.dart';
import 'package:untitled/screens/main_panel.dart';
import '../screens/error_screen.dart';
import '../screens/panels_ui/dashboard_and_add_items/dashboard_add_item.dart';
import '../screens/panels_ui/services_management/add_prompts_page.dart';
import '../screens/panels_ui/services_management/service_details_prompts.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
        name: "mainPanelScreen",
        path: "/mainPanelScreen",
        builder: (context, state) => const MainPanelScreen(),
        routes: [
          GoRoute(
            name: "dashboardAddItem",
            path: "dashboardAddItem",
            builder: (context, state) => const DashboardAddItemScreen(),
          ),
          GoRoute(
            name: "AddPromptsScreen",
            path: "AddPromptsScreen",
            builder: (context, state) => const AddPromptsScreen()
          ),
          GoRoute(
              name: "ServicesDetailsPageScreen",
              path: "ServicesDetailsPageScreen",
              builder: (context, state) => const ServicesDetailsPageScreen()
          )
        ])
  ],
  initialLocation: "/mainPanelScreen",
  errorBuilder: (context, state) => const ErrorScreen(),
);
