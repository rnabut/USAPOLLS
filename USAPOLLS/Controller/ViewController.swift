//
//  ViewController.swift
//  USAPOLLS
//
//  Created by Reidel Nabut on 6/25/20.
//  Copyright © 2020 USAPOLLS.NEWS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let listStates = ["AZ", "FL", "GA", "IA", "MI","NC", "NH", "NV", "OH", "PA", "TX", "WI"]
    var stateA = "FL"
    var collect = States()
    
    @IBOutlet weak var bidenElectoralVotes: UILabel!
    @IBOutlet weak var trumpElectoralVotes: UILabel!
    
    @IBOutlet weak var AZButton: UIButton!
    @IBOutlet weak var FLButton: UIButton!
    @IBOutlet weak var GAButton: UIButton!
    @IBOutlet weak var IAButton: UIButton!
    @IBOutlet weak var MIButton: UIButton!
    @IBOutlet weak var NCButton: UIButton!
    @IBOutlet weak var NHButton: UIButton!
    @IBOutlet weak var NVButton: UIButton!
    @IBOutlet weak var OHButton: UIButton!
    @IBOutlet weak var PAButton: UIButton!
    @IBOutlet weak var TXButton: UIButton!
    @IBOutlet weak var WIButton: UIButton!
    
    
    @IBOutlet weak var electoralVotesBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeColor()
        
        var newBiden: Int = 0
        var newTrump: Int = 0
        
        for s in listStates {
            if Float(collect.dictionaryOfStates[s]!.bidenScore) > Float(collect.dictionaryOfStates[s]!.trumpScore)  {
                newBiden += (collect.dictionaryOfStates[s]?.electoralVotes)!

        } else {
            newTrump += (collect.dictionaryOfStates[s]?.electoralVotes)!
        }
        
        }
        
        collect.bidenVotes = K.FStore.bidenDefault + newBiden
        collect.trumpVotes = K.FStore.trumpDefault + newTrump
        
        electoralVotesBar.progress = Float(Double(collect.bidenVotes)/Double(538))
        bidenElectoralVotes.text = String(collect.bidenVotes)
        trumpElectoralVotes.text = String(collect.trumpVotes)
    }
    
    @IBAction func statePressed(_ sender: UIButton) {
        stateA = sender.currentTitle ?? "FL"
        
        self.performSegue(withIdentifier: "goToState", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToState"{
            
            let destination = segue.destination as! StateViewController
            
            destination.stateAbb = self.stateA
            
            destination.bidenScore = Float(38.3)
            destination.trumpScore = Float(39.7)
            destination.collection = self.collect
            
            //assign variables
        }
    }
    
    // CHANGE COLOR OF BUTTON

    func changeColor() {

            AZButton.setBackgroundImage(UIImage(named: collect.dictionaryOfStates["AZ"]!.color), for: .normal)
            FLButton.setBackgroundImage(UIImage(named: collect.dictionaryOfStates["FL"]!.color), for: .normal)
            GAButton.setBackgroundImage(UIImage(named: collect.dictionaryOfStates["GA"]!.color), for: .normal)
            IAButton.setBackgroundImage(UIImage(named: collect.dictionaryOfStates["IA"]!.color), for: .normal)
            MIButton.setBackgroundImage(UIImage(named: collect.dictionaryOfStates["MI"]!.color), for: .normal)
            NCButton.setBackgroundImage(UIImage(named: collect.dictionaryOfStates["NC"]!.color), for: .normal)
            NHButton.setBackgroundImage(UIImage(named: collect.dictionaryOfStates["NH"]!.color), for: .normal)
            NVButton.setBackgroundImage(UIImage(named: collect.dictionaryOfStates["NV"]!.color), for: .normal)
            OHButton.setBackgroundImage(UIImage(named: collect.dictionaryOfStates["OH"]!.color), for: .normal)
            PAButton.setBackgroundImage(UIImage(named: collect.dictionaryOfStates["PA"]!.color), for: .normal)
            TXButton.setBackgroundImage(UIImage(named: collect.dictionaryOfStates["TX"]!.color), for: .normal)
            WIButton.setBackgroundImage(UIImage(named: collect.dictionaryOfStates["WI"]!.color), for: .normal)
            
    }
    
    // END CHANGE COLOR
}
