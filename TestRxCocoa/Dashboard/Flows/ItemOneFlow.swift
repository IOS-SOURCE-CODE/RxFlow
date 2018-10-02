//
//  ItemOneFlow.swift
//  TestRxCocoa
//
//  Created by seyha on 2/10/18.
//  Copyright © 2018 seyha. All rights reserved.
//

import UIKit
import RxFlow

class ItemOneFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }
    
    let rootViewController = UINavigationController()
    let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
    let viewModel = ItemOneViewModel()
    
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? ItemOneStep else { return NextFlowItems.none }
        switch step {
            
        case .home:
            return navigationToHome()
        case .present:
            return navigationToPresent()
        case .push:
           return  navigationToPush()
            
        case .dismiss:
            return dismiss()
            
        }
    }
    
    private func navigationToHome() -> NextFlowItems {
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemOneViewController") as! ItemOneViewController
        viewController.viewModel = viewModel
        viewController.navigationItem.title = "ItemOneViewController"
        self.rootViewController.pushViewController(viewController, animated: true)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewModel))
    }
    
    private func navigationToPush() -> NextFlowItems {
       
        let viewController = storyboard.instantiateViewController(withIdentifier: "DPushViewController") as! DPushViewController
        viewController.viewModel = viewModel
        self.rootViewController.pushViewController(viewController, animated: true)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewModel))
    }
    
    private func navigationToPresent() -> NextFlowItems {
        let viewController = storyboard.instantiateViewController(withIdentifier: "DPresentViewController") as! DPresentViewController
        viewController.viewModel = viewModel
        self.rootViewController.present(viewController, animated: true, completion: nil)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewModel))
    }
    
    private func dismiss() -> NextFlowItems {
        self.rootViewController.presentedViewController?.dismiss(animated: true, completion: nil)
        return NextFlowItems.none
    }
}
