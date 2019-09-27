//
//  ViewController.swift
//  LoginIOS
//
//  Created by hieuhd on 9/27/19.
//  Copyright © 2019 hieuhd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvError: UILabel!
    @IBOutlet weak var edPassword: UITextField!
    @IBOutlet weak var edUserName: UITextField!
    
    var username: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func login(_ sender: Any) {
        username = edUserName.text
        let passwrod = edPassword.text
        if username == "admin" && passwrod == "admin"{
            let src = storyboard?.instantiateViewController(withIdentifier: "HomeScreen") as! HomeViewController
            present(src, animated: false, completion: nil)
               }else{
                   tvError.text = "User Or Password invalid"
               }
    }
}

