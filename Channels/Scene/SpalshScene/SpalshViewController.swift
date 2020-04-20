//
//  SpalshViewController.swift
//  Channels
//
//  Created by sara.galal on 3/30/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class SpalshViewController: UIViewController {

    @IBOutlet weak private var splashImageView: UIImageView!
    @IBOutlet weak private var appNameImage: UIImageView!
    @IBOutlet weak private var greenCircleImage: UIImageView!
    @IBOutlet weak private var darkGreenCircleImage: UIImageView!
    @IBOutlet weak private var blueCircleImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        splashImageView.isHidden = false
        appNameImage.isHidden = true
        greenCircleImage.isHidden = true
        darkGreenCircleImage.isHidden = true
        blueCircleImage.isHidden = true
        startAnimation()
    }
    private func startAnimation() {
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: [], animations: {
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        })
        UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.splashImageView.alpha = 0
            })
        }) { _ in
            self.splashImageView.isHidden = true
            self.splashImageView.alpha = 1
            self.greenCircleImage.isHidden = false
            self.darkGreenCircleImage.isHidden = false
            self.blueCircleImage.isHidden = false
            
            let animator = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.7) {
              self.greenCircleImage.frame = self.greenCircleImage.frame.offsetBy(dx: -100, dy: -300)
                self.darkGreenCircleImage.frame = self.greenCircleImage.frame.offsetBy(dx: 300, dy: 100)
                self.blueCircleImage.frame = self.greenCircleImage.frame.offsetBy(dx: 150, dy: 600)
                self.appNameImage.isHidden = false
            }
                 animator.startAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    UIView.animate(withDuration: 1, animations: {
                         self.splashImageView.isHidden = false
                         self.appNameImage.isHidden = true
                         self.greenCircleImage.isHidden = true
                         self.darkGreenCircleImage.isHidden = true
                         self.blueCircleImage.isHidden = true
                         self.splashImageView.transform = CGAffineTransform(scaleX: 3, y: 3)
                         self.splashImageView.alpha = 0
                    }) 
            }
        }
  }
}
