import 'package:flutter/material.dart';

class ProtectionOversightScreen extends StatefulWidget {
  const ProtectionOversightScreen({super.key});

  @override
  State<ProtectionOversightScreen> createState() => _ProtectionOversightScreenState();
}

class _ProtectionOversightScreenState extends State<ProtectionOversightScreen> {
  int _selectedIndex = 0; // Set to 'Overview' for context

  final List<Map<String, dynamic>> _cases = [
    {
      'title': 'Brake system damage',
      'user': 'Maya Chen',
      'vehicle': '2019 Honda Civic',
      'amount': '\$250.00',
      'status': 'Urgent',
      'statusColor': const Color(0xFFFF8A00),
      'statusBgColor': const Color(0xFFFFF3E0),
    },
    {
      'title': 'Incorrect suspension installation',
      'user': 'Owen Brooks',
      'vehicle': '2017 Subaru Outback',
      'amount': '\$450.00',
      'status': 'Evidence ready',
      'statusColor': const Color(0xFF22C55E),
      'statusBgColor': const Color(0xFFE8F9EF),
    },
    {
      'title': 'Oil leak after service',
      'user': 'Priya Shah',
      'vehicle': '2020 Toyota RAV4',
      'amount': '\$180.00',
      'status': 'Mechanic reply due',
      'statusColor': const Color(0xFF1B6EF3),
      'statusBgColor': const Color(0xFFEEF3FB),
    },
  ];

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
                    'Protection oversight',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF16223A),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list_rounded),
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
                    // Main "12 cases need review" Card
                    _buildMainReviewCard(),
                    const SizedBox(height: 16),

                    // Secondary Stats Row
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.folder_open_rounded,
                            title: 'Open reports',
                            mainValue: '24',
                            subValue: '6 urgent today',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.account_balance_wallet_rounded,
                            title: 'Awaiting payout',
                            mainValue: '\$3,840',
                            subValue: '8 approved cases',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Priority Loss Reports Header
                    const Text(
                      'Priority loss reports',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Cases List
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _cases.length,
                      itemBuilder: (context, index) {
                        final caseItem = _cases[index];
                        return _buildCaseCard(caseItem);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildMainReviewCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1B6EF3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.shield_rounded, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '12 cases need review',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Tap to view your assigned queue',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String mainValue,
    required String subValue,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF1B6EF3), size: 22),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B7686),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            mainValue,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF16223A),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subValue,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF6B7686),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaseCard(Map<String, dynamic> caseItem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: caseItem['statusBgColor'],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  caseItem['status'].toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: caseItem['statusColor'],
                  ),
                ),
              ),
              Text(
                caseItem['amount'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF16223A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            caseItem['title'],
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF16223A),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.person_outline_rounded, size: 14, color: Color(0xFF6B7686)),
              const SizedBox(width: 4),
              Text(
                '${caseItem['user']} · ${caseItem['vehicle']}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6B7686),
                ),
              ),
            ],
          ),
        ],
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
                icon: Icon(Icons.grid_view_rounded),
                label: 'Overview',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_rounded),
                label: 'Cases',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_rounded),
                label: 'Payouts',
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