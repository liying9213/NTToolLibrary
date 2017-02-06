Pod::Spec.new do |s|
  s.name         = "NTToolLibrary"
  s.version      = "0.0.1"
  s.summary      = "NTToolLibrary is a tool"
  s.homepage     = "https://github.com/liying9213/NTToolLibrary"
  s.license      = "MIT"
  s.author       = { "liying" => "tiantian9213@gmail.com" }
  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/liying9213/NTToolLibrary.git", :tag => "#{s.version}" }
  s.source_files  = "NTToolLibrary/toolLibrary/**/*.{h,m}"
  s.framework    = 'UIKit'
  #s.library = 'sqlite3'
  s.dependency 'AFNetworking'
  s.dependency 'AFNetworking-Synchronous'
  s.dependency 'SVProgressHUD'
  s.dependency 'libextobjc'
  s.dependency 'MJRefresh'
  s.dependency 'SDWebImage'
  s.dependency 'NullSafe'
  s.dependency 'UIColor-HexString'
  s.dependency 'SDCycleScrollView'
  s.dependency 'UITableView+FDTemplateLayoutCell'
  s.requires_arc = true
  
end
