//
//  ViewControllerFadeTransition.swift
//  ZKSignup
//
//  Created by Zeeshan Khan on 2/19/17.
//  Copyright © 2017 Zeeshan Khan. All rights reserved.
//

import UIKit

class ViewControllerFadeTransition: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    var reverse = false

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        reverse = true
        return self
    }

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if reverse == false {
            animationForPresenting(transitionContext)
        } else {
            animationForDismissal(transitionContext)
        }
    }

    func animationForPresenting(_ transitionContext: UIViewControllerContextTransitioning) {

        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = transitionContext.containerView
        let duration = self.transitionDuration(using: transitionContext)

        toVC?.view.alpha = 0.0
        containerView.addSubview((toVC?.view)!)

        UIView.animate(withDuration: duration, animations: {
            toVC?.view.alpha = 1
//            toVC?.view.backgroundColor = UIColor.green //(white:1, alpha:0.3)

        }) { (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }

    func animationForDismissal(_ transitionContext: UIViewControllerContextTransitioning) {

        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = transitionContext.containerView
        let duration = self.transitionDuration(using: transitionContext)

        containerView.insertSubview((toVC?.view)!, belowSubview: (fromVC?.view)!)
        toVC?.view.alpha = 1

        UIView.animate(withDuration: duration, animations: {
            fromVC?.view.alpha = 0
//            toVC?.view.backgroundColor = UIColor(white:1, alpha:0.3)
        }) { (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }

}
