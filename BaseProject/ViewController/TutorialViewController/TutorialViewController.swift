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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainPageControl: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
    
    // Sample data
    let backgrounds = ["slide1", "slide2", "slide3", "slide4"]
    let titles = ["Creative", "Idea", "Action", "Summary"]
    let descriptions = ["Offered say visited elderly and. Waited period are played family man formed. He ye body or made on pain part meet. You one delay nor begin our folly abode. By disposed replying mr me unpacked no. As moonlight of my resolving unwilling.", "Two exquisite objection delighted deficient yet its contained. Cordial because are account evident its subject but eat. Can properly followed learning prepared you doubtful yet him. Over many our good lady feet ask that.", "Expenses own moderate day fat trifling stronger sir domestic feelings. Itself at be answer always exeter up do. Though or my plenty uneasy do. Friendship so considered remarkably be to sentiments. Offered mention greater fifteen one promise because nor. Why denoting speaking fat indulged saw dwelling raillery.", "Up unpacked friendly ecstatic so possible humoured do. Ample end might folly quiet one set spoke her. We no am former valley assure. Four need spot ye said we find mile."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        self.mainScrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        self.mainScrollView.contentSize = CGSize(width: screenWidth * 4,
            height: screenHeight)
        for i in 0..<backgrounds.count {
            let backgoundImageView = UIImageView(frame: self.mainScrollView.frame)
            backgoundImageView.frame.origin.x = screenWidth * CGFloat(integerLiteral: i)
            backgoundImageView.image = UIImage(named: backgrounds[i])
            self.mainScrollView.addSubview(backgoundImageView)
        }
        self.titleLabel?.text = titles[0]
        self.descriptionLabel?.text = descriptions[0]
    }

    // MARK: - IBActions

    @IBAction func startButtonTapped(_ sender: Any) {
        let loginViewController = LoginViewController()
        let navigationController = BaseNavigationController(rootViewController: loginViewController)
        self.present(navigationController, animated: true, completion: nil)
    }
    
}

// MARK: - UIScrollViewDelegate

extension TutorialViewController: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = Int(scrollView.contentOffset.x / self.mainScrollView.frame.width)
        self.titleLabel?.text = titles[currentIndex]
        self.descriptionLabel?.text = descriptions[currentIndex]
        self.mainPageControl.currentPage = currentIndex
        if currentIndex == backgrounds.count - 1 {
            UIView.animate(withDuration: 1.0, animations: { 
                self.startButton.alpha = 1.0
            })
        } else {
            self.startButton.alpha = 0.0
        }
    }
    
}
