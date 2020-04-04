# @summary
#  Installs Base Apache on two os families
#
class apache::install {
  package { "$apache::install_name":
    ensure => $apache::install_ensure,
  }  
}
