import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/home/presentation/pages/portfolio_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Starter',
      theme: AppTheme.lightTheme,
      home: const PortfolioPage(),
    );
  }
}
