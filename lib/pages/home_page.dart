import 'package:flutter/material.dart';

//Landing page
class LandingPage extends StatefulWidget{
  @override
  LandingPageState createState() => LandingPageState();


}
class LandingPageState extends State<LandingPage>{
  int _selectedIndex = 0;

final List<Widget> _pages = [
  HomePage(),
  OrderPage(),
  ProfilePage(),
];
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(
      title: Text("My first Mobile"),
      backgroundColor: Colors.indigo,
      centerTitle: true,
    ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // Highlight Navigation Bar
        currentIndex: _selectedIndex,

        selectedItemColor: Colors.indigo,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [const
        BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
        ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
//profile page
class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //Logout
    return Center(
      child: ElevatedButton(
        onPressed: (){
          Navigator.pop(context);
        },
        //BUtton text
        child: Text('Logout'),
      ),
    );
  }
}

//home page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.indigo,
            Colors.lightBlueAccent
          ],
        )
      ),
      //list of order
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _itemCard("Burger", "120"),
          _itemCard("Siomai", "20"),
          _itemCard("Fries", "12"),
          _itemCard("Milktea", "100"),
          _itemCard("Tapsilog", "70"),
        ],
      ),
    );
  }
}
    // create widget itemcard
    Widget _itemCard(String name, String price){
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        margin: EdgeInsets.only(bottom: 12),
        child: ListTile(
          title: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          subtitle: Text(price),
          trailing: ElevatedButton(
            onPressed: (){},
            child: Text("Order"),
          ),
        )

      );

}

//ORDER PAGE
class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Center(
      child: Text("Your order will display here",
      style: TextStyle(fontSize: 18),
    ),
    );
  }
}