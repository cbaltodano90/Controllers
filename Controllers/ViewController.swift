//
//  ViewController.swift
//  Controllers
//
//  Created by cesar on 2/8/21.
//

import UIKit

class ViewController: UIViewController {
    // Outlet
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Button
        myButton.setTitle("Borrar texto", for: .normal)
        
        // TextField
        myTextField.placeholder = "Texto a insertar"
        myTextField.delegate = self
        
        // TextView
        myTextView.text = ""
        myTextView.isEditable = false
        
        // ActivityIndicator
        myActivityIndicator.color = .red
        myActivityIndicator.hidesWhenStopped = true

        
        
    }
    
    // Actions
    @IBAction func myButtonAction(_ sender: Any) {
        myTextView.text = ""
    }
}



extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myActivityIndicator.stopAnimating()
        myTextView.text.append(" " + myTextField.text!)
        myTextField.text = ""
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        myActivityIndicator.startAnimating()
        return true
    }
    
}
