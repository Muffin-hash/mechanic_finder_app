import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:untitled2/problem_input.dart';
import 'package:untitled2/mechanic_registration.dart';
import 'package:untitled2/admin_issues_supervision.dart';
import 'app_provider.dart';
import 'login_screen.dart';

// Initialize Supabase BEFORE runApp
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fdbhxxfegevxcqgathsj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZkYmh4eGZlZ2VmeGNxZ2F0aHNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODg5NTMzOTcsImV4cCI6MjEwNDUyOTM5N30.zZnYsnU_vDEFSXUn1an8RqwjD2mjqrx9o57AduRiSI4',
  );

  runApp(const ClearDriveApp());
}

class ClearDriveApp extends StatelessWidget {
  const ClearDriveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        title: 'ClearDrive',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Inter',
          scaffoldBackgroundColor: const Color(0xFFF7F9FB),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF1B6EF3),
            primary: const Color(0xFF1B6EF3),
          ),
          useMaterial3: true,
        ),
        home: const LoginScreen(), // App starts at the Login Screen
      ),
    );
  }
}

// This is the Homepage shown AFTER successful login
class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  int? _selected;

  final List<RoleOption> _roles = const [
    RoleOption(
      icon: Icons.directions_car_rounded,
      title: "I'm a driver",
      points: [
        'Diagnose vehicle issues',
        'Find nearby support',
        'Track repairs & protection',
      ],
    ),
    RoleOption(
      icon: Icons.build_rounded,
      title: "I'm a mechanic",
      points: [
        'Set up your workshop',
        'Browse repair requests',
        'Manage customer feedback',
      ],
    ),
    RoleOption(
      icon: Icons.shield_rounded,
      title: "I'm an administrator",
      points: [
        'Review damage reports',
        'Verify submitted evidence',
        'Manage reimbursements',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1B6EF3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.cleaning_services_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'ClearDrive',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF16223A),
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.help_outline_rounded),
                    color: const Color(0xFF6B7686),
                  ),
                ],
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome 👋',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1B6EF3),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'How will you use\nClearDrive?',
                      style: TextStyle(
                        fontSize: 26,
                        height: 1.2,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Select the option that best describes you to personalize your experience.',
                      style: TextStyle(
                        fontSize: 13,
                        color: const Color(0xFF6B7686),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Role list
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _roles.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final role = _roles[index];
                  final isSelected = _selected == index;
                  return _RoleCard(
                    role: role,
                    isSelected: isSelected,
                    onTap: () => setState(() => _selected = index),
                  );
                },
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 18),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: _selected == null
                          ? null
                          : () {
                        // Check if the selected role is "driver" (index 0)
                        if (_selected == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CarDiagnosticApp(),
                            ),
                          );
                        }
                        // Check if the selected role is "mechanic" (index 1)
                        else if (_selected == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MechanicRegistrationScreen(),
                            ),
                          );
                        }
                        // Check if the selected role is "administrator" (index 2)
                        else if (_selected == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProtectionOversightScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B6EF3),
                        disabledBackgroundColor: const Color(0xFFB8CBF0),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: const Text('Continue'),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not sure which to choose? ',
                        style: TextStyle(
                          fontSize: 13,
                          color: const Color(0xFF6B7686),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Contact support',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1B6EF3),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoleOption {
  final IconData icon;
  final String title;
  final List<String> points;

  const RoleOption({
    required this.icon,
    required this.title,
    required this.points,
  });
}

class _RoleCard extends StatelessWidget {
  final RoleOption role;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.role,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final border = isSelected
        ? Border.all(color: const Color(0xFF1B6EF3), width: 2)
        : Border.all(color: const Color(0xFFE4E9F0), width: 1);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF1F6FF) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: border,
        boxShadow: [
          if (!isSelected)
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon badge
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF1B6EF3)
                        : const Color(0xFFEEF3FB),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    role.icon,
                    color:
                    isSelected ? Colors.white : const Color(0xFF1B6EF3),
                    size: 26,
                  ),
                ),
                const SizedBox(width: 16),
                // Text content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        role.title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF16223A),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...role.points.map(
                            (p) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 6),
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1B6EF3),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  p,
                                  style: const TextStyle(
                                    fontSize: 13.5,
                                    color: Color(0xFF5A6577),
                                    height: 1.35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Radio indicator
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? const Color(0xFF1B6EF3)
                        : Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF1B6EF3)
                          : const Color(0xFFC8D0DD),
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}