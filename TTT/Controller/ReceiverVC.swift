//
//  ReceiverVC.swift
//  TTT
//
//  Created by cate on 1/22/19.
//  Copyright © 2019 Sean Zhan. All rights reserved.
//

import UIKit

class ReceiverVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var dimensionEntered: UITextField!
    
    var dimen = 0
    @IBAction func playPressed(_ sender: UIButton) {
        dimen = Int(dimensionEntered.text ?? "") ?? 3
        print(dimen)
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
