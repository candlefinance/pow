//
//  ViewController.swift
//  test-swiftui
//
//  Created by Gary Tokman on 4/13/23.
//

import UIKit
import SwiftUI
import Pow

class ViewController<T: View>: UIViewController {
    
    let uiView: T
    
    init(uiView: T) {
        self.uiView = uiView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup(withRootView: uiView)
    }
    
    func setup<Content: View>(withRootView view: Content) {
        self.children.forEach { $0.removeFromParent() }
        self.view.subviews.forEach { $0.removeFromSuperview() }
        let host = Hosting(rootView: view)
        host.add(to: self)
    }
    
}

public class Hosting<Content: View>: UIHostingController<Content> {
    
    public func add(to controller: UIViewController) {
        controller.addChild(self)
        controller.view.addSubview(view)
        didMove(toParent: controller)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor),
            view.topAnchor.constraint(equalTo: controller.view.topAnchor),
            view.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor),
        ])
    }
    
    deinit {
        removeFromParent()
        view.removeFromSuperview()
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateViewConstraints()
    }
}



