import sys
import re


def main():
    argv_len = len(sys.argv)

    if(argv_len != 2):
        assert "Usage: python3 main.py <file name> <out file>\n"
    
    file_name = sys.argv[1]
    out_file = sys.argv[2]

    with open(file_name,'r') as f:
        wf = open(out_file,'wt')
        num=0
        for t_line in f:
            if(t_line == None):
                continue
            if(len(t_line) == 1):
                continue
            line = t_line[0:len(t_line)-1]
            strr = re.split(r'[;,\s]\s*', line.lower())
            try:
                if(len(strr[2]) != 8):
                    continue
                num = num + 1
                print(strr[2]+' '+str(num))
                for i in range(1,5):
                    byte = strr[2][8-i*2:8-2*(i-1)]
                    print(byte,file=wf)
            except:
                pass
        wf.close


if __name__ == '__main__': main()