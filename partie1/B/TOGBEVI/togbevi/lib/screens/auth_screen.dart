import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:togbevi/widgets/auth_form.dart';

class AuthentificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/auth_img.png'),
                ),
                Column(
                  children: [
                    Text('Million of Songs.',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('Free on Spotify.',
                        style: Theme.of(context).textTheme.headlineMedium)
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    child: AuthentificationForm(),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
