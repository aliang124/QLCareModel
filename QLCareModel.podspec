Pod::Spec.new do |s|
  s.name         = "QLCareModel"
  s.version      = "0.0.1"
  s.summary      = "QLCareModel趣浪首页"

  s.homepage     = "https://github.com/aliang124/QLCareModel"

  s.license      = "MIT"
  s.author             = { "jienliang000" => "jienliang000@163.com" }

  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.requires_arc = true

  s.source       = { :git => "https://github.com/aliang124/QLCareModel.git", :tag => "#{s.version}" }
  s.source_files  = "QLCareModel/*.{h,m}"

end
