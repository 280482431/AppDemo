Pod::Spec.new do |s|
        s.name                  = "CommonSDK"
        s.version               = "1.0.0"
        s.summary               = "登录注册"
        s.homepage              = "http://www.100yy.com"
        s.license               = "MIT"
        s.author                = {"sillker" => "panhuifeng@hqwx.com"}
        s.source                = {:path => "."}
        s.platform              = :ios, "8.0"
        s.requires_arc  = true
        s.source_files  = "CommonSDK/**/*.{h,m,mm}"
        s.resource_bundles = {
          'CommonSDK' => ['CommonSDK/**/*.{xib,storyboard,png,xcassets}']
#            'HQLoginSDK' => ['HQLoginSDK/**/*.xcassets']
        }
        
        
        #s.preserve_paths = 'libs/*.a'
        s.dependency 'JSONKit-NoWarning', '~> 1.2'
        s.dependency 'Masonry'
        s.dependency 'SVProgressHUD', '2.2.5'
        #'2.6.3'
        s.dependency 'AFNetworking/Reachability','~>3.0'
        s.dependency 'CocoaLumberjack','~>3.0.0'
        s.dependency 'YTKNetwork' ,'~>2.1.0'
        s.dependency 'FDFullscreenPopGesture'
        
        s.dependency 'Realm', '~> 2.8.3'
        
        s.dependency 'MJExtension'
        s.dependency 'HQAPPCommonSDK'
        s.dependency 'SDWebImage'
        s.dependency 'ReactiveCocoa'
        s.dependency 'HQGlobalFiles'
        s.dependency 'HqAppArchitect'
        s.dependency 'Uagent'
        #s.dependency 'UMCShare/Social/ReducedWeChat'
        s.dependency 'HQWX_ATAuthSDK'
        s.dependency 'TTTAttributedLabel' , '1.13.4'
        s.dependency 'ArchitectureBase'
        
end
