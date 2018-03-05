//
//  WordSetsTableVC.swift
//  Project1-Checkpoint1
//
//  Created by Claire Koval and Danny Kim
//  Copyright © 2018 Claire Koval and Danny Kim. All rights reserved.
//

import UIKit

class WordSetsTableVC: UITableViewController {
    var wordSets: [(name: String, value: [String])] = []
    var selectedWordSet = ["a", "ache", "ad", "after", "am", "am", "an", "and", "and", "and", "and", "apparatus", "are", "are", "as", "as", "as", "as", "ask", "at", "at", "at"]
    var wordSetA = ["a", "ache", "ad", "after", "am", "am", "an", "and", "and", "and", "and", "apparatus", "are", "are", "as", "as", "as", "as", "ask", "at", "at", "at"]
    var wordSetB = ["be", "by", "bad", "bag", "bang", "bed", "boring", "black", "boy", "box", "blame", "buy", "bye", "beat", "bus", "book", "blind", "bored", "beard", "behalf"]
    var wordSetC = ["cab", "cat", "cry", "cake", "came", "come", "cell", "clue", "club", "cool", "cow", "catch", "chair", "clear", "castle", "charge", "cook", "charm", "cruel"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add arrays of words to array of word arrays
        wordSets += [(name: "Words with A", value: wordSetA)]
        wordSets += [(name: "Words with B", value: wordSetB)]
        wordSets += [(name: "Words with C", value: wordSetC)]
        
    }
    
    //func numberOfSelections()\\
    //Set number of choices to one
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //func tableView()\\
    //Sets the number of tables to present equal to the number of indexes in wordSets array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordSets.count
    }
    
    //func tableView()\\
    //if there are too many cells present, rewrite them instead of taking up more space
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let currentSet = wordSets[indexPath.row]
        let name = currentSet.name
        cell.textLabel?.text = name
        
        return cell
    }
    
    //func tableView()\\
    //set words equal to the words at the selected index
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWordSet = wordSets[indexPath.row].value
    }
    
    //func cancelTapped()\\
    //if cancel button tapped, dismiss table view
    @IBAction func cancelTapped(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    

}
