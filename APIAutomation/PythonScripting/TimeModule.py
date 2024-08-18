import datetime
import time

#print(datetime.date.today())

#now= datetime.date.today()

#other= datetime.datetime(1994,1,15,12,23)
#print(now-other)
epc=time.time()
print(time.ctime(epc))
'''
epc=time.time()
print(epc)

localtime=time.localtime(epc)
print(localtime)
print(localtime.tm_year)
print(time.ctime(epc))
'''
