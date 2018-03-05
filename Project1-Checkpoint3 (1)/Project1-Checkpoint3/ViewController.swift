//
//  ViewController.swift
//  Project1-Checkpoint1
//
//  Created by Claire Koval and Danny Kim
//  Copyright © 2018 Claire Koval and Danny Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //Initialize word array
    var words = ["a", "ache", "ad", "after", "am", "am", "an", "and", "and", "and", "and", "apparatus", "are", "are", "as", "as", "as", "as", "ask", "at", "at", "at"]
    var backgroundImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set background color to maroon-ish
        view.backgroundColor = UIColor(red:0.59, green:0.29, blue:0.76, alpha:1.0)
        
        //Call function/s
        placeWords()
        
        words = AppData.shared.wordSet
    }
    
    //func placeWords()\\
    //Positions initial words and loaded words on top of screen with propper background sizing
    func placeWords(){
        var row: CGFloat = 1.0
        let spacing: CGFloat = 10.0 //set space inbetween words
        let gutter: CGFloat = 20       // Right margin to help keep words in view
        var xPos: CGFloat = spacing
        var yPos: CGFloat = spacing
        
        for word in words {
            let wordLabel = UILabel()
            wordLabel.backgroundColor = UIColor.white
            wordLabel.text = word
            wordLabel.textAlignment = .center
            wordLabel.sizeToFit()
            
            //Add background spacings for words
            if wordLabel.frame.size.width < 20 {
                wordLabel.frame.size.width = 40 //Set sizing to 40 if it is too small
            }
            else {
                wordLabel.frame.size.width += 20
            }
            wordLabel.frame.size.height = 40
            
            xPos += spacing
            
            //Move words to next row if the words extend the frame width
            if (xPos + wordLabel.frame.size.width + spacing) > (UIScreen.main.bounds.width - gutter) {
                xPos = spacing
                row += 1
            }
            yPos = row * (spacing + wordLabel.frame.size.height)
            
            //Position words on screen
            wordLabel.frame.origin.x = xPos
            wordLabel.frame.origin.y = yPos
            xPos += wordLabel.frame.size.width
            
            //Make the words draggable!
            wordLabel.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(makeDraggable))
            wordLabel.addGestureRecognizer(panGesture)
            
            //Add words to view
            view.addSubview(wordLabel)
        }
    }
    
    //func createNewWord\\
    //Handles spacing and initialization of new word label when added (The things in above loop)
    func createNewWord(text: String) -> UILabel {
        let newWord = UILabel()
        newWord.backgroundColor = UIColor.white
        newWord.text = text
        newWord.textAlignment = .center
        newWord.sizeToFit()
        
        //Set whitespace for new word
        if newWord.frame.size.width < 20 {
            newWord.frame.size.width = 40 //Set sizing to 40 if it is too small
        }
        else {
            newWord.frame.size.width += 20
        }
        newWord.frame.size.height = 40
        
        //make new word draggable
        newWord.isUserInteractionEnabled = true
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(makeDraggable))
        newWord.addGestureRecognizer(panGesture)
        
        return newWord
    }
    
    //func makeDraggable()\\
    //Makes word labels draggable by adding pangesture
    @objc func makeDraggable(panGesture: UIPanGestureRecognizer) {
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }
    
    //func prepare()\\
    //Sets up word sets view controller to load new set of words
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTableSetsSegue" {
            let wordSetsVC = segue.destination.childViewControllers[0] as! WordSetsTableVC
            wordSetsVC.title = "Choose a word set"
        }
    }
    
    //func imagePickerController()\\
    //Sets background image of view to one selected from user library
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image: UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        backgroundImage = image
        (self.view as! UIImageView).contentMode = .center
        (self.view as! UIImageView).image = backgroundImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    //func imagePickerControllerDidCancel()\\
    //dismisses image picker window when selected/cancelled
    @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    //func loadImageButton()\\
    //loads in new image from picker controller
    @IBAction func loadImageButton(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    //func addWord()\\
    //Set up alert box to add new word
    @IBAction func addWord(_ sender: Any) {
            let alert = UIAlertController(title: "Add Word", message: "Type in your own word", preferredStyle: .alert)
            let enter = UIAlertAction(title: "Enter", style: .default, handler: { (_) in
                //Get the input values
                let newWord = alert.textFields?[0].text //access text entered in box
                if newWord != nil {
                    let newLabel = self.createNewWord(text: newWord!)
                    newLabel.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2) //position new word front and center in view
                    self.view.addSubview(newLabel)
                }
            })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in })
        
        //Add subtle text and text field to take in user input
        alert.addTextField { (textField) in
            textField.placeholder = "Add Word"
        }
        
        alert.addAction(enter)
        alert.addAction(cancel)
        
        //Show box!!!!!
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var addCustomWord: UIBarButtonItem!
    
    //func share()\\
    //Set up screenshot of image to share
    @IBAction func share(_ sender: Any) {
        let image = self.view.takeSnapshot()
        let textToShare = "I just used Words of Attraction by Claire Koval and Danny Kim!"
        let objectsToShare:[AnyObject] = [textToShare as AnyObject, image!]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityType.print]
        self.present(activityVC, animated: true, completion: nil)
    }
    
    //func unwindToMain()\\
    //When done button tapped, set selected words and place them accordingly
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneTapped" {
            for view in view.subviews {
                if view is UILabel {
                    view.removeFromSuperview()
                }
            }
            let wordSetVC = segue.source as! WordSetsTableVC
            let wordSet = wordSetVC.selectedWordSet
            self.words = wordSet
            placeWords()
        }
    }

}

