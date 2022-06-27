//
//  ViewController.swift
//  iteMe
//
//  Created by user216739 on 6/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }


    func setUpElements() {
        Utilities.styleFilledButton(signUpBtn)
        Utilities.styleFilledButton(loginBtn)
        
    }
    
}

