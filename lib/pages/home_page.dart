import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First Mobile App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const SignUpPage(), // App starts at Sign Up Page [cite: 1]
    );
  }
}

// --- SIGN UP PAGE ---
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>(); // Use Form widget with GlobalKey [cite: 23]
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Use Scaffold [cite: 19]
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pinkAccent[800]!, Colors.pinkAccent[400]!],
          ),
        ),
        child: SingleChildScrollView( // Use SingleChildScrollView [cite: 22]
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Form(
            key: _formKey,
            child: Column( // Wrap inputs in Column [cite: 24]
              children: [
                const Icon(Icons.person_add, size: 80, color: Colors.white),
                const SizedBox(height: 10),
                const Text(
                  "Create Account", // [cite: 6, 29]
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 30), // Spacing using SizedBox [cite: 25]

                _buildTextField("First Name", Icons.person, (val) {
                  if (val == null || val.isEmpty) return "Cannot be empty"; // [cite: 28]
                  return null;
                }),
                const SizedBox(height: 15),

                _buildTextField("Last Name", Icons.person_outline, (val) {
                  if (val == null || val.isEmpty) return "Cannot be empty"; // [cite: 28]
                  return null;
                }),
                const SizedBox(height: 15),

                _buildTextField("Contact Number", Icons.phone, (val) {
                  if (val == null || val.length < 10 || val.length > 15) return "Must be 10-15 digits"; // [cite: 28]
                  return null;
                }, keyboardType: TextInputType.phone), // Numeric keyboard [cite: 9]
                const SizedBox(height: 15),

                _buildTextField("Username", Icons.alternate_email, (val) {
                  if (val == null || val.length < 4) return "Minimum 4 characters"; // [cite: 28]
                  return null;
                }),
                const SizedBox(height: 15),

                _buildTextField("Password", Icons.lock, (val) {
                  if (val == null || val.length < 6) return "Minimum 6 characters"; // [cite: 28]
                  return null;
                },
                    isPassword: true,
                    obscureText: _obscurePassword,
                    controller: _passwordController,
                    toggleVisibility: () => setState(() => _obscurePassword = !_obscurePassword)),
                const SizedBox(height: 15),

                _buildTextField("Confirm Password", Icons.lock_clock, (val) {
                  if (val != _passwordController.text) return "Must match Password"; // [cite: 28]
                  return null;
                },
                    isPassword: true,
                    obscureText: _obscureConfirm,
                    controller: _confirmPasswordController,
                    toggleVisibility: () => setState(() => _obscureConfirm = !_obscureConfirm)),
                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent[900],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) { // Validation logic [cite: 27]
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LandingPage()));
                      }
                    },
                    child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18)), // [cite: 20]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, String? Function(String?) validator,
      {TextInputType keyboardType = TextInputType.text, bool isPassword = false, bool obscureText = false,
        VoidCallback? toggleVisibility, TextEditingController? controller}) {
    return TextFormField( // Use TextFormField for validation [cite: 27]
      controller: controller,
      obscureText: obscureText, // Obscure TextField for passwords
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.pinkAccent),
        suffixIcon: isPassword ? IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: toggleVisibility,
        ) : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
      ),
    );
  }
}

// --- LANDING PAGE ---
class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 2; // Default to Profile for this demonstration

  final List<Widget> _pages = const [
    HomePage(),
    OrderPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("My First Mobile App", style: TextStyle(fontWeight: FontWeight.bold)), // [cite: 44]
        backgroundColor: Colors.white,
        foregroundColor: Colors.pinkAccent,
        centerTitle: true,
        elevation: 0.5,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"), // [cite: 55]
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded), label: "Order"), // [cite: 56]
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile"), // [cite: 57]
        ],
      ),
    );
  }
}

// --- HOME PAGE ---
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.pinkAccent[800]!, Colors.pinkAccent[400]!],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _itemCard("Burger", "35"),
          _itemCard("Ham & Egg Sandwich", "20"),
          _itemCard("Carbonara", "80"),
        ],
      ),
    );
  }

  Widget _itemCard(String name, String price) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("₱$price", style: const TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
        trailing: ElevatedButton(onPressed: () {}, child: const Text("Order")),
      ),
    );
  }
}

// --- ORDER PAGE ---
class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Your Order will display here", style: TextStyle(fontSize: 18)));
  }
}

// --- PROFILE PAGE --- [cite: 37]
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Header [cite: 37]
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(
              gradient: LinearGradient( // Gradient background [cite: 37]
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.indigo[800]!, Colors.blue[400]!],
              ),
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar( // Large circular profile avatar [cite: 37]
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 60, color: Colors.pinkAccent),
                    ),
                    Container( // Edit icon overlay [cite: 40]
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.edit, size: 18, color: Colors.pinkAccent),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text("Lorenzo Panopio", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)), // [cite: 45]
                const Text("@zoren", style: TextStyle(color: Colors.white70)), // [cite: 42]
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _infoTile(Icons.email, "Email", "renzo@gmail.com"), // [cite: 46]
                _infoTile(Icons.phone, "Contact Number", "09694131622"), // [cite: 48]
                _infoTile(Icons.location_on, "Address", "Calamba Laguna, Philippines"), // [cite: 50]
                const SizedBox(height: 20),
                _actionButton("Edit Profile", Icons.edit, Colors.pinkAccent), // [cite: 52]
                const SizedBox(height: 10),
                _actionButton("Logout", Icons.logout, Colors.green), // [cite: 53]
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Card(
        /*margin: const EdgeInsets.symmetric(vertical:
          child: ListTile(
            leading: Icon(icon, color: Colors.indigo),
            title: Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            subtitle: Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),*/
        );
    }

  Widget _actionButton(String label, IconData icon, Color color) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white, shape: const StadiumBorder()),
      ),
    );
  }
}