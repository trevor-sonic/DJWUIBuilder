//
//  File.swift
//  
//
//  Created by dejaWorks on 30/01/2020.
//

import UIKit
import DJWCommon
import DJWBuilderNS
import DJWBindableNS

public extension Builder{
    class BButton:UIViewBuilder{
        
        private let button: Bindable.Button
        
        // MARK: - Inits
        public init(title: String, type:UIButton.ButtonType = .system) {
            button = Bindable.Button(type: type)
            button.setTitle(title, for: .normal)
            super.init(button)
        }
        
        public enum Position{
            case iconLeftTextLeft
        }
        public func imageAndTextPos(_ pos:Position = .iconLeftTextLeft)->Self{
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10 , bottom: 0, right: 0)
            button.titleLabel?.textAlignment = .left
            button.contentHorizontalAlignment = .left
            return self
        }
        public func tag(_ n:Int)->Self{
            button.tag = n
            return self
        }
        public func bind(_ callback:@escaping ( (UIButton)->Void) )->Self{
            button.bind(callback)
            return self
        }
        public func bindUp(_ callback:@escaping ( (UIButton)->Void) )->Self{
            button.bindUp(callback)
            return self
        }
        public func bindDown(_ callback:@escaping ( (UIButton)->Void) )->Self{
            button.bindDown(callback)
            return self
        }
        public func font(size:CGFloat, weight:UIFont.Weight)->Self{
            button.titleLabel?.font = UIFont.monospacedDigitSystemFont(ofSize: size, weight: weight)
            return self
        }
        public func title(_ title: String, for state:UIControl.State = .normal)->Self{
            button.setTitle(title, for: state)
            return self
        }
        public func image(_ image: UIImage, for state:UIControl.State = .normal)->Self{
            button.setImage(image, for: state)
            return self
        }
        public func bgImage(_ image: UIImage, for state:UIControl.State = .normal)->Self{
            button.setBackgroundImage(image, for: state)
            return self
        }
        /// If set true; after every tap button will be disables for 0.2 sec.
        public func protect(forButtonAbuse:Bool)->Self{
            button.protectButtonAbuse = forButtonAbuse
            return self
        }
        public func inset(top: CGFloat = 5, left: CGFloat = 5, bottom: CGFloat = 5, right: CGFloat = 5)->Self{
            button.contentEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
            return self
        }
        
        // MARK: - Build and finalize
        override public  func build() -> Bindable.Button {
            return button
        }
        override public func buildAndAdd(on view: UIView)->Bindable.Button {
            view.addSubview(button)
            return button
        }
    }
}



public extension Bindable{
    class Button:UIButton{
        open var onTap:ClosureWith<UIButton> = { _ in}
        public var onDown:ClosureWith<UIButton> = { _ in}
        public var onUp:ClosureWith<UIButton> = { _ in}
        var protectButtonAbuse = false
        
        open func bind(_ callback:@escaping ClosureWith<UIButton>){
            onTap = callback
            addTarget(self, action: #selector(buttonTapped), for: UIControl.Event.touchUpInside)
        }
        
        public func bindDown(_ callback:@escaping ClosureWith<UIButton>){
            onDown = callback
            addTarget(self, action: #selector(buttonDown), for: UIControl.Event.touchDown)
        }
        
        public func bindUp(_ callback:@escaping ClosureWith<UIButton>){
            onUp = callback
            addTarget(self, action: #selector(buttonUp), for: UIControl.Event.touchUpInside)
            addTarget(self, action: #selector(buttonUp), for: UIControl.Event.touchUpOutside)
        }
        
        @objc public func buttonTapped(_ sender:Bindable.Button){
            onTap(sender)
            preventButtonAbuse()
        }
        @objc func buttonDown(_ sender:Bindable.Button){
            onDown(sender)
            preventButtonAbuse()
        }
        @objc func buttonUp(_ sender:Bindable.Button){
            onUp(sender)
            preventButtonAbuse()
        }
        open func preventButtonAbuse(){
            guard protectButtonAbuse else {return}
            isEnabled = false
            //// Latency for button abuse
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.2 ) {
                //print("Latency preventButtonAbuse")
                self.isEnabled = true
            }
        }
    }
}
