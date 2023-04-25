import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthe/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
// null checks (!) were added to
    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(user!.photoURL!),
          ),
          const SizedBox(height: 8),
          Text(
            'Name: ${user.displayName!}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'Email: ${user.email!}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
