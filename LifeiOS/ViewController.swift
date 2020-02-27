//
//  ViewController.swift
//  LifeiOS
//
//  Created by Thomas Goss on 2/19/20.
//  Copyright © 2020 Thomas Goss. All rights reserved.
//

import UIKit
import LinkKit

class ViewController: UIViewController {
    let network = Network()
    let finances = Finances()

    var b = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        presentLink()
        updateMode()]
//        sampleGet()
    }
    
//    func sampleGet() {
//        network.get(path: "example", { response in
//            guard let test = response["test"] as! String? else {
//                print("shit")
//                return
//            }
//            print(test)
//        })
//    }
    
    func presentLink() {
        if b {
            b = false
            print("presentLink")
//            let config = PLKConfiguration(key: network.publicKey, env: .development, product: .transactions)
//            config.clientName = "Life iOS"
//            let linkViewController = PLKPlaidLinkViewController(configuration: delegate: self)
//            present(linkViewController, animated: true)
            // With shared configuration from Info.plist
            let linkViewDelegate = self
            let linkViewController = PLKPlaidLinkViewController(delegate:
            linkViewDelegate)
//            if (UI_USER_INTERFACE_IDIOM() == .pad) {
//                linkViewController.modalPresentationStyle = .formSheet;
//            }
            present(linkViewController, animated: true)
        }
    }
    
    func updateMode() {
        let linkViewDelegate = self
        let linkViewController = PLKPlaidLinkViewController(publicToken:
            network.publicKey, delegate: linkViewDelegate)
//        if (UI_USER_INTERFACE_IDIOM() == .pad) {
//            linkViewController.modalPresentationStyle = .formSheet;
//        }
        present(linkViewController, animated: true)
    }
    
//    func handleSuccessWithToken(_ publicToken: String, metadata: [String : Any]?) {
//        p("Success", message: "token: \(publicToken)\nmetadata: \(metadata ?? [:])")
//    }
    
//    func presentAlertViewWithTitle(_ title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
//    }


}

extension ViewController : PLKPlaidLinkViewDelegate {
    func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didSucceedWithPublicToken publicToken: String, metadata: [String : Any]?) {
        print("onSuccess")
//        NSLog("Successfully linked account!\npublicToken: \(publicToken)\nmetadata: \(metadata ?? [:])")
//        self.handleSuccessWithToken(publicToken, metadata: metadata)
//        network.post(path: "get_access_token", parameters: ["public_token" : publicToken])
        finances.getAccessToken(publicToken: publicToken)
//        finances.getTransactions({ response in
//            print(response)
//        })
//        finances.getTotalExpenses({ response in
//            print(response)
//        })
    }
    
    func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didExitWithError error: Error?, metadata: [String : Any]?) {
        print("onError")
        print(error)
    }
    
    func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didHandleEvent event: String, metadata: [String : Any]?) {
        print("x")
        print(event)
    }
    
    
}

