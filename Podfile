# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'

# 忽略所有pods的警告
inhibit_all_warnings!


def sharePods
  pod 'SDWebImage'
  pod 'YYKit'
  # 手动约束
  pod 'Masonry'
  # 下拉刷新
  pod 'MJRefresh'
  
end

target 'AppDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AppDemo
  sharePods

  target 'AppDemoTests' do
    inherit! :search_paths
    # Pods for testing
    sharePods
  end

  target 'AppDemoUITests' do
    # Pods for testing
    sharePods
  end

end
