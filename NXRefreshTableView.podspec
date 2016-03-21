Pod::Spec.new do |s|
  s.name         = 'NXRefreshTableView'
  s.version      = '0.1.0'
  s.summary      = '带上啦加载，下啦刷新的TableView'
  s.homepage     = 'https://git.coding.net/nightx/NXRefreshTableView.git'
  s.license      = 'MIT'
  s.author             = { 'nightx' => 'qufeng33@hotmail.com' }
  s.platform     = :ios, '7.0'
  s.source       = { :git => 'https://git.coding.net/nightx/NXRefreshTableView.git', :tag => s.version }
  s.source_files  = 'NXRefreshTableView'
  s.requires_arc = true
  s.dependency 'TPKeyboardAvoiding'
  s.dependency 'MJRefresh'
  s.dependency 'DZNEmptyDataSet'
end