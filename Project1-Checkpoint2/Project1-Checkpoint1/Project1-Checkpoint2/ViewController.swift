//
//  ViewController.swift
//  Project1-Checkpoint1
//
//  Created by Claire Koval and Danny Kim
//  Copyright © 2018 Claire Koval. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Initialize word array
    var words = ["a", "ache", "ad", "after", "am", "am", "an", "and", "and", "and", "and", "apparatus", "are", "are", "as", "as", "as", "as", "ask", "at", "at", "at"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set background color to maroon-ish
        view.backgroundColor = UIColor(red:0.59, green:0.29, blue:0.76, alpha:1.0)
        
        //Call function/s
        placeWords()
    }
    
    func placeWords(){
        var row: CGFloat = 1.0
        let spacing: CGFloat = 10.0 //set space inbetween words
        let gutter: CGFloat = 20       // Right margin to help keep words in view
        var xPos: CGFloat = spacing
        var yPos: CGFloat = spacing
        
        for word in words {
            let wordLabel = UILabel() //Make new lable
            wordLabel.backgroundColor = UIColor.white //Make backgorund white
            wordLabel.text = word //Add text to words
            wordLabel.textAlignment = .center //Align words based on their center
            wordLabel.sizeToFit()
            
            //Add spacing for words
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
            
            //Position words
            wordLabel.frame.origin.x = xPos
            wordLabel.frame.origin.y = yPos
            
            //Add to x position
            xPos += wordLabel.frame.size.width
            
            //Make the words draggable!
            wordLabel.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(makeDraggable))
            wordLabel.addGestureRecognizer(panGesture)
            
            //Add words to view
            view.addSubview(wordLabel)
        }
    }
    
    @objc func makeDraggable(panGesture: UIPanGestureRecognizer) {
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTableSetsSegue" {
            let wordSetsVC = segue.destination.childViewControllers[0] as! WordSetsTableVC
            wordSetsVC.title = "Choose a word set"
        }
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneTapped" {
            //let wordSetVC = segue.source as! WordSetsTableVC
            //let wordSet = wordSetVC.selectedWordSet
            //self.view.backgroundColor = wordSet
            for v in view.subviews {
                if v is UILabel {
                    v.removeFromSuperview()
                }
            }
            let wordSetVC = segue.source as! WordSetsTableVC
            let wordSet = wordSetVC.selectedWordSet
            self.words = wordSet
            placeWords()
        }
    }

}

