# -*- coding: utf-8 -*-
"""
Created on Fri Nov 22 12:52:03 2019

@author: Brian
"""

def convert_csv_to_fas(input_file, output_file):
    with open(input_file) as read_file:
        with open(output_file, "w") as write_file:
            headerLine = read_file.readline()
            headerLine_list = headerLine.rstrip("\n").split(",")
            header_list = []
            
            for i in headerLine_list:
                i = i.replace("ï»¿", "")
                header_list.append(i)
            seq_index = header_list.index("Sequence")
            genus_index = header_list.index("Genus")
            spec_index = header_list.index("Species")
            DNA_num_index = header_list.index("DNA Number  - BRY")
            fasta_string = ""
    
                
            
            for line in read_file:
                line_list = line.rstrip("\n").split(",")
                
                
                #for i in range(4):
                genus_string = line_list[genus_index]
                seq_string = line_list[seq_index]
                DNA_num_string = line_list[DNA_num_index]
                spec_string = line_list[spec_index]
                fasta_string = ">" + genus_string + "_" + spec_string + "_" + DNA_num_string + "\n" + seq_string + "\n" + "\n"
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
    
#convert_csv_to_fas("candelariella_11Dec2019v2.csv", "candelariella_11Dec2019v2.fas")
#convert_csv_to_fas("dnaReferenceLibraryAcarosporaceae.csv", "dnaReferenceLibraryAcarosporaceae.fas")
#convert_csv_to_fas("dnaReferenceLibrary_aspicilia.csv", "dnaReferenceLibrary_aspicilia.fas")
convert_csv_to_fas("part2_physciaceaeOthers.phy.csv", "part2_physciaceaeOthers.phy.fas")
