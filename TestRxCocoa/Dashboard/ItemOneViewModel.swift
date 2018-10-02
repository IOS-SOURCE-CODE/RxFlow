//
//  ItemOneViewModel.swift
//  TestRxCocoa
//
//  Created by seyha on 2/10/18.
//  Copyright © 2018 seyha. All rights reserved.
//

import Foundation
import RxFlow

class ItemOneViewModel: Stepper {
    
    init() {
        self.step.accept(ItemOneStep.home)
    }
    
    func push() {
        self.step.accept(ItemOneStep.push)
    }
    
    func present() {
        self.step.accept(ItemOneStep.present)
    }
    
    func dismiss() {
        self.step.accept(ItemOneStep.dismiss)
    }
    
}
