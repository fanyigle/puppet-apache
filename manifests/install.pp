# @summary
#  Installs Base Apache
# 
#
#
#
class apache::install {
  package { 'httpd':
    ensure => present,
  }  
}
