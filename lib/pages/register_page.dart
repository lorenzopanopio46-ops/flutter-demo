import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background remains, but the form items will be solid
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pinkAccent[900]!, Colors.pinkAccent[600]!],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 80),
                // Simple Header
                Icon(Icons.person_add_alt_1_rounded, size: 70, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                SizedBox(height: 40),

                // Solid White Input Fields
                _buildSolidField("First Name", Icons.person_outline, (v) => v!.isEmpty ? "Required" : null),
                _buildSolidField("Last Name", Icons.person_outline, (v) => v!.isEmpty ? "Required" : null),
                _buildSolidField("Contact Number", Icons.phone_android,
                        (v) => (v!.length < 10 || v.length > 15) ? "10-15 digits required" : null,
                    keyboardType: TextInputType.phone),
                _buildSolidField("Username", Icons.alternate_email, (v) => v!.length < 4 ? "Min 4 characters" : null),
                _buildSolidField("Password", Icons.lock_outline, (v) => v!.length < 6 ? "Min 6 characters" : null,
                    obscure: true, controller: _passController),
                _buildSolidField("Confirm Password", Icons.lock_reset, (v) => v != _passController.text ? "Passwords don't match" : null,
                    obscure: true),

                SizedBox(height: 30),

                // Solid Primary Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.indigo[900],
                    minimumSize: Size(double.infinity, 55),
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle signup
                    }
                  },
                  child: Text("SIGN UP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),

                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Already have an account? Login here.",
                    style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper for Solid Material Inputs
  Widget _buildSolidField(String hint, IconData icon, String? Function(String?) validator,
      {bool obscure = false, TextEditingController? controller, TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Solid color instead of transparent
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: Colors.indigo[400]),
            border: InputBorder.none, // Hide the default underline
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            errorStyle: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}