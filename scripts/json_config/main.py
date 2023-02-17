#!/bin/python3
import json
import os
import sys
from pprint import pprint

prj_dir = "/home/cyril/workspace/riscv/mycpu"

init_data = {
    "test_case_num" : 0,
}

case_info = {
    "name": "xori",
    "dir": prj_dir + "/test/rv32i/build"
}

file_name = 'test_case_cfg.json'

def main():
    for arg in sys.argv:
        print(arg)
    
    # init json file
    if sys.argv[1] == '-i':
        with open(file_name, 'w') as f:
            json.dump(init_data,f,indent=4)

    # append test case
    test_case_num = 0
    try:
        with open(file_name,'r') as f:
            data = json.load(f)
            test_case_num = data["test_case_num"]
    except:
        print(file_name + " not exsist! create a new json file")
        with open(file_name, 'w') as f:
            json.dump(init_data,f,indent=4)
    
    if sys.argv[1] == '-a':
        name = sys.argv[2]
        dir = sys.argv[3]
        try:
            err_code = sys.argv[4]
        except:
            err_code = None
        data = None
        with open(file_name,'r') as f:
            data = json.load(f)
        data["test_case_num"] = test_case_num + 1
        data.update({str(data["test_case_num"]):{"name":name,"dir":dir,"err_code":int(err_code)}})
        print(data)
        with open(file_name,'w') as f:
            json.dump(data,f,indent=4)


if __name__ == '__main__': main()