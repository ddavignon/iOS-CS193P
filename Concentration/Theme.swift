//
//  Theme.swift
//  Concentration
//
//  Created by Dustin D'Avignon on 2/18/18.
//  Copyright © 2018 Dustin D'Avignon. All rights reserved.
//

import Foundation

struct Theme {
    
    private let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷🎳⛳️",
        "Animals": "🐶🦆🐹🐸🐘🦍🐓🐩🐦🦋🐙🐏",
        "Faces": "😀😌😎🤓😠😤😭😰😱😳😜😇",
        "Costumes": "🧙🧙‍♂️🧚‍♀️🧚‍♂️🧛‍♀️🧛‍♂️🧜‍♀️🧜‍♂️🧝‍♀️🧝‍♂️🧞🧞‍♀️🧟‍♀️🧟‍♂️"
    ]
    
//    private let themes = [
//        "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷🎳⛳️",
//        "🐶🦆🐹🐸🐘🦍🐓🐩🐦🦋🐙🐏",
//        "😀😌😎🤓😠😤😭😰😱😳😜😇",
//        "🧙🧙‍♂️🧚‍♀️🧚‍♂️🧛‍♀️🧛‍♂️🧜‍♀️🧜‍♂️🧝‍♀️🧝‍♂️🧞🧞‍♀️🧟‍♀️🧟‍♂️"
//    ]
    
    var randomTheme: String {
        let keys = Array(themes.keys)
        
        let randomKey = keys[keys.count.arc4random]
        
        return themes[randomKey]!
    }
}

