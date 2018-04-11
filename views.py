from home import app
from flask import render_template,request,redirect,url_for,session,flash,jsonify
from flaskext.mysql import MySQL
import requests
import json
import os
import datetime
mysql = MySQL()
mysql.init_app(app)
app.debug = True
global user_login
user_login="false"
	
@app.route("/signup",methods=['POST'])
def signup():
	#user_detail=[{'username':'1','email':'a','password':'a'}]
	#user_detail.clear()
	user_detail=[]
	db=mysql.connect()	
	name=request.form['username']
	email=request.form['email']
	password=request.form['password']
	cursor=db.cursor()
	count=0
	cursor.execute("select * from user where user_email=%s",email)
	for raw in cursor.fetchall():
		count=count+1
	if count>0:
		return "Email Already Exist"
	else:
		cursor.execute("insert into user (user_name,user_email,user_password) values (%s,%s,%s)",(name,email,password))
		db.commit()		
	return redirect(url_for('.index'))		
	

@app.route("/signin",methods=['POST'])
def signin():
	#user_detail=[{'username':'1','email':'a','password':'a'}]
	#user_detail.clear()
	user_detail=[]
	c=0
	db=mysql.connect()
	email=request.form['email']
	password=request.form['password']
	url=request.form['url']
	if url=="" or url=="result":
		final_url='.index'
	else:	
		final_url='.'+url
	# print(final_url)	
	cursor=db.cursor()
	cursor.execute("select * from user where user_email=%s and user_password=%s",(email,password))
	for raw in cursor.fetchall():
		c=1
		user_detail=raw	
	if c==1:	
		session['user_id']=user_detail[0]
		session['user_name']=user_detail[1]
		session['user_email']=user_detail[2]	
		global user_login
		user_login="true"	
		return redirect(url_for(final_url))
	else:
		return "Incorrect Email or Password"


@app.route("/signin_xyz",methods=['POST'])
def signin_xyz():
	Email = request.form['email']
	Pass = request.form['password']
	
	arr=['a']
	db = mysql.connect()
	cursor = db.cursor()
	
	cursor.execute("SELECT * FROM user where user_email=%s and user_password=%s;", (Email,Pass))
	for raw in cursor.fetchall():
			arr=raw
	if arr[0] =='a':
		return "wrong"
	else:
		return "success"


@app.route("/signout",methods=['POST'])
def signout():
	session.pop('user_id', None)
	session.pop('user_name', None)
	session.pop('user_email', None)	
	url=request.form['url']
	global user_login
	user_login="false"
	return url	
	

@app.route("/")
def index():	
	if 	user_login=="true":
		user_name=session['user_name']
	else:
		user_name=""
	return render_template('index.html',user_login=user_login,user_name=user_name)


@app.route("/information")
def information():
	if 	user_login=="true":
		user_name=session['user_name']
	else:
		user_name=""
	return render_template('information.html',user_login=user_login,user_name=user_name)
		

@app.route("/result",methods=['POST'])
def result():
	if 	user_login=="true":
		user_name=session['user_name']
		user_id=session['user_id']	
	else:
		user_name=""		
	#animal_detail=[{'animal_id':'1','animal_name':'a','animal_information':'a','result':'a','date':'a','image':'a'}]
	animal_detail=[]
	#animal_detail.clear()	
	image=''
	image_path=''
	animal_id=''
	animal_name=''
	animal_information=''
	for f in request.files.getlist("filePhoto"):
		if f.filename == '':
			image=''
		else:
			target=os.path.join('/home/vatsal/flask-application/Animal_Recognition/static','Animal_Image')
			filename=f.filename
			image_path = "/".join([target,filename])
			f.save(image_path)
			image=f.filename
			
	#Algorithm to find name of animal and store in result
	ans=os.popen('cd /home/vatsal/AnimalRecognition && ./darknet detect cfg/yolo.cfg yolo.weights'+' '+image_path).read()
	
	i=-1
    	n=0
    	
    	
    	while 'seconds' not in ans.split()[i]:
	   per=ans.split()[i]
           no=per.split("%")
           print no[0]
	   if no[0] > n:
	      n=no[0]
              result=per
              name_of_animal=ans.split()[i-1]
	      print(name_of_animal+result)
           i=i-2
        #ans_ans=name+final_per
	#print name_of_animal+"abcd"
	#nn=ans.split()[-2]
	#name_of_animal=nn.split(':')
	#result=ans.split()[-1]	
	current_date = datetime.datetime.now()
	current_date=current_date.strftime("%Y-%m-%d")
	if 'NotAnimal' in name_of_animal:
		name_of_animal='Not Animal'	
		animal_name='Not Animal'
	else:					
		db=mysql.connect()
		cursor=db.cursor()	
		name_of_animal=name_of_animal.split(':')	
		cursor.execute("select * from animal where animal_name like %s",name_of_animal[0])
		for raw in cursor.fetchall():
			animal_id=raw[0]
			#print animal_id+"abcbcb"
			animal_name=raw[1]
			animal_information=raw[2]
			# animal_detail.append({'animal_id':raw[0],'animal_name':raw[1],'animal_information':raw[2],'result':result,'date':current_date,'image':image});
		if 	user_login=="true":		
			cursor.execute("insert into history (user_id,animal_id,image,date_reg,result) values (%s,%s,%s,%s,%s)",(user_id,animal_id,image,current_date,result))
			db.commit()
	return render_template('result.html',user_login=user_login,user_name=user_name,animal_name=animal_name,animal_information=animal_information,result=result,current_date=current_date,image=image)					
	# return render_template('result.html',user_login=user_login,user_name=user_name,animal_detail=animal_detail)	
	

@app.route("/my_profile")
def my_profile():
	if 	user_login=="true":
		user_name=session['user_name']
		user_id=session['user_id']	
	else:
		user_name=""
	#user_detail=[{'username':'1','email':'a','password':'a'}]
	#user_detail.clear()
	user_detail=[]
	db=mysql.connect()
	cursor=db.cursor()
	cursor.execute("select * from user where user_id=%s",user_id)
	for raw in cursor.fetchall():
		user_detail=raw
	return render_template('my_profile.html',user_login=user_login,user_name=user_name,user_detail=user_detail)	


@app.route("/update_profile",methods=['POST'])
def update_profile():
	if 	user_login=="true":
		user_name=session['user_name']
		user_id=session['user_id']	
	else:
		user_name=""
	#user_detail=[{'username':'a','email':'a','password':'a'}]
	#user_detail.clear()
	user_detail=[]
	username=request.form['username']
	email=request.form['email']
	password=request.form['password']
	session['user_name']=username
	session['user_email']=email	
	db=mysql.connect()
	cursor=db.cursor()
	cursor.execute("update user set user_name=%s,user_email=%s,user_password=%s where user_id=%s",(username,email,password,user_id))
	db.commit()
	return redirect(url_for('.my_profile'))


@app.route("/history")
def history():
	if 	user_login=="true":
		user_name=session['user_name']
		user_id=session['user_id']			
		#data=[{'user_id':'1','animal_id':'a','image':'a','date':'a','result':'a','animal_name':'a','animal_information':'a'}]
		#data.clear()
		data=[]			
		db=mysql.connect()
		cursor=db.cursor()			
		cursor.execute("select * from history where user_id=%s",user_id)
		for raw in cursor.fetchall():
			cursor.execute("select * from animal where animal_id=%s",raw[1])
			for raw1 in cursor.fetchall():
				data.append({'user_id':raw[2],'animal_id':raw[1],'image':raw[0],'date':raw[4],'result':raw[3],'animal_name':raw1[1],'animal_information':raw1[2]})					
	else:
		user_name=""
		data=''		
	return render_template('history.html',user_login=user_login,user_name=user_name,data=data)	


@app.route("/gallery")
def gallery():
	#animal_detail=[{'animal_id':'a','animal_name':'a','image':'a'}]
	#animal_detail.clear()
	animal_detail=[]
	if 	user_login=="true":
		user_name=session['user_name']
	else:
		user_name=""
	db=mysql.connect()
	cursor=db.cursor()
	cursor.execute("select * from animal")
	for raw in cursor.fetchall():
		animal_detail.append({'animal_id':raw[0],'animal_name':raw[1],'image':raw[3]})		
	return render_template('gallery.html',user_login=user_login,user_name=user_name,animal_detail=animal_detail)
	
	
@app.route("/detail_of_animal")
def detail_of_animal():
	#animal_detail=[{'animal_name':'a','animal_information':'a','image':'a'}]
	animal_detail=[]
	#animal_detail.clear()
	if 	user_login=="true":
		user_name=session['user_name']
	else:
		user_name=""
		
	animal_id= request.args.get('i_id', default='', type=str)	

	db=mysql.connect()
	cursor=db.cursor()
	cursor.execute("select * from animal where animal_id=%s",animal_id)
	for raw in cursor.fetchall():
		animal_detail.append({'animal_name':raw[1],'animal_information':raw[2],'image':raw[3]})					
	return render_template('detail_of_animal.html',user_login=user_login,user_name=user_name,animal_detail=animal_detail)


@app.route("/about")
def about():
	if 	user_login=="true":
		user_name=session['user_name']
	else:
		user_name=""
	return render_template('about.html',user_login=user_login,user_name=user_name)


@app.route("/contact")
def contact():
	if 	user_login=="true":
		user_name=session['user_name']
	else:
		user_name=""
	return render_template('contact.html',user_login=user_login,user_name=user_name)

@app.route("/contact_1",methods=['POST'])
def contact_1():
	
	print("abcbcbcbc")	
	user_name=""	
	name=request.form['Name']
	email=request.form['Email']
	subject=request.form['Subject']
	message=request.form['Message']
	db=mysql.connect()
	cursor=db.cursor()
	cursor.execute("insert into query (name,email,subject,message) values (%s,%s,%s,%s)",(name,email,subject,message))
	db.commit()
	return redirect(url_for('.contact'))
	
	
