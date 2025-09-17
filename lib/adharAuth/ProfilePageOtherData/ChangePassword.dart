import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentController = TextEditingController();
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool _loading = false;
  String? _message;

  void _changePassword() {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _message = null;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _loading = false;
        _message = "Password changed successfully ✅";
        _currentController.clear();
        _newController.clear();
        _confirmController.clear();
      });
    });
  }

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Password")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _currentController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Current Password",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.isEmpty) ? "Enter current password" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _newController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "New Password",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.length < 6) ? "Min 6 characters" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm New Password",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                v != _newController.text ? "Passwords do not match" : null,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _changePassword,
                  child: _loading
                      ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : const Text("Change Password"),
                ),
              ),
              if (_message != null) ...[
                const SizedBox(height: 12),
                Text(_message!, style: const TextStyle(color: Colors.green)),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
