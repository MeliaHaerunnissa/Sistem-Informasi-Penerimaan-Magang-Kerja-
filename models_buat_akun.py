from flask_wtf import Form
from wtforms import FileField, SubmitField
from datetime import datetime
import pymysql
import config

class MSimpanUser:
	def __init__ (self,no=None, nama_lengkap=None, username=None, password=None, jenis_kelamin=None):
		self.no = no
		self.nama_lengkap = nama_lengkap
		self.username = username
		self.password = password
		self.jenis_kelamin = jenis_kelamin

	def openDB (self):
		global db, cursor
		db = pymysql.connect(
			config.DB_HOST,
			config.DB_USER,
			config.DB_PASSWORD,
			config.DB_NAME)
		cursor = db.cursor()

	def closeDB(self):
		global db, cursor
		db.close()

	def selectDB(self):
		self.openDB()
		cursor.execute("SELECT * FROM user")
		container = []
		self.closeDB()
		return container

	def insertDB(self, data):
		self.openDB()
		cursor.execute("INSERT INTO user (username, password, nama_lengkap, jenis_kelamin) VALUES( '%s','%s','%s', '%s')" % data)
		db.commit()
		self.closeDB()

	def getDBbyNo(self, no):
		self.openDB()
		cursor.execute("SELECT * FROM user WHERE no='%s'" % no)
		data = cursor.fetchone()
		return data

	def updateDB(self, data):
		self.openDB()
		cursor.execute("UPDATE user SET nama_lengkap='%s', username='%s', password='%s', jenis_kelamin='%s' WHERE no=%s" % data)
		db.commit()
		self.closeDB()