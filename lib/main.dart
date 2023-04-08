import 'package:adventuregame/story_brain.dart';
import 'package:flutter/material.dart';


void main() => runApp(AdventureGame());

class AdventureGame extends StatelessWidget {
  const AdventureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // we are using the dark theme
      home: StoryPage(),
    );
  }
}

//Create a new storyBrain object from the StoryBrain class.
StoryBrain storybrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //Find a background image, add the background image into the images directory, then add the background image to this Container.
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //use the storyBrain to get the first story title and display it in this Text Widget.
                    storybrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Alkatra',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  child: TextButton(
                    onPressed: () {
                      // Choice 1 made by user
                      //Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                      storybrain.nextStory(1);
                      // Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.
                      setState(() {
                        storybrain.getStory();
                        storybrain.getChoice1();
                        storybrain.getChoice2();
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Color(0xFFF32934)),
                      foregroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                      shape: MaterialStateProperty.resolveWith(
                              (states) => BeveledRectangleBorder()),
                    ),
                    child: Text(
                      //Use the storyBrain to get the text for choice 1.
                      storybrain.getChoice1(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Alkatra',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  //Use a Flutter Visibility Widget to wrap this TextButton.
                  //Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                  visible: storybrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      // Choice 2 made by user
                      //Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                      storybrain.nextStory(2);
                      // Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.
                      setState(() {
                        storybrain.getStory();
                        storybrain.getChoice1();
                        storybrain.getChoice2();
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Color(0xFF755BC1)),
                      foregroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                      shape: MaterialStateProperty.resolveWith(
                              (states) => BeveledRectangleBorder()),
                    ),
                    child: Text(
                      //Use the storyBrain to get the text for choice 2.
                      storybrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Alkatra',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
