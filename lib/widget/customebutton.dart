import 'package:cvtracker/constate/Consate.dart';
import 'package:cvtracker/pageview/singleormultiplepages.dart';
import 'package:flutter/material.dart';

class customebutton extends StatelessWidget {
  const customebutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Singlrormultible();
        }));
      },
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'continue',
            style: TextStyle(
                color: Color(Kprimiarycolor),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
