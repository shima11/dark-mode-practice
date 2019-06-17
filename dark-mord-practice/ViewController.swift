//
//  ViewController.swift
//  dark-mord-practice
//
//  Created by jinsei_shima on 2019/06/05.
//  Copyright © 2019 jinsei_shima. All rights reserved.
//

import Foundation
import UIKit


// https://developer.apple.com/documentation/appkit/supporting_dark_mode_in_your_interface

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Title"
        
        // AssetCatalogでColorSetを定義した場合
        view.backgroundColor = UIColor.init(named: "Color1")
        
        let label = UILabel()
        label.text = "Label"
        label.textColor = UIColor.systemGray2
        label.layer.backgroundColor = UIColor.systemBackground.cgColor
        
        let segment = UISegmentedControl(items: [
            "Tokyo", "SanJose", "Korean"
            ])
        segment.tintColor = .darkGray
        segment.backgroundColor = .lightGray
        segment.layoutIfNeeded()
        segment.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        let activity = UIActivityIndicatorView(style: .medium)
        activity.color = .orange
        activity.startAnimating()
        
        let stepper = UIStepper()
        stepper.maximumValue = 100
        stepper.minimumValue = 0
        stepper.largeContentTitle = "title"
        stepper.tintColor = .darkGray
        stepper.backgroundColor = .lightGray
        stepper.autorepeat = true
        stepper.layer.cornerRadius = 8
        stepper.layer.cornerCurve = .continuous
        stepper.clipsToBounds = true
        
        let switchView = UISwitch()
        switchView.tintColor = .systemGray
        switchView.backgroundColor = .clear
        switchView.onTintColor = .systemOrange
        switchView.thumbTintColor = .systemGroupedBackground
        
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.minimumTrackTintColor = .systemGray6
        slider.maximumTrackTintColor = .systemGray2
        slider.thumbTintColor = .systemGroupedBackground
        slider.tintColor = .systemGray
        
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        let customView = CustomView()
        customView.frame = .init(x: 0, y: 0, width: 100, height: 100)
        customView.backgroundColor = .systemBlue
        
        let stackView = UIStackView(arrangedSubviews: [
            label,
            segment,
            activity,
            stepper,
            switchView,
            slider,
            button,
            customView
            ])
        stackView.spacing = 24
        stackView.alignment = .center
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc func didTapButton() {        
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        // environment overrides で Interface Style を変更すると呼ばれるが、break pointには反応しないので注意。
        
        print("viewconroller traitCollectionDidChange")

        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {

            print("changed")
            
            // hasDifferentColorAppearanceを呼んで色に関して変更があるかどうかを確認
            
            guard let trait = previousTraitCollection else { return }
            
            switch trait.userInterfaceStyle {
            case .dark:
                break
            case .light:
                break
            case .unspecified:
                break
            @unknown default:
                break
            }
        }
    }
    
}

class CustomView: UIView {
    
    class ContentView: UIView {
        
        override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            super.traitCollectionDidChange(previousTraitCollection)
            print("content view traitCollectionDidChange")
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        let view = ContentView()
        addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        print("custom view traitCollectionDidChange")
    }
    
}

class DetailViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        overrideUserInterfaceStyle = .dark
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        present(EditViewController(), animated: true, completion: nil)
        
    }
}

class EditViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
