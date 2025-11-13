import 'package:flutter/material.dart';
import 'fill_profile.dart'; // ✅ This is the file that contains ActivateQuickcartPage

class FillBusinessInfoPage extends StatelessWidget {
  const FillBusinessInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Fill your business information',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image placeholder
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.image_outlined,
                  size: 48, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: 'Your Business',
                  items: const [
                    DropdownMenuItem(
                        value: 'Your Business', child: Text('Your Business')),
                    DropdownMenuItem(value: 'Service', child: Text('Service')),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Progress indicator box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Your Store',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        '0/5 Complete',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Aling Mirna Pork Shop',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Row(
                    children: const [
                      Text('Set Store Contact',
                          style: TextStyle(color: Colors.blue, fontSize: 12)),
                      SizedBox(width: 8),
                      Text('Edit',
                          style: TextStyle(color: Colors.blue, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // List items
                  const _ListItem(
                      title: 'Store Information',
                      subtitle: 'Fill in basic store information'),
                  const _ListItem(
                      title: 'Bank Accounts',
                      subtitle:
                          'Register your bank account to receive earnings'),
                  const _ListItem(
                      title: 'Products/Services',
                      subtitle: 'Photos of your products you want to sell'),
                  const _ListItem(
                      title: 'Permits',
                      subtitle: 'Photos of your permits'),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // ✅ Submit Button — redirects to ActivateQuickcartPage
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3455EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                 Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => BusinessProfileScreen(),
  ),
);

                },
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const _ListItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
