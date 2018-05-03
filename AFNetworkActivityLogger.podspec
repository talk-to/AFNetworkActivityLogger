Pod::Spec.new do |s|
  s.name     = 'AFNetworkActivityLogger'
  s.version  = '2.0.4-private-spec'
  s.license  = 'MIT'
  s.summary  = 'AFNetworking 2.0 Extension for Network Request Logging'
  s.homepage = 'https://github.com/talk-to/AFNetworkActivityLogger'
  s.authors  = { 'Mattt Thompson' => 'm@mattt.me' }
  s.source   = { :git => 'https://github.com/talk-to/AFNetworkActivityLogger.git', :tag => "#{s.version}" }
  s.source_files = [ 'AFNetworkActivityLogger/*.{h,m}',
                     'AFNetworkingWrapper/*.{h,m}' ]
  s.requires_arc = true
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'

  s.dependency 'AFNetworking', '~> 2.0'
end
