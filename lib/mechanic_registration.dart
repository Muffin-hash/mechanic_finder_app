import 'package:flutter/material.dart';
import 'package:untitled2/repair_requests_screen.dart';

class MechanicRegistrationScreen extends StatefulWidget {
  const MechanicRegistrationScreen({super.key});

  @override
  State<MechanicRegistrationScreen> createState() =>
      _MechanicRegistrationScreenState();
}

class _MechanicRegistrationScreenState extends State<MechanicRegistrationScreen> {
  int _selectedIndex = 3; // Set to 'Profile' for context
  int _charCount = 176;

  final TextEditingController _workshopController =
  TextEditingController(text: 'Kowalski Auto Care');
  final TextEditingController _expertiseController = TextEditingController(
    text:
    'Specialized in comprehensive brake systems and suspension repairs for European and domestic vehicles. Over 10 years of experience with diagnostic troubleshooting and performance upgrades.',
  );

  String _selectedService = 'Brake & suspension repair';
  final List<String> _services = [
    'Brake & suspension repair',
    'Engine Diagnostics',
    'Oil & Fluid Change',
    'Electrical Systems',
    'Tire & Alignment',
    'General Maintenance'
  ];

  @override
  void initState() {
    super.initState();
    _expertiseController.addListener(() {
      setState(() {
        _charCount = _expertiseController.text.length;
      });
    });
  }

  @override
  void dispose() {
    _workshopController.dispose();
    _expertiseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: const Color(0xFF16223A),
                  ),
                  const Text(
                    'Mechanic Portal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF16223A),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.help_outline_rounded),
                    color: const Color(0xFF6B7686),
                  ),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Title
                    const Text(
                      'Create your mechanic profile',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1B6EF3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Step 1 of 3',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Business details',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B7686),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Form Fields
                    _buildLabel('Your workshop'),
                    const SizedBox(height: 8),
                    _buildTextInput(
                      controller: _workshopController,
                      hintText: 'e.g. Kowalski Auto Care',
                      icon: Icons.storefront_rounded,
                    ),
                    const SizedBox(height: 20),

                    _buildLabel('Primary service'),
                    const SizedBox(height: 8),
                    _buildDropdownField(),
                    const SizedBox(height: 20),

                    _buildLabel('Your expertise'),
                    const SizedBox(height: 8),
                    _buildExpertiseInput(),
                  ],
                ),
              ),
            ),

            // Bottom Action Button
            _buildBottomButton(),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color(0xFF16223A),
      ),
    );
  }

  Widget _buildTextInput({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: const Color(0xFF6B7686), size: 20),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFA0A8B4), fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedService,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down_rounded,
              color: Color(0xFF6B7686)),
          items: _services.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  const Icon(Icons.build_circle_outlined,
                      color: Color(0xFF6B7686), size: 20),
                  const SizedBox(width: 12),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF16223A),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedService = newValue!;
            });
          },
        ),
      ),
    );
  }

  Widget _buildExpertiseInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE4E9F0)),
          ),
          child: TextField(
            controller: _expertiseController,
            maxLines: 6,
            maxLength: 500,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(16),
              border: InputBorder.none,
              counterText: '',
              hintText:
              'Describe your skills, experience, and specializations...',
              hintStyle: TextStyle(color: Color(0xFFA0A8B4), fontSize: 14),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Text(
            '$_charCount/500',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B7686),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          // --- ADDED NAVIGATION HERE ---
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RepairRequestsScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1B6EF3),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'Continue to verification',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
            backgroundColor: Colors.transparent,
            elevation: 0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: const Color(0xFF1B6EF3),
            unselectedItemColor: const Color(0xFF6B7686),
            selectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.build_circle_outlined),
                label: 'Diagnose',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                label: 'Nearby',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}