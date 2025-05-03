import 'package:flutter/material.dart';

class InsideUnitScreenExpandableRoomCard extends StatelessWidget {
  final String areaName;
  final bool isExpanded;
  //final String areaType;
  final VoidCallback onToggle;
  final VoidCallback onAdd;  final Function(String detail)? onItemTap;

  final List<String> details; // ✅ Added details list

  const InsideUnitScreenExpandableRoomCard({
    Key? key,
    required this.areaName,
    required this.isExpanded,
    // required this.areaType,
    required this.onToggle,
    required this.onAdd,  this.onItemTap,
    required this.details, // ✅ Required details parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2, // Half of screen width
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row (Title + Add Button)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // Make this take available space
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Inside",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          areaName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  // Add Button (+)
                  IconButton(
                    icon: Icon(Icons.add, size: 20, color: Colors.black),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ),

            // Divider
            Divider(),

            // Expand/Collapse Button (Centered)
            IconButton(
              icon: Icon(
                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              ),
              onPressed: onToggle,
            ),

            // ✅ Divider below dropdown icon when expanded
            if (isExpanded) Divider(height: 0),

            // Expanded Content (if expanded)
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListView.builder(
                  shrinkWrap: true, // ✅ Important: let ListView size itself
                  physics: NeverScrollableScrollPhysics(), // ✅ No internal scrolling needed
                  itemCount: details.length,
                  itemBuilder: (context, index) {
                    final detail = details[index];
                    return GestureDetector(
                      onTap: () => onItemTap?.call(detail),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          detail,
                          style: TextStyle(
                            fontFamily: 'Roboto-Regular',
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),



          ],
        ),
      ),
    );
  }
}
