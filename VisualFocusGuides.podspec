Pod::Spec.new do |s|

s.platform = :tvos, "9.0"
#s.tvos.deployment_target = '9.0'
s.name = "VisualFocusGuides"
s.summary = "Extension to make tvOS Focus Guides visible."
s.requires_arc = true

s.version = "0.1.0"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "David Engelhardt" => "daengelhardt@gmail.com" }

s.homepage = "https://github.com/davidengelhardt/VisualFocusGuides"

s.source = { :git => "https://github.com/davidengelhardt/VisualFocusGuides.git", :tag => "#{s.version}"}

s.framework = "UIKit"

s.source_files = "VisualFocusGuides/**/*.{swift,h,m}"

#s.resources = "VisualFocusGuides/**/*.{png,jpeg,jpg,storyboard,xib}"

end