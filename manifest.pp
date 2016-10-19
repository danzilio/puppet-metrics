class foo {
  $var1 = 'val1'
  $var2 = 'val2'

  resource { 'name': }
  $var3 = function1('foo')

  $var4 = true or false

  case $facts['os']['name'] {
    'Solaris':           { include role::solaris }
    'RedHat', 'CentOS':  { include role::redhat  }
    /^(Debian|Ubuntu)$/: { include role::debian  }
    default:             { include role::generic }
  }

  $rootgroup = $facts['os']['family'] ? {
    'Solaris'          => 'wheel',
    /(Darwin|FreeBSD)/ => 'wheel',
    default            => 'root',
  }

  file { '/etc/passwd':
    ensure => file,
    owner  => 'root',
    group  => $rootgroup,
  }

  unless $facts['memory']['system']['totalbytes'] > 1073741824 {
    $maxclient = 500
  }
}
