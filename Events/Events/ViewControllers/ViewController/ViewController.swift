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

        let parseResponse: (Bool, Data?) -> () = { success, data in

            print("success: \(success)")

            guard let data = data, success,
                  let response = try? JSONDecoder().decode(EventResponse.self, from: data)
            else {

                print("Error parsing")
                return
            }

            print("Parse success: \(response) \(response.events?.count) \(response.locations?.count)")
        }

        DispatchQueue.global(qos: .userInitiated)
                     .async {
                         let target = FatsomaEventsAPITarget.events(page: 1, pageSize: 1)
                         FatsomaAPIClient(session: URLSession.shared).performRequest(target: target, onCompletion: parseResponse)
                         LocalAPIClient().performRequest(target: target, onCompletion: parseResponse)
                     }
    }
}

