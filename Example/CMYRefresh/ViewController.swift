//
//  ViewController.swift
//  CMYRefresh
//
//  Created by BeyChan on 04/24/2019.
//  Copyright (c) 2019 BeyChan. All rights reserved.
//

import UIKit
import CMYRefresh

class ViewController: UIViewController {

    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.automaticallyAdjustsScrollViewInsets = false
        addScrollView()
        addRefresh()

        scrollView.cmy_topRefresh?.beginRefresh()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        scrollView.contentSize = view.bounds.size
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.cmy_topRefresh?.beginRefresh()
    }
    
    func addScrollView() {
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = .white
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.bounces = true
        scrollView.contentSize = view.bounds.size
        view.addSubview(scrollView)
        self.scrollView = scrollView
    }
    
    func addRefresh() {
        var config = CMYRefreshConfig()
        config.textIdle = "下拉返回商品详情"
        config.textReady = "释放返回商品详情"
       
        scrollView.addCMYRefresh(position: .top, config: config, refreshView: nil) { (refresh) in
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
                refresh.endRefresh()
            })
        }
        
        scrollView.addCMYRefresh(position: .left, config: config) { (refresh) in
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
                refresh.endRefresh()
            })
        }
        
        scrollView.addCMYRefresh(position: .bottom) { (refresh) in
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
                refresh.endRefresh()
            })
        }
        
        scrollView.addCMYRefresh(position: .right) { (refresh) in
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
                refresh.endRefresh()
            })
        }
    }
    
    

}

