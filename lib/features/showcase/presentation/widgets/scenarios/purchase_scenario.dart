// Copyright 2025 Seth Ladd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/enums/widget_style.dart';

const _states = [
  'AL',
  'AK',
  'AZ',
  'AR',
  'CA',
  'CO',
  'CT',
  'DE',
  'FL',
  'GA',
  'HI',
  'ID',
  'IL',
  'IN',
  'IA',
  'KS',
  'KY',
  'LA',
  'ME',
  'MD',
  'MA',
  'MI',
  'MN',
  'MS',
  'MO',
  'MT',
  'NE',
  'NV',
  'NH',
  'NJ',
  'NM',
  'NY',
  'NC',
  'ND',
  'OH',
  'OK',
  'OR',
  'PA',
  'RI',
  'SC',
  'SD',
  'TN',
  'TX',
  'UT',
  'VT',
  'VA',
  'WA',
  'WV',
  'WI',
  'WY',
];

class PurchaseScenario extends StatefulWidget {
  final WidgetStyle style;

  const PurchaseScenario({super.key, required this.style});

  @override
  State<PurchaseScenario> createState() => _PurchaseScenarioState();
}

class _PurchaseScenarioState extends State<PurchaseScenario> {
  final _nameController = TextEditingController();
  final _street1Controller = TextEditingController();
  final _street2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  String? _selectedState;

  @override
  void dispose() {
    _nameController.dispose();
    _street1Controller.dispose();
    _street2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  Widget _buildMaterialVersion() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.name,
              autofillHints: const [AutofillHints.name],
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            // Address Section
            const Text(
              'Shipping Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _street1Controller,
              decoration: const InputDecoration(
                labelText: 'Street Address',
                hintText: 'Street and number',
                prefixIcon: Icon(Icons.location_on),
              ),
              keyboardType: TextInputType.streetAddress,
              autofillHints: const [AutofillHints.streetAddressLine1],
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _street2Controller,
              decoration: const InputDecoration(
                labelText: 'Apt, Suite, Unit (optional)',
                hintText: 'Apartment, suite, unit, etc.',
                prefixIcon: Icon(Icons.location_on),
              ),
              keyboardType: TextInputType.streetAddress,
              autofillHints: const [AutofillHints.streetAddressLine2],
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      labelText: 'City',
                      hintText: 'Enter city',
                      prefixIcon: Icon(Icons.location_city),
                    ),
                    keyboardType: TextInputType.text,
                    autofillHints: const [AutofillHints.addressCity],
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedState,
                    decoration: const InputDecoration(
                      labelText: 'State',
                      prefixIcon: Icon(Icons.map),
                    ),
                    items:
                        _states
                            .map(
                              (state) => DropdownMenuItem(
                                value: state,
                                child: Text(state),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedState = value;
                        _stateController.text = value ?? '';
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _zipController,
              decoration: const InputDecoration(
                labelText: 'ZIP Code',
                hintText: 'Enter ZIP code',
                prefixIcon: Icon(Icons.location_on),
              ),
              keyboardType: TextInputType.number,
              autofillHints: const [AutofillHints.postalCode],
              textInputAction: TextInputAction.next,
              maxLength: 5,
            ),
            const SizedBox(height: 16),
            // Payment Section
            const Text(
              'Payment Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _cardNumberController,
              decoration: const InputDecoration(
                labelText: 'Card Number',
                hintText: 'XXXX XXXX XXXX XXXX',
                prefixIcon: Icon(Icons.credit_card),
              ),
              keyboardType: TextInputType.number,
              autofillHints: const [AutofillHints.creditCardNumber],
              textInputAction: TextInputAction.next,
              maxLength: 19,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _expiryController,
                    decoration: const InputDecoration(
                      labelText: 'Expiry Date',
                      hintText: 'MM/YY',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    keyboardType: TextInputType.datetime,
                    autofillHints: const [
                      AutofillHints.creditCardExpirationDate,
                    ],
                    textInputAction: TextInputAction.next,
                    maxLength: 5,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _cvvController,
                    decoration: const InputDecoration(
                      labelText: 'CVV',
                      hintText: 'XXX',
                      prefixIcon: Icon(Icons.security),
                    ),
                    keyboardType: TextInputType.number,
                    autofillHints: const [AutofillHints.creditCardSecurityCode],
                    textInputAction: TextInputAction.done,
                    maxLength: 3,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {},
              child: const Text('Complete Purchase'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCupertinoVersion() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CupertinoTextField(
              controller: _nameController,
              placeholder: 'Full Name',
              prefix: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(CupertinoIcons.person),
              ),
              keyboardType: TextInputType.name,
              autofillHints: const [AutofillHints.name],
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            // Address Section
            const Text(
              'Shipping Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CupertinoTextField(
              controller: _street1Controller,
              placeholder: 'Street Address',
              prefix: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(CupertinoIcons.location),
              ),
              keyboardType: TextInputType.streetAddress,
              autofillHints: const [AutofillHints.streetAddressLine1],
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            CupertinoTextField(
              controller: _street2Controller,
              placeholder: 'Apt, Suite, Unit (optional)',
              prefix: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(CupertinoIcons.location),
              ),
              keyboardType: TextInputType.streetAddress,
              autofillHints: const [AutofillHints.streetAddressLine2],
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CupertinoTextField(
                    controller: _cityController,
                    placeholder: 'City',
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(CupertinoIcons.location_circle),
                    ),
                    keyboardType: TextInputType.text,
                    autofillHints: const [AutofillHints.addressCity],
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup<void>(
                        context: context,
                        builder:
                            (BuildContext context) => Container(
                              height: 216,
                              padding: const EdgeInsets.only(top: 6.0),
                              margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              color: CupertinoColors.systemBackground
                                  .resolveFrom(context),
                              child: SafeArea(
                                top: false,
                                child: CupertinoPicker(
                                  itemExtent: 32,
                                  scrollController: FixedExtentScrollController(
                                    initialItem:
                                        _selectedState != null
                                            ? _states.indexOf(_selectedState!)
                                            : 0,
                                  ),
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      _selectedState = _states[index];
                                      _stateController.text = _states[index];
                                    });
                                  },
                                  children:
                                      _states
                                          .map((state) => Text(state))
                                          .toList(),
                                ),
                              ),
                            ),
                      );
                    },
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
                              CupertinoIcons.map,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _selectedState ?? '',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CupertinoTextField(
              controller: _zipController,
              placeholder: 'ZIP Code',
              prefix: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(CupertinoIcons.location),
              ),
              keyboardType: TextInputType.number,
              autofillHints: const [AutofillHints.postalCode],
              textInputAction: TextInputAction.next,
              maxLength: 5,
            ),
            const SizedBox(height: 16),
            // Payment Section
            const Text(
              'Payment Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CupertinoTextField(
              controller: _cardNumberController,
              placeholder: 'Card Number',
              prefix: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(CupertinoIcons.creditcard),
              ),
              keyboardType: TextInputType.number,
              autofillHints: const [AutofillHints.creditCardNumber],
              textInputAction: TextInputAction.next,
              maxLength: 19,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CupertinoTextField(
                    controller: _expiryController,
                    placeholder: 'MM/YY',
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(CupertinoIcons.calendar),
                    ),
                    keyboardType: TextInputType.datetime,
                    autofillHints: const [
                      AutofillHints.creditCardExpirationDate,
                    ],
                    textInputAction: TextInputAction.next,
                    maxLength: 5,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CupertinoTextField(
                    controller: _cvvController,
                    placeholder: 'CVV',
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(CupertinoIcons.lock),
                    ),
                    keyboardType: TextInputType.number,
                    autofillHints: const [AutofillHints.creditCardSecurityCode],
                    textInputAction: TextInputAction.done,
                    maxLength: 3,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CupertinoButton.filled(
              onPressed: () {},
              child: const Text('Complete Purchase'),
            ),
          ],
        ),
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
