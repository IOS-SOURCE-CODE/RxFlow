//
//  PresentViewController.swift
//  TestRxCocoa
//
//  Created by seyha on 2/10/18.
//  Copyright © 2018 seyha. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {
    
    var viewModel: ViewModel!

    @IBAction func dismiss(_ sender: Any) {
      self.viewModel.dismiss()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

   

}
