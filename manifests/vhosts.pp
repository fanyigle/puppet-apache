# @summary
#   This defined type leverages a vhost template to deploy files of apache
#
# @example
# apache::vhosts { 'namevar':
#   port      => INT,
#   subdomain => STR,
#   admin     => STR,
#   docroot   => STR,
define apache::vhosts (
  Integer $port,
  String[1] $subdomain,
  String  $admin,
  String[1] $docroot,
) {
  # handles the docroot dir's requirements
  file { "$docroot":
    ensure => 'directory',
    owner  => $apache::vhosts_owner,
    group  => $apache::vhosts_group,
  }    
  # creates os dependent vhosts conf file
  file { "${apache::vhosts_dir}/${subdomain}.conf":
    ensure => 'file',
    owner  => $apache::vhosts_owner,
    group  => $apache::vhosts_group,
    mode   => '0644',
    content => epp('apache/vhosts.conf.epp',{'port' => $port,'subdomain' => $subdomain,'admin' => $admin,'docroot' => $docroot}),
    notify => Service["${apache::service_name}"],

    
  }
}
