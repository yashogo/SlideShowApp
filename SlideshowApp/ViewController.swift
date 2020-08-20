//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山田祥吾 on 2020/08/18.
//  Copyright © 2020 yashogoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var actionButtonStyle: UIButton!
    
    let pictureList = ["img1.png", "img2.png", "img3.png", "img4.png", "img5.png"]
    
    var num: Int = 0
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picture.image = UIImage(named: pictureList[0])
    }
    
    @objc func pictureDisplay(_ timer: Timer) {
        if num == pictureList.count-1 {
            num = 0
        } else {
            num += 1
        }
        picture.image = UIImage(named: pictureList[num])
    }

    @IBAction func nextButton(_ sender: Any) {
        if timer == nil {
            if num == pictureList.count-1 {
                num = 0
            } else {
                num += 1
            }
            picture.image = UIImage(named: pictureList[num])
        }
    }
    
    @IBAction func reverseButton(_ sender: Any) {
        if timer == nil {
            if num == 0 {
                num = pictureList.count-1
            } else {
                num -= 1
            }
            picture.image = UIImage(named: pictureList[num])
        }
    }
    
    @IBAction func actionButton(_ sender: Any) {
        if timer == nil {
            actionButtonStyle.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(pictureDisplay(_:)), userInfo: nil, repeats: true)
        } else {
            actionButtonStyle.setTitle("再生", for: .normal)
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        secondViewController.pictureName = pictureList[num]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
       }
}

