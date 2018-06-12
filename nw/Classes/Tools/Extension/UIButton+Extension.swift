//
//  UIButton+Extension.swift
//  nw
//
//  Created by HP on 2018/6/8.
//  Copyright © 2018年 HP. All rights reserved.
//

import UIKit

extension UIButton {
    /// 便利构造函数
    /// - parameter imageName:      图像名称
    /// - parameter backImageName:  背景图像名称
    /// - rerurns: UIButton
    convenience init(imageName: String,backImageName: String?) {
        self.init()
        // 设置按钮图像
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        // 设置按钮背景图像
        setBackgroundImage(UIImage(named: backImageName!), for: .normal)
        setBackgroundImage(UIImage(named: backImageName! + "_highlighted"), for: .highlighted)
        // 设置根据背景图片的大小调整尺寸
        sizeToFit()
    }
}
