container_port=80
targetgroup_name="<+serviceVariables.containername>-tg"
VpcId="<+serviceVariables.VpcId>"
listenerArn="<+serviceVariables.listenerArn"
priorityNumber="<+serviceVariables.PriorityNumber>"
pathName="/<+serviceVariables.path>"
region="<+serviceVariables.region>"
