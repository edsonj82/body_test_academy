import psycopg2
from logging import info

class DeloreanLibrary():
    
    #No Robot vira uma KW automaticamente => Remove Student     email.com@thotokus.com
    def remove_student(self, email):
        
        query = "delete from students where email = '{}'".format(email)
        info(query)
        
        conn = psycopg2.connect(
            host='ec2-3-233-43-103.compute-1.amazonaws.com',
            database='d1n6rrmc0ou8vl',
            user='fyxxegvbexbhlu',
            password='f57ada515fe4939c7bba61bd0567805aff2390419315d79140b1ac88dd2441aa'
        )
        
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()