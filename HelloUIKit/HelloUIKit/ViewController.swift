//
//  ViewController.swift
//  HelloUIKit
//
//  Created by Alumno on 4/2/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var messageButton: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Controller Code")
        
        name.text = "Alan Adrian Estrada Alfaro"
    }

    @IBAction func modifyMessageButton(_ sender: UIButton) {
        print("Button tapped")
        
        messageButton.text = """
            - iOS Mobile App
            - Advaced Computer Java
            - BigData
            """
    }
}

