//
//  MainViewController.swift
//  BaseProject
//
//  Created by Nguyen Van Thieu B on 3/1/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit

class MainViewController: BaseTabBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let topViewController = BaseNavigationController(rootViewController: TopViewController())
        let resumeViewController = BaseNavigationController(rootViewController: ResumeViewController())
        let messageViewController = BaseNavigationController(rootViewController: MessageViewController())
        let scheduleViewController = BaseNavigationController(rootViewController: ScheduleViewController())
        let accountViewController = BaseNavigationController(rootViewController: AccountViewController())
        
        topViewController.tabBarItem.title = "TOP"
        topViewController.tabBarItem.image = UIImage(named: "tab_top")
        resumeViewController.tabBarItem.title = "RESUME"
        resumeViewController.tabBarItem.image = UIImage(named: "tab_resume")
        messageViewController.tabBarItem.title = "MESSAGE"
        messageViewController.tabBarItem.image = UIImage(named: "tab_message")
        scheduleViewController.tabBarItem.title = "SCHEDULE"
        scheduleViewController.tabBarItem.image = UIImage(named: "tab_schedule")
        accountViewController.tabBarItem.title = "SETTINGS"
        accountViewController.tabBarItem.image = UIImage(named: "tab_settings")
        
        self.view.backgroundColor = UIColor.red
        self.setViewControllers([
            topViewController,
            resumeViewController,
            messageViewController,
            scheduleViewController,
            accountViewController], animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
