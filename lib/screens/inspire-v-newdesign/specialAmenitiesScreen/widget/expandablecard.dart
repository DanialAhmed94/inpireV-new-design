import '../../../../commons/all.dart';

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
                  style: TextStyle(fontSize: 18.px, fontWeight: FontWeight.bold)),
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
