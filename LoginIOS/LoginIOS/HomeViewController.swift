//
//  HomeViewController.swift
//  LoginIOS
//
//  Created by hieuhd on 9/27/19.
//  Copyright © 2019 hieuhd. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tvWellcom: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        tvWellcom.text = "Xin chào " + vc.username
    }

}
