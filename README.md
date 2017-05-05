# Luxloop Unity Boilerplate

This project is pre-set up to be tracked via git, using git LFS to track assets.

Make sure you have LFS installed (you only have to do this once per machine, not per project): 
* `brew install git-lfs` or download and install the binary from [here](https://github.com/git-lfs/git-lfs/releases/download/v2.0.2/git-lfs-darwin-amd64-2.0.2.tar.gz)

## How to Use
* From the repo's root directory, run `./setup.sh YOUR_NEW_PROJECT_NAME`.

### Manually
* Rename the folder `LuxloopUnityBoilerplate` to whatever you want your project to be called and run `git remote rm origin` to remove the boilerplate repo. Don't forget to `git remote add` a remote later.
*  Go to `Edit > Project Settings > Player` and change the `Product Name` to the name of your project.

_(Optional) Finally, in the `Services` tab, create a new `Unity Project ID` for this project_

## Adding Filetypes to LFS
Currently, LFS handles the following file extensions:
* .jpg/.jpg
* .psd
* .png
* .tiff/tiff
* .ogg
* .stl
* .obj
* .mov
* .mp4
* .fbx
* .mp3
* .m4a
* .bin
* .skp
* .tga

If you need to include a binary filetype that is not in the list above, make sure to run `git lfs track "*.xxx"` **before** you commit it to your repo.

## Using SublimeText3 Instead of MonoDevelop
This repo comes with a pre-configured sublime-project file. If you didn't use the init script, make sure to change the name
of the `"solution_file:"` key to the name of your projects .sln file.

To configure ST3 to make C# development for Unity easier, follow the instructions [here](https://www.youtube.com/watch?v=z7na1MuMDRg).
