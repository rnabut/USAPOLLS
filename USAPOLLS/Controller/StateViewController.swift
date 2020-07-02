//
//  StateViewController.swift
//  USAPOLLS
//
//  Created by Reidel Nabut on 6/25/20.
//  Copyright © 2020 USAPOLLS.NEWS. All rights reserved.
//

import UIKit

class StateViewController: UIViewController {
    var bidenScore = Float(0.0)
    var trumpScore = Float(0.0)
    var winners = ["Trump", "Obama", "Obama", "Bush"]
    var stateAbb = "FL"
    
    let entriesNumber = ["AZ": 0, "FL": 1, "GA": 2, "IA": 3, "MI": 4,"NC": 5, "NH": 6, "NV": 7, "OH": 8, "PA": 9, "TX": 10, "WI": 11]
    let listStates = ["AZ", "FL", "GA", "IA", "MI","NC", "NH", "NV", "OH", "PA", "TX", "WI"]
    
    @IBOutlet weak var currentMargin: UILabel!
    @IBOutlet weak var stateName: UILabel!
    @IBOutlet weak var bidenPercent: UILabel!
    @IBOutlet weak var trumpPercent: UILabel!
    @IBOutlet weak var electoralVotesLabel: UILabel!
    
    @IBOutlet weak var stateImage: UIImageView!
    
    @IBOutlet weak var barStats: UIProgressView!
    
    @IBOutlet weak var winner2016: UIImageView!
    @IBOutlet weak var winner2012: UIImageView!
    @IBOutlet weak var winner2008: UIImageView!
    @IBOutlet weak var winner2004: UIImageView!
    
    @IBOutlet weak var whiteStats: UILabel!
    @IBOutlet weak var africanAmericansStats: UILabel!
    @IBOutlet weak var hispanicStats: UILabel!
    @IBOutlet weak var nativeAmericansStats: UILabel!
    @IBOutlet weak var asiansStats: UILabel!
    @IBOutlet weak var populationStats: UILabel!
    
    
    var collection: States = States()
    var currentEntrie = 0
    
    
    override func viewDidLoad() {
        //loadMessages()
        
        super.viewDidLoad()
        let state: Entry = collection.dictionaryOfStates[stateAbb]!
        
        currentEntrie = entriesNumber[state.abb]!
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let formattedNumber = numberFormatter.string(from: NSNumber(value:state.population))
        
        // DISPLAY STATS
        populationStats.text = "Population: \(formattedNumber ?? "0,000,000")"
        whiteStats.text = "\(state.demography[0])"
        africanAmericansStats.text = "\(state.demography[1])"
        hispanicStats.text = "\(state.demography[2])"
        nativeAmericansStats.text = "\(state.demography[3])"
        asiansStats.text = "\(state.demography[4])"
        
        
        stateName.text = state.stateName!
        electoralVotesLabel.text = "\(state.electoralVotes) Votes"
        if state.bidenScore > state.trumpScore {
            currentMargin.text = String(format: "Biden +%0.2f", state.bidenScore - state.trumpScore)
            currentMargin.textColor = UIColor.blue
        } else {
            currentMargin.text = String(format: "Trump +%0.2f",  state.trumpScore - state.bidenScore)
            currentMargin.textColor = UIColor.red
        }
        

        //print(state.stateName!)
        //print(bidenScore)
        //print(trumpScore)
        
        
        bidenPercent.text = String(state.bidenScore)
        trumpPercent.text = String(state.trumpScore)
        barStats.progress = Float(state.bidenScore)/Float(state.bidenScore+state.trumpScore)
        
        if state.bidenScore > state.trumpScore {
            stateImage.image = UIImage(named: "\(state.abb)Blue")
        } else {
            stateImage.image = UIImage(named: "\(state.abb)Red")
        }
        
        winner2016.image = UIImage(named: state.previousWinners[0])
        winner2012.image = UIImage(named: state.previousWinners[1])
        winner2008.image = UIImage(named: state.previousWinners[2])
        winner2004.image = UIImage(named: state.previousWinners[3])
        
    }
    
    @IBAction func goBackPressed(_ sender: UIButton) {
         self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func nextStatePressed(_ sender: UIButton) {
        //print(collection.dictionaryOfStates["FL"]?.bidenScore ?? 0.0)
        if currentEntrie == 11{
            currentEntrie = 0
        } else {
            currentEntrie += 1
        }
        
        stateAbb = listStates[currentEntrie]
        viewDidLoad()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
