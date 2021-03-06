# Class: codedeploy
# ===========================
#
# Download and install the AWS CodeDeploy agent.
#
# Authors
# -------
#
# Todd Courtnage <todd@chaordix.com >
#
# Copyright
# ---------
#
# Copyright 2016 Todd Courtnage
#
class codedeploy {
  include codedeploy::params

  include codedeploy::install
  include codedeploy::service
}
