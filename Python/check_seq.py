# -*- coding: utf-8 -*-
"""
Created on Tue Mar 10 01:52:01 2020

@author: Brian Colgrove
"""
import re
def check_seq(original_file, edited_file):
    with open(original_file) as read_file:
        with open(edited_file) as read_file2:
            headerLine2 = read_file2.readline()
            headerLine = read_file.readline()
            count = 0
            headerLine_list = headerLine2.rstrip("\n").split(",")
            header_list = []
            
            for i in headerLine_list:
                i = i.replace("ï»¿", "")
                header_list.append(i)
            seq_index = header_list.index("Sequence")
            genus_index = header_list.index("Genus")
            spec_index = header_list.index("Species")
            DNA_num_index = header_list.index("DNA Number  - BRY")
            fasta_string = ""
    
            org_dic = {}
            org_list = []
            #print(headerLine_list)
            for line in read_file:
                line_list = line.rstrip("\n").split("\t")
                #print(line_list)
                #print(line_list[0])
                #print(line_list[0].split("_"))
                lichen_list = line_list[0].split("_")
                
                print(lichen_list)
                #Split before re.search
                
                for i in lichen_list:
                    if re.search(r"\_", i):
                        i = i.replace(".its", "")
#                        line_list[0]=i
                        org_dic[i] = line_list[1]
                        org_list.append([i, line_list[1]])
                    elif re.search(r"\d\d+", i):
                        #print(i)
                        count = count +1
                        i = i.replace(".its", "")
#                        line_list[0]=i
                        org_dic[i] = line_list[1]

                        org_list.append([i, line_list[1]])

                       # print(i)
            #print("\n" + str(count))
                #print(line_list)
            #print(org_dic)
            #print(org_list)
                
            seq_dic = {}

            for line in read_file2:
                seq_list = line.rstrip("\n").split(",")
                DNA_number = seq_list[DNA_num_index]
                
                seq_dic[seq_list[DNA_num_index]] = seq_list[seq_index]

                #print(DNA_number)
            #print(seq_dic)

            for value in seq_dic:
                if value in org_dic:
                    if seq_dic[value] == org_dic[value]:
                        continue
                    else:
                        #continue  
                        print("\nThe following DNA number and sequence do not match:")
                        print(org_list.index([value, org_dic[value]])+2)

                        print(value)
                        print(org_dic[value])
                        
                else:
                    print("\nThe following DNA Number is not found in the original data set:\n" + str(value) + "\n")
                    continue
            #print(seq_dic == org_dic)
            #print(org_list)

        #print(seq_dic["Haikonen21103"])
        #print(org_dic["Haikonen21103"])
        #for value in org_dic[value]:
         #   if value == "Otnyukova_7_24_97":
          #      print(True)
        #org_dic["Otnyukova_7_24_97"]
        #for value in org_dic:
        #    print(value)
        
        
        #print(org_dic)
        #print(org_dic["97"])
        return

#check_seq("part1_physcia (1).phy", "part1_physcia.phy.csv")
check_seq("part2_physciaceaeOthers.phy", "part2_physciaceaeOthers.phy.csv")