//
//  ItemTwoViewModel.swift
//  TestRxCocoa
//
//  Created by seyha on 2/10/18.
//  Copyright © 2018 seyha. All rights reserved.
//

import Foundation
import RxFlow

class ItemTwoViewModel: Stepper {
    
    init() {
        self.step.accept(ItemTwoStep.home)
    }
}

