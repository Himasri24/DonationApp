import 'package:flutter/material.dart';
import 'dart:async';
void main() {
  runApp(DonationApp());
}

class DonationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donation App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQESIDG8i7VA3wFzRIf824A6Cxd1_PWbe9B7g&s', // Replace with your correct image URL
          width: 200, // Adjust size as needed
          height: 200,
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Implement your login logic here, such as validating credentials
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    // Example authentication logic (replace with your actual authentication process)
    if (email == 'abcd@gmail.com' && password == '1234') {
      // Navigate to DonationHomePage on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DonationHomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password. Please try again.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),

                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 30),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: _login,
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DonationHomePage extends StatefulWidget {
  @override
  _DonationHomePageState createState() => _DonationHomePageState();
}

class _DonationHomePageState extends State<DonationHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DonationCategoriesPage(),
    DonatedPage(),
    RewardPointsPage(),
  ];

  int rewardPoints = 0;
  List<String> donations = [];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _addDonation(String message) {
    setState(() {
      donations.add(message);
      rewardPoints++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation App'),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(147, 255, 255, 0),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),

          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Donated',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.point_of_sale),
            label: 'Reward points',
          ),
        ],
      ),
    );
  }
}

class DonationCategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Giving is the greatest art of grace',
          textAlign: TextAlign.justify,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DonationCategoryCard(
                    imageUrl: 'https://static.thenounproject.com/png/4962268-200.png', // Replace with actual URL
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FoodDonationPage()),
                      );
                    },
                  ),
                  DonationCategoryCard(
                    imageUrl: 'https://cdn-icons-png.flaticon.com/512/508/508834.png', // Replace with actual URL
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BloodDonationPage()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20), // Space between rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DonationCategoryCard(
                    imageUrl: 'https://t4.ftcdn.net/jpg/05/64/68/45/360_F_564684510_SfXH6yfEudOMiYGMvdpP0nvGrGdENbkD.jpg', // Replace with actual URL
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClothDonationPage()),
                      );
                    },
                  ),
                  DonationCategoryCard(
                    imageUrl: 'https://static.thenounproject.com/png/2139173-200.png', // Replace with actual URL
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MoneyDonationPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DonationCategoryCard extends StatelessWidget {
  final String imageUrl;
  final Function onTap;
  final Color backgroundColor; // New property to hold background color

  const DonationCategoryCard({
    Key? key,
    required this.imageUrl,
    required this.onTap,
    this.backgroundColor = Colors.white, // Set default to transparent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
        color: backgroundColor, // Set the background color of the Card
        child: SizedBox(
          width: 130,
          height: 130,
          child: Stack(
            alignment: Alignment.center, // Center the image and text
            children: <Widget>[
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DonatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donated page'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Items Donated:vegetables',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RewardPointsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reward Points'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Reward points',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class FoodDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Donation'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Choose Old Age Home',
                style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('Old Age Home 1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OldAgeHome1Page()),
                  );
                },
              ),
              ListTile(
                title: const Text('Old Age Home 2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OldAgeHome2Page()),
                  );
                },
              ),
              ListTile(
                title:const Text('Old Age Home 3'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OldAgeHome3Page()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OldAgeHome1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Old Age Home 1'),
          backgroundColor: Colors.white
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Choose a Food item',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              ListTile(
                title: const Text('Vegetables'),
                onTap: () {
                  _handleDonation(context, 'Vegetables donated');
                },
              ),
              ListTile(
                title:const Text('Fruits'),
                onTap: () {
                  _handleDonation(context, 'Fruits donated');
                },
              ),
              ListTile(
                title: const Text('Snacks'),
                onTap: () {
                  _handleDonation(context, 'Snacks donated');
                },
              ),
              ListTile(
                title: const Text('Milk'),
                onTap: () {
                  _handleDonation(context, 'Milk donated');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleDonation(BuildContext context, String message) {
    final homePageState = context.findAncestorStateOfType<_DonationHomePageState>();
    homePageState?._addDonation(message);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    Navigator.pop(context);
  }
}
class OldAgeHome2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Old Age Home 2'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Choose a Food item',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title:const Text('Vegetables'),
                onTap: () {
                  _handleDonation(context, 'Vegetables donated');
                },
              ),
              ListTile(
                title: const Text('Fruits'),
                onTap: () {
                  _handleDonation(context, 'Fruits donated');
                },
              ),
              ListTile(
                title:const Text( 'Snacks'),
                onTap: () {
                  _handleDonation(context, 'Snacks donated');
                },
              ),
              ListTile(
                title: const Text('Milk'),
                onTap: () {
                  _handleDonation(context, 'Milk donated');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleDonation(BuildContext context, String message) {
    final homePageState = context.findAncestorStateOfType<_DonationHomePageState>();
    homePageState?._addDonation(message);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    Navigator.pop(context);
  }
}
class OldAgeHome3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Old Age Home 3'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Choose a Food item',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('Vegetables'),
                onTap: () {
                  _handleDonation(context, 'Vegetables donated');
                },
              ),
              ListTile(
                title: const Text('Fruits'),
                onTap: () {
                  _handleDonation(context, 'Fruits donated');
                },
              ),
              ListTile(
                title: const Text('Snacks'),
                onTap: () {
                  _handleDonation(context, 'Snacks donated');
                },
              ),
              ListTile(
                title: const Text('Milk'),
                onTap: () {
                  _handleDonation(context, 'Milk donated');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleDonation(BuildContext context, String message) {
    final homePageState = context.findAncestorStateOfType<_DonationHomePageState>();
    homePageState?._addDonation(message);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    Navigator.pop(context);
  }
}

class BloodDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Donation'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Choose Blood Group',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Hospital 1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Hospital1page()),
                  );
                },
              ),
              ListTile(
                title: const Text('Hospital 2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Hospital2page()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Hospital1page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital1'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Choose Blood Group',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('A+'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title: const Text('B+'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title: const Text('AB+'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title:const Text('O+'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title:const Text('A-'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title:const Text('B-'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title:const Text('AB-'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title:const Text('O-'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void _handleDonation(BuildContext context, String message) {
  final homePageState = context.findAncestorStateOfType<_DonationHomePageState>();
  homePageState?._addDonation(message);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
  Navigator.pop(context);
}
class Hospital2page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital1'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Choose Blood Group',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('A+'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title: const Text('B+'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title: const Text('AB+'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title:const Text('O+'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title:const Text('A-'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title:const Text('B-'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title:const Text('AB-'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
              ListTile(
                title:const Text('O-'),
                onTap: () {
                  _handleDonation(context, 'Blood donated');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClothDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloth Donation'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Choose Clothing Category',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Men'),
                onTap: () {
                  // Handle men's clothing action
                },
              ),
              ListTile(
                title: const Text('Women'),
                onTap: () {
                  // Handle women's clothing action
                },
              ),
              ListTile(
                title: const Text('Kids'),
                onTap: () {
                  // Handle kids' clothing action
                },
              ),
              ListTile(
                title: const Text('Old Aged'),
                onTap: () {
                  // Handle old aged clothing action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MoneyDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Donation'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Choose Old Age Home',
                style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('Old Age Home 1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OldAgeHome()),
                  );
                },
              ),
              ListTile(
                title: const Text('Old Age Home 2'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OldAgeHome()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class OldAgeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Old Age Home 1'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Choose a money transaction',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('Digital Transaction'),
              ),
              ListTile(
                title: const Text('By cash'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}