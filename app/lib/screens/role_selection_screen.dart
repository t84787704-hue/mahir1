import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';
import '../models/user_model.dart';
import '../providers/auth_provider.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aap Kaun Hain?"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "Select Account Type",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _card(
              context,
              "Customer Hoon",
              "Kaam karwana hai",
              Icons.person,
              Colors.blue.shade50,
              UserRole.customer,
            ),

            const SizedBox(height: 16),

            _card(
              context,
              "Mahir Hoon",
              "Kaam karna hai",
              Icons.build,
              Colors.orange.shade50,
              UserRole.provider,
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    UserRole role,
  ) {
    return GestureDetector(
      onTap: () {
        AuthProvider.setRole(role);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MainNavigationScreen(role: role),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Icon(icon, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
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