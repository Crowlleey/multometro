//
//  LoadingView.swift
//  Mulltometro
//
//  Created by George Gomes on 16/11/18.
//  Copyright © 2018 CrowCode. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    @IBOutlet weak var backGroundView: UIView! {
        didSet {
            backGroundView.roundedCornerColor(radius: 8)
        }
    }
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    func start() {
        loadingIndicator.startAnimating()
    }
}

extension UIViewController {
    /**
     ShowLoader:  loading view ..
     
     - parameter Color:  ActivityIndicator and view loading color .
     
     */
    func showLoader(_ color:UIColor?){
        let allViewsInXibArray = Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)
        let loadingView = allViewsInXibArray!.first as! LoadingView
        loadingView.tag = -888754
        loadingView.frame = self.view.bounds
        self.view.addSubview(loadingView)
    }

    func dismissLoader(){
        if let view = view.viewWithTag(-888754) {
            view.removeFromSuperview()
        }
    }
}
