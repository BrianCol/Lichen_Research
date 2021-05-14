# -*- coding: utf-8 -*-
"""
Created on Wed Sep 23 21:32:29 2020

@author: Brian Colgrove
"""



#Look at current working directory to check files
import os
wd = os.getcwd()
print(wd)

#change excel to csv
import pandas as pd

excel_file = "UNITEonly_mutlionly.xlsx"
read_file = pd.read_excel(r"UNITEonly_mutlionly.xlsx")
input_file = read_file.to_csv(r"UNITEonly_mutlionly.xlsx.csv", header = True)
output_file = "UNITEonly_mutlionly.xlsx.fas"

#excel_file = "trapeliaceae_12dec2019v1.phy.xlsx"
#read_file = pd.read_excel(r"trapeliaceae_12dec2019v1.phy.xlsx")
#input_file = read_file.to_csv(r"trapeliaceae_12dec2019v1.phy.csv", header = True)
#output_file = "trapeliaceae_12dec2019v1.phy.fas"

def convert_csv_to_fas(input_file, output_file):
    with open(input_file) as read_file:
        with open(output_file, "w") as write_file:
            headerLine = read_file.readline()
            headerLine_list = headerLine.rstrip("\n").split(",")
            header_list = []
            
            for i in headerLine_list:
                i = i.replace("ï»¿", "")
                header_list.append(i)
            seq_index = header_list.index("seed_sequence")
            genus_index = header_list.index("genus")
            spec_index = header_list.index("species")
            #DNA_num_index = header_list.index("DNA Number  - BRY")
            family_index = header_list.index("family")
            kingdom_index = header_list.index("kingdom")
            phylum_index = header_list.index("phylum")
            class_index = header_list.index("class")
            order_index = header_list.index("order")
            fasta_string = ""
    
                
            
            for line in read_file:
                line_list = line.rstrip("\n").split(",")
                
                
                #for i in range(4):
                genus_string = line_list[genus_index]
                seq_string = line_list[seq_index]
                #DNA_num_string = line_list[DNA_num_index]
                spec_string = line_list[spec_index]
                family_string = line_list[family_index]
                kingdom_string = line_list[kingdom_index]
                phylum_string = line_list[phylum_index]
                class_string = line_list[class_index]                
                order_string = line_list[order_index]               
                fasta_string = ">" + genus_string + "_" + spec_string + "|" + genus_string + "." + spec_string + "|" + "reps|" + "k_" + kingdom_string + ";p_" + phylum_string + ";c_" + class_string + ";o_" + order_string + ";f_" + family_string + ";g_" + genus_string + ";s_" + spec_string + "\n" + seq_string + "\n" + "\n"
                #if len(fasta_string) > 60:
                #    for i in range(round(len(fasta_string)/60),1):
                #        value = i * 60
                #        new_string = fasta_string[value:value+60] + "\n" + new_string + "\n"
                #        
                #        write_file.write(new_string)
                    

                write_file.write(fasta_string)
     
                print(fasta_string) 
                
       
                #print(line)
            return
convert_csv_to_fas("UNITEonly_mutlionly.xlsx.csv", "UNITEonly_mutlionly.xlsx.fas")
#convert_csv_to_fas("candelariella_11Dec2019v2.csv", "candelariella_11Dec2019v2.fas")
#convert_csv_to_fas("cladonia_11dec2019v1.csv", "cladonia_11dec2019v1.phy.fas")
#convert_csv_to_fas("dnaReferenceLibrary_aspicilia.csv", "dnaReferenceLibrary_aspicilia.fas")
            
#convert_csv_to_fas("part1_physcia.phy.csv", "part1_physcia.phy.csv.fas")
            
#convert_csv_to_fas("trapeliaceae_12dec2019v1.phy.csv", "trapeliaceae_12dec2019v1.phy.fas")