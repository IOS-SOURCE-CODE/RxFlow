//
//  ItemTwoFlow.swift
//  TestRxCocoa
//
//  Created by seyha on 2/10/18.
//  Copyright © 2018 seyha. All rights reserved.
//

import Foundation
import RxFlow

class ItemTwoFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }
    
    let rootViewController = UINavigationController()
    let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
    let viewModel = ItemTwoViewModel()
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? ItemTwoStep else { return NextFlowItems.none }
        switch step {
        case .home:
            return navigationToPush()
        }
    }
    
    private func navigationToPush() -> NextFlowItems {
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemTwoViewController") as! ItemTwoViewController
        viewController.viewModel = viewModel
        viewController.navigationItem.title = "ItemTwoViewController"
        self.rootViewController.pushViewController(viewController, animated: true)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewModel))
    }
    
   
}
