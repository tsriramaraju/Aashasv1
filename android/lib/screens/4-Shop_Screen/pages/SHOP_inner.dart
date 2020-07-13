import 'package:flutter/material.dart';

class ShopInnerPage extends StatelessWidget {
  final _controller = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inner SHop Page'),
      ),
      body: Center(
          child: Column(
        children: [
          TextField(
//              controller: _controller,
            onSubmitted: (val) {
              _controller.requestFocus();
            },
          ),
          TextField(
            focusNode: _controller,
            onSubmitted: (val) {
              _controller.unfocus();
            },
          )
        ],
      )),
    );
  }
}
