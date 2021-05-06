import psycopg2
from logging import info

class DeloreanLibrary():

    def connect(self):
        return psycopg2.connect(
            host='ec2-3-233-43-103.compute-1.amazonaws.com',
            database='d1n6rrmc0ou8vl',
            user='fyxxegvbexbhlu',
            password='f57ada515fe4939c7bba61bd0567805aff2390419315d79140b1ac88dd2441aa'
        )
    
    #No Robot vira uma KW automaticamente => Remove Student     email.com@thotokus.com
    def remove_student(self, email):
        
        query = "delete from students where email = '{}'".format(email)
        info(query)
        
        conn = self.connect()
        
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def remove_student_by_name(self,name):
    
        query = "delete from students where name LIKE '%{}%'".format(name)
        info(query)
        
        conn = self.connect()
        
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def insert_student(self,student):
        self.remove_student(student['email'])

        query = ("insert into students(name, email, age, weight, feet_tall, created_at, updated_at)"
            "values('{}','{}',{},{},{},NOW(),NOW());"
            .format(student['name'],student['email'],student['age'],student['weight'],student['feet_tall'])
        )
        info(query)

        conn = self.connect()
        
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()