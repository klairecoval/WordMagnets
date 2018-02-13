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
    let words = ["a", "ache", "ad", "after", "am", "am", "an", "dog", "and", "and", "and", "and", "apparatus", "are", "are", "as", "as", "as", "as", "ask", "at", "cat", "at", "at"]
    
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
        
        for word in words{
            let l = UILabel() //Make new lable
            l.backgroundColor = UIColor.white //Make backgorund white
            l.text = word //Add text to words
            l.textAlignment = .center //Align words based on their center
            l.sizeToFit()
            
            //Add spacing for words
            if l.frame.size.width < 20{
                l.frame.size.width = 40 //Set sizing to 40 if it is too small
            }
            else{
                l.frame.size.width += 20
            }
            l.frame.size.height = 40
            
            xPos += spacing
            
            //Move words to next row if the words extend the frame width
            if (xPos + l.frame.size.width + spacing)>(UIScreen.main.bounds.width - gutter){
                xPos = spacing
                row += 1
            }
            yPos = row*(spacing + l.frame.size.height)
            
            //Position words
            l.frame.origin.x = xPos
            l.frame.origin.y = yPos
            
            //Add to x position
            xPos += l.frame.size.width
            
            //Make the words draggable!
            l.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target:self, action:#selector(makeDraggable))
            l.addGestureRecognizer(panGesture)
            
            //Add words to view
            view.addSubview(l)
        }
    }
    
    @objc func makeDraggable(panGesture:UIPanGestureRecognizer){
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }

}

