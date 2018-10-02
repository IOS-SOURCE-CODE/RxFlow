//
//  MovieListViewController.swift
//  TestRxCocoa
//
//  Created by seyha on 2/10/18.
//  Copyright © 2018 seyha. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    
    @IBAction func presentAnotherViewController(_ sender: Any) {
        self.viewModel.present()
    }
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  

}
