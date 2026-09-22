import 'package:flutter/material.dart';

class MechanicFeedbackScreen extends StatefulWidget {
  const MechanicFeedbackScreen({super.key});

  @override
  State<MechanicFeedbackScreen> createState() => _MechanicFeedbackScreenState();
}

class _MechanicFeedbackScreenState extends State<MechanicFeedbackScreen> {
  int _selectedIndex = 2; // Set to 'Reviews' for context

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
                    'Driver Feedback',
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
                    // Overall Rating Summary Card
                    _buildSummaryCard(),
                    const SizedBox(height: 24),

                    // 90-Day Rating Breakdown
                    const Text(
                      'Rating Breakdown (Last 90 Days)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildRatingBreakdown(),
                    const SizedBox(height: 24),

                    // Recent Feedback
                    const Text(
                      'Recent Feedback',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Review 1
                    _buildReviewCard(
                      name: 'Nadia Flores',
                      timeAgo: '2 days ago',
                      rating: 5.0,
                      serviceType: 'Brake Repair',
                      comment: 'They explained the brake issue clearly and finished early. The car is running great again!',
                    ),
                    const SizedBox(height: 12),

                    // Review 2
                    _buildReviewCard(
                      name: 'Owen Brooks',
                      timeAgo: '5 days ago',
                      rating: 4.0,
                      serviceType: 'Engine Diagnostic',
                      comment: 'Good service overall, but I wish I got faster updates during the repair process.',
                    ),
                    const SizedBox(height: 20),

                    // Trust Tip Box
                    _buildTrustTip(),
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

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Kowalski Auto Care',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF16223A),
                ),
              ),
              const Spacer(),
              const Icon(Icons.star_rounded, color: Color(0xFFFFB800), size: 20),
              const SizedBox(width: 4),
              const Text(
                '4.8',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF16223A),
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                '(126)',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7686),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFE4E9F0), height: 1, thickness: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMiniStat('92%', 'Recommendation'),
              _buildMiniStat('24', 'Feedback This Month'),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFE4E9F0), height: 1, thickness: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSubRating('Repair Quality', 4.9),
              _buildSubRating('Communication', 4.7),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1B6EF3),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7686),
          ),
        ),
      ],
    );
  }

  Widget _buildSubRating(String title, double score) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6B7686),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(
              score.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF16223A),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.star_rounded, color: Color(0xFFFFB800), size: 16),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingBreakdown() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E9F0)),
      ),
      child: Column(
        children: [
          _buildRatingBar('5', 98, 98),
          const SizedBox(height: 12),
          _buildRatingBar('4', 19, 98),
          const SizedBox(height: 12),
          _buildRatingBar('3', 5, 98),
          const SizedBox(height: 12),
          _buildRatingBar('2', 2, 98),
          const SizedBox(height: 12),
          _buildRatingBar('1', 1, 98),
        ],
      ),
    );
  }

  Widget _buildRatingBar(String stars, int count, int maxCount) {
    double percentage = count / maxCount;

    return Row(
      children: [
        Row(
          children: [
            Text(
              stars,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6B7686),
              ),
            ),
            const SizedBox(width: 2),
            const Icon(Icons.star_rounded, color: Color(0xFFFFB800), size: 14),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: percentage,
              minHeight: 10,
              backgroundColor: const Color(0xFFF0F2F5),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1B6EF3)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 30,
          child: Text(
            count.toString(),
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF16223A),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewCard({
    required String name,
    required String timeAgo,
    required double rating,
    required String serviceType,
    required String comment,
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
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFE6F0FF),
                child: Text(
                  name[0],
                  style: const TextStyle(
                    color: Color(0xFF1B6EF3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF16223A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      timeAgo,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B7686),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF16223A),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.star_rounded, color: Color(0xFFFFB800), size: 16),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F9FB),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE4E9F0)),
            ),
            child: Text(
              serviceType,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6B7686),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '"$comment"',
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Color(0xFF475569),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrustTip() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF3FB),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDCE6F8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.tips_and_updates_outlined, color: Color(0xFF1B6EF3), size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Build Trust with Drivers',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF16223A),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Responding to feedback promptly helps build trust and improves your overall rating.',
                  style: TextStyle(
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
                icon: Icon(Icons.inbox_rounded),
                label: 'Requests',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_rounded),
                label: 'Schedule',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.reviews_rounded),
                label: 'Reviews',
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