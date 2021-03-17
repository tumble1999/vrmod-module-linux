# GarrysMod VRMod Linux Port
Original repository: https://github.com/catsethecat/vrmod-module

**THIS IS UNFINSIHED DO NOT ATTEMPT TO INSTALL**

This is a wip linux port of the gmod vrmod created by @catsethecat.

Progress: Not Started

Required Packages: wget
## Building
### Prerequisites
* Debian: ```sudo apt install build-essentials cmake wget libopenvr-dev libglew-dev```
* Arch: ```sudo pacman -S base-devel cmake wget openvr glew```
### Build
```
chmod +x ./build.sh
./build.sh
```

## TODO
- [x] Convert batch Scripts
- [x] Move to CMake
- [x] Research for required devevlopment librarue
- [x] Get Linux requivalents of dlls
- [ ] Learn Gmod Module api and DirectX


## Old README
```
his module adds some Lua functions to provide basic OpenVR support to Garry's Mod.

To install or update the module, open the "install" folder and read "INSTALLATION.txt"

#######################################################################################
# Lua functions
#######################################################################################

Function: number vrmod.GetVersion()
Description: Returns the module version

Function: boolean vrmod.IsHMDPresent()
Description: Returns true if a VR headset is connected

Function: vrmod.Init()
Description: Starts OpenVR and performs some initialization.
This must be called successfully before using any of the functions listed below.
You must call vrmod.Shutdown() before calling this again.

Function: vrmod.Shutdown()
Description: Shuts down OpenVR and performs some clean up.
You must not call any of the functions listed below until you successfully run
vrmod.Init() again.

Function: vrmod.SetActionManifest( string fileName )
Description: Sets the specified file as the action manifest.
Path is relative to garrysmod/data/.
This should be called only once between init/shutdown.

Function: vrmod.SetActiveActionSets( string actionSetName, ... )
Description: Makes the given action sets currently active.

Function: table vrmod.GetDisplayInfo( number nearZ, number farZ )
Description: Returns the following table of information:
{
  table ProjectionLeft, --Left eye projection matrix as 2D table [row][col]
  table ProjectionRight,
  table TransformLeft, --Left eye transform matrix
  table TransformRight,
  number RecommendedWidth, --Recommended render target resolution (per eye)
  number RecommendedHeight,
}

Function: vrmod.ShareTextureBegin()
Description: After calling this function, the next texture that is created in the game
will be shared with the module. You should create a new texture (using GetRenderTarget
for example) immediately after calling this function. This should be called only once
between init/shutdown.

Function: vrmod.ShareTextureFinish()
Description: This must be called after creating a texture to finish the texture sharing
process. This should be called only once between init/shutdown.

Function: vrmod.UpdatePosesAndActions()
Description: This should be called once per frame to update the poses and actions
which you can then use to render with.
This function is also responsible for syncing the fps to the headsets refresh rate.

Function: table vrmod.GetPoses()
Description: Returns a table of poses. The hmd pose is automatically included, the
rest are defined by the action manifest.
{
  hmd = {
    vector pos,
    vector vel,
    angle ang,
    angle angvel,
  },
  ...
}

Function: table, table vrmod.GetActions()
Description: Returns a table of actions (defined by the action manifest) and their states.
The second table only includes boolean actions that changed state from the previous call.
It could look something like this:
{
  boolean boolean_example,
  number vector1_example,
  vector2_example = {
    number x,
    number y,
  }
  skeleton_example {
    table fingerCurls = {
      number 1
      number 2
      number 3
      number 4
      number 5
    }
  }
}

Function: vrmod.SetSubmitTextureBounds( uMinLeft, vMinLeft, uMaxLeft, vMaxLeft, 
  uMinRight, vMinRight, uMaxRight, vMaxRight )
Description: Sets UV coordinates to use for the left/right eye areas of the shared
texture

Function: vrmod.SubmitSharedTexture()
Description: Submits the shared texture to the VR Compositor. This should be called
once per frame, after you have rendered to / updated the shared texture.

Function: vrmod.TriggerHaptic( string actionName, number delay, number duration,
  number frequency, number amplitude )
Description: Triggers the specified vibration action (defined by the action manifest)
using the given parameters.

Function: table vrmod.GetTrackedDeviceNames()
Description: returns a sequential numerical indexed table with names of all connected
tracked devices. For example:
{
  1 = "indexhmd"
  2 = "knuckles"
  3 = "knuckles"
}

#######################################################################################
# Compiling
#######################################################################################

To compile the module yourself:
step 1: have Visual Studio installed
step 2: make sure the path to vcvarsall is correct inside build.bat
step 3: run build.bat

#######################################################################################
# Credits / Special Thanks
#######################################################################################

-UselessGhost (https://steamcommunity.com/id/UselessGhost)
For sharing tips and the their gmod vr project
(https://bitbucket.org/uselessghost/gmcl_openvr)
-willox (https://github.com/willox)
For updating gmod which has made VR work better, as well as providing solutions for
some other issues
```


## External Resources
- https://github.com/catsethecat/vrmod-module
- https://github.com/Facepunch/gmod-module-base
- https://github.com/ValveSoftware/openvr