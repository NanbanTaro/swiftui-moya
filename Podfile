# Uncomment the next line to define a global platform for your project
platform :ios, '16.0'

target 'Swiftui-Moya' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Alamofire','5.6.4'
  pod 'Moya/Combine','15.0.0'
end

# Pods for Swiftui-Moya

target 'Swiftui-MoyaTests' do
  inherit! :search_paths
  # Pods for testing
end

target 'Swiftui-MoyaUITests' do
  # Pods for testing
end


post_install do |installer|
  target_names = [
    'Alamofire',
  ]
  target_names.each do |target_name|
    # 変更対象のターゲットを探索する
    pods_target = installer.pods_project.targets.find{ |target| target.name == target_name }
    unless pods_target
      raise ::Pod::Informative, "Failed to fin '"<< target_name >>"' target"
    end

    # ビルド設定を変更する
    pods_target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end