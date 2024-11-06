import sys
import os
from os import path

sys.path.append(path.abspath('./'))

commands = {

    #Android
    "-android": "robot -d ./logs -v device:android ./src/test",
   
    #Browserstack
    "-browserstack-android": "robot -d ./logs -v device:browserstack-android ./src/test",
    "-browserstack-wip-android": "robot -d ./logs -i Wip -v device:browserstack-android ./src/test",
       
    #Ios
    "-ios": "robot -d ./logs -v device:ios ./src/test",

    #Browserstack
    "-browserstack-ios": "robot -d ./logs -v device:browserstack-ios ./src/test",
    "-browserstack-wip-ios": "robot -d ./logs -i Wip -v device:browserstack-ios ./src/test",

}

for param in sys.argv[1:]:
    if param in commands:
        command = commands[param]
    else :
        print(f"Parâmetro inválido ou inexistente: {param}")

os.system(command)