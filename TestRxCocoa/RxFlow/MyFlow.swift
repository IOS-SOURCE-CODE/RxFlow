//
//  MyFlow.swift
//  TestRxCocoa
//
//  Created by seyha on 2/10/18.
//  Copyright © 2018 seyha. All rights reserved.
//

import UIKit
import RxFlow

class MyFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }
    
    private let rootViewController = UINavigationController()
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func navigate(to step: Step) -> NextFlowItems {
        
        guard let step = step as? MyStep else { return NextFlowItems.none}
        
        switch step {
            
        case .home:
            return navigationViewController()
            
        case .movieList:
            return navigationToMovieList()
            
        case .present:
            return navigationToPresent()
            
        case .dismiss:
           return dismiss()
        }
    }
    
    private func navigationViewController() -> NextFlowItems {
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let viewModel = ViewModel()
        viewController.viewModel = viewModel
        self.rootViewController.pushViewController(viewController, animated: true)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewModel))
    }
    
    private func navigationToMovieList() -> NextFlowItems {
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        
        let viewModel = ViewModel()
        viewController.viewModel = viewModel
        self.rootViewController.pushViewController(viewController, animated: true)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewModel))
    }
    
    private func navigationToPresent() -> NextFlowItems {
        let viewController = storyboard.instantiateViewController(withIdentifier: "PresentViewController") as! PresentViewController
        let viewModel = ViewModel()
        viewController.viewModel  = viewModel
        self.rootViewController.present(viewController, animated: true, completion: nil)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewModel))
    }
    
    private func dismiss() -> NextFlowItems {
        self.rootViewController.presentedViewController?.dismiss(animated: true, completion: nil)
        return NextFlowItems.none
    }
    
}
