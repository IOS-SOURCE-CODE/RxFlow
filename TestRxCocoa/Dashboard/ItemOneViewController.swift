//
//  ItemOneViewController.swift
//  TestRxCocoa
//
//  Created by seyha on 2/10/18.
//  Copyright © 2018 seyha. All rights reserved.
//

import UIKit

class ItemOneViewController: UIViewController {

    var viewModel: ItemOneViewModel!

    @IBAction func pushToAnotherVC(_ sender: Any) {
        viewModel.push()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
