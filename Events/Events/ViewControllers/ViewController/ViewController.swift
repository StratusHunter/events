//
//  ViewController.swift
//  Events
//
//  Created by Terence Baker on 26/02/2022.
//

import UIKit

class ViewController: UIViewController {

    init() {

        let nib = R.nib.viewController
        super.init(nibName: nib.name, bundle: nib.bundle)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) is not supported") }

    override func viewDidLoad() {

        super.viewDidLoad()
    }
}

