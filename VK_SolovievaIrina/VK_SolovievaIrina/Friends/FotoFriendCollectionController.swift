//
//  FotoFriendCollectionController.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 22.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit

class FotoFriendCollectionController: UICollectionViewController {
    var fotoDelegate: [String] = []
//    let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
//    self.view.addGestureRecognizer(recognizer)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //(_:0, _:0.5)
        self.navigationItem.backBarButtonItem?.title = "Закрыть"
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
     //   let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
      //  self.collectionView.addGestureRecognizer(recognizer)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return fotoDelegate.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FotoCell", for: indexPath) as! FotoCollectionCell
      //  cell.superview?.bringSubviewToFront(cell)
    //    self.tabBarController?.tabBar.isHidden = true
    //   self.navigationController?.isNavigationBarHidden = true

        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: [],
                       animations: {
                        collectionView.backgroundColor = .white
                     //   collectionView.isScrollEnabled = false
        })
        let foto = fotoDelegate[indexPath.row]
        cell.allFoto.image = UIImage(named: foto)
        self.navigationController?.navigationItem.backBarButtonItem?.title = "Закрыть"
        self.navigationItem.title = "\(indexPath.row+1) из \(fotoDelegate.count)"
        reloadInputViews()
        

        return cell
    }
    

    
    var interactiveAnimator: UIViewPropertyAnimator!
    
    @objc func onSwipe(_ recognizer: UIPanGestureRecognizer) {
        guard let selectedIndexPath = self.collectionView.indexPathForItem(at: recognizer.location(in: self.collectionView)) else {
            return
        }
        print(selectedIndexPath.row)
        switch recognizer.state {
        case .began:

               // self.collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
            interactiveAnimator?.startAnimation()
            print("start")
            interactiveAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                         curve: .linear,
                                                         animations: {
                                             //               collectionView.performBatchUpdates(_ updates: let scale = CATransform3DScale(CATransform3DIdentity, 0.7, 0.7, 0),
                                             //                                                  completion: self.collectionView.cellForItem(at: selectedIndexPath)!.transform = CATransform3DGetAffineTransform(scale))
                                                           // self.collectionView.layer.anchorPoint = CGPoint(x: 1.0, y: 1.0)
                                                         let scale = CATransform3DScale(CATransform3DIdentity, 0.7, 0.7, 0)
                                                         self.collectionView.cellForItem(at: selectedIndexPath)!.transform = CATransform3DGetAffineTransform(scale)
            })
            
            interactiveAnimator.pauseAnimation()
        case .changed:
            print("change")
//            let translation = CABasicAnimation(keyPath: "center.x")
//            translation.toValue = 100

            let translation = recognizer.translation(in: self.collectionView)
            interactiveAnimator.fractionComplete = translation.y/100
            print(translation)
         //   self.collectionView.updateInteractiveMovementTargetPosition(recognizer.location(in: recognizer.view!))
        case .ended:
            print("end")
       //     self.collectionView.endInteractiveMovement()
            interactiveAnimator.stopAnimation(true)
            
            interactiveAnimator.addAnimations {
                self.collectionView.transform = .identity
            }
            self.collectionView.reloadData()
            self.collectionView.reloadData()
            
        default: return //self.collectionView.cancelInteractiveMovement()
        }
    }
    
//    override func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
//
//    }
    
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
        
}
