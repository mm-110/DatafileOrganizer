import os
import sys
import shutil

from mgmt_text import split_string_and_get_value_from_index

def organize_folder(folderpath: str, sep: str, index: str):
    """ Organize files in the specified folder by creating subfolders based on extracted indices.
    
    Steps: 
    1. Take all files from folderpath. 
    2. Extract all indices by name. 
    3. Get unique values. 
    4. For every unique value, create a subfolder named value. 
    5. Put inside the subfolder all files containing value as an index.
    
    Use this when you want create substructure of a folder path based on rule on file names. 
    """
    
    # Step 1: Take all files from folderpath
    try:
        files = [f for f in os.listdir(folderpath) if os.path.isfile(os.path.join(folderpath, f))]
        print(f"Files: {files}")
    except Exception as e:
        print(f"Error reading files in directory: {e}")
        return False

    # Step 2: Extract all indices by name
    try:
        indices = [split_string_and_get_value_from_index(file, sep, int(index)) for file in files]
        print(f"Indices: {indices}")
    except Exception as e:
        print(f"Error extracting indices: {e}")
        return False

    # Step 3: Get unique values
    unique_indices = set(indices)
    print(f"Unique indices: {unique_indices}")

    # Step 4 & 5: For every unique value, create a subfolder named value and move files
    try:
        for i in unique_indices:
            subfolder_path = os.path.join(folderpath, i)
            os.makedirs(subfolder_path, exist_ok=True)
            for file in files:
                if i == split_string_and_get_value_from_index(file, sep, int(index)):
                    shutil.move(os.path.join(folderpath, file), subfolder_path)
    except Exception as e:
        print(f"Error organizing files: {e}")
        return False

    print("Folder organized successfully")
    return True

if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("Usage: python script.py <folderpath> <separator> <index>")
        sys.exit(1)

    folder_path = sys.argv[1]
    sep = sys.argv[2]
    index = sys.argv[3]

    success = organize_folder(folderpath=folder_path, sep=sep, index=index)
    if success:
        print("Script completed successfully")
    else:
        print("Script encountered errors")
