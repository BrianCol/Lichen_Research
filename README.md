# Lichen_Research
Before you start using this repository, please read the following.

### Note
The images dispalyed as part of this README.md file are not one to one. They are a basic overview of what you should be doing. The names of the urls and computers names displayed in the terminal will not be the same. 

## The files
There are 3 files ‘csv’ files that contain all the data. They are genbank.csv, tle.csv, and working.csv. As denoted by their names, each file corresponds to either the genbank data, tle data or the working data. There are also 3 R scripts intended to produce graphs of either the world destiny or the United States destiny for each ‘csv’ file. The R scripts are genbank_graphs.R, tle_graphs.R, working_graphs.R. Each R script has two functions that will produce a jpg saved to wherever dictionary—also known as a file—you have cloned the github repository into. The functions in the R scripts are gen_world_map and gen_states_map for the genbank.csv, tle_world_map and tle_states_map for the tle.csv, and working_world_map and working_states_map for the working.csv. You can click on the “view code” button the see the raw R code. 

## How to move forward?
Now that you know what the 'csv' files, R scripts, and functions are, you will now need to know how to implement them. First off, you need to access them through github.
If you have a Apple computer or a computer running on Linux, you’ll need you open your terminal. Go to your search bar and type terminal. For those using Windows, I would recommend downloading gitbash for your computer. Gitbash performs like a Linux terminal, but it can run on a Windows operating system. There are other options including WSL, virutal box, and others. You may look into this other options you desire to. 

### Apple terminal
![alt text](https://www.wikihow.com/images/9/95/Open-a-Terminal-Window-in-Mac-Step-7-Version-3.jpg)
![alt text](https://eshop.macsales.com/blog/wp-content/uploads/2016/12/DefaultTerminal1280.jpg)

### Linux terminal
![alt text](https://www.howtogeek.com/wp-content/uploads/2013/03/launch-terminal-on-ubuntu.png?trim=1,1&bg-color=000&pad=1,1)
![alt text](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/optimized/2X/b/ba76cbf3dc8dc2cc94d26dd61c7aad3cedcd5102_2_690x300.png)

## Gitbash for Windows
![alt text](https://www.stanleyulili.com/assets/images/posts/2019-08-13-install-git-bash/download-starting.jpg)
![alt text](https://www.stanleyulili.com/assets/images/posts/2019-08-13-install-git-bash/git-bash.jpg)


## Cloning the github repository
First move in where you want the repository to be stored on your local device. Used commands pwd to "print your working directory" and cd to "change pyour current directory". If you want to copy the repository in your documents folder, simply type "cd Documents" in your command line. If you ever want to go back one directory, type "cd .." in the command line. Now that you are located in your desired directory, do the following: Copy the github repository from github. Then in your terminal type "git clone" then your copied repsoitory url on the same command line. 
![alt text](https://i.stack.imgur.com/lQFbj.gif)
![alt text](https://d17h27t6h515a5.cloudfront.net/topher/2017/January/588bba64_ud123-l2-git-clone/ud123-l2-git-clone.gif)

## What's next?
Now that you have all the files from the github repository, you can use the R scripts to produce your graphs from the data. Simply open up Rstudio or R, then open the file that you want. Run the code in the file. Type your desired function (remember its the name_of_the_data followed by world_map or states_map) in the console. Once you have ran the function, the graph will be saved to your folder. 
