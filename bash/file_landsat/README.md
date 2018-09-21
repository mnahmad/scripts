This scripts calculate total number of images for landsat 8 for a specific pathrows.

The files are 

1. landsatrowpath.csv  = contains specific row path (in our case africa)
2. ls_on_date.csv = the output of the script on a specific date. The output looks like the one below (showing rowpath and the total number of landsat seen for that rowpath)

```
159052 
    "total": 30, 
159053 
159054 
160052 
    "total": 37, 
160053 
    "total": 36, 
160054 
160055 
160056 
160057 
160058 
161051 
    "total": 40, 
161052 
    "total": 40, 
161053 
    "total": 43, 
161054 
    "total": 39, 
161055 
    "total": 37, 
161056 
    "total": 32, 
161057 
161058 
161059 
162051 
    "total": 35, 
162052 
    "total": 40, 
162053 
    "total": 38, 
162054 
    "total": 40, 
162055 
    "total": 38, 
162056 
    "total": 29, 
162057 
    "total": 29, 
162058 
    "total": 31, 
162059 
162060 
163051 
    "total": 38, 
163052 
    "total": 41, 
163053 
    "total": 41, 
163054 
    "total": 34, 
163055 
    "total": 35, 
163056 
    "total": 35, 
163057 
    "total": 27, 
163058 
    "total": 17, 
163059 
    "total": 34, 
163060 
163061 
163062 
163068 
    "total": 27, 

```


3. total.csv = a cleaned version of ls_on_date.csv
4. total.csvt = csvt file to be used for GIS styling etc. 


 

