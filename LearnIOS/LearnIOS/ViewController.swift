//
//  ViewController.swift
//  LearnIOS
//
//  Created by hieuhd on 9/26/19.
//  Copyright © 2019 hieuhd. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Tham chiếu cell được thiết kế tại Prototype Cells
        let cell = self.tv.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! CustomTableViewCell
        // Hiển thị dữ liệu
        cell.label1.text = self.names[indexPath.row]
        cell.label2.text = String.init(self.ages[indexPath.row])
        return cell;
    }
 
    var names = ["Xuan", "Ha", "Thu", "Dong"]
    var ages = [19, 20, 21, 22]
    
    @IBOutlet weak var tvHelloword: UILabel!
    
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var edInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideKeyboardWhenTappedAround()
             tv.delegate = self
    }

    @IBAction func toast(_ sender: Any) {
         showToast(message: "HieuHD")
    }
    @IBAction func clickAlert(_ sender: Any) {
        showAlert()
    }
    @IBAction func setString(_ sender: Any) {
        let value: String = edInput.text!
        let number : Int = Int(value)!
        if(number % 2 == 0){
            tvHelloword.text = "So chan"
        }else{
            tvHelloword.text = "So Le"
        }
        
        self.names.append("Hieu")
        self.ages.append( 1)
        
        tv.reloadData()
    print(value)
    }
 
    func showToast(message : String) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
        
    }
   func hideKeyboardWhenTappedAround() {
       let tapGesture = UITapGestureRecognizer(target: self,
                        action: #selector(hideKeyboard))
       view.addGestureRecognizer(tapGesture)
   }

   @objc func hideKeyboard() {
       view.endEditing(true)
   }
    func showAlert(){
        // create the alert
               let alert = UIAlertController(title: "Warning", message: "Xin Chào Các Bạn Mình Là HieuHD Android Developer!! Rất Vui Khi Được Làm Quen Với Các Bạn.", preferredStyle: UIAlertController.Style.alert)

               // add an action (button)
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

               // show the alert
               self.present(alert, animated: true, completion: nil)
    }
}

