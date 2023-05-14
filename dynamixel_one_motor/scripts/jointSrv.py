"""
Allows to use the service dynamixel_command 
"""
import sys
import rospy
import time
from std_msgs.msg import String
from dynamixel_workbench_msgs.srv import DynamixelCommand


__author__ = "F Gonzalez, S Realpe, JM Fajardo"
__credits__ = ["Felipe Gonzalez", "Sebastian Realpe", "Jose Manuel Fajardo", "Robotis"]
__email__ = "fegonzalezro@unal.edu.co"
__status__ = "Test"
Torques=[500,500,500,500,500]
G1=int(sys.argv[1])
G2=int(sys.argv[2])
G3=int(sys.argv[3])
G4=int(sys.argv[4])
Deg1=[G1, G2, G3, G4, 512]
def jointCommand(command, id_num, addr_name, value, time):
    #rospy.init_node('joint_node', anonymous=False)
    rospy.wait_for_service('dynamixel_workbench/dynamixel_command')
    try:        
        dynamixel_command = rospy.ServiceProxy('/dynamixel_workbench/dynamixel_command', DynamixelCommand)
        result = dynamixel_command(command,id_num,addr_name,value)
        rospy.sleep(time)
        return result.comm_result
    except rospy.ServiceException as exc:
        print(str(exc))

if __name__ == '__main__':
    try:
        for i in range(5):    
            jointCommand('', (i+1), 'Torque_Limit', Torques[i], 0)
        #Rutina para ir al home.
        print('Ir a home\n')
        for i in range(5):
            jointCommand('', (i+1), 'Goal_Position', Deg1[i], 1)
            print('Moviento eslabon: '+str(i+1)+'\n')
            time.sleep(0.5)
        print('En home\n')
    except rospy.ROSInterruptException:
        pass