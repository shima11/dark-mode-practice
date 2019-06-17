import UIKit

enum AppColor {
    static let dynamicRed = UIColor.init(dynamicProvider: { trait in
        switch (trait.userInterfaceStyle, trait.accessibilityContrast) {
        case (.light, .normal):
            return UIColor.init(red: 0.6, green: 0, blue: 0, alpha: 1)
        case (.light, .high):
            return UIColor.init(red: 0.7, green: 0, blue: 0, alpha: 1)
        case (.dark, .normal):
            return UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 1)
        case (.dark, .high):
            return UIColor.init(red: 0.9, green: 0, blue: 0, alpha: 1)
        default:
            fatalError()
        }
    })
}

func checkColor(traitCollection: UITraitCollection) {
    print(":::", traitCollection)
    print(UIColor.red.resolvedColor(with: traitCollection))
    print(UIColor.systemRed.resolvedColor(with: traitCollection))
    print(AppColor.dynamicRed.resolvedColor(with: traitCollection))
}

let trait1: UITraitCollection = .init(traitsFrom: [.init(accessibilityContrast: .normal), .init(userInterfaceStyle: .light)])
let trait2: UITraitCollection = .init(traitsFrom: [.init(accessibilityContrast: .high), .init(userInterfaceStyle: .light)])
let trait3: UITraitCollection = .init(traitsFrom: [.init(accessibilityContrast: .normal), .init(userInterfaceStyle: .dark)])
let trait4: UITraitCollection = .init(traitsFrom: [.init(accessibilityContrast: .high), .init(userInterfaceStyle: .dark)])

checkColor(traitCollection: trait1)
checkColor(traitCollection: trait2)
checkColor(traitCollection: trait3)
checkColor(traitCollection: trait4)
