# Section 1

## Steps

- Split the name field into first_name, and last_name
- Remove any zeros prepended to the price field
- Delete any rows which do not have a name
- Create a new field named above_100, which is true if the price is strictly greater than 100

- Cron job should take a python file and run it scheduled 1am

## Files

- raw_data folder : contains original csv files
- processed_data folder : contains processed csv files
- process.ipynb : notebook used to process data

## Cron job steps
```
@daily is 0 1 * * * --> minute | hour | day (month) | month | day (week)

In the vi editor, switch to insert mode (press i to edit the file) and add this command to execute the python script with the process function

0 1 * * * /usr/bin/python /path/to/file/<FILENAME>.oy /path/to/file/<FILENAME>.log
So in this case, the command is --> 0 1 * * * python process.py dataframe_path_1 dataframe_path_2
    
After writing the crontab, press esc to exit edit mode
    
Write :wq to write crontab
```
