# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

# Comment the next line if you don't want to use dynamic frameworks
use_frameworks!

workspace 'NoteSalihMVVM'

target 'NoteSalihMVVM' do
  
  project 'NoteSalihMVVM.xcodeproj'
  
  # Pods for NoteSalihMVVM
  pod 'SwiftLint', '~> 0.46'

  target 'NoteSalihMVVMTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NoteSalihMVVMUITests' do
    # Pods for testing
  end

end

target 'DataProvider' do
  
  project 'DataProvider/DataProvider.xcodeproj'
  
  # Pods for DataProvider
  
  target 'DataProviderTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end


