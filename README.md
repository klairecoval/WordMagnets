# Words of Attraction
Claire Koval and Danny Kim

A magnetic poetry app created in Swift for IGME-340 Spring

## Proposed Features
1. Add custom words
2. Deleting words with animated trash can icon that gets bigger as word gets closer to the icon
3. Shake or press button to clear screen and move words back to the top.

## Checkpoint 1
### Initial Sketches

Word would ideally be positioned at the bottom so that the user feels gets the feeling of texting. There will be an export button at the top to save to gallery, save to app, or export/share on other apps

![alt text](Images/wordFrame.png "Wireframe of proposed app")

User interaction with the pan gesture draggability is working, and the words start off at the top of the screen. It works on iPhone and iPad.

![alt text](Images/mainScreen.png "current main words page")
![alt text](Images/LaunchScreen.png "current launch screen page")

### Current Features
1. Words can be dragged (no zoom or rotation)

### Upcoming
Look into customizing background colors, labels, and word fonts. 

Will make the UI and Loadscreen more visually pleasing.

## Checkpoint 2
- The user can load at least 3 distinct sets of words. (see the Tables I-III Walkthrough for ideas on how to let the user choose something from a list). Because multiple view controllers will depend on the same data, ideally you have that data stored in just one place.
- Before loading a new word set the app needs to get rid of all of the old UILabels. See this Stack Overflow post on how to do this. (-3 if not done)
- When new word sets are loaded, make sure that the words are not too close to the top or edges of the screen for the user to tap. Test for this fact on a real device. (-2 if not done)
- Hide the status bar - you can do this on the General settings page for the Xcode project (-2 if not done)
- Make sure your Springboard app name matches the name on the icon - see developer.apple.com - Updating the Display Name of Your App (-2 if not done)
- Get rid of all compiler warnings - including those for unused variables, missing icons, and broken Storyboard constraints (-1 per compiler warning)
- Make sure you still meet all of the checkpoint #1 requirements (-1 per requirement not met)
