//
//  TransitionAnima.swift
//  SplitView
//
//  Created by Bob Wakefield on 3/11/17.
//  Copyright © 2017 Bob Wakefield. All rights reserved.
//

import UIKit

class TransitionAnima: NSObject {
    
    fileprivate let view: UIImageView
    fileprivate let fadeView: UIView
    
    var frame: CGRect {
        
        get { return self.view.frame }
        
        set {
            
            self.view.frame = newValue
            self.fadeView.frame = newValue
        }
    }
    
    var alpha: CGFloat {
        
        get { return self.fadeView.alpha }
        
        set { self.fadeView.alpha = newValue }
    }
    
    var transform: CGAffineTransform {
        
        get { return self.view.transform }
        
        set {
            
            self.view.transform = newValue
            self.fadeView.transform = newValue
        }
    }
    
    func addTo( superView: UIView ) -> Void {
        
        superView.addSubview( self.view )
        superView.addSubview( self.fadeView )
    }
    
    func removeFromSuperview() -> Void {
        
        self.view.removeFromSuperview()
        self.fadeView.removeFromSuperview()
    }
    
    init(
            _ sourceView: UIView,
            frame: CGRect,
            alpha: CGFloat = 1.0,
            transform: CGAffineTransform = CGAffineTransform.identity
        ) {
        
        self.view = UIImageView( image: sourceView.dt_takeSnapshot() )
        
        self.fadeView =  UIView.init( frame: frame )
        self.fadeView.backgroundColor = sourceView.backgroundColor
        self.fadeView.alpha = alpha

        if transform.isIdentity {
            self.view.frame = frame
            self.fadeView.frame = frame
        } else {
            self.view.transform = transform
            self.fadeView.transform = transform
        }
    }
    
    convenience init( _ sourceView: UIView ) {
        
        self.init( sourceView, frame: sourceView.frame, alpha: 1.0 )
    }

    convenience init( _ sourceView: UIView, alpha: CGFloat ) {
        
        self.init( sourceView, frame: sourceView.frame, alpha: alpha )
    }
    
    convenience init( _ sourceView: UIView, frame: CGRect, alpha: CGFloat ) {
        
        self.init( sourceView, frame: frame, alpha: alpha )
    }
    
    convenience init( _ sourceView: UIView, alpha: CGFloat, transform: CGAffineTransform ) {
        
        self.init( sourceView, frame: CGRect.zero, alpha: alpha, transform: transform )
    }
}
