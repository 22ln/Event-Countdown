import 'package:flutter/material.dart';

class EventAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EventAppBar(),  // Custom AppBar
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get the available height and width
          final screenHeight = constraints.maxHeight;
          final screenWidth = constraints.maxWidth;

          // Check if the keyboard is visible
          final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: isKeyboardVisible ? MediaQuery.of(context).viewInsets.bottom : 0,
                left: screenWidth * 0.05,  // 5% of screen width for padding
                right: screenWidth * 0.05, // 5% of screen width for padding
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Your other content, like the input field and form
                  
                  SizedBox(height: screenHeight * 0.02), // Some space before the button
                  
                  ElevatedButton(
                    onPressed: () {
                      // Show Add Event dialog or perform an action
                    },
                    child: Text('Add Event'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.2,  // Adjust button padding based on screen size
                        vertical: screenHeight * 0.015,  // Vertical padding for button
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class EventAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return AppBar(
      title: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01,
        ),
        child: Text(
          'Event Countdown',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.05,
          ),
        ),
      ),
      backgroundColor: Colors.teal,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
