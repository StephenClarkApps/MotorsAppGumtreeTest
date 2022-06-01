//
//  UIFont+MA.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import UIKit
import Foundation

let LightFontName = "CoverfaceSELight"
let RegularFontName = "CoverfaceSE"
let BoldFontName = "CoverfaceSE-Bold"

extension UIFont {
    
    struct Light {
        static var size0 = { return UIFont(name: LightFontName, size: 10) ?? UIFont.systemFont(ofSize: 10)}()
        static var size1 = { return UIFont(name: LightFontName, size: 12) ?? UIFont.systemFont(ofSize: 12)}()
        static var size2 = { return UIFont(name: LightFontName, size: 13) ?? UIFont.systemFont(ofSize: 13)}()
        static var size3 = { return UIFont(name: LightFontName, size: 14) ?? UIFont.systemFont(ofSize: 14)}()
        static var size4 = { return UIFont(name: LightFontName, size: 15) ?? UIFont.systemFont(ofSize: 15)}()
        static var size5 = { return UIFont(name: LightFontName, size: 17) ?? UIFont.systemFont(ofSize: 17)}()
    }
    
    struct Body {
        static var size0 = { return UIFont(name: RegularFontName, size: 10) ?? UIFont.systemFont(ofSize: 10)}()
        static var size1 = { return UIFont(name: RegularFontName, size: 12) ?? UIFont.systemFont(ofSize: 12)}()
        static var size2 = { return UIFont(name: RegularFontName, size: 13) ?? UIFont.systemFont(ofSize: 13)}()
        static var size3 = { return UIFont(name: RegularFontName, size: 15) ?? UIFont.systemFont(ofSize: 15)}()
        static var size4 = { return UIFont(name: RegularFontName, size: 16) ?? UIFont.systemFont(ofSize: 16)}()
        static var size5 = { return UIFont(name: RegularFontName, size: 17) ?? UIFont.systemFont(ofSize: 17)}()
    }
    
    struct Bold {
        static var size0 = { return UIFont(name: BoldFontName, size: 12) ?? UIFont.systemFont(ofSize: 12)}()
        static var size1 = { return UIFont(name: BoldFontName, size: 14) ?? UIFont.systemFont(ofSize: 14)}()
        static var size2 = { return UIFont(name: BoldFontName, size: 15) ?? UIFont.systemFont(ofSize: 15)}()
        static var size3 = { return UIFont(name: BoldFontName, size: 16) ?? UIFont.systemFont(ofSize: 16)}()
        static var size4 = { return UIFont(name: BoldFontName, size: 17) ?? UIFont.systemFont(ofSize: 17)}()
        static var size5 = { return UIFont(name: BoldFontName, size: 20) ?? UIFont.systemFont(ofSize: 20)}()
        static var size6 = { return UIFont(name: BoldFontName, size: 22) ?? UIFont.systemFont(ofSize: 22)}()
        static var size7 = { return UIFont(name: BoldFontName, size: 24) ?? UIFont.systemFont(ofSize: 24)}()
    }
    
    struct Button {
        struct Primary {
            static var size1 = { return UIFont(name: BoldFontName, size: 14) ?? UIFont.systemFont(ofSize: 14)}()
            static var size2 = { return UIFont(name: BoldFontName, size: 16) ?? UIFont.systemFont(ofSize: 16)}()
        }
        struct Secondary {
            static var size0 = { return UIFont(name: RegularFontName, size: 12) ?? UIFont.systemFont(ofSize: 12)}()
            static var size1 = { return UIFont(name: RegularFontName, size: 15) ?? UIFont.systemFont(ofSize: 15)}()
        }
    }
}
