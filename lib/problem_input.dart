import 'package:flutter/material.dart';
import 'package:untitled2/find_nearby_mechanics.dart';

void main() {
  runApp(const CarDiagnosticApp());
}

class CarDiagnosticApp extends StatelessWidget {
  const CarDiagnosticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Diagnostic',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF3F4F6), // Light gray background
        fontFamily: 'SF Pro Display', // Use system font or specify your own
      ),
      home: const ProblemInputScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProblemInputScreen extends StatefulWidget {
  const ProblemInputScreen({super.key});

  @override
  State<ProblemInputScreen> createState() => _ProblemInputScreenState();
}

class _ProblemInputScreenState extends State<ProblemInputScreen> {
  // Dummy data for categories
  final List<String> _categories = ['Electrical', 'Engine', 'Brakes', 'Tires', 'Battery'];
  int _selectedCategoryIndex = 1; // 'Engine' is selected by default

  // Dummy data for recent issues
  final List<Map<String, String>> _recentIssues = [
    {'title': 'Grinding noise when braking', 'date': 'Today'},
    {'title': 'Engine light came on', 'date': 'Yesterday'},
    {'title': 'Weak battery startup', 'date': 'Oct 12'},
  ];

  // 1. Define the controller here so it doesn't get recreated on every build
  final TextEditingController _problemController = TextEditingController(
    text: 'My car makes a grinding noise when I brake, especially at low speeds.',
  );

  @override
  void dispose() {
    // 2. Always dispose controllers to prevent memory leaks
    _problemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    const Text(
                      'Good morning',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "What's the issue?",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Input Area
                    _buildInputArea(),
                    const SizedBox(height: 32),

                    // Browse Categories
                    const Text(
                      'Browse by category',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildCategoryList(),
                    const SizedBox(height: 32),

                    // Recent Issues
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent issues',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('See all'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildRecentIssuesList(),
                  ],
                ),
              ),
            ),

            // Bottom Action Buttons
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  // Widget for the main input box and actions
  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 3. Removed 'const' from TextField and used the class-level controller
          TextField(
            controller: _problemController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Describe the problem...',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            maxLines: 4,
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton(Icons.mic_none, 'Voice'),
              _buildActionButton(Icons.camera_alt_outlined, 'Photo'),
              _buildActionButton(Icons.auto_fix_high, 'Diagnose'),
            ],
          )
        ],
      ),
    );
  }

  // Widget for Voice/Photo/Diagnose buttons
  Widget _buildActionButton(IconData icon, String label) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Widget for horizontal category list
  Widget _buildCategoryList() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == _selectedCategoryIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: isSelected ? Theme.of(context).primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Theme.of(context).primaryColor : Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: Text(
                  _categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget for recent issues list
  Widget _buildRecentIssuesList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _recentIssues.length,
      separatorBuilder: (context, index) => const Divider(height: 24),
      itemBuilder: (context, index) {
        final issue = _recentIssues[index];
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.amber.shade700),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      issue['title']!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      issue['date']!,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        );
      },
    );
  }

  // Widget for bottom sticky buttons
  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              // --- ADDED NAVIGATION HERE ---
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ClearDriveApp(),
                  ),
                );
              },
              icon: const Icon(Icons.build_outlined),
              label: const Text('Find Mechanics'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.flash_on),
              label: const Text('Diagnostics'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}