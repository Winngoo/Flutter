import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomDropdown extends StatefulWidget {
  final String label;
  final List<String>? options;
   final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.label,
    this.options,
     required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedOption;
  List<String> _options = [];
  OverlayEntry? _dropdownOverlay;
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    if (widget.options != null) {
      _options = widget.options!;
    } else {
      _fetchBusinessTypes();
    }
  }

  Future<void> _fetchBusinessTypes() async {
    final String apiUrl = "https://winngoouk.wimbgo.com/api/getBusinessTypes";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data["success"] == true) {
          final List<dynamic> businessTypes = data["data"]["business_types"];
          setState(() {
            _options =
                businessTypes.map((item) => item["type"] as String).toList();
          });
        } else {
          print("Failed to fetch business types: ${data["message"]}");
        }
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching business types: $e");
    }
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

   void _openDropdown() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    _dropdownOverlay = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            constraints: BoxConstraints(maxHeight: 120),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _options.length,
              itemBuilder: (context, index) {
                final option = _options[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedOption = option;
                      _isDropdownOpen = false;
                    });
                    _closeDropdown();
                    widget.onChanged(option); // Notify the parent widget of the selection
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                      color: _selectedOption == option
                          ? Colors.blue[400]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        color: _selectedOption == option
                            ? Colors.white
                            : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(_dropdownOverlay!);
    setState(() {
      _isDropdownOpen = true;
    });
  }
  void _closeDropdown() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
    setState(() {
      _isDropdownOpen = false;
    });
  }

  @override
  void dispose() {
    _closeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleDropdown,
      child: Container(
        width: 263,
        height: 34,
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedOption ?? widget.label,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(
              _isDropdownOpen
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              color: Colors.grey,
              size: 20,
            ),
            
          ],
        ),
      ),
    );
  }
}
