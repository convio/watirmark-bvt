lib_dir = File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH.unshift File.expand_path(lib_dir)
require 'watirmark-bvt'
require 'rspec/autorun'
