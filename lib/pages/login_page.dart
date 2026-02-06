import 'package:flutter/material.dart';


import 'home_page.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Visual Layout
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, // Set color of the first line
              end: Alignment.bottomCenter, // Set color of the second line
              colors: [
            Colors.indigo,
            Colors.lightBlueAccent
          ])
        ),

      // Padding for spaces in the edges
      child: Padding(
          padding: EdgeInsets.all(24),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 // Lock icon
                Icon(Icons.lock, size: 80, color: Colors.white),

                // space between icon and text
                SizedBox(height: 20),

                // Display text
                Text(
                  "Welcome Back User",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                // space between icon and text
                SizedBox(height: 15),
                //Email input
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Input Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                ),
//Email input
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                ),

                //Login Button
                SizedBox(height: 20),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> LandingPage(),
                      ),
                      );

                    },
                    child: Text('Login'),


                        ),
              ],
           ),
      ),
    ),
    );
  }
}