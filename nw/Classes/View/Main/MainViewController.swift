//
//  MainViewController.swift
//  nw
//
//  Created by HP on 2018/6/8.
//  Copyright © 2018年 HP. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        setUpComposedButton()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        // 创建tabbar中的所有控制器对应的按钮
        super.viewWillAppear(animated)
        // 将撰写的按钮移到最前面
        tabBar.bringSubview(toFront: composedButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var composedButton: UIButton = UIButton(imageName: "tabbar_compose_icon_add", backImageName: "tabbar_compose_button")
    
}

extension MainViewController {
    // 添加所有的控制器
    private  func addChildViewControllers() {
        // 设置tintColor-渲染颜色
        tabBar.tintColor = UIColor.orange
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        // 添加空视图控制器
        addChildViewController(UIViewController())
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(ProfileTableViewController(), title: "我", imageName: "tabbar_profile")
    }
    /// 添加控制器
    /// - parameter vc:     vc
    /// - parameter title:  标题
    /// - parameter imagenName: 图像名称
    private func addChildViewController(_ vc: UIViewController, title: String, imageName: String) {
        // 设置标题--由内至外设置的
        vc.title = title
        // 设置图像
        vc.tabBarItem.image = UIImage(named: imageName)
        // 导航控制器
        let nav = UINavigationController(rootViewController: vc)
        addChildViewController(nav)
    }
    // 设置添加按钮
    private func setUpComposedButton() {
        // 添加按钮
        tabBar.addSubview(composedButton)
        // 调整按钮
        let count = childViewControllers.count
        // 让按钮宽一点点，能够解决手指触摸的荣复查问题
        let w = tabBar.bounds.width / CGFloat(count) - 1
        composedButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        //        composedButton.frame.insetBy(dx: 2 * w, dy: 0)
        composedButton.addTarget(self, action: #selector(MainViewController.clickComposedButton), for: .touchUpInside)
    }
    @objc private func clickComposedButton(){
        print("点我")
    }
}
