// Copyright 2025 Seth Ladd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/enums/widget_style.dart';

class ProfileScenario extends StatefulWidget {
  final WidgetStyle style;

  const ProfileScenario({super.key, required this.style});

  @override
  State<ProfileScenario> createState() => _ProfileScenarioState();
}

class _ProfileScenarioState extends State<ProfileScenario> {
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bioController = TextEditingController();
  final _websiteController = TextEditingController();
  DateTime? _birthDate;

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    if (widget.style == WidgetStyle.material) {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _birthDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != _birthDate) {
        setState(() => _birthDate = picked);
      }
    } else {
      showCupertinoModalPopup<void>(
        context: context,
        builder:
            (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: CupertinoDatePicker(
                  initialDateTime: _birthDate ?? DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  maximumDate: DateTime.now(),
                  minimumYear: 1900,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() => _birthDate = newDate);
                  },
                ),
              ),
            ),
      );
    }
  }

  String get _formattedDate {
    if (_birthDate == null) return '';
    return '${_birthDate!.month}/${_birthDate!.day}/${_birthDate!.year}';
  }

  Widget _buildMaterialVersion() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _fullNameController,
            decoration: const InputDecoration(
              labelText: 'Full Name',
              hintText: 'Enter your full name',
              prefixIcon: Icon(Icons.person),
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.name],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              hintText: 'Choose a unique username',
              prefixIcon: Icon(Icons.alternate_email),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.username],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email address',
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              hintText: 'Enter your phone number',
              prefixIcon: Icon(Icons.phone),
            ),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.telephoneNumber],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () => _selectDate(context),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Birth Date',
                prefixIcon: Icon(Icons.calendar_today),
              ),
              child: Text(
                _formattedDate.isEmpty
                    ? 'Select your birth date'
                    : _formattedDate,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _bioController,
            decoration: const InputDecoration(
              labelText: 'Bio',
              hintText: 'Tell us about yourself',
              prefixIcon: Icon(Icons.description),
              alignLabelWithHint: true,
            ),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _websiteController,
            decoration: const InputDecoration(
              labelText: 'Website',
              hintText: 'Enter your website URL',
              prefixIcon: Icon(Icons.link),
            ),
            keyboardType: TextInputType.url,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.url],
          ),
          const SizedBox(height: 24),
          FilledButton(onPressed: () {}, child: const Text('Create Profile')),
        ],
      ),
    );
  }

  Widget _buildCupertinoVersion() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CupertinoTextField(
            controller: _fullNameController,
            placeholder: 'Full Name',
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(CupertinoIcons.person),
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.name],
          ),
          const SizedBox(height: 16),
          CupertinoTextField(
            controller: _usernameController,
            placeholder: 'Username',
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(CupertinoIcons.at),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.username],
          ),
          const SizedBox(height: 16),
          CupertinoTextField(
            controller: _emailController,
            placeholder: 'Email',
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(CupertinoIcons.mail),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email],
          ),
          const SizedBox(height: 16),
          CupertinoTextField(
            controller: _phoneController,
            placeholder: 'Phone Number',
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(CupertinoIcons.phone),
            ),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.telephoneNumber],
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.systemGrey4),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      CupertinoIcons.calendar,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _formattedDate.isEmpty
                        ? 'Select your birth date'
                        : _formattedDate,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          CupertinoTextField(
            controller: _bioController,
            placeholder: 'Tell us about yourself',
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(CupertinoIcons.text_justify),
            ),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          CupertinoTextField(
            controller: _websiteController,
            placeholder: 'Website URL',
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(CupertinoIcons.link),
            ),
            keyboardType: TextInputType.url,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.url],
          ),
          const SizedBox(height: 24),
          CupertinoButton.filled(
            onPressed: () {},
            child: const Text('Create Profile'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.style == WidgetStyle.material
        ? _buildMaterialVersion()
        : _buildCupertinoVersion();
  }
}
