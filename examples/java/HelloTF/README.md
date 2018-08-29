# Hello TensorFlow with Java

This is a simple exercise to verify some of the simplest [instructions for the Java Programming Language](https://www.tensorflow.org/install/install_java) on both Windows and WSL (Windows Subsystem for Linux) running Ubuntu 18.04.1 LTS.

## Structure of the folder

You will find the following in this folder:

```text
.
├── HelloTF.java
├── README.md
├── download.sh
├── jni
│   ├── LICENSE
│   ├── libtensorflow_framework.so
│   ├── libtensorflow_jni.so
│   └── tensorflow_jni.dll
└── libtensorflow-1.9.0.jar
```

`HelloTF.java` is copied directly from the aforementioned instructions web page.The `libtensorflow-1.9.0.jar` and corresponding native libraries for each OS are in `jni` folder.

`download.sh` contains a simple bash script that you can use to download JNI files for Linux/Mac OS X. For Windows, [use this](https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow_jni-cpu-windows-x86_64-1.9.0.zip) (version 1.9.0).

## Run the code

You can verify that the above works in two steps:

1. Compile `HelloTF.java` from the command line. You need to put `libtensorflow-1.9.0.jar` in your classpath. This is the same in both OSes.

    ```text
    javac -cp libtensorflow-1.9.0.jar HelloTF.java
    ```

2. Run/execute your program. The JVM will need the appropriate Java Native Interface (JNI) file for your operating system and processor support:

    ```powershell
    # Windows
    java -cp "libtensorflow-1.9.0.jar;." -D"java.library.path=./jni" HelloTF
    2018-08-29 15:26:52.294753: I tensorflow/core/platform/cpu_feature_guard.cc:141] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2
    Hello from 1.9.0
    ```

    ```bash
    # WSL / Ubuntu
    java -cp libtensorflow-1.9.0.jar:. -Djava.library.path=./jni HelloTF
    2018-08-29 15:36:53.277527: I tensorflow/core/platform/cpu_feature_guard.cc:141] Your CPU supports instructions that this TensorFlow binary was not compiled to use: SSE4.1 SSE4.2 AVX AVX2 FMA
    Hello from 1.9.0
    ```

