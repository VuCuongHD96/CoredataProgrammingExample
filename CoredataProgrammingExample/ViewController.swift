//
//  ViewController.swift
//  MagicalRecordExample
//
//  Created by Sun on 06/08/2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let coredata = CoredataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coredata.save()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        coredata.fetch()
    }
}
