//
//  ViewController.swift
//  UIKit-SwiftUI
//
//  Created by Sachin Daingade on 15/08/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func OpenSwiftUIAction(_ sender: Any) {
        let vc = UIHostingController(rootView: PhotosList())
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

