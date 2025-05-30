import '../../../../commons/all.dart';
import '../controller/amenitiesScreen_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemsCard extends StatefulWidget {
  const SystemsCard({Key? key}) : super(key: key);

  @override
  State<SystemsCard> createState() => _SystemsCardState();
}

class _SystemsCardState extends State<SystemsCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InspireVAmenitiesScreenController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Systems",
                style: TextStyle(fontSize: 24.px, fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 12.px),
              Expanded(
                child: Container(
                  height: 1.px,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              SizedBox(width: 12.px),
              Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            ],
          ),
        ),
        if (_expanded)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.px, vertical: 8.px),
            child: Column(
              children: controller.systemOptions.map((system) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.px),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Obx(() => Checkbox(
                                value: system.isChecked.value,
                                onChanged: (val) => system.isChecked(val),
                              )),
                          Text(system.label, style: TextStyle(fontSize: 20.px)),
                        ],
                      ),
                      SizedBox(height: 8.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: system.fuelOptions.map((fuel) {
                          return Obx(() => Row(
                                children: [
                                  Radio<String>(
                                    value: fuel,
                                    groupValue: system.selectedFuel.value,
                                    onChanged: (value) =>
                                        system.selectedFuel(value),
                                  ),
                                  Text(fuel),
                                ],
                              ));
                        }).toList(),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        SizedBox(height: 16.px),
      ],
    );
  }
}

class SingleRadioExpandableSection extends StatefulWidget {
  final String title;
  final RxString selectedValue;
  final List<String> options;

  const SingleRadioExpandableSection({
    Key? key,
    required this.title,
    required this.selectedValue,
    required this.options,
  }) : super(key: key);

  @override
  State<SingleRadioExpandableSection> createState() =>
      _SingleRadioExpandableSectionState();
}

class _SingleRadioExpandableSectionState
    extends State<SingleRadioExpandableSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,
                  style:
                      TextStyle(fontSize: 24.px, fontWeight: FontWeight.w400)),
              SizedBox(width: 12.px),
              Expanded(
                child: Container(
                  height: 1.px,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              SizedBox(width: 12.px),
              Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            ],
          ),
        ),
        if (_expanded)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.px, vertical: 8.px),
            child: Obx(() => Wrap(
                  spacing: 16.px,
                  runSpacing: 8.px,
                  children: widget.options.map((option) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<String>(
                          value: option,
                          groupValue: widget.selectedValue.value,
                          onChanged: (val) => widget.selectedValue.value = val!,
                        ),
                        Text(option),
                      ],
                    );
                  }).toList(),
                )),
          ),
        SizedBox(height: 16.px),
      ],
    );
  }
}

class AdditionalExpandableSection extends StatefulWidget {
  final String title;
  final List<AmenityOption> options;

  const AdditionalExpandableSection({
    Key? key,
    required this.title,
    required this.options,
  }) : super(key: key);

  @override
  State<AdditionalExpandableSection> createState() =>
      _AdditionalExpandableSectionState();
}

class _AdditionalExpandableSectionState
    extends State<AdditionalExpandableSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,
                  style:
                      TextStyle(fontSize: 24.px, fontWeight: FontWeight.w400)),
              SizedBox(width: 12.px),
              Expanded(
                child: Container(
                  height: 1.px,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              SizedBox(width: 12.px),
              Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            ],
          ),
        ),
        if (_expanded)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 8.px),
            child: Wrap(
              spacing: 16.px,
              runSpacing: 8.px,
              children: widget.options.map((option) {
                return SizedBox(
                  width: 180.px,
                  child: Row(
                    children: [
                      Checkbox(value: false, onChanged: (val) {}),
                      Expanded(child: Text(option.label)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        SizedBox(height: 16.px),
      ],
    );
  }
}

class ExpandableSection extends StatefulWidget {
  final String title;
  final List<String> items;
  final bool initiallyExpanded;

  const ExpandableSection({
    Key? key,
    required this.title,
    required this.items,
    this.initiallyExpanded = false,
  }) : super(key: key);

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _expanded = false;

  @override
  void initState() {
    _expanded = widget.initiallyExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,
                  style:
                      TextStyle(fontSize: 18.px, fontWeight: FontWeight.bold)),
              Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            ],
          ),
        ),
        if (_expanded)
          Padding(
            padding: EdgeInsets.only(top: 12.px, bottom: 24.px),
            child: Column(
              children: [
                ...widget.items.map((item) => Row(
                      children: [
                        Checkbox(value: false, onChanged: (val) {}),
                        Expanded(child: Text(item)),
                      ],
                    )),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (val) {}),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Other",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.px),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        Divider(thickness: 1.px, color: Colors.grey.shade300),
        SizedBox(height: 16.px),
      ],
    );
  }
}
