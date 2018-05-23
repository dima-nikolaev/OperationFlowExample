//
//  TestViewController.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import UIKit
import OperationFlow

class TestViewController: UIViewController, TestModelDelegate {
    
    private let model: TestModel
    
    init(model: TestModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var activityIndicatorView: ActivityIndicatorView = {
        let activityIndicator = ActivityIndicatorView(frame: imageView.bounds)
        activityIndicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return activityIndicator
    }()
    
    private func showActivityIndicator() {
        showNextPreviewButton.isEnabled = false
        activityIndicatorView.isHidden = false
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.activityIndicatorView.alpha = 1
        })
    }
    
    private func hideActivityIndicator() {
        showNextPreviewButton.isEnabled = true
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.activityIndicatorView.alpha = 0
        }) { (isComplete) in
            self.activityIndicatorView.isHidden = true
        }
    }

    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet private weak var showNextPreviewButton: Button!
    
    @IBAction private func showNextImage() {
        showActivityIndicator()
        model.supplyNewImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.addSubview(activityIndicatorView)
        activityIndicatorView.beginAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TestModelDelegate
    
    var image: UIImage? {
        didSet {
            imageView.image = image
            hideActivityIndicator()
        }
    }

}
