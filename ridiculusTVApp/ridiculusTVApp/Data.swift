//
//  Data.swift
//  ridiculusTVApp
//
//  Created by René Melo de Lucena on 18/09/2018.
//  Copyright © 2018 René Melo de Lucena. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Data {
    var noun : [Word] = [Word(name: "Xuxa", type: "noun"),Word(name: "Obama", type: "noun"),Word(name: "Teacher", type: "noun"),Word(name: "Britney", type: "noun"),Word(name: "Lula", type: "noun"),Word(name: "castor", type: "noun"),Word(name: "Eliete", type: "noun"),Word(name: "Francisco", type: "noun"),Word(name: "Brownie", type: "noun")]
    
    var place : [Word] = [Word(name: "Egito", type: "place"),Word(name: "Paris", type: "place"),Word(name: "Disney", type: "place"),Word(name: "Bar", type: "place"),Word(name: "Castle", type: "place"), Word(name: "Carnival", type: "place"),Word(name: "Zero Um", type: "place"),Word(name: "Lab", type: "place"),Word(name: "Beach", type: "place")]
    
    var verb : [Word] = [Word(name: "Singing", type: "verb"),Word(name: "Dancing", type: "verb"),Word(name: "Shower", type: "verb"),Word(name: "Digging", type: "verb"),Word(name: "Driving", type: "verb"),Word(name: "Cry", type: "verb"),Word(name: "Buy", type: "verb"),Word(name: "smell", type: "verb")]
    
    var nounUsed:[Word] = []
    var placeUsed:[Word] = []
    var verbUsed:[Word] = []

    var teams : [Team] = []
    var teamsDone : [Team] = []
    
    var collectionWords : [Word] = []
    var newCollectionWords : [Word] = []
    var finalCollectionWords : [Word] = []
    
    static var shared = Data()
}

