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
import AVFoundation

class Data {
    var noun : [Word] = [Word(name: "Xuxa", type: "noun"),Word(name: "Obama", type: "noun"),Word(name: "Teacher", type: "noun"),Word(name: "Britney", type: "noun"),Word(name: "Lula", type: "noun"),Word(name: "Castor", type: "noun"),Word(name: "", type: "noun"),Word(name: "Francisco", type: "noun"),Word(name: "Harry Potter", type: "noun"),Word(name: "Faustão", type: "noun"),Word(name: "Gandalf", type: "noun"),Word(name: "Sylvester", type: "noun"),Word(name: "Dragon", type: "noun"),Word(name: "Unicorn", type: "noun"),Word(name: "Mermaid", type: "noun"),Word(name: "Mario", type: "noun"),Word(name: "Fairy", type: "noun"),Word(name: "Simba", type: "noun"),Word(name: "pikachu", type: "noun"),Word(name: "Timon", type: "noun"), Word(name: "Yoda", type: "noun"), Word(name: "Darth Vader", type: "noun"), Word(name: "Chewbacca", type: "noun"), Word(name: "Spock", type: "noun"), Word(name: "Spider Man", type: "noun"), Word(name: "Thor", type: "noun"), Word(name: "Hulk", type: "noun"), Word(name: "Captain America", type: "noun"), Word(name: "Iron Man", type: "noun"), Word(name: "Black Panther", type: "noun"), Word(name: "Super Man", type: "noun"), Word(name: "Batman", type: "noun"), Word(name: "Wonder woman", type: "noun"), Word(name: "Voldemort", type: "noun")]
    
    var place : [Word] = [Word(name: "Egypt", type: "place"),Word(name: "Paris", type: "place"),Word(name: "Disney", type: "place"),Word(name: "Bar", type: "place"),Word(name: "Castle", type: "place"), Word(name: "Carnival", type: "place"),Word(name: "shopping", type: "place"),Word(name: "ilha", type: "place"), Word(name: "Beach", type: "place"), Word(name: "estacionamento", type: "place"), Word(name: "parque de diversões", type: "place"), Word(name: "laboratório", type: "place"), Word(name: "campo de golfe", type: "place"), Word(name: "casa lotérica", type: "place"), Word(name: "cinema", type: "place"), Word(name: "copa do mundo", type: "place")]
    
    var verb : [Word] = [Word(name: "Singing", type: "verb"),Word(name: "Dancing", type: "verb"),Word(name: "Shower", type: "verb"),Word(name: "Digging", type: "verb"),Word(name: "Driving", type: "verb"),Word(name: "Cry", type: "verb"),Word(name: "Buy", type: "verb"), Word(name: "smell", type: "verb"), Word(name: "amar", type: "verb"), Word(name: "cair", type: "verb"), Word(name: "voar", type: "verb"), Word(name: "abrir", type: "verb"), Word(name: "andar", type: "verb"),  Word(name: "babar", type: "verb"), Word(name: "caçar", type: "verb"), Word(name: "casar", type: "verb"), Word(name: "cavar", type: "verb"), Word(name: "falar", type: "verb")]
    
    var nounUsed:[Word] = []
    var placeUsed:[Word] = []
    var verbUsed:[Word] = []

    var teams : [Team] = []
    var teamsDone : [Team] = []
    var teamTurn = 0
    var winner: [String] = []
    var collectionWords : [Word] = []
    var newCollectionWords : [Word] = []
    var finalCollectionWords : [Word] = []
    
    static var shared = Data()
    
    var player:AVAudioPlayer?

    var numberOfTeams = 0

}

