//
//  AppData.swift
//  Project1-Checkpoint3
//
//  Created by Student on 3/5/18.
//  Copyright © 2018 Claire Koval. All rights reserved.
//

import Foundation

class AppData {
    let wordSetKey = "kWordSetKey"
    static let shared = AppData()

    var wordSet: Array = ["a"] {
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(wordSet, forKey: wordSetKey)
        }
    }

    private init() {
        readDefaultsData()
    }

    private func readDefaultsData() {
        let defaults = UserDefaults.standard
        //wordSet = defaults.array(forKey: wordSetKey) as! Array<String>
    }

    private func saveDefaultsData() {
        let defaults = UserDefaults.standard
        defaults.set(wordSet, forKey: wordSetKey)
        defaults.synchronize()
    }

}

