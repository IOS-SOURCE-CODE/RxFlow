//
//  ViewModel.swift
//  TestRxCocoa
//
//  Created by seyha on 2/10/18.
//  Copyright © 2018 seyha. All rights reserved.
//

import UIKit
import RxFlow

class ViewModel {
    
    
}


extension ViewModel: Stepper {
    
    func goToMovieList() {
        self.step.accept(MyStep.movieList)
    }
    
    func present() {
        self.step.accept(MyStep.present)
    }
    
    func dismiss() {
        self.step.accept(MyStep.dismiss)
    }
}
