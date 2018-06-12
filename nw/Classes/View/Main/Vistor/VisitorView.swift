//
//  VisitorView.swift
//  nw
//
//  Created by HP on 2018/6/8.
//  Copyright © 2018年 HP. All rights reserved.
//

import UIKit
import SnapKit

class VisitorView: UIView {

    // MARK: - 构造函数
    // initWithFrame是 UIview的指定构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    // initWithCoder - 使用StoryBoard & XIB 开发加载的函数
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK: -懒加载控件
    /// 图标，使用image：构造函数创建的 imageView默认就是 image的大小
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    private lazy var homeIconView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    // 消息文字
    private lazy var messageLabel : UILabel = {
        let label = UILabel()
        label.text = "关注一些人，回这里看看有什么惊喜"
        // 界面设计上，避免使用纯黑色
        // 字体颜色
        label.textColor = UIColor.darkGray
        // 字体大小
        label.font = UIFont.systemFont(ofSize: 13)
        // 不限制行数
        label.numberOfLines = 0;
        // 文字对齐方式
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    /// 注册按钮
    private lazy var registerButton : UIButton = {
        let button = UIButton()
        button.setTitle("注册", for: UIControlState.normal)
        button.setTitleColor(UIColor.orange, for: UIControlState.normal)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: UIControlState.normal)
        return button
    }()
    /// 登录按钮
    private lazy var loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("登录", for: UIControlState.normal)
        button.setTitleColor(UIColor.orange, for: UIControlState.normal)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: UIControlState.normal)
        return button
    }()
    private lazy var maskIconView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    // 开启首页转轮动画
    private func startAnim() {
        //        CABasicAnimation 指的是核心动画，如果想让图片旋转需要指定的keypath为“transform.rotation”，基本动画为开始值到结束值
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2.0 * .pi
        //        不停旋转
        anim.repeatCount = MAXFLOAT
        //        设置动画旋转一圈的时长
        anim.duration = 20
        //        用着不断重复的动画上，当动画绑定的图层对应的视图被销毁，动画被自动被销毁
        anim.isRemovedOnCompletion = false
        // 添加到图层
        iconView.layer.add(anim, forKey: nil)
    }

}

extension VisitorView{
    // 设置界面
    private func setupUI(){
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(homeIconView)
        addSubview(messageLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        // 1>图标
        // make 理解为要添加的约束对象
        
        iconView.snp.makeConstraints { (make) in
            // 指定centerX属性等于 '参照对象'.'snp_'参照属性值
            // offset 就是指定相对视图约束的偏移量
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(-60)
        }
        //        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        // 2>小房子
        homeIconView.snp.makeConstraints { (make) in
            make.center.equalTo(iconView.snp.center)
        }
        // 3>消息文字
        messageLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(iconView.snp.centerX)
            make.top.equalTo(iconView.snp.bottom).offset(16)
            make.width.equalTo(224)
            make.height.equalTo(36)
        }
        // 4>注册按钮
        registerButton.snp.makeConstraints { (make) in
            make.left.equalTo(messageLabel.snp.left)
            make.top.equalTo(messageLabel.snp.bottom).offset(16)
            make.width.equalTo(100)
            make.height.equalTo(36)
        }
        // 5>登录按钮
        loginButton.snp.makeConstraints { (make) in
            make.right.equalTo(messageLabel.snp.right)
            make.top.equalTo(messageLabel.snp.bottom).offset(16)
            make.width.equalTo(100)
            make.height.equalTo(36)
        }
        // 6>遮罩视图
        maskIconView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(registerButton.snp.bottom)
        }
        backgroundColor = UIColor(white: 237.0 / 255.0, alpha: 1.0)
    }
    func setupInfo(_ imageName: String?,title: String) {
        // 设置消息label的文字
        messageLabel.text = title
        // 如果图片名称为nil，说明是首页，直接返回
        guard let imgName = imageName else {
            // 播放动画
            startAnim()
            return
        }
        iconView.image = UIImage(named: imgName)
        // 隐藏小房子
        homeIconView.isHidden = true
        // 将遮罩图像移动至底层
        sendSubview(toBack: maskIconView)
    }
}
