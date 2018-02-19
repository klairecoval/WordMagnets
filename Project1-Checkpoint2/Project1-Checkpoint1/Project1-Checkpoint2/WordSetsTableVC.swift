//
//  WordSetsTableVC.swift
//  Project1-Checkpoint1
//
//  Created by Danny Kim on 2/18/18.
//  Copyright © 2018 Claire Koval. All rights reserved.
//

import UIKit

class WordSetsTableVC: UITableViewController {
    var wordSets: [(name: String, value: [String])] = []
    var selectedWordSet = ["a", "ache", "ad", "after", "am", "am", "an", "and", "and", "and", "and", "apparatus", "are", "are", "as", "as", "as", "as", "ask", "at", "at", "at"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordSets += [(name: "Words with A", value: ["a", "ache", "ad", "after", "am", "am", "an", "dog", "and", "and", "and", "and", "apparatus", "are", "are", "as", "as", "as", "as", "ask", "at", "cat", "at", "at"])]
        wordSets += [(name: "Words with B", value: ["be", "by", "bad", "bag", "bang", "bed", "boring", "black", "boy", "box", "blame", "buy", "bye", "beat", "bus", "book", "blind", "bored", "beard", "behalf"])]
        wordSets += [(name: "Words with C", value: ["cab", "cat", "cry", "cake", "came", "come", "cell", "clue", "club", "cool", "cow", "catch", "chair", "clear", "castle", "charge", "cook", "charm", "cruel"])]
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordSets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let currentSet = wordSets[indexPath.row]
        let name = currentSet.name
        cell.textLabel?.text = name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWordSet = wordSets[indexPath.row].value
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    

}
