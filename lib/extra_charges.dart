import 'package:flutter/material.dart';
import 'package:untitled2/reimbursement_screen.dart';
import 'package:untitled2/mechanic_feedback_screen.dart';

class ExtraChargesScreen extends StatefulWidget {
  const ExtraChargesScreen({super.key});

  @override
  State<ExtraChargesScreen> createState() => _ExtraChargesScreenState();
}

class _ExtraChargesScreenState extends State<ExtraChargesScreen> {
  int _selectedIndex = 0; // For bottom navigation

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
                    'Billing Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF16223A),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.headset_mic_rounded),
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
                    // Header Illustration & Title
                    _buildHeader(),
                    const SizedBox(height: 24),

                    // Mechanic & Status Card
                    _buildMechanicStatusCard(),
                    const SizedBox(height: 24),

                    // Cost Breakdown
                    const Text(
                      'Cost Breakdown',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildCostBreakdownCard(),
                    const SizedBox(height: 24),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: _buildActionButton(
                            title: 'Contact James',
                            isFilled: false,
                            icon: Icons.chat_bubble_outline_rounded,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildActionButton(
                            title: 'View Invoice',
                            isFilled: true,
                            icon: Icons.receipt_long_rounded,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Reimbursement Option
                    _buildReimbursementButton(context),
                    const SizedBox(height: 16),

                    // --- NEW: No Issue / End Order / Give Feedback Option ---
                    _buildEndOrderButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildEndOrderButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MechanicFeedbackScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF22C55E), // Green for success/no issue
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'No Issues - End Order & Rate Mechanic',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildReimbursementButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFFFE0B2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.report_problem_rounded, color: Color(0xFFFF8A00), size: 24),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Faced an issue or loss?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF16223A),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'If you suffered a loss due to poor service, request a reimbursement from our team.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7686),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LossReimbursementInvoiceScreen(),
                ),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFFF8A00),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Claim'),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF3FB),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.receipt_long,
                  size: 50,
                  color: const Color(0xFF1B6EF3).withOpacity(0.3),
                ),
                const Icon(
                  Icons.search,
                  size: 40,
                  color: Color(0xFF1B6EF3),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Why was I charged extra?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Color(0xFF16223A),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Sometimes repairs change due to unexpected issues found during the process. We always ensure you approve any extra costs before they are added.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Color(0xFF6B7686),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMechanicStatusCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.person_rounded, color: Color(0xFF1B6EF3), size: 28),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'James Kowalski',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.verified_rounded, size: 14, color: Color(0xFF1B6EF3)),
                        SizedBox(width: 4),
                        Text(
                          'Verified Professional',
                          style: TextStyle(fontSize: 12, color: Color(0xFF6B7686)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Initial Est.',
                    style: TextStyle(fontSize: 12, color: Color(0xFF6B7686)),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F9FB),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      '\$350.00',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF16223A),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFE4E9F0), height: 1),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(Icons.check_circle_rounded, color: Color(0xFF22C55E), size: 20),
                  SizedBox(width: 6),
                  Text(
                    'REPAIR COMPLETED',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF16223A),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.paid_rounded, color: Color(0xFF1B6EF3), size: 20),
                  SizedBox(width: 6),
                  Text(
                    'PAID',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF16223A),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCostBreakdownCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: Column(
        children: [
          _buildPriceRow(
            title: 'Original Estimate',
            subtitle: 'Approved initially',
            price: '\$350.00',
          ),
          const SizedBox(height: 16),
          _buildPriceRow(
            title: 'Extra Labor',
            subtitle: 'Removal of seized part',
            price: '+\$85.00',
            isExtra: true,
          ),
          const SizedBox(height: 16),
          _buildPriceRow(
            title: 'Replacement Hardware',
            subtitle: 'New mounting hardware',
            price: '+\$40.00',
            isExtra: true,
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFE4E9F0), height: 1, thickness: 1),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Final Total',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF16223A),
                ),
              ),
              Text(
                '\$475.00',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1B6EF3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow({
    required String title,
    required String subtitle,
    required String price,
    bool isExtra = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF16223A),
                    ),
                  ),
                  if (isExtra) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Extra',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFB300),
                        ),
                      ),
                    ),
                  ]
                ],
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6B7686),
                ),
              ),
            ],
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: isExtra ? const Color(0xFFFF8A00) : const Color(0xFF16223A),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String title,
    required bool isFilled,
    required IconData icon,
  }) {
    return SizedBox(
      height: 54,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isFilled ? const Color(0xFF1B6EF3) : Colors.white,
          foregroundColor: isFilled ? Colors.white : const Color(0xFF16223A),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: isFilled
                ? BorderSide.none
                : const BorderSide(color: Color(0xFFE4E9F0), width: 1.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
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
            selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.build_circle_outlined),
                label: 'Diagnostics',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                label: 'Nearby',
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