Pod::Spec.new do |s|
  s.name         = "CPAutoAdvScrollVC"
  s.version      = "1.0.0"
  s.summary      = "An iOS activity indicator view."
  s.description  = <<-DESC
                    CPAutoAdvScrollVC.podspec 可以用于欢迎页和滚屏广告的轻便控制器
                   DESC
  #s.homepage     = "http://www.bukovinski.com"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Captain0502' => 'wangzhangchuan0502@163.com' }
  s.source       = { :git => "https://github.com/matej/MBProgressHUD.git", :tag => s.version.to_s }
  s.ios.deployment_target = '6.0'
  s.source_files = '*.{h,m}'
  s.requires_arc = true
end
