import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;
    final routeTo = route == 'login' ? 'register' : 'login';
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            route == 'login'
                ? 'Don\'t have an account?'
                : 'Already have an account?',
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, routeTo),
            child: Text(
              route == 'login' ? 'Create new account' : 'Login now',
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
