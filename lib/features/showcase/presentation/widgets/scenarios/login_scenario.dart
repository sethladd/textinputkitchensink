import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/enums/widget_style.dart';

class LoginScenario extends StatefulWidget {
  final WidgetStyle style;

  const LoginScenario({super.key, required this.style});

  @override
  State<LoginScenario> createState() => _LoginScenarioState();
}

class _LoginScenarioState extends State<LoginScenario> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildMaterialVersion() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              ),
            ),
            obscureText: _obscurePassword,
          ),
          const SizedBox(height: 24),
          FilledButton(onPressed: () {}, child: const Text('Login')),
        ],
      ),
    );
  }

  Widget _buildCupertinoVersion() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CupertinoTextField(
            controller: _emailController,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(CupertinoIcons.mail),
            ),
            autocorrect: false,
          ),
          const SizedBox(height: 16),
          CupertinoTextField(
            controller: _passwordController,
            placeholder: 'Password',
            obscureText: _obscurePassword,
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(CupertinoIcons.lock),
            ),
            suffix: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() => _obscurePassword = !_obscurePassword);
              },
              child: Icon(
                _obscurePassword
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash,
              ),
            ),
          ),
          const SizedBox(height: 24),
          CupertinoButton.filled(onPressed: () {}, child: const Text('Login')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          widget.style == WidgetStyle.material
              ? _buildMaterialVersion()
              : _buildCupertinoVersion(),
    );
  }
}
