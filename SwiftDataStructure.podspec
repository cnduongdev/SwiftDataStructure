Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "SwiftDataStructure"
s.summary = "SwiftDataStructure lets a user used data structure in Swift"
s.requires_arc = true

# 2
s.version = "0.0.2"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "duongcn" => "duongcn.dev@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/cnduongdev/SwiftDataStructure.git"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/cnduongdev/SwiftDataStructure.git",
             :tag => "#{s.version}" }

# 7
s.source_files = "SwiftDataStructure/**/*.{swift}"

# 8
s.swift_version = "5.0"

end
