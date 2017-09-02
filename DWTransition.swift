//
//  DWTransition.swift
//  XProject
//
//  Created by Di Wang on 2017/8/23.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit

class DWTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! DWViewController
        let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! IntroViewController
        let snapshot = fromView.selectedCell.snapshotView(afterScreenUpdates: false)
        snapshot?.frame = container.convert(fromView.selectedCell.frame, from: fromView.selectedCell)
        
        toView.view.alpha = 0
        
        container.addSubview(snapshot!)
        container.addSubview(toView.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: { 
            
        }) { (finish: Bool) in
            
        }
    }
}
