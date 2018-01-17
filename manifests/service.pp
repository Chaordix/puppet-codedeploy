# Ensure CodeDeploy service is running.
class codedeploy::service inherits codedeploy {
  case $::operatingsystem {
    'Ubuntu': {
      service { 'codedeploy-agent':
        ensure => running,
        name => 'codedeploy-agent',
      }
    }
    default: { fail("The ${module_name} module is not supported on ${::osfamily}/${::operatingsystem}.") }
  }
}

