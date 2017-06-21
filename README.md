# Build-opencv-for-android (Depreciated)

An interactive script to download and build opencv and opencv_contrib for android

### Requirements
 - Python >=2.4
 - CMake >=2.8

### Installation
```sh
$ git clone https://github.com/tzutalin/build-opencv-for-android.git
$ cd build-opencv-for-android
$ ./setup.sh 3.1.0
```
By default, it will download opencv and opencv_contrib with 3.1.0 version. You can specify the version when executing ./setup.sh

Extract and export your android path which is downloaded under ./android-ndk-downloader

`$ export [ANDROID_NDK_PATH]`

Build it

```sh
$ ./build-android-opencv.sh
```

The final library will be located in android_lib folder

### Liecnese
Copyright (c) 2016 Tzutalin
Create by TzuTaLin <tzu.ta.lin@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
