echo on
echo  

CodeEngine.exe -i:PBMessage.proto -o:PBMessage.cs -c:csharp

protoc --java_out=.\\ PBMessage.proto

python ID_Generator.py

rd /s/q ..\Server
rd /s/q ..\Client
echo copy PBMessage class
mkdir ..\Client\Assets\Client\Scripts\NetModule\
mkdir ..\Server\src\com\mrd\game\message\

copy /y PBMessage.cs ..\Client\Assets\Client\Scripts\NetModule\PBMessage.cs
rem copy /y \game\message\PBMessage.java ..\Server\src\game\message\PBMessage.java
copy /y .\com\mrd\game\message\PBMessage.java ..\Server\src\com\mrd\game\message\PBMessage.java

echo copy ID class
copy /y MessageID.cs ..\Client\Assets\Client\Scripts\NetModule\MessageID.cs
copy /y HOpCodeEx.java ..\Server\src\com\mrd\game\message\HOpCodeEx.java
echo copy PacketDistributed
copy /y PacketDistributed.cs ..\Client\Assets\Client\Scripts\NetModule\PacketDistributed.cs

echo del temp files
del PBMessage.cs
rd /s/q com
rd /s/q ProtocolCommon

pause