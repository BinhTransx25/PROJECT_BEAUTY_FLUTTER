import 'package:flutter/material.dart';

class AddressItemWidget extends StatelessWidget {
  final bool isDefault;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  AddressItemWidget({
    this.isDefault = false,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 219, 219, 219),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/src/assets/Address/location.png',
                height: 60,
                width: 60,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Nhà',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        if (isDefault)
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 244, 234, 234),
                            ),
                            child: Text(
                              'Mặc định',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 36,
                height: 36,
                child: Checkbox(
                  shape: CircleBorder(),
                  side: BorderSide(
                    color: isChecked ? Colors.black : Colors.grey,
                    width: 1.5,
                  ),
                  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.black;
                    }
                    return Colors.transparent;
                  }),
                  checkColor: Colors.white,
                  value: isChecked,
                  onChanged: onChanged,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
