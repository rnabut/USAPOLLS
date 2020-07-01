//
//  HomeViewController.swift
//  USAPOLLS
//
//  Created by Reidel Nabut on 6/29/20.
//  Copyright © 2020 USAPOLLS.NEWS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var collection: States = States()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.update()
        // Do any additional setup after loading the view.
    }

    @IBAction func PresidentialPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.FStore.homeSeque, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.FStore.homeSeque {
            
            let destination = segue.destination as! ViewController
            
            destination.collect = self.collection
            
            //assign variables
        }
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
