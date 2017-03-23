//
//  SplitViewControllerAnimatedTransitioning.swift
//  SplitView
//
//  Created by Bob Wakefield on 3/9/17.
//  Copyright © 2017 Bob Wakefield. All rights reserved.
//

import UIKit

class SplitViewControllerAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {

    private let showFromScale: CGFloat = 0.8
    private let hideToScale: CGFloat = 1.2
    private let animationDuration: TimeInterval = 0.33
    
    func animateTransition( using transitionContext: UIViewControllerContextTransitioning ) {
        
        let containerView = transitionContext.containerView
        
        var sourceVC = transitionContext.viewController( forKey: UITransitionContextViewControllerKey.from )
        
        if let sourceNavVC = sourceVC as? UINavigationController {

            sourceVC = sourceNavVC.topViewController!
        }
        
        guard let currentDetailVC = sourceVC else {
            
            fatalError( "transition source view controller missing" )
        }
        
        guard let newDetailNavVC = transitionContext.viewController( forKey: UITransitionContextViewControllerKey.to ) as? UINavigationController else {
            
            fatalError( "transition target view controller missing" )
        }
        
        guard let splitVC = currentDetailVC.navigationController?.splitViewController else {
            
            fatalError( "transition target view controller split view controller is missing" )
        }
        
        let currentAnima = TransitionAnima( currentDetailVC.view, frame: currentDetailVC.view.frame, alpha: CGFloat( 0.0 ) )
        let newAnima = TransitionAnima( newDetailNavVC.view, alpha: CGFloat( 0 ) )
        
        currentAnima.addTo( superView: containerView )
        newAnima.addTo( superView: containerView )
        
        UIView.animate(withDuration: animationDuration / 2.0, animations: { () -> Void in
            // hide the old view with transform
            
            currentAnima.alpha = 0.0
            currentAnima.transform = CGAffineTransform( scaleX: self.hideToScale, y: self.hideToScale )
            
        }, completion: { (completed) -> Void in
            
            newAnima.transform = newDetailNavVC.view.transform.scaledBy( x: self.showFromScale, y: self.showFromScale )
            
            // if there is a navigation controller delegate, push a transition controller onto its stack
            if let ncd = newDetailNavVC.delegate as? NavigationControllerDelegate {
                
                let transition: ZoomTransition? = nil
                //                        self.chooseTransition( navController: newDetailNavVC, sourceVC: sourceVC )
                
                ncd.pushZoomTransition( transition )
            }
            splitVC.showDetailViewController( newDetailNavVC, sender: sourceVC )
            
            // Show new view
            
            UIView.animate( withDuration: self.animationDuration / 2.0, animations: { () -> Void in
                
                newAnima.alpha = 1.0
                newAnima.transform = newAnima.transform.scaledBy( x: 1 / self.showFromScale, y: 1 / self.showFromScale )
                
            }, completion: { (completed) -> Void in
                
                transitionContext.completeTransition( true )
            })
        })
    }
    
    func animationEnded( _ transitionCompleted: Bool ) {
        
    }
    
    func transitionDuration( using transitionContext: UIViewControllerContextTransitioning? ) -> TimeInterval {
        
        return animationDuration
    }
}
