import 'package:flutter/material.dart';
// Make sure this import matches your actual file name and project name
import 'package:untitled2/mechanic_booking.dart';

void main() => runApp(const ClearDriveApp());

class ClearDriveApp extends StatelessWidget {
  const ClearDriveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const MechanicsNearbyScreen(),
    );
  }
}

class MechanicsNearbyScreen extends StatelessWidget {
  const MechanicsNearbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data matching your description
    final List<Mechanic> mechanics = [
      Mechanic(
        name: 'James Kowalski',
        rating: 4.9,
        distance: '0.8 km',
        diagFee: '\$45',
        repairEst: '\$180 - \$350',
        avatarColor: const Color(0xFFE6F0FF),
        iconColor: const Color(0xFF1B6EF3),
      ),
      Mechanic(
        name: 'Sarah Al-Farsi',
        rating: 4.7,
        distance: '1.4 km',
        diagFee: '\$40',
        repairEst: '\$200 - \$400',
        avatarColor: const Color(0xFFE6F0FF),
        iconColor: const Color(0xFF1B6EF3),
      ),
      Mechanic(
        name: 'Miguel Torres',
        rating: 4.6,
        distance: '2.1 km',
        diagFee: '\$50',
        repairEst: '\$160 - \$320',
        avatarColor: const Color(0xFFE6F0FF),
        iconColor: const Color(0xFF1B6EF3),
      ),
    ];

    return Scaffold(
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
                    'Mechanics Nearby',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF16223A),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.tune_rounded),
                        color: const Color(0xFF6B7686),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.map_outlined),
                        color: const Color(0xFF6B7686),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Diagnosis Context Box
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE4E9F0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0E5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.car_crash_rounded,
                      color: Color(0xFFFF8C42),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Grinding noise when braking',
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFF6B7686),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Worn Brake Pads / Rotors',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF16223A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Mechanics List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                itemCount: mechanics.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  return MechanicCard(mechanic: mechanics[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Mechanic {
  final String name;
  final double rating;
  final String distance;
  final String diagFee;
  final String repairEst;
  final Color avatarColor;
  final Color iconColor;

  Mechanic({
    required this.name,
    required this.rating,
    required this.distance,
    required this.diagFee,
    required this.repairEst,
    required this.avatarColor,
    required this.iconColor,
  });
}

class MechanicCard extends StatelessWidget {
  final Mechanic mechanic;

  const MechanicCard({super.key, required this.mechanic});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE4E9F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Avatar + Name/Rating + Distance
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: mechanic.avatarColor,
                  child: Icon(
                    Icons.person_rounded,
                    color: mechanic.iconColor,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mechanic.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF16223A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded,
                              size: 16, color: Color(0xFFFFB800)),
                          const SizedBox(width: 4),
                          Text(
                            mechanic.rating.toString(),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF16223A),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.location_on_rounded,
                              size: 16, color: Color(0xFF6B7686)),
                          const SizedBox(width: 4),
                          Text(
                            mechanic.distance,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF6B7686),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_rounded),
                  color: const Color(0xFF6B7686),
                  iconSize: 22,
                )
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Color(0xFFE4E9F0), height: 1),
            const SizedBox(height: 16),
            // Bottom Row: Pricing details
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Diagnosis Fee',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B7686),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mechanic.diagFee,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF16223A),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  width: 1,
                  color: const Color(0xFFE4E9F0),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Repair Estimate',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B7686),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mechanic.repairEst,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1B6EF3),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    // --- ADDED NAVIGATION HERE ---
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MechanicBookingScreen(
                            mechanicName: mechanic.name,
                            rating: mechanic.rating,
                            distance: mechanic.distance,
                            diagFee: mechanic.diagFee,
                            repairEst: mechanic.repairEst,
                            issue: 'Worn Brake Pads / Rotors', // Passing the diagnosis from the top card
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B6EF3),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Book',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}