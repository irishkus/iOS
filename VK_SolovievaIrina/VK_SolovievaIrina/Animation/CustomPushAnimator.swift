//
//  CustomPushAnimator.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 30.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        transitionContext.containerView.addSubview(destination.view)
        print(source.view.frame)
        destination.view.frame = source.view.frame
        let translationFirst = CGAffineTransform(translationX: source.view.frame.width/2, y: 3*source.view.frame.width/2)
        let rotationFirst = CGAffineTransform(rotationAngle: -.pi/2)
        destination.view.transform = translationFirst.concatenating(rotationFirst)
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                        let translation = CGAffineTransform(translationX: -200, y: 0)
                                                        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                                                        source.view.transform = translation.concatenating(scale)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.4,
                                                       relativeDuration: 0.2,
                                                       animations: {
                                                        destination.view.transform = CGAffineTransform(rotationAngle: 0)
//                                                        print(destination.view.frame.minX)
//                                                        print(destination.view.frame.maxX)
//                                                        print(destination.view.frame.minY)
//                                                        print(destination.view.frame.maxY)
//                                                        print(destination.view.frame)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.6,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                       destination.view.transform = .identity
                                    })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}
