//
//  PasscodeSignButton.swift
//  PasscodeLock
//
//  Created by Yanko Dimitrov on 8/28/15.
//  Copyright © 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit

@IBDesignable
public class PasscodeSignButton: UIButton {
    
    @IBInspectable
    public var passcodeSign: String = "1"
    
    @IBInspectable
    public var borderColor: UIColor = UIColor.whiteColor() {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable
    public var borderRadius: CGFloat? {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable
    public var highlightBackgroundColor: UIColor = UIColor.clearColor() {
        didSet {
            setupView()
        }
    }
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupView()
        setupActions()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        setupActions()
    }
    
    private var defaultBackgroundColor = UIColor.clearColor()
    
    private func setupView() {
        
        layer.borderWidth = 1
        
        layer.borderColor = borderColor.CGColor
        
        if let backgroundColor = backgroundColor {
            defaultBackgroundColor = backgroundColor
        }
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews();
        
        // Used for autolayout.
        if borderRadius == nil {
            layer.cornerRadius = self.frame.height/2;
        } else {
            layer.cornerRadius = borderRadius!
        }
    }
    
    private func setupActions() {
        addTarget(self, action: #selector(PasscodeSignButton.handleTouchDown), forControlEvents: .TouchDown)
        addTarget(self, action: #selector(PasscodeSignButton.handleTouchUp), forControlEvents: [.TouchUpInside, .TouchDragOutside, .TouchCancel])
    }
    
    func handleTouchDown() {
        
        animateBackgroundColor(highlightBackgroundColor)
    }
    
    func handleTouchUp() {
        
        animateBackgroundColor(defaultBackgroundColor)
    }
    
    private func animateBackgroundColor(color: UIColor) {
        
        UIView.animateWithDuration(
            0.3,
            delay: 0.0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.0,
            options: [.AllowUserInteraction, .BeginFromCurrentState],
            animations: {
                
                self.backgroundColor = color
            },
            completion: nil
        )
    }
}
