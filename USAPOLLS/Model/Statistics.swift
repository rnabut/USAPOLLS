//
//  Statistics.swift
//  USAPOLLS
//
//  Created by Reidel Nabut on 6/25/20.
//  Copyright © 2020 USAPOLLS.NEWS. All rights reserved.
//

import Foundation
import Firebase

let db = Firestore.firestore()

struct K {
    
    struct FStore {
        static let homeSeque = "HomeToStates"
        static let collectionName = "SwingStates"
        static let name = "StateName"
        static let abb = "Abb"
        static let ev = "ElectoralVotes"
        static let prevwinners = "PreviousWinners"
        static let bidenName = "BidenScore"
        static let trumpName = "TrumpScore"
        static let statesList = ["AZ", "FL", "GA", "IA", "MI","NC", "NH", "NV", "OH", "PA", "TX", "WI"]
        static let bidenDefault = 222
        static let trumpDefault = 128
    }
}

struct votes {
    var totalBiden: Int
    var totalTrump: Int
    
    init(tb: Int, tt: Int){
        totalBiden = tb
        totalTrump = tt
    }
}

class State {
    var electoralVotes: Int = 0
    var stateName: String?
    var abb: String
    var previousWinners: [String]
    var color = ""
    let demographyOrder = ["White", "Black", "Hispanic", "Native", "Asian"]
    var demography: [Float]
    var population: Int = 0
    
    init(votes: Int, name: String, ab: String, winners: [String], color: String, dem: [Float], pop: Int) {
        self.electoralVotes = votes
        self.stateName = name
        self.abb = ab
        self.previousWinners = winners
        self.color = "\(ab)\(color)"
        self.demography = dem
        self.population = pop
    }
}

class Entry: State {
    var bidenScore: Float = 0.0
    var trumpScore: Float = 0.0
    
    init(votes: Int, name: String, ab:String, winners: [String], bidenS: Float, trumpS: Float, dem: [Float], pop: Int) {
        self.bidenScore = bidenS
        self.trumpScore = trumpS
        
        if bidenS > trumpScore{
            super.init(votes: votes, name: name, ab: ab, winners: winners, color: "Blue", dem: dem, pop: pop)
        } else {
            super.init(votes: votes, name: name, ab: ab, winners: winners, color: "Red", dem: dem, pop: pop)
        }
    }
    
    func changeScore(bidenS: Float, trumpS: Float){
        self.bidenScore = bidenS
        self.trumpScore = trumpS
    }
}

// States Declaration


var Arizona = Entry(votes: 11, name: "Arizona", ab: "AZ", winners: ["Trump", "Romney", "McCain", "Bush"], bidenS: 0.0, trumpS: 0.0, dem: [54.1, 5.2, 31.7, 5.3, 3.7], pop: 7278717)
var Florida = Entry(votes: 29, name: "Florida", ab: "FL", winners: ["Trump", "Obama", "Obama", "Bush"], bidenS: 0.0, trumpS: 0.0, dem: [53.2, 16.9, 26.4, 0.5, 3.0], pop: 21477737)
var Georgia = Entry(votes: 16, name: "Georgia", ab: "GA", winners: ["Trump", "Romney", "McCain", "Bush"], bidenS: 0.0, trumpS: 0.0, dem: [52.0, 32.6, 9.9, 0.5, 4.4], pop: 10617423)
var Iowa = Entry(votes: 6, name: "Iowa", ab: "IA", winners: ["Trump", "Obama", "Obama", "Bush"], bidenS: 0.0, trumpS: 0.0, dem: [85.0, 4.1, 6.3, 0.5, 2.7], pop: 3155070)
var Michigan = Entry(votes: 16, name: "Michigan", ab: "MI", winners: ["Trump", "Obama", "Obama", "Kerry"], bidenS: 0.0, trumpS: 0.0, dem: [74.7, 14.1, 5.3, 0.7, 3.4], pop:9986857)
var NorthCarolina = Entry(votes: 15, name: "North Carolina", ab: "NC", winners: ["Trump", "Romney", "Obama", "Bush"], bidenS: 0.0, trumpS: 0.0, dem: [62.6, 22.2, 9.8, 1.6, 3.2], pop: 10488084)
var NewHampshire = Entry(votes: 3, name: "New Hampshire", ab: "NH", winners: ["Clinton", "Obama", "Obama", "Kerry"], bidenS: 0.0, trumpS: 0.0, dem: [89.8, 1.8, 4.0, 0.3, 3.0], pop: 1359711)
var Nevada = Entry(votes: 6, name: "Nevada", ab: "NV", winners: ["Clinton", "Obama", "Obama", "Bush"], bidenS: 0.0, trumpS: 0.0, dem: [48.2, 10.3, 29.2, 1.7, 8.7], pop:3080156)
var Ohio = Entry(votes: 18, name: "Ohio", ab: "OH", winners: ["Trump", "Obama", "Obama", "Bush"], bidenS: 0.0, trumpS: 0.0, dem: [78.4, 13.1, 4.0, 0.3, 2.5], pop:11689100)
var Pennsylvania = Entry(votes: 20, name: "Pennsylvania", ab: "PA", winners: ["Trump", "Obama", "Obama", "Kerry"], bidenS: 0.0, trumpS: 0.0, dem: [75.7, 12.0, 7.8, 0.4, 3.8], pop:12801989)
var Texas = Entry(votes: 38, name: "Texas", ab: "TX", winners: ["Trump", "Romney", "McCain", "Bush"], bidenS: 0.0, trumpS: 0.0, dem: [41.2, 12.9, 39.7, 1.0, 5.2], pop:28995881)
var Wisconsin = Entry(votes: 10, name: "Wisconsin", ab: "WI", winners: ["Trump", "Obama", "Obama", "Kerry"], bidenS: 0.0, trumpS: 0.0, dem: [80.9, 6.7, 7.1, 1.2, 3.0], pop:5822424)


let dicOfStates = ["AZ": Arizona, "FL": Florida, "GA": Georgia,
"IA": Iowa, "MI": Michigan, "NC": NorthCarolina,
"NH": NewHampshire, "NV": Nevada, "OH": Ohio,
"PA": Pennsylvania, "TX": Texas, "WI": Wisconsin]


class States {

    var bidenVotes: Int = 0
    var trumpVotes: Int = 0
    
    let dictionaryOfStates = dicOfStates
    
//    init(){
//    for s in K.FStore.statesList {
//
//
//        db.collection(K.FStore.collectionName).addDocument(data: [
//            K.FStore.name: dictionaryOfStates[s]?.stateName ?? "",
//            K.FStore.abb: s,
//            K.FStore.ev: dictionaryOfStates[s]?.electoralVotes ?? 0,
//            K.FStore.bidenName: dictionaryOfStates[s]?.bidenScore ?? 0.0,
//            K.FStore.trumpName: dictionaryOfStates[s]?.trumpScore ?? 0.0,
//            K.FStore.prevwinners: dictionaryOfStates[s]?.previousWinners ?? ["Trump", "Obama", "Obama", "Bush"]
//            ]) {(error) in
//       if let e = error {
//           print("There was issue saving data to firestore, \(e)")
//       } else {
//           print("Successfully saved data")
//              }
//       }
//    }
//    }


    init(){
        self.bidenVotes = K.FStore.bidenDefault
        self.trumpVotes = K.FStore.trumpDefault
        
        update()
}
    
    func update(){
        
        db.collection(K.FStore.collectionName).order(by: K.FStore.abb).getDocuments{ (querySnapshot, error) in
            
            if let r = error {
                print("There was an issue retriving data, \(r)")
            } else {
                self.bidenVotes = K.FStore.bidenDefault
                self.trumpVotes = K.FStore.trumpDefault
                
                if let snapshotDocument = querySnapshot?.documents {
                    
                    for doc in snapshotDocument {
                        let data = doc.data()
                        
                        let abb = data[K.FStore.abb] ?? "FL"
                        let stateName = data[K.FStore.name] ?? "Florida"
                        let ev = data[K.FStore.ev]!
                        let bidenSc = data[K.FStore.bidenName]! as! NSNumber
                        let trumpSc = data[K.FStore.trumpName]! as! NSNumber
                        
                        let bidenS: Float = bidenSc.floatValue
                        let trumpS: Float = trumpSc.floatValue
                        
                        let prevW = data[K.FStore.prevwinners] ?? ["Trump", "Obama", "Obama", "Bush"]
                        
                        self.dictionaryOfStates[abb as! String]?.electoralVotes = (ev as? Int)!
                        self.dictionaryOfStates[abb as! String]?.stateName = stateName as? String
                        self.dictionaryOfStates[abb as! String]?.previousWinners = prevW as? [String] ?? ["Trump", "Obama", "Obama", "Bush"]
                        
                        self.dictionaryOfStates[abb as! String]?.bidenScore = Float(bidenS)
                        self.dictionaryOfStates[abb as! String]?.trumpScore = Float(trumpS)
                        
                        if bidenS > trumpS {
                            self.dictionaryOfStates[abb as! String]?.color = "\(abb)Blue"

                        } else {
                             self.dictionaryOfStates[abb as! String]?.color = "\(abb)Red"
                        }
                        
                    }
                    
//                    newStats.totalBiden = newBiden
//                    newStats.totalTrump = newTrump
                }
                
            } //else
        } //db
    }

}
