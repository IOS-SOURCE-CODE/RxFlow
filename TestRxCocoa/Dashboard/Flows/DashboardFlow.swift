//
//  DashboardFlow.swift
//  TestRxCocoa
//
//  Created by seyha on 2/10/18.
//  Copyright © 2018 seyha. All rights reserved.
//

import UIKit
import RxFlow

class DashboardFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }
    
    let rootViewController = UITabBarController()
    let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? DashboardStep else { return NextFlowItems.none }
        switch step {
        case  .home:
            
            return navigationToDashBoard()
        }
    }
    
    private func navigationToDashBoard() -> NextFlowItems {
        
        let tabBarItem1 = UITabBarItem(title: "Wishlist", image: UIImage(named: "wishlist"), selectedImage: nil)
        
        let tabBarItem2 = UITabBarItem(title: "Watched", image: UIImage(named: "watched"), selectedImage: nil)
        
        let itemOneFlow = ItemOneFlow()
        let itemTwoFlow = ItemTwoFlow()
       
        let itemOneViewModel = ItemOneViewModel()
        let itemTwoViewModel = ItemTwoViewModel()
        
        Flows.whenReady(flow1: itemOneFlow, flow2: itemTwoFlow) { [unowned self] (root1, root2) in
            
            root1.tabBarItem = tabBarItem1
            root2.tabBarItem = tabBarItem2
            
            
            self.rootViewController.setViewControllers([root1, root2], animated: true)
        }
        
        
        return .multiple(flowItems: [NextFlowItem(nextPresentable: itemOneFlow, nextStepper: itemOneViewModel), NextFlowItem(nextPresentable: itemTwoFlow, nextStepper: itemTwoViewModel)])
    }
    
}

