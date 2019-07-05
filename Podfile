source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

def all_pods
    pod 'Alamofire', '4.7.3'
    pod 'SwiftyJSON', '4.1.0'
    pod 'R.swift', '4.0.0'
    pod 'RxSwift', '4.2.0'
    pod 'RxCocoa', '4.2.0'
    pod 'SDWebImage', '3.8.2'
    pod 'SwiftLint', '0.27.0'
    pod 'lottie-ios', '2.5.0'
    pod 'Hero', '1.3.0'
end

target 'QuickieNews' do
    all_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
        end
    end
end
