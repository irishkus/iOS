//
//  CustomInteractiveTransition.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 31.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {

    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(target: self,
                                                              action: #selector(handleScreenEdgeGesture(_:)))
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }
    
    var hasStarted: Bool = false
    var shouldFinish: Bool = false
    
    @objc func handleScreenEdgeGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            self.hasStarted = true
            self.viewController?.navigationController?.popViewController(animated: true)
            print("handleScreenEdgeGesture  1 \(#function)")
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = translation.x / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTranslation))
            
            self.shouldFinish = progress > 0.33
            
            self.update(progress)
            print("handleScreenEdgeGesture  2 \(#function)")
        case .ended:
            self.hasStarted = false
            self.shouldFinish ? self.finish() : self.cancel()
            print("handleScreenEdgeGesture  3 \(#function)")
        case .cancelled:
            self.hasStarted = false
            self.cancel()
            print("handleScreenEdgeGesture  4 \(#function)")
        default: return
        }
    }
    
}
