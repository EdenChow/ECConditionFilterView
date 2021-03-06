Pod::Spec.new do |s|
s.name        = 'ECConditionFilterView'
s.version     = '0.0.1'
s.authors     = { 'EdenChow' => '334186564@qq.com' }
s.homepage    = 'https://github.com/EdenChow/ECConditionFilterView.git'
s.summary     = 'a dropdown menu for ios like wechat homepage.'
s.source      = { :git => 'https://github.com/EdenChow/ECConditionFilterView.git',
:tag => '0.0.1' }
s.license     = { :type => "MIT", :file => "LICENSE" }

s.platform = :ios, '9.0'
s.requires_arc = true
s.source_files = 'Classes/*.{h,m}'
s.public_header_files = 'Classes/*.{h,m}'

s.ios.deployment_target = '9.0'
end