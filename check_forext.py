import os
all_files=os.listdir("/storage")

all_htmls=[]
all_phps=[]

for file in all_files:
    if os.path.splitext(file)[1] ==".html" or os.path.splitext(file)[1]==".js":
        all_htmls.append(file)
    if os.path.splitext(file)[1] ==".php":
        all_phps.append(file)

if(len(all_htmls)==0 and len(all_phps)==0):
    os.system("tput setaf 3")
    print("NO FILE TO COPY")
    os.system("exit 0")
if len(all_htmls)>0:
    os.system("ssh root@192.168.29.62 rm -rf /htmltest_storage/")
    os.system("ssh root@192.168.29.62 mkdir /htmltest_storage/")
    for htm in all_htmls:
        os.system(f"scp {htm}  192.168.29.62:/htmltest_storage")
if len(all_phps)>0:
    os.system("ssh root@192.168.29.62 rm -rf /phptest_storage/")
    os.system("ssh root@192.168.29.62 mkdir /phptest_storage/")
    for php in all_phps:
        os.system(f"scp {php}  192.168.29.62:/phptest_storage")


print("TOTAL FILES COPIED:",len(all_files))

print("TOTAL PHP FILES  :",len(all_phps))
print("TOTAL HTML+JS FILES  :",len(all_htmls))
print("OTHER FILES:",len(all_files)-len(all_phps)-len(all_htmls))


