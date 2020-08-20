//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 山田祥吾 on 2020/08/20.
//  Copyright © 2020 yashogoz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var exPicture: UIImageView!
    var pictureName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exPicture.image = UIImage(named: pictureName)
    }

}
