# verilog module extractor
# seperate every single module within a single verilog file

import re
import os
import sys

curr_path =  '/home/cyril/workspace/riscv/mycpu/scripts/extract_verilog_module/'
output_path = curr_path+'output/'

def main():
    os.system('rm '+output_path+'*')
    input_file = sys.argv[1]
    print(input_file)
    with open(curr_path + '/' + input_file, 'rt') as f:
        find_module = False
        find_endmodule = False
        module_name = ''
        wf = None
        lf = open(curr_path+'log.txt', 'wt')
        module_count = 0
        line_num = 1
        for line in f:
            if(line.count('module') != 0 and find_module == False):
                find_module = True
                module_name = re.split(r'[;,\s(]\s*',line)[1]
                module_count = module_count + 1
                strr = '['+str(module_count)+'] find module => '+module_name + ' in line ' + str(line_num)
                # print(strr)
                print(strr, file=lf)
                # file_name = output_path+str(module_count)+'_'+module_name+'.v'
                file_name = output_path+module_name+'.v'
                wf = open(file_name,'wt')
            
            if(line.count('endmodule') != 0):
                find_endmodule = True

            if(find_module == True):
                print(line,end='',file=wf)
                temp_line = re.split(r'[;,\s]\s*',line)
                if(temp_line.count('(') == 1 and temp_line.count(')') == 0):
                    # print(temp_line)
                    # strr = '\tfind submodule => ('+temp_line[1] +')\t('+ temp_line[2] +') in line ['+str(line_num)+']'
                    strr = '\tfind submodule => module_name:( %-*s)  inst_name:( %-*s) in line [ %-*s ]'%(20,temp_line[1],20,temp_line[2],6,str(line_num))
                    # print(strr)
                    print(strr, file=lf)
                
            if(find_endmodule == True):
                find_module = False
                find_endmodule = False
                strr = module_name+' done!' + ' in line ' + str(line_num) + '\n'
                # print(strr)
                print(strr,file=lf)
                try:
                    wf.close()
                except:
                    pass
            line_num = line_num + 1
        lf.close()
        # os.system('rm '+output_path+'.v')


if __name__ == '__main__': main()
