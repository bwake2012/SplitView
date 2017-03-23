//
//  ViewControllerTransitioningDelegate.swift
//  SplitView
//
//  Created by Bob Wakefield on 3/9/17.
//  Copyright © 2017 Bob Wakefield. All rights reserved.
//

import UIKit

class ViewControllerTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return nil
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return nil
    }
}
