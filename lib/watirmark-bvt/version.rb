module Watirmark
  module BVT
    module VERSION
      NAME = 'watirmark_bvt'
      STRING = '1.1'
      CODENAME = ''
      SUMMARY = "#{NAME}-#{STRING} (#{CODENAME})"
    end
    DEPENDENCIES = [
      ['json', "~>1"],
      ['rest-client', "~>1"],
    ]
  end
end