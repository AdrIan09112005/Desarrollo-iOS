//
//  SkillsViewController.swift
//  CV
//
//  Created by Alumno on 11/3/26.
//
import UIKit

class SkillsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Aparecera la vista (viewWillAppear")
    }
    
    // Override -> Sobrescribe objetos
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Apareció la vista (viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Aparecera la vista (viewWillAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Aparecera la vista (viewWillAppear")
    }
}
