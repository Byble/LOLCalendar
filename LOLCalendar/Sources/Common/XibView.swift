//
//  XibView.swift
//  LOLCalendar
//
//  Created by 김민국 on 2020/11/22.
//

import UIKit

class XibView: UIView {
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let className = String(describing: type(of: self))
        let nib = UINib(nibName: className, bundle: .main)
        
        guard let xibView = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let className = String(describing: type(of: self))
        let nib = UINib(nibName: className, bundle: .main)
        
        guard let xibView = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
    }
}
