import 'package:flutter/material.dart';
import 'package:untitled2/extra_charges.dart';

class PricingPolicyScreen extends StatelessWidget {
  final String mechanicName;
  final String issue;

  const PricingPolicyScreen({
    super.key,
    required this.mechanicName,
    required this.issue,
  });

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
                    'Pricing Policy',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF16223A),
                    ),
                  ),
                  const SizedBox(width: 48), // Balances the back button
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
                    // Header Summary
                    _buildSummaryHeader(),
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
                    _buildCostBreakdown(),
                    const SizedBox(height: 12),

                    // --- NEW: Extra Charges Navigation Button ---
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExtraChargesScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.help_outline_rounded, size: 18, color: Color(0xFF1B6EF3)),
                        label: const Text(
                          'Why was I charged extra?',
                          style: TextStyle(
                            color: Color(0xFF1B6EF3),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Policies
                    const Text(
                      'Service Policies',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildPolicyItem(
                      icon: Icons.cancel_outlined,
                      title: 'Cancellation Policy',
                      description: 'Free cancellation up to 2 hours before the scheduled appointment. A \$15 fee applies for late cancellations.',
                    ),
                    const SizedBox(height: 12),
                    _buildPolicyItem(
                      icon: Icons.shield_outlined,
                      title: 'Warranty',
                      description: 'All repairs include a 12-month or 12,000-mile warranty on parts and labor.',
                    ),
                    const SizedBox(height: 12),
                    _buildPolicyItem(
                      icon: Icons.payment_outlined,
                      title: 'Payment Terms',
                      description: 'Payment is due upon completion of the service. We accept all major credit cards and digital wallets.',
                    ),
                    const SizedBox(height: 12),
                    _buildPolicyItem(
                      icon: Icons.handshake_outlined,
                      title: 'Satisfaction Guarantee',
                      description: 'If you are not 100% satisfied with the repair, we will make it right at no additional cost.',
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Action Button
            _buildBottomButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1B6EF3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.receipt_long_rounded, color: Colors.white, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Service for $mechanicName',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Issue: $issue',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCostBreakdown() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: Column(
        children: [
          _buildPriceRow('Diagnosis Fee', '\$50.00'),
          const SizedBox(height: 12),
          _buildPriceRow('Labor (2 hrs @ \$80/hr)', '\$160.00'),
          const SizedBox(height: 12),
          _buildPriceRow('Parts & Materials', '\$240.00'),
          const SizedBox(height: 12),
          _buildPriceRow('Mobile Service Fee', '\$15.00'),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFE4E9F0), height: 1, thickness: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Total Estimate',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF16223A),
                ),
              ),
              Text(
                '\$465.00',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1B6EF3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Final price may vary based on actual time and parts required.',
            style: TextStyle(
              fontSize: 11,
              fontStyle: FontStyle.italic,
              color: Color(0xFFA0A8B4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF6B7686),
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF16223A),
          ),
        ),
      ],
    );
  }

  Widget _buildPolicyItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF3FB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF1B6EF3), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF16223A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.4,
                    color: Color(0xFF6B7686),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
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
          onPressed: () {
            // Show success message and return to previous screen
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Booking Confirmed Successfully!'),
                backgroundColor: Color(0xFF1B6EF3),
              ),
            );
            Navigator.pop(context);
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
            'Agree & Confirm Booking',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}