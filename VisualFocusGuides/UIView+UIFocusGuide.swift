//
//  UIView+UIFocusGuide.swift
//  VisualFocusGuides
//
//  Created by David Engelhardt on 6/8/16.
//  Copyright © 2016 Viacom. All rights reserved.
//

import UIKit

public extension UIView {
    
    class VisualFocusGuide: UIView {
        
    }
    
    func showAllVisualFocusGuides() {
        var colors = [UIView: UIColor]()
        for layoutGuide in self.layoutGuides {
            
            var focusGuideColor = UIColor.randomColor()

            if let layoutGuide = layoutGuide as? UIFocusGuide {
                
                // Preferred Focused View
                if let preferredFocusedView = layoutGuide.preferredFocusedView {
                    let preferredFocusedVisualGuide = VisualFocusGuide(frame: preferredFocusedView.frame)
                    preferredFocusedVisualGuide.frame = CGRect(x: preferredFocusedVisualGuide.frame.origin.x - 10, y: preferredFocusedVisualGuide.frame.origin.y - 10, width: preferredFocusedVisualGuide.frame.size.width + 10, height: preferredFocusedVisualGuide.frame.size.height + 10)
                    preferredFocusedVisualGuide.layer.borderWidth = 10
                    if let color = colors[preferredFocusedView] {
                        preferredFocusedVisualGuide.layer.borderColor = color.CGColor
                        focusGuideColor = color
                    } else {
                        preferredFocusedVisualGuide.layer.borderColor = focusGuideColor.CGColor
                        colors.updateValue(focusGuideColor, forKey: preferredFocusedView)
                    }
                    self.addSubview(preferredFocusedVisualGuide)
                }

                // Focus Guide
                let visualFocusGuide = VisualFocusGuide(frame: layoutGuide.layoutFrame)
                visualFocusGuide.backgroundColor = focusGuideColor
                self.addSubview(visualFocusGuide)
            }
        }
    }
    
    func hideAllVisualFocusGuides() {
        for subview in self.subviews {
            if subview is VisualFocusGuide {
                subview.removeFromSuperview()
            }
        }
    }
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}