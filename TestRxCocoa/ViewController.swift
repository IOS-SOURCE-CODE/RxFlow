//
//  ViewController.swift
//  TestRxCocoa
//
//  Created by seyha on 2/10/18.
//  Copyright © 2018 seyha. All rights reserved.
//

import UIKit
import RxFlow


class ViewController: UIViewController {

    @IBAction func clickMovieList(_ sender: UIButton) {
        self.viewModel.goToMovieList()
    }
    
    @IBOutlet weak var goMovieList: UIButton!
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }


}

