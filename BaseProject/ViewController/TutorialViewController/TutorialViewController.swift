//
//  TutorialViewController.swift
//  BaseProject
//
//  Created by  on 3/2/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit

class TutorialViewController: BaseViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var mainPageControl: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
    
    // Sample data
    let backgrounds = ["slide1", "slide2", "slide3", "slide4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let screenWidth = self.mainScrollView.frame.width
        let screenHeight = self.mainScrollView.frame.height
        self.mainScrollView.contentSize = CGSize(width: screenWidth * 4,
            height: screenHeight)
        for i in 0..<backgrounds.count {
            let backgoundImageView = UIImageView(frame: self.mainScrollView.frame)
            backgoundImageView.frame.origin.x = screenWidth * CGFloat(integerLiteral: i)
            backgoundImageView.image = UIImage(named: backgrounds[i])
            self.mainScrollView.addSubview(backgoundImageView)
        }
    }

    // MARK: - IBActions

    @IBAction func startButtonTapped(_ sender: Any) {
        let registerViewController = RegisterViewController()
        self.present(registerViewController, animated: true, completion: nil)
    }
    
}

// MARK: - UIScrollViewDelegate

extension TutorialViewController: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = Int(scrollView.contentOffset.x / self.mainScrollView.frame.width)
        self.mainPageControl.currentPage = currentIndex
        self.startButton.alpha = currentIndex == backgrounds.count - 1 ? 1.0 : 0.0
    }
    
}
