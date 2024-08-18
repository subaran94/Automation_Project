import smtplib

sender=smtplib.SMTP('smtp.gmail.com', 587)
sender.starttls()
sender.login('deniyalsubaran@gmail.com','agqk jdrn kdge gucu')
sender.sendmail('deniyalsubaran@gmail.com','nishithasahu8@gmail.com','i love you')
print('mail sent')
