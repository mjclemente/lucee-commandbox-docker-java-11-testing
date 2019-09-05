# Testing openjdk11 with Lucee using the CommandBox Docker image

When testing the image, using `docker-compose up`, the server startup hangs, with the following logs:

```
Building cfml
Step 1/3 : FROM ortussolutions/commandbox:4.6.0
 ---> d4fd1e994599
Step 2/3 : COPY ./app ${APP_DIR}/
 ---> dcc5633841ca
Step 3/3 : RUN ${BUILD_DIR}/util/warmup-server.sh
 ---> Running in e52a1e513627
Starting up container in test mode
INFO: CF Engine defined as lucee@5.3.2+77
INFO: Server Home Directory set to: /root/serverHome
INFO: CF Engine set to lucee@5.3.2+77
Picked up JAVA_TOOL_OPTIONS: -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
 ✓ | Starting Server
   |------------------------------
   | start server in - /app/
   | server name - app
   | server config file - /app//server.json
   | Exploding WAR/zip archive...
   | Found environment variable [cfconfig_adminPassword]
   | [adminPassword] set.
   | Also setting adminPassword to Lucee web context.
   | [adminPassword] set.
   | Server start command:
   |     /bin/bash /root/.CommandBox/cfml/system/modules_app/server-command
   | s/bin/server_spawner.sh /root/serverHome/nohup.log /opt/java/openjdk/b
   | in/java
   |     -jar /root/.CommandBox/lib/runwar-3.8.1-SNAPSHOT.jar
   |     --background=true
   |     --host 0.0.0.0
   |     --stop-port 33147
   |     --processname app [lucee 5.3.2+77]
   |     --log-dir /root/serverHome/logs
   |     --server-name app
   |     --tray-icon /root/.CommandBox/cfml/system/config/server-icons/tray
   | icon-lucee.png
   |     --tray-config /root/.CommandBox/server/57E8298F9745C82938251974D88
   | 3583E-app/trayOptions.json
   |     --tray-enable true
   |     --directoryindex false
   |     --timeout 240
   |     --proxy-peeraddress true
   |     --cookie-secure false
   |     --cookie-httponly false
   |     --debug true
   |     --servlet-rest-mappings __DISABLED__
   |     --gzip-enable true
   |     --cfengine-name lucee
   |     -war /app/
   |     --web-xml-path /root/serverHome/WEB-INF/web.xml
   |     --http-enable true
   |     --ssl-enable false
   |     --ajp-enable false
   |     --open-browser false
   |     --open-url http://0.0.0.0:8080
   |     --port 8080
   |     --urlrewrite-enable false
   | The server for /app/ is starting on http://0.0.0.0:8080 ...
   |------------------------------
   | ✓ | Installing package [forgebox:lucee@5.3.2+77]
   |   |-----------------------------------------------------------
   |   | Verifying package 'lucee' in ForgeBox, please wait...
   |   | Installing version [5.3.2+77].
   |   | Verified entry in ForgeBox: 'lucee'
   |   | Deferring to [https] endpoint for ForgeBox entry [lucee]...
   |   | Downloading [HTTPS://downloads.ortussolutions.com/lucee/lucee/5.3.2.77
   |   | /cf-engine-5.3.2.77.zip]
   |   | Decompressing...
   |   | Storing download in artifact cache...
   |   | Done.
   |   | Installing to: /root/.CommandBox/temp/650F2E2D-E725-427B-861115F3FE28D
   |   | CDF
   |   | -> 2 File(s) Installed
   |   | -> 0 File(s) ignored
   |   | Eureka, 'lucee@5.3.2+77' has been installed!
   |   |-----------------------------------------------------------

Picked up JAVA_TOOL_OPTIONS: -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
Enabling URL rewrite log level: DEBUG
[INFO ] Runwar: Enabling URL rewrite log level: DEBUG
[INFO ] Runwar: Starting RunWAR 3.8.1-SNAPSHOT
[DEBUG] Runwar: Checking that we're running on > java7
[DEBUG] Runwar: Requisitioning 0.0.0.0:8080 (http) 0.0.0.0:33147 (stop socket)
[INFO ] Runwar: Starting background app [lucee 5.3.2+77] from: /root/.CommandBox/lib/runwar-3.8.1-SNAPSHOT.jar
[DEBUG] Runwar: launching background process with these args:
[DEBUG] Runwar:
    /opt/java/openjdk/jre/bin/java
    -XX:+UnlockExperimentalVMOptions
    -XX:+UseCGroupMemoryLimitForHeap
    -jar  /root/.CommandBox/lib/runwar-3.8.1-SNAPSHOT.jar
    --host  0.0.0.0  33147
    --processname  app [lucee 5.3.2+77]
    --log-dir  /root/serverHome/logs
    --server-name  app
    --tray-icon  /root/.CommandBox/cfml/system/config/server-icons/trayicon-lucee.png
    --tray-config  /root/.CommandBox/server/57E8298F9745C82938251974D883583E-app/trayOptions.json
    --tray-enable  true
    --directoryindex  false
    --timeout  240
    --proxy-peeraddress  true
    --cookie-secure  false
    --cookie-httponly  false
    --debug  true
    --servlet-rest-mappings  __DISABLED__
    --gzip-enable  true
    --cfengine-name  lucee
    -war  /app/
    --web-xml-path  /root/serverHome/WEB-INF/web.xml
    --http-enable  true
    --ssl-enable  false
    --ajp-enable  false
    --open-browser  false
    --open-url  http://0.0.0.0:8080  8080
    --urlrewrite-enable  false
    --background  false
    --port  8080
    --stop-port  33147
[DEBUG] Runwar: timeout of 240 seconds
[INFO ] Starting in background -
Picked up JAVA_TOOL_OPTIONS: -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
Enabling URL rewrite log level: DEBUG
[INFO ] Runwar: Enabling URL rewrite log level: DEBUG
[INFO ] Runwar: Starting RunWAR 3.8.1-SNAPSHOT
[DEBUG] Runwar: Checking that we're running on > java7
[DEBUG] Runwar: Requisitioning 0.0.0.0:8080 (http) 0.0.0.0:33147 (stop socket)
[INFO ] Runwar: Adding additional lib dir of: /root/serverHome/WEB-INF/lib
[DEBUG] Runwar: WEB-INF classes directory (/root/serverHome/WEB-INF/classes) does not exist
[DEBUG] Runwar: Initializing classloader with 1 libraries
[DEBUG] Runwar: Server Mode: war
[INFO ] Runwar: ******************************************************************************
[INFO ] Runwar: Starting - port:8080 stop-port:33147 warpath:file:/app/
[INFO ] Runwar: context: /  -  version: 3.8.1-SNAPSHOT
[INFO ] Runwar: web-dirs: /app
[INFO ] Runwar: Log Directory: /root/serverHome/logs
[INFO ] Runwar: ******************************************************************************
[DEBUG] Runwar: Added shutdown hook
[DEBUG] Runwar: Transfer Min Size: 100
[DEBUG] Runwar: Setting coldfusion.home: '/root/serverHome/WEB-INF/cfusion'
[DEBUG] Runwar: Setting coldfusion.classpath: '/root/serverHome/WEB-INF/cfusion/lib/updates/,/root/serverHome/WEB-INF/cfusion/lib/,/root/serverHome/WEB-INF/cfusion/lib/axis2,/root/serverHome/WEB-INF/cfusion/gateway/lib/,/root/serverHome/WEB-INF/cfusion/../cfform/jars,/root/serverHome/WEB-INF/cfusion/../flex/jars,/root/serverHome/WEB-INF/cfusion/lib/oosdk/lib,/root/serverHome/WEB-INF/cfusion/lib/oosdk/classes'
[DEBUG] Runwar: Setting flex.dir (cfform): '/root/serverHome/WEB-INF/cfform'
[DEBUG] Runwar: found WEB-INF: '/root/serverHome/WEB-INF'
[INFO ] Runwar: Serving content from /app
[INFO ] Runwar: Parsing '/root/serverHome/WEB-INF/web.xml'
[DEBUG] Runwar: URL rewriting is disabled
[DEBUG] Runwar: enabling path_info filter
[DEBUG] Runwar: File cache is disabled
[INFO ] Runwar: welcome pages in deployment manager: [index.cfm, index.lucee, index.html, index.htm]
[INFO ] Runwar: Overriding web.xml rest mappings with [__DISABLED__]
[INFO ] Runwar: Added rest mapping: __DISABLED__ to RESTServlet
[DEBUG] Runwar: Added websocket context

INFO: Waiting for server to become available...
INFO: Server engine up and running.
INFO: Configuration processed and server started in 22 seconds.
Picked up JAVA_TOOL_OPTIONS: -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
Stopping app...
Stopped
Picked up JAVA_TOOL_OPTIONS: -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
Picked up JAVA_TOOL_OPTIONS: -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
Artifacts directory cleaned of '1' items.
Container successfully warmed up
Picked up JAVA_TOOL_OPTIONS: -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
Artifacts directory cleaned of '0' items.
Removing intermediate container e52a1e513627
 ---> 220f509034e9

Successfully built 220f509034e9
Successfully tagged lucee_commandbox_docker_java_cfml:latest
Creating lucee_commandbox_docker_java_cfml_1 ... done
Attaching to lucee_commandbox_docker_java_cfml_1
cfml_1  | INFO: CF Engine defined as lucee@5.3.2+77
cfml_1  | INFO: Server Home Directory set to: /root/serverHome
cfml_1  | INFO: CF Engine set to lucee@5.3.2+77
cfml_1  | INFO: Customer JRE argument detected. Starting the server using openjdk11
cfml_1  | Picked up JAVA_TOOL_OPTIONS: -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
cfml_1  |  ✓ | Starting Server
cfml_1  |    |------------------------------
cfml_1  |    | start server in - /app/
cfml_1  |    | server name - app
cfml_1  |    | server config file - /app//server.json
cfml_1  |    | WAR/zip archive already installed.
cfml_1  |    | Found environment variable [cfconfig_adminPassword]
cfml_1  |    | [adminPassword] set.
cfml_1  |    | Also setting adminPassword to Lucee web context.
cfml_1  |    | [adminPassword] set.
cfml_1  |    | Server start command:
cfml_1  |    |     /bin/bash /root/.CommandBox/cfml/system/modules_app/server-command
cfml_1  |    | s/bin/server_spawner.sh /root/serverHome//nohup.log /root/.CommandBox/
cfml_1  |    | serverJREs/openjdk11_jre_x64_linux_hotspot_jdk-11.0.4+11/bin/java
cfml_1  |    |     -jar /root/.CommandBox/lib/runwar-3.8.1-SNAPSHOT.jar
cfml_1  |    |     --background=true
cfml_1  |    |     --host 0.0.0.0
cfml_1  |    |     --stop-port 33301
cfml_1  |    |     --processname app [lucee 5.3.2+77]
cfml_1  |    |     --log-dir /root/serverHome//logs
cfml_1  |    |     --server-name app
cfml_1  |    |     --tray-icon /root/.CommandBox/cfml/system/config/server-icons/tray
cfml_1  |    | icon-lucee.png
cfml_1  |    |     --tray-config /root/.CommandBox/server/57E8298F9745C82938251974D88
cfml_1  |    | 3583E-app/trayOptions.json
cfml_1  |    |     --tray-enable true
cfml_1  |    |     --directoryindex false
cfml_1  |    |     --timeout 240
cfml_1  |    |     --proxy-peeraddress true
cfml_1  |    |     --cookie-secure false
cfml_1  |    |     --cookie-httponly false
cfml_1  |    |     --debug true
cfml_1  |    |     --servlet-rest-mappings __DISABLED__
cfml_1  |    |     --gzip-enable true
cfml_1  |    |     --cfengine-name lucee
cfml_1  |    |     -war /app/
cfml_1  |    |     --web-xml-path /root/serverHome//WEB-INF/web.xml
cfml_1  |    |     --http-enable true
cfml_1  |    |     --ssl-enable false
cfml_1  |    |     --ajp-enable false
cfml_1  |    |     --open-browser false
cfml_1  |    |     --open-url http://0.0.0.0:8080
cfml_1  |    |     --port 8080
cfml_1  |    |     --urlrewrite-enable false
cfml_1  |    | The server for /app/ is starting on http://0.0.0.0:8080 ...
cfml_1  |    |------------------------------
cfml_1  |    | ✓ | Installing package [java:openjdk11:lockVersion]
cfml_1  |    |   |--------------------------------------------------------------
cfml_1  |    |   | Installing [openjdk11]
cfml_1  |    |   | Java version:              openjdk11
cfml_1  |    |   | Java type:                 jre
cfml_1  |    |   | Java arch:                 x64
cfml_1  |    |   | Java os:                   linux
cfml_1  |    |   | Java jvm-implementation:   hotspot
cfml_1  |    |   | Java release:              latest
cfml_1  |    |   | Hitting the AdoptOpenJDK API to find your download.
cfml_1  |    |   | https://api.adoptopenjdk.net/v2/info/releases/openjdk11?openjdk_impl=h
cfml_1  |    |   | otspot&os=linux&arch=x64&release=latest&type=jre
cfml_1  |    |   | Exact version is [openjdk11_jre_x64_linux_hotspot_jdk-11.0.4+11]
cfml_1  |    |   | Redirecting to: 'https://github.com/AdoptOpenJDK/openjdk11-binaries/re
cfml_1  |    |   | leases/download/jdk-11.0.4%2B11/OpenJDK11U-jre_x64_linux_hotspot_11.0.
cfml_1  |    |   | 4_11.tar.gz'...
cfml_1  |    |   | Redirecting to: 'https://github-production-release-asset-2e65be.s3.ama
cfml_1  |    |   | zonaws.com/140419044/5a657b00-a962-11e9-84bf-569fc0deb831?X-Amz-Algori
cfml_1  |    |   | thm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20190904%
cfml_1  |    |   | 2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20190904T235403Z&X-Amz-Expi
cfml_1  |    |   | res=300&X-Amz-Signature=cb9fbfb5552f54c3f971fc11bf526d7165dac244d4fa08
cfml_1  |    |   | 7769d0d6ada3fad9a4&X-Amz-SignedHeaders=host&actor_id=0&response-conten
cfml_1  |    |   | t-disposition=attachment%3B%20filename%3DOpenJDK11U-jre_x64_linux_hots
cfml_1  |    |   | pot_11.0.4_11.tar.gz&response-content-type=application%2Foctet-stream'
cfml_1  |    |   | ...
cfml_1  |    |   | /root/.CommandBox/serverJREs/box.json updated with dependency.
cfml_1  |    |   | Fixing *nix file permissions on java
cfml_1  |    |   | Installing to: /root/.CommandBox/serverJREs/openjdk11_jre_x64_linux_ho
cfml_1  |    |   | tspot_jdk-11.0.4+11
cfml_1  |    |   | -> 355 File(s) Installed
cfml_1  |    |   | -> 0 File(s) ignored
cfml_1  |    |   | Eureka, 'java:openjdk11:lockVersion' has been installed!
cfml_1  |    |   |--------------------------------------------------------------
cfml_1  |
cfml_1  |
cfml_1  | INFO: Waiting for server to become available...
cfml_1  | INFO: Server engine up and running.
cfml_1  | INFO: Configuration processed and server started in 26 seconds.
cfml_1  | Picked up JAVA_TOOL_OPTIONS: -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
cfml_1  |
```

And, the probable source - if you SSH into the container you'll see a `nohup.log` file is created in the `/root/serverHome` with the following contents:

```
Picked up JAVA_TOOL_OPTIONS: -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
Unrecognized VM option 'UseCGroupMemoryLimitForHeap'
Error: Could not create the Java Virtual Machine.
Error: A fatal exception has occurred. Program will exit.
```