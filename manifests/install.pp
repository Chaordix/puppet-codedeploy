# Install the CodeDeploy package
class codedeploy::install inherits codedeploy {
  case $::operatingsystem {
    'Ubuntu': {
      exec { 'download_codedeploy-agent':
        command => "/usr/bin/wget -N https://aws-codedeploy-${::region}.s3.amazonaws.com/latest/install -O /opt/codedeploy-install.sh",
        path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
        creates => '/opt/codedeploy-install.sh',
      } ~>
      file { '/opt/codedeploy-install.sh':
        mode => '0755',
      } ~>
      exec { 'install_codedeploy-agent':
        command => '/opt/codedeploy-install.sh',
        path    => '/sbin:/bin:/usr/bin:/usr/local/bin:/usr/sbin',
        refreshonly => true,
      }
    }
    default: { fail("The ${module_name} module is not supported on ${::osfamily}/${::operatingsystem}.") }
  }
}

