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
    let words : [Word] = [Word(name: "Xuxa", type: "noun"),Word(name: "Obama", type: "noun"),Word(name: "Teacher", type: "noun"),Word(name: "Britney", type: "noun"),Word(name: "Lula", type: "noun"),Word(name: "Egito", type: "place"),Word(name: "Paris", type: "place"),Word(name: "Disney", type: "place"),Word(name: "Bar", type: "place"),Word(name: "Castle", type: "place"),Word(name: "Singing", type: "verb"),Word(name: "Dancing", type: "verb"),Word(name: "Shower", type: "verb"),Word(name: "Digging", type: "verb"),Word(name: "Driving", type: "verb")]
static var shared = Data()
}
