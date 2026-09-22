import 'package:flutter/material.dart';
import 'package:untitled2/mechanic_pricing_policy.dart';

class MechanicBookingScreen extends StatefulWidget {
  final String mechanicName;
  final double rating;
  final String distance;
  final String diagFee;
  final String repairEst;
  final String issue;

  const MechanicBookingScreen({
    super.key,
    required this.mechanicName,
    required this.rating,
    required this.distance,
    required this.diagFee,
    required this.repairEst,
    required this.issue,
  });

  @override
  State<MechanicBookingScreen> createState() => _MechanicBookingScreenState();
}

class _MechanicBookingScreenState extends State<MechanicBookingScreen> {
  int _selectedDateIndex = 0;
  int _selectedTimeIndex = 0;
  final TextEditingController _notesController = TextEditingController();

  // Dummy data for dates and times
  final List<Map<String, String>> _dates = [
    {'day': 'Today', 'date': 'Oct 24'},
    {'day': 'Tomorrow', 'date': 'Oct 25'},
    {'day': 'Sat', 'date': 'Oct 26'},
    {'day': 'Sun', 'date': 'Oct 27'},
    {'day': 'Mon', 'date': 'Oct 28'},
  ];

  final List<String> _times = ['09:00 AM', '11:30 AM', '02:00 PM', '04:30 PM'];

  @override
  void dispose() {
    _notesController.dispose();
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
                    'Book Mechanic',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF16223A),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
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
                    // Mechanic Card Summary
                    _buildMechanicSummary(),
                    const SizedBox(height: 24),

                    // Service Details
                    _buildServiceDetails(),
                    const SizedBox(height: 24),

                    // Select Date
                    const Text(
                      'Select Date',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildDateSelector(),
                    const SizedBox(height: 24),

                    // Select Time
                    const Text(
                      'Select Time',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildTimeSelector(),
                    const SizedBox(height: 24),

                    // Notes
                    const Text(
                      'Additional Notes (Optional)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildNotesInput(),
                    const SizedBox(height: 24),

                    // Price Summary
                    _buildPriceSummary(),
                  ],
                ),
              ),
            ),

            // Bottom Action Button
            _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildMechanicSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFE6F0FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.person_rounded, color: Color(0xFF1B6EF3), size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.mechanicName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF16223A),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star_rounded, size: 16, color: Color(0xFFFFB800)),
                    const SizedBox(width: 4),
                    Text(
                      widget.rating.toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.location_on_rounded, size: 16, color: Color(0xFF6B7686)),
                    const SizedBox(width: 4),
                    Text(
                      widget.distance,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF6B7686)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF3FB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.car_crash_rounded, color: Color(0xFF1B6EF3), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Service Requested',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7686)),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.issue,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF16223A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _dates.length,
        itemBuilder: (context, index) {
          final isSelected = index == _selectedDateIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedDateIndex = index),
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF1B6EF3) : Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isSelected ? const Color(0xFF1B6EF3) : const Color(0xFFE4E9F0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _dates[index]['day']!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : const Color(0xFF6B7686),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _dates[index]['date']!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: isSelected ? Colors.white : const Color(0xFF16223A),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTimeSelector() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(_times.length, (index) {
        final isSelected = index == _selectedTimeIndex;
        return GestureDetector(
          onTap: () => setState(() => _selectedTimeIndex = index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF1B6EF3) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? const Color(0xFF1B6EF3) : const Color(0xFFE4E9F0),
              ),
            ),
            child: Text(
              _times[index],
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : const Color(0xFF16223A),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildNotesInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: TextField(
        controller: _notesController,
        maxLines: 3,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(16),
          border: InputBorder.none,
          hintText: 'e.g. The car is parked in the driveway. Brakes make a loud screeching sound.',
          hintStyle: TextStyle(color: Color(0xFFA0A8B4), fontSize: 13),
        ),
      ),
    );
  }

  Widget _buildPriceSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: Column(
        children: [
          _buildPriceRow('Diagnosis Fee', widget.diagFee, false),
          const SizedBox(height: 12),
          _buildPriceRow('Repair Estimate', widget.repairEst, false),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFE4E9F0), height: 1),
          const SizedBox(height: 12),
          _buildPriceRow('Total Estimate', widget.repairEst, true),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String title, String price, bool isBold) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
            color: isBold ? const Color(0xFF16223A) : const Color(0xFF6B7686),
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isBold ? FontWeight.w800 : FontWeight.w600,
            color: isBold ? const Color(0xFF1B6EF3) : const Color(0xFF16223A),
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
          )
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          // --- NAVIGATION TO PRICING POLICY SCREEN ---
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PricingPolicyScreen(
                  mechanicName: widget.mechanicName,
                  issue: widget.issue,
                ),
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
            'Confirm Booking',
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