import 'package:flutter/material.dart';
import 'package:hackathon/src/design/components/cyberpunk_components.dart';
import 'package:hackathon/src/design/theme/cyberpunk_palette.dart';
import 'package:hackathon/src/design/theme/theme_text_styles.dart';
import 'package:hackathon/src/design/widget/theme_switch.dart';
import 'package:hackathon/src/presentation/home/controller/fingerprint_scanner_controller.dart';

class CyberpunkSettingsDialog extends StatefulWidget {
  final FingerprintScannerController controller;

  const CyberpunkSettingsDialog({super.key, required this.controller});

  @override
  State<CyberpunkSettingsDialog> createState() =>
      _CyberpunkSettingsDialogState();
}

class _CyberpunkSettingsDialogState extends State<CyberpunkSettingsDialog> {
  late TextEditingController _apiEndpointController;
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    _apiEndpointController = TextEditingController(
      text: widget.controller.currentApiEndpoint,
    );
  }

  @override
  void dispose() {
    _apiEndpointController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: CyberpunkCard(
        glowColor: CyberpunkPalette.neonPurple,
        borderRadius: BorderRadius.circular(24),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: CyberpunkPalette.neonPurple,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  'NEURAL SCANNER CONFIGURATION',
                  style: ThemeTextStyles.heading(
                    context,
                  ).copyWith(fontSize: 20),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: CyberpunkPalette.neonCyan,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildThemeSection(),
            const SizedBox(height: 24),

            _buildApiEndpointSection(),
            const SizedBox(height: 24),

            _buildConnectionTestSection(),
            const SizedBox(height: 24),

            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('VISUAL THEME', style: ThemeTextStyles.subheading(context)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CyberpunkPalette.darkSurface.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: CyberpunkPalette.neonPurple.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.palette, color: CyberpunkPalette.neonPurple, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Switch between light and dark themes',
                  style: ThemeTextStyles.body(context),
                ),
              ),
              const ThemeSwitch(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildApiEndpointSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'API ENDPOINT CONFIGURATION',
          style: CyberpunkTextStyles.subheading,
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: CyberpunkPalette.darkSurface.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: CyberpunkPalette.neonCyan.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: TextField(
            controller: _apiEndpointController,
            style: CyberpunkTextStyles.body,
            decoration: InputDecoration(
              hintText: 'Enter API endpoint URL',
              hintStyle: CyberpunkTextStyles.body.copyWith(
                color: CyberpunkPalette.textMuted,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
              prefixIcon: Icon(Icons.cloud, color: CyberpunkPalette.neonCyan),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Configure the neural matching service endpoint for biometric verification',
          style: CyberpunkTextStyles.body.copyWith(
            color: CyberpunkPalette.textMuted,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildConnectionTestSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('CONNECTION STATUS', style: CyberpunkTextStyles.subheading),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CyberpunkPalette.darkSurface.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.controller.isConnected
                  ? CyberpunkPalette.success.withOpacity(0.3)
                  : CyberpunkPalette.error.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: widget.controller.isConnected
                      ? CyberpunkPalette.success
                      : CyberpunkPalette.error,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color:
                          (widget.controller.isConnected
                                  ? CyberpunkPalette.success
                                  : CyberpunkPalette.error)
                              .withOpacity(0.6),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.controller.isConnected
                      ? 'Neural matching service is online'
                      : 'Neural matching service is offline',
                  style: CyberpunkTextStyles.body.copyWith(
                    color: widget.controller.isConnected
                        ? CyberpunkPalette.success
                        : CyberpunkPalette.error,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        CyberpunkButton(
          text: 'TEST CONNECTION',
          icon: Icons.wifi_find,
          onPressed: _isUpdating ? null : _testConnection,
          isLoading: _isUpdating,
          glowColor: CyberpunkPalette.neonBlue,
        ),
        const SizedBox(height: 12),
        CyberpunkButton(
          text: 'SAVE CONFIGURATION',
          icon: Icons.save,
          onPressed: _isUpdating ? null : _saveConfiguration,
          glowColor: CyberpunkPalette.neonGreen,
        ),
      ],
    );
  }

  Future<void> _testConnection() async {
    setState(() {
      _isUpdating = true;
    });

    try {
      await widget.controller.testApiConnection();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.controller.isConnected
                  ? 'Connection test successful!'
                  : 'Connection test failed!',
              style: CyberpunkTextStyles.body,
            ),
            backgroundColor: widget.controller.isConnected
                ? CyberpunkPalette.success
                : CyberpunkPalette.error,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Connection test error: $e',
              style: CyberpunkTextStyles.body,
            ),
            backgroundColor: CyberpunkPalette.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUpdating = false;
        });
      }
    }
  }

  Future<void> _saveConfiguration() async {
    setState(() {
      _isUpdating = true;
    });

    try {
      await widget.controller.updateApiEndpoint(_apiEndpointController.text);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Configuration saved successfully!',
              style: CyberpunkTextStyles.body,
            ),
            backgroundColor: CyberpunkPalette.success,
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to save configuration: $e',
              style: CyberpunkTextStyles.body,
            ),
            backgroundColor: CyberpunkPalette.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUpdating = false;
        });
      }
    }
  }
}
