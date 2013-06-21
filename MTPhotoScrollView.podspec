Pod::Spec.new do |s|
s.name         = "MTPhotoScrollView"
s.version      = "0.0.1"
s.summary      = "A zooming image view"
s.homepage     = "https://github.com/willowtreeapps/MTPhotoScrollView"
s.license      = 'MIT'
s.author       = { "WillowTree Apps" => "" }
s.source       = { :git => "git@github.com:willowtreeapps/MTPhotoScrollView.git", :tag => s.version }
s.source_files = 'Classes'
s.requires_arc = true
s.platform = :ios, '5.0'
end
