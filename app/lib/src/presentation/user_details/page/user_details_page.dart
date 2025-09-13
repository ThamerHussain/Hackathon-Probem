import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hackathon/src/core/config/fingerprint_config.dart';
import 'package:hackathon/src/data/service/user_api_service.dart';
import 'package:hackathon/src/domain/entities/user.dart';

@RoutePage()
class UserDetailsPage extends StatefulWidget {
  final String fingerPrintId;

  const UserDetailsPage({super.key, required this.fingerPrintId});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  User? _user;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    try {
      final apiEndpoint = await FingerprintConfig.getApiEndpoint();
      final dio = Dio();
      final userApiService = UserApiService(dio: dio, baseUrl: apiEndpoint);

      final user = await userApiService.getUserByFingerprintId(
        widget.fingerPrintId,
      );

      if (mounted) {
        setState(() {
          _user = user;
          _isLoading = false;
          _error = user == null ? 'User not found' : null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _error = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.green,
      ),
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.green),
            SizedBox(height: 16),
            Text(
              'Loading user details...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 64),
            const SizedBox(height: 16),
            Text(
              'Error: $_error',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadUserDetails,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_user == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_off, color: Colors.orange, size: 64),
            SizedBox(height: 16),
            Text(
              'User not found',
              style: TextStyle(color: Colors.orange, fontSize: 18),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Avatar
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green,
              backgroundImage: _user!.imageUrl != null
                  ? NetworkImage(_user!.imageUrl!)
                  : null,
              child: _user!.imageUrl == null
                  ? const Icon(Icons.person, size: 60, color: Colors.black)
                  : null,
            ),
          ),
          const SizedBox(height: 32),

          // User Information
          _buildInfoCard('ID', _user!.id),
          const SizedBox(height: 16),
          _buildInfoCard('Name', _user!.name),
          const SizedBox(height: 16),
          _buildInfoCard('Role', _user!.role),
          const SizedBox(height: 16),
          _buildInfoCard('Fingerprint ID', _user!.fingerPrintId ?? 'Not set'),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
