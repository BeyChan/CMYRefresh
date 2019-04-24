//
//  CMYRefreshView.swift
//  CMYRefresh
//
//  Created by Melody on 2019/4/24.
//

import UIKit

// MARK: - Public
extension CMYRefreshView: CMYRefreshViewProtocol {
    
    public func show(_ state: CMYRefreshState, config: CMYRefreshConfig, animated: Bool) {
        var action: (() -> Void)?
        var text: String?
        switch state {
        case .idle:
            action = {
                self.imageView.transform = CGAffineTransform.identity
            }
            refreshingView.stopAnimating()
            imageView.isHidden = false
            text = config.textIdle
        case .ready:
            action = {
                self.imageView.transform = CGAffineTransform(rotationAngle: degreesToRadians(180))
            }
            text = config.textReady
        case .refreshing:
            action = {
                self.imageView.transform = CGAffineTransform.identity
            }
            refreshingView.startAnimating()
            imageView.isHidden = true
            text = config.textRefreshing
        }
        
        setText(text)
        if let action = action {
            if animated {
                UIView.animate(withDuration: config.animationDurationSlow, animations: action)
            } else {
                action()
            }
        }
    }
}


public class CMYRefreshView: UIView {
    
    // MARK: - Const
    let imageViewMargin: CGFloat = 5
    let imageViewWidth = 16
    let imageDown = "cmy_arrow_down@2x.png"
    let imageUp = "cmy_arrow_up@2x.png"
    
    // MARK: - Property
    var position: CMYRefreshPosition
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.imageViewWidth, height: self.imageViewWidth))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var textLabel: UILabel = {
        var label = UILabel(frame: CGRect.zero)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(white: 0.4, alpha: 1.0)
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    lazy var refreshingView: UIActivityIndicatorView = {
        var refreshingView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        refreshingView.hidesWhenStopped = true
        return refreshingView
    }()
    
    // MARK: - Initialization
    init(position: CMYRefreshPosition) {
        self.position = position
        super.init(frame: CGRect.zero)
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(textLabel)
        addSubview(imageView)
        addSubview(refreshingView)
        
        var imageName = ""
        switch position {
        case .left, .bottom:
            imageName = imageUp
        default:
            imageName = imageDown
        }
        
        imageView.image = imageFromBundle(named: imageName)
    }
}

// MARK: - Override
extension CMYRefreshView {
    open override func layoutSubviews() {
        super.layoutSubviews()
        updateLocation()
    }
}

// MARK: - Private
extension CMYRefreshView {
    func updateLocation() {
        var center = CGPoint(x: bounds.midX, y: bounds.midY)
        textLabel.sizeToFit()
        textLabel.center = center
        
        center.x -= textLabel.bounds.midX + imageView.bounds.midX + imageViewMargin
        imageView.center = center
        refreshingView.center = center
    }
    
    func setText(_ text: String?) {
        textLabel.text = text
        updateLocation()
    }
}


