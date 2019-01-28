//
//  FotoCollectionCell.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 24.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit

class FotoCollectionCell: UICollectionViewCell {
    @IBOutlet weak var allFoto: UIImageView!
    
 //   let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
   // allFoto.addGestureRecognizer(recognizer)
    
    var interactiveAnimator: UIViewPropertyAnimator!

//    override func dragStateDidChange(_ dragState: UICollectionViewCell.DragState) {
////           let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
////           allFoto.addGestureRecognizer(recognizer)
//
//        UIView.animate(withDuration: 0.2, delay: 0, options: [.repeat, .autoreverse], animations: {
//            self.allFoto.frame.size.height -= 100
//            self.allFoto.frame.size.width -= 100
//
//        })
//    }
    
//    @objc func onSwipe(_ recognizer: UIPanGestureRecognizer) {
////        guard let selectedIndexPath = self.contentView(at: recognizer.location(in: self.collectionView)) else {
////            return
////        }
//     //   print(selectedIndexPath.row)
//        switch recognizer.state {
//        case .began:
//
//            // self.collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
//            interactiveAnimator?.startAnimation()
//            print("start")
//            interactiveAnimator = UIViewPropertyAnimator(duration: 0.5,
//                                                         curve: .linear,
//                                                         animations: {
//                                                            // self.collectionView.layer.anchorPoint = CGPoint(x: 1.0, y: 1.0)
//                                                            let scale = CATransform3DScale(CATransform3DIdentity, 0.7, 0.7, 0)
//                                                            self.allFoto.transform = CATransform3DGetAffineTransform(scale)
//            })
//
//            interactiveAnimator.pauseAnimation()
//        case .changed:
//            print("change")
//            //            let translation = CABasicAnimation(keyPath: "center.x")
//            //            translation.toValue = 100
//
//            let translation = recognizer.translation(in: self.allFoto)
//            interactiveAnimator.fractionComplete = translation.y/100
//            print(translation)
//           // self.collectionView.updateInteractiveMovementTargetPosition(recognizer.location(in: recognizer.view!))
//        case .ended:
//            print("end")
//            //     self.collectionView.endInteractiveMovement()
//            interactiveAnimator.stopAnimation(true)
//
//            interactiveAnimator.addAnimations {
//                self.allFoto.transform = .identity
//            }
//
//        default: return //self.collectionView.cancelInteractiveMovement()
//        }
//    }
//
//        @objc func tap(gesture: UITapGestureRecognizer) {
//        print("1")
//        if gesture.state == .began {
//            animateAuthButton()
//        }
//    }
//    
//    func animateAuthButton() {
//        print("2")
//    let animation = CASpringAnimation(keyPath: "transform.scale")
//    animation.fromValue = 0
//    animation.toValue = 1
//    animation.stiffness = 200
//    animation.mass = 2
//    animation.duration = 2
//    animation.beginTime = CACurrentMediaTime() + 1
//    
//    self.allFoto.layer.add(animation, forKey: nil)
//    }

}
