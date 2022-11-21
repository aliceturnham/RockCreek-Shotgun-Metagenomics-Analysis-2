#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul 12 22:22:27 2021

@author: yuezhang
"""

import os
import sys
# path to the CLEAN_READS dir
in_file=sys.argv[1]
nfile=sys.argv[2]
#in_file='/Volumes/microbiome/chesapeake_bay_paper/spreheim/scaffolds_tmp.fasta'
#nfile=40

directory = in_file[0:in_file.rfind('/')+1] + 'splitted_scaffolds/'
os.makedirs(directory)
assert os.path.exists(in_file)

# default setting break the fasta file down to 48 individual files where each file has the same amount of base-pairs

len_list = []
node_list = []
count = 0
for line in open(in_file):
        if line[0]!=">":
                continue
        else:
            node_list.append(line.rstrip().split("_")[1])
            len_list.append(int(line.rstrip().split("_")[3]))
            count += int(line.rstrip().split("_")[3])

bp_per_file = count/int(nfile)


breakposition= []
cumulative_len = 0
new_file = True
for i in range(len(len_list)):
    if len_list[i] >= bp_per_file:
        print('1')
        breakposition.append(node_list[i])

    else: 
        
        cumulative_len += len_list[i]
        print(cumulative_len)
        if new_file == True:
            breakposition.append(node_list[i])
            new_file = False
            print(new_file)
        else:
            if cumulative_len >= bp_per_file:
                breakposition.append(node_list[i])
                cumulative_len = len_list[i]
            else:
                continue

breakposition = breakposition + ['end']

    
filenames=[]
for i in range(1,len(breakposition)):
    filenames.append('scaffords_chunck_' + str(i) + '.fasta')

i = 0

for line in open(in_file):
    if line.startswith(">") == False:
        with open(directory+filenames[i-1], "a") as f:
            f.write(line)
    else:
        if line.find(line.rstrip().split("_")[0] + '_' + str(breakposition[i])) != -1:
            with open(directory+filenames[i], "a") as f:
                f.write(line)
            if i != len(node_list)-1:
                
                percentage_finished = "{:.0%}".format(node_list.index(breakposition[i])/len(node_list))
                print(str(percentage_finished) +' done')
                
                i += 1
        
        elif line.find(line.rstrip().split("_")[0] + '_' + str(breakposition[i])) == -1:
            with open(directory+filenames[i-1], "a") as f:
                f.write(line)
    
print('100% done')
