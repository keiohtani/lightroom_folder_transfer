# Lightroom Folder Transfer

Adobe Lightroom by default stores photos in this structure. 
- folder location
  * year
    + date
      + photos

This scripts moves pictures from the old location to a new location keeping the folder structure. 

### Before
- old folder location
  * year
    + date
      + photos

### After
- new folder location
  * year
    + date
      + photos

After manupilating file locations, Lightroom would not be able to locate the pictures, but you can easily fix this issue by updating the folder location in Lightroom.

## How to use the scripts

- Get the script.
```
git clone https://github.com/keiohtani/lightroom_folder_transfer.git
```

- Specify the origin folder and the target folder in the script.
```
origin_dir=/Volumes/YOUR_OLD_VOLUME
target_dir=/Volumes/YOUR_NEW_VOLUME
```

- Run the script. The command takes the year as the argument. 
```
sh move_folders.sh YEAR
```
