//
//  CustomPresentationController.swift
//  BigClock
//
//  Created by naoyashiga on 2014/12/15.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit

class CustomPresentationController: UIPresentationController {
    //呼び出し元のvcに重ねるオーバレイview
    var overlay: UIView!
    
    //表示トランジション前に呼ばれる
    override func presentationTransitionWillBegin() {
        let containView = self.containerView
        let presented = self.presentedViewController
        
        self.overlay = UIView(frame: containerView.bounds)
        self.overlay.gestureRecognizers = [UITapGestureRecognizer(target: self, action: "overlayDidTouch:")]
        self.overlay.alpha = 0.0
        self.overlay.backgroundColor = UIColor.hexStr("60DFE5", alpha: 1)
        containerView.insertSubview(self.overlay, atIndex: 0)
        
        //トランジションを実行
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({
            [unowned self] context in
            self.overlay.alpha = 0.5
        }, completion: nil)
        
    }
    
    
    //非表示トランジション前に呼ばれる
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator()?.animateAlongsideTransition({
            [unowned self] context in
            self.overlay.alpha = 0.0
            }, completion: nil)
    }
   
    //非表示トランジション開始後に呼ばれる
    override func dismissalTransitionDidEnd(completed: Bool) {
        if completed {
            self.overlay.removeFromSuperview()
        }
    }
    
    //子のコンテナのサイズを返す
    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width, height: parentSize.height / 2)
    }
    
    //呼び出し先のVCのFrameを返す
    override func frameOfPresentedViewInContainerView() -> CGRect {
        var presentedViewFrame = CGRectZero
        let containerBounds = self.containerView.bounds
        presentedViewFrame.size = self.sizeForChildContentContainer(self.presentedViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.origin.x = containerBounds.size.width - presentedViewFrame.size.width
        presentedViewFrame.origin.y = containerBounds.size.height - presentedViewFrame.size.height
        
        return presentedViewFrame
    }
    
    //レイアウト開始前に呼ばれる
    override func containerViewWillLayoutSubviews() {
        overlay.frame = self.containerView.bounds
        self.presentedView().frame = self.frameOfPresentedViewInContainerView()
    }
    
    //レイアウト開始後に呼ばれる
    override func containerViewDidLayoutSubviews() {
        
    }
    
    //オーバレイをタッチしたときに呼ばれる
    @IBAction func overlayDidTouch(sender: AnyObject){
        self.presentedViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
