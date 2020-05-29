//
//  ViewController.swift
//  ios-movstone
//
//  Created by JeongSik Kim on 03/01/2019.
//  Copyright © 2019 Hecas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var startNicknameText: UITextField! { didSet { startNicknameText.delegate = self }}
    
    @IBOutlet weak var beginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

        self.view.endEditing(true)

    }
    
    func textFieldShouldReturn(_ startNicknameText: UITextField) -> Bool {

        startNicknameText.resignFirstResponder()

        return true

    }
    
    @IBAction func sendText(_ sender: UIButton) {
        performSegue(withIdentifier: "showSecondView", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showSecondView"{
            
            let secondVC = segue.destination as! SetEmotionActivity
            
            secondVC.data = startNicknameText.text!
            
        }
    
    }
    
    
}
