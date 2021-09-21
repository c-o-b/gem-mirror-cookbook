#
# Cookbook:: gem-mirror
# Recipe:: server
#
# Copyright:: 2019, The Authors, All Rights Reserved.


# all-datacenter-attributes::_repos should contain data like:
# 
# node.run_state['_repos'] = { 
#   'rubygems' => { 
#     node['hostname'] => {
#       'gemlist' => { [
#          ['gem-mirror'],		 # this could be a name=>verSpec but we
#          ['bundler','< 2'],		 # didn't put in the '>0' default
#          ['public_suffix', '= 2.0.5'], # because we're dumb.  Until then
#          ['psych'],			 # we have this array-of-arrays
#        ] }
#     }
#   }
# }

# default['_repos']['rubygems']['local_mirrors'] = {
#   %w(host1 host2) => 
#   node.run_state['_repos']['rubygems']['config'] = {  # marker for later migration
#     'ssl' => false,	# need to shovel local certs into place
#     'urldir' => 'gems', # will get slashy delimiters
#     'gemlist' => [
#                   ['gem-mirror'],
#                   ['bundler','< 2'],['public_suffix', '= 2.0.5'],['psych'],
#                  ],
#     'disk' => {
#       'size' => '10g',          # for lvm
#       'vg' => 'gems_vg',        # for lvm
#       'lv' => 'repo ',          # for lvm
#     },
#   }
# }

include_attribute 'all-datacenter-attributes::_repos'
